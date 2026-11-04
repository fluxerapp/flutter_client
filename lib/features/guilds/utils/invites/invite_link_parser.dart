import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/features/chat/utils/messages/url_sanitization_utils.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';

const int kMaxInviteCodesPerMessage = 10;

const List<String> kOfficialInviteUrlBases = <String>[
  'https://fluxer.app/invite',
  'https://canary.fluxer.app/invite',
  'https://web.fluxer.app/invite',
  'https://web.canary.fluxer.app/invite',
  'https://fluxer.gg/invite',
  'https://fluxer.gg',
];

const List<String> _officialMessageInviteUrlBases = <String>[
  'https://fluxer.gg',
  'https://fluxer.app/invite',
  'https://web.fluxer.app/invite',
  'https://fluxer.com/invite',
];

String? _cachedMessageInvitePatternKey;
RegExp? _cachedMessageInvitePattern;

RegExp messageInviteRegExpFor(List<String> urlBases) {
  final List<String> ordered =
      <String>{
        for (final String base in urlBases) ?normalizeGiftUrlBase(base),
      }.toList()..sort((a, b) {
        final int byLength = b.length.compareTo(a.length);
        return byLength != 0 ? byLength : a.compareTo(b);
      });
  if (ordered.isEmpty) {
    return RegExp('(?!)');
  }
  final String key = ordered.join('|');
  if (_cachedMessageInvitePatternKey == key &&
      _cachedMessageInvitePattern != null) {
    return _cachedMessageInvitePattern!;
  }
  final String branches = ordered.map(RegExp.escape).join('|');
  final RegExp pattern = RegExp(
    '(?:https?://)?(?:$branches)/(?!invite/)([a-zA-Z0-9\\-]{2,32})(?![a-zA-Z0-9\\-])',
    caseSensitive: false,
  );
  _cachedMessageInvitePatternKey = key;
  _cachedMessageInvitePattern = pattern;
  return pattern;
}

List<String> findMessageInviteCodes(String content) {
  final RegExp pattern = messageInviteRegExpFor(
    InstanceEndpoints.selfHosted
        ? <String>[
            InstanceEndpoints.invite,
            '${InstanceEndpoints.webApp}/invite',
          ]
        : _officialMessageInviteUrlBases,
  );
  final Set<String> seen = <String>{};
  final List<String> result = <String>[];
  for (final Match m in pattern.allMatches(content)) {
    if (matchOverlapsMarkdownCodeSpan(content, m)) {
      continue;
    }
    final String? code = m.group(1);
    if (code != null && seen.add(code)) {
      result.add(code);
      if (result.length == kMaxInviteCodesPerMessage) {
        break;
      }
    }
  }
  return result;
}

final RegExp _bareInviteCodePattern = RegExp(r'^[a-zA-Z0-9\-]{2,32}$');
final RegExp _genericInvitePathPattern = RegExp(
  r'(?:https?:\/\/)?[^/\s]+/invite/([a-zA-Z0-9\-]{2,32})',
  caseSensitive: false,
);

String? parseInviteCode(
  String input, {
  List<String> inviteUrlBases = const <String>[],
}) {
  final String trimmed = input.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final Set<String> bases = <String>{
    ...kOfficialInviteUrlBases,
    ...inviteUrlBases,
  };
  final List<String> sortedBases = bases.toList()
    ..sort((String a, String b) => b.length.compareTo(a.length));
  for (final String base in sortedBases) {
    final String? code = _extractCodeFromBase(trimmed, base);
    if (code != null) {
      return code;
    }
  }
  final RegExpMatch? genericMatch = _genericInvitePathPattern.firstMatch(
    trimmed,
  );
  if (genericMatch != null) {
    return genericMatch.group(1);
  }
  if (_bareInviteCodePattern.hasMatch(trimmed)) {
    return trimmed;
  }
  return null;
}

String? _extractCodeFromBase(String input, String urlBase) {
  final String? normalizedBase = _normalizeUrlBase(urlBase);
  if (normalizedBase == null) {
    return null;
  }
  final String lowerInput = input.toLowerCase();
  final int slashIndex = normalizedBase.indexOf('/');
  final String host = slashIndex == -1
      ? normalizedBase
      : normalizedBase.substring(0, slashIndex);
  final String path = slashIndex == -1
      ? ''
      : normalizedBase.substring(slashIndex);
  final List<String> hostVariants = <String>[
    host,
    if (host.startsWith('www.')) host.substring(4) else 'www.$host',
  ];
  for (final String hostVariant in hostVariants) {
    final String prefixWithPath = '$hostVariant$path/';
    final String prefixHostOnly = '$hostVariant/';
    final int indexWithPath = lowerInput.indexOf(prefixWithPath);
    if (indexWithPath != -1) {
      return _codeFromSuffix(
        input.substring(indexWithPath + prefixWithPath.length),
      );
    }
    if (path.isEmpty) {
      final int indexHostOnly = lowerInput.indexOf(prefixHostOnly);
      if (indexHostOnly != -1) {
        return _codeFromSuffix(
          input.substring(indexHostOnly + prefixHostOnly.length),
        );
      }
    }
  }
  return null;
}

String? _codeFromSuffix(String suffix) {
  final int end = suffix.indexOf(RegExp(r'[/?#\s]'));
  final String candidate = (end == -1 ? suffix : suffix.substring(0, end))
      .trim();
  if (_bareInviteCodePattern.hasMatch(candidate)) {
    return candidate;
  }
  return null;
}

String? _normalizeUrlBase(String urlBase) {
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
    return '${uri.host}$path'.toLowerCase();
  } on FormatException {
    return trimmed
        .replaceFirst(RegExp('^https?://', caseSensitive: false), '')
        .toLowerCase();
  }
}
