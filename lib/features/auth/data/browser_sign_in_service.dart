import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/sso_auth_service.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';

class BrowserSignInCancelledException implements Exception {
  const BrowserSignInCancelledException();
}

class BrowserSignInFailedException implements Exception {
  const BrowserSignInFailedException();
}

final Provider<BrowserSignInService> browserSignInServiceProvider =
    Provider<BrowserSignInService>(
      (Ref ref) => BrowserSignInService(
        repository: ref.watch(authRepositoryProvider),
        browser: ref.watch(ssoAuthServiceProvider),
      ),
    );

final Provider<bool> authInstanceOffersBrowserSignInProvider = Provider<bool>(
  (Ref ref) =>
      !ref.watch(authInstanceSupportsPasskeysProvider) &&
      browserSignInWebApp(ref.watch(authInstanceSnapshotProvider)) != null,
);

Uri? browserSignInWebApp(InstanceConfigSnapshot instance) {
  final String raw = instance.wellKnown?.endpoints.webapp.trim() ?? '';
  final Uri? uri = Uri.tryParse(raw.replaceAll(RegExp(r'/+$'), ''));
  if (uri == null ||
      !(uri.isScheme('https') || uri.isScheme('http')) ||
      uri.host.isEmpty) {
    return null;
  }
  return uri;
}

class BrowserSignInService {
  static const String returnUri = 'fluxer://handoff';

  final AuthRepository _repository;
  final SsoAuthService _browser;

  const BrowserSignInService({
    required this._repository,
    required this._browser,
  });

  Future<AuthSession> signIn({
    required InstanceConfigSnapshot instance,
    required String identifier,
    required bool usernameSignIn,
  }) async {
    final Uri? webApp = browserSignInWebApp(instance);
    final Uri? api = Uri.tryParse(instance.apiBaseUrl);
    if (webApp == null || api == null || !api.hasAuthority) {
      throw const BrowserSignInFailedException();
    }
    final ({String code, String pollSecret}) handoff = await _repository
        .startBrowserSignIn(returnUri: returnUri);
    try {
      final Uri callback;
      try {
        callback = await _browser.authenticate(
          authorizationUrl: webApp
              .replace(
                path: '${webApp.path}/login',
                queryParameters: <String, String>{
                  'handoff': '1',
                  'code': handoff.code,
                  'api': api.origin,
                  if (identifier.trim().isNotEmpty)
                    usernameSignIn ? 'login' : 'email': identifier.trim(),
                },
              )
              .toString(),
        );
      } on SsoAuthCancelledException {
        final AuthSession? session = await _repository.finishBrowserSignIn(
          code: handoff.code,
          pollSecret: handoff.pollSecret,
        );
        if (session != null) {
          return session;
        }
        throw const BrowserSignInCancelledException();
      }
      final String? grant = _grantFor(handoff.code, callback);
      final AuthSession? session = grant == null
          ? null
          : await _repository.finishBrowserSignIn(
              code: handoff.code,
              pollSecret: handoff.pollSecret,
              grant: grant,
            );
      if (session == null) {
        throw const BrowserSignInFailedException();
      }
      return session;
    } on Object {
      unawaited(
        _repository.cancelBrowserSignIn(
          code: handoff.code,
          pollSecret: handoff.pollSecret,
        ),
      );
      rethrow;
    }
  }

  static String? _grantFor(String code, Uri callback) {
    final Uri expected = Uri.parse(returnUri);
    final String? grant = callback.queryParameters['grant'];
    if (callback.scheme != expected.scheme ||
        callback.host != expected.host ||
        _normalizeCode(callback.queryParameters['code'] ?? '') !=
            _normalizeCode(code) ||
        grant == null ||
        grant.isEmpty) {
      return null;
    }
    return grant;
  }

  static String _normalizeCode(String code) =>
      code.replaceAll(RegExp('[^A-Za-z0-9]'), '').toUpperCase();
}
