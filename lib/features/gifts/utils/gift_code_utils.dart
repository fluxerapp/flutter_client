import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/features/chat/utils/messages/url_sanitization_utils.dart';

const int kMaxGiftCodesPerMessage = 10;

const String _giftCodeCapture = r'([a-zA-Z0-9\-]{2,32})(?![a-zA-Z0-9\-])';

const List<String> kOfficialGiftUrlBases = <String>[
  'https://fluxer.app/gift',
  'https://canary.fluxer.app/gift',
  'https://web.fluxer.app/gift',
  'https://web.canary.fluxer.app/gift',
  'https://fluxer.com/gift',
  'https://canary.fluxer.com/gift',
  'https://fluxer.gift',
  'https://fluxer.gift/gift',
];

String? _cachedGiftKey;
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
    final String port = uri.hasPort ? ':${uri.port}' : '';
    return '${uri.host}$port$path'.toLowerCase();
  } on FormatException {
    return trimmed
        .replaceFirst(RegExp('^https?://', caseSensitive: false), '')
        .toLowerCase();
  }
}

RegExp giftCodesRegExpFor(List<String> urlBases) {
  final List<String> bases =
      <String>{
        for (final String base in urlBases) ?normalizeGiftUrlBase(base),
      }.toList()..sort((a, b) {
        final int byLength = b.length.compareTo(a.length);
        return byLength != 0 ? byLength : a.compareTo(b);
      });
  if (bases.isEmpty) {
    return RegExp('(?!)');
  }
  final String key = bases.join('|');
  if (_cachedGiftKey == key && _cachedGiftRegExp != null) {
    return _cachedGiftRegExp!;
  }
  final String branches = bases
      .map((String base) {
        final int slash = base.indexOf('/');
        final String host = slash == -1 ? base : base.substring(0, slash);
        final String path = slash == -1 ? '' : base.substring(slash);
        return '${RegExp.escape(host)}(?:/#)?${RegExp.escape(path)}';
      })
      .join('|');
  final RegExp pattern = RegExp(
    '(?:https?://)?(?:$branches)/$_giftCodeCapture',
    caseSensitive: false,
  );
  _cachedGiftKey = key;
  _cachedGiftRegExp = pattern;
  return pattern;
}

List<String> findGiftCodes(
  String content, {
  String? giftBaseUrl,
  int limit = kMaxGiftCodesPerMessage,
}) {
  final RegExp pattern = giftCodesRegExpFor(
    giftBaseUrl != null
        ? <String>[giftBaseUrl]
        : <String>[
            InstanceEndpoints.gift,
            '${InstanceEndpoints.webApp}/gift',
            if (!InstanceEndpoints.selfHosted) ...kOfficialGiftUrlBases,
          ],
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
