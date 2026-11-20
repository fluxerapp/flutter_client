import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';

typedef AttachmentTokenMinter =
    Future<AttachmentMediaToken?> Function({required String url});

class AttachmentMediaToken {
  const AttachmentMediaToken({required this.token, required this.expiresAt});

  final String token;
  final DateTime expiresAt;
}

final RegExp _kAttachmentRoutePattern = RegExp(
  '^(?:/v[0-9]+)?/channels/[0-9]+/attachments/[0-9]+/[^/]',
);
final RegExp _kTrailingVersionPattern = RegExp(r'(?:/v[0-9]+)?/*$');
final RegExp _kEncodedSeparatorPattern = RegExp(
  '%(?:2e|2f|5c)',
  caseSensitive: false,
);
const Duration _kRenewMargin = Duration(seconds: 30);
const int _kMaxFileTokens = 64;
const String _kTokenParameter = 'mt';
const String _kMessageParameter = 'mid';

Uri? _attachmentBase(String? baseUrl) {
  final Uri? base = baseUrl == null ? null : Uri.tryParse(baseUrl.trim());
  if (base == null || !base.hasScheme || base.host.isEmpty) {
    return null;
  }
  return base.replace(
    path: base.path.replaceFirst(_kTrailingVersionPattern, ''),
  );
}

class AttachmentFileTokenUrl {
  const AttachmentFileTokenUrl({required this.url, required this.expiresAt});

  final String url;
  final DateTime? expiresAt;

  bool get isFresh {
    final DateTime? expiry = expiresAt;
    return expiry == null || isFreshFileToken(expiry);
  }
}

bool isFreshFileToken(DateTime expiresAt) =>
    DateTime.now().isBefore(expiresAt.subtract(_kRenewMargin));

class AttachmentRequestAuth {
  AttachmentRequestAuth._();

  static int _session = 0;
  static String? _token;
  static Uri? _base;
  static AttachmentTokenMinter? _mintToken;
  static final Map<String, AttachmentMediaToken> _fileTokens =
      <String, AttachmentMediaToken>{};
  static final Map<String, Future<AttachmentMediaToken?>> _pendingFileTokens =
      <String, Future<AttachmentMediaToken?>>{};

  static void update({
    required String? token,
    required String? baseUrl,
    required AttachmentTokenMinter? mintToken,
  }) {
    final Uri? base = _attachmentBase(baseUrl);
    final bool changed = token != _token || base != _base;
    _token = token == null || token.isEmpty ? null : token;
    _base = base;
    _mintToken = mintToken;
    if (changed) {
      _session += 1;
      _fileTokens.clear();
      _pendingFileTokens.clear();
    }
  }

  static bool isApiAttachmentUrl(String url) {
    final Uri? base = _base;
    final Uri? target = Uri.tryParse(url);
    if (base == null ||
        target == null ||
        !isRequestUnderBaseUrl(target, base)) {
      return false;
    }
    final String routePath = target.path.substring(base.path.length);
    return _kAttachmentRoutePattern.hasMatch(routePath) &&
        !_kEncodedSeparatorPattern.hasMatch(routePath);
  }

  static Map<String, String>? headersFor(String url) {
    final String? token = _token;
    if (token == null || !isApiAttachmentUrl(url)) {
      return null;
    }
    return <String, String>{
      'Authorization': formatSessionAuthorizationHeader(token),
      fluxerApiFeaturesHeaderName: buildFluxerApiFeaturesHeaderValue(),
    };
  }

  static Future<String> fileTokenUrl(String url) async =>
      (await fileTokenSource(url)).url;

  static Future<AttachmentFileTokenUrl> fileTokenSource(String url) async {
    final AttachmentTokenMinter? mintToken = _mintToken;
    if (!isApiAttachmentUrl(url) || mintToken == null) {
      return AttachmentFileTokenUrl(url: url, expiresAt: null);
    }
    final Uri target = Uri.parse(url);
    final Map<String, String> query = <String, String>{
      ...target.queryParameters,
    }..remove(_kTokenParameter);
    final Uri bare = target.replace(queryParameters: query);
    final AttachmentMediaToken? token = await _fileToken(
      _fileKey(bare),
      mintToken,
    );
    if (token == null) {
      return AttachmentFileTokenUrl(url: bare.toString(), expiresAt: null);
    }
    return AttachmentFileTokenUrl(
      url: target
          .replace(
            queryParameters: <String, String>{
              ...query,
              _kTokenParameter: token.token,
            },
          )
          .toString(),
      expiresAt: token.expiresAt,
    );
  }

  static String _fileKey(Uri bare) {
    final String? messageId = bare.queryParameters[_kMessageParameter];
    return Uri(
      scheme: bare.scheme,
      host: bare.host,
      port: bare.hasPort ? bare.port : null,
      path: bare.path,
      queryParameters: messageId == null
          ? null
          : <String, String>{_kMessageParameter: messageId},
    ).toString();
  }

  static Future<AttachmentMediaToken?> _fileToken(
    String key,
    AttachmentTokenMinter mintToken,
  ) async {
    final AttachmentMediaToken? cached = _fileTokens[key];
    if (cached != null && isFreshFileToken(cached.expiresAt)) {
      return cached;
    }
    final int session = _session;
    final Future<AttachmentMediaToken?> pending = _pendingFileTokens
        .putIfAbsent(key, () => _mintFileToken(key, mintToken, session));
    try {
      final AttachmentMediaToken? minted = await pending;
      return session == _session ? minted : null;
    } on Object {
      return null;
    }
  }

  static Future<AttachmentMediaToken?> _mintFileToken(
    String key,
    AttachmentTokenMinter mintToken,
    int session,
  ) async {
    try {
      final AttachmentMediaToken? minted = await mintToken(url: key);
      if (minted != null && session == _session) {
        _remember(key, minted);
      }
      return minted;
    } finally {
      if (session == _session) {
        unawaited(_pendingFileTokens.remove(key));
      }
    }
  }

  static void _remember(String key, AttachmentMediaToken token) {
    final DateTime now = DateTime.now();
    _fileTokens
      ..remove(key)
      ..removeWhere(
        (String _, AttachmentMediaToken cached) =>
            !now.isBefore(cached.expiresAt),
      )
      ..[key] = token;
    while (_fileTokens.length > _kMaxFileTokens) {
      _fileTokens.remove(_fileTokens.keys.first);
    }
  }
}

class AttachmentAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Map<String, String>? headers = AttachmentRequestAuth.headersFor(
      options.uri.toString(),
    );
    if (headers != null) {
      options.headers.addAll(headers);
    }
    handler.next(options);
  }
}
