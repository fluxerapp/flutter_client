import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/features/chat/utils/url_sanitization_utils.dart';

const int kMaxGiftCodesPerMessage = 10;

const String _giftCodeCapture = r'([a-zA-Z0-9\-]{2,32})(?![a-zA-Z0-9\-])';

String? _cachedGiftBase;
RegExp? _cachedGiftRegExp;

String? normalizeGiftUrlBase(String urlBase) {
  final String trimmed = urlBase.trim().replaceAll(RegExp(r'/+$'), '');
  if (trimmed.isEmpty) {
    return null;
  }
  try {
    final Uri uri = trimmed.contains('://')
        ? Uri.parse(trimmed)
        : Uri.parse('https://$trimmed');
    final String path = uri.path == '/'
        ? ''
        : uri.path.replaceAll(RegExp(r'/+$'), '');
    if (uri.host.isEmpty) {
      return null;
    }
    return '${uri.host}$path'.toLowerCase();
  } on FormatException {
    return trimmed
        .replaceFirst(RegExp('^https?://', caseSensitive: false), '')
        .toLowerCase();
  }
}

RegExp giftCodesRegExpFor(String giftBaseUrl) {
  final String? normalized = normalizeGiftUrlBase(giftBaseUrl);
  if (normalized == null) {
    return RegExp('(?!)');
  }
  if (_cachedGiftBase == normalized && _cachedGiftRegExp != null) {
    return _cachedGiftRegExp!;
  }
  final String escaped = RegExp.escape(normalized);
  final RegExp pattern = RegExp(
    '(?:https?://)?$escaped/$_giftCodeCapture',
    caseSensitive: false,
  );
  _cachedGiftBase = normalized;
  _cachedGiftRegExp = pattern;
  return pattern;
}

List<String> findGiftCodes(
  String content, {
  String? giftBaseUrl,
  int limit = kMaxGiftCodesPerMessage,
}) {
  final RegExp pattern = giftCodesRegExpFor(
    giftBaseUrl ?? InstanceEndpoints.gift,
  );
  final seen = <String>{};
  final result = <String>[];
  for (final Match m in pattern.allMatches(content)) {
    if (matchOverlapsMarkdownCodeSpan(content, m)) {
      continue;
    }
    final String? code = m.group(1);
    if (code != null && seen.add(code)) {
      result.add(code);
      if (result.length == limit) {
        break;
      }
    }
  }
  return result;
}

String extractGiftCode(String input) {
  final trimmed = input.trim();
  final lastSlashIndex = trimmed.lastIndexOf('/');
  if (lastSlashIndex == -1) {
    return trimmed;
  }
  return trimmed.substring(lastSlashIndex + 1);
}

String giftShareUrl({required String giftBaseUrl, required String code}) {
  final String base = giftBaseUrl.trim().replaceAll(RegExp(r'/+$'), '');
  if (base.isEmpty) {
    return '${InstanceEndpoints.gift}/$code';
  }
  return '$base/$code';
}
