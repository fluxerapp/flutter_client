import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/features/chat/utils/messages/url_sanitization_utils.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';

const int kMaxSharedThemesPerMessage = 10;

const List<String> kOfficialThemeUrlBases = <String>[
  'https://fluxer.app/theme',
  'https://canary.fluxer.app/theme',
  'https://web.fluxer.app/theme',
  'https://web.canary.fluxer.app/theme',
  'https://fluxer.com/theme',
  'https://canary.fluxer.com/theme',
];

String? _cachedThemePatternKey;
RegExp? _cachedThemePattern;

RegExp sharedThemeLinkRegExpFor(String webAppBaseUrl) {
  final Set<String> bases = <String>{
    for (final String base in <String>[
      '$webAppBaseUrl/theme',
      ...kOfficialThemeUrlBases,
    ])
      ?normalizeGiftUrlBase(base),
  };
  final List<String> ordered = bases.toList()
    ..sort((a, b) {
      final int byLength = b.length.compareTo(a.length);
      return byLength != 0 ? byLength : a.compareTo(b);
    });
  final String key = ordered.join('|');
  if (_cachedThemePatternKey == key && _cachedThemePattern != null) {
    return _cachedThemePattern!;
  }
  final String branches = ordered.map(RegExp.escape).join('|');
  final RegExp pattern = RegExp(
    '(?:https?://)?(?:$branches)/([a-zA-Z0-9\\-]{2,32})(?![a-zA-Z0-9\\-])',
    caseSensitive: false,
  );
  _cachedThemePatternKey = key;
  _cachedThemePattern = pattern;
  return pattern;
}

List<String> findSharedThemeIds(String content, {String? webAppBaseUrl}) {
  final RegExp pattern = sharedThemeLinkRegExpFor(
    webAppBaseUrl ?? InstanceEndpoints.webApp,
  );
  final Set<String> seen = <String>{};
  final List<String> result = <String>[];
  for (final Match m in pattern.allMatches(content)) {
    if (matchOverlapsMarkdownCodeSpan(content, m)) {
      continue;
    }
    final String? id = m.group(1);
    if (id != null && seen.add(id)) {
      result.add(id);
      if (result.length == kMaxSharedThemesPerMessage) {
        break;
      }
    }
  }
  return result;
}

String sharedThemeCssUrl(String themeId, {String? mediaBaseUrl}) {
  final String base = (mediaBaseUrl ?? InstanceEndpoints.media).replaceAll(
    RegExp(r'/+$'),
    '',
  );
  return '$base/themes/$themeId.css';
}
