final RegExp _urlRegex = RegExp(
  r'''\bhttps?:\/\/[^\s<>'"`)\]]+''',
  caseSensitive: false,
);

final RegExp _trailingPunctRegex = RegExp(r'[.,;:!?]+$');

final RegExp _codeSpanRegex = RegExp(r'```[\s\S]*?```|``[^`]*``|`[^`\n]*`');

final RegExp _youtubeHostRegex = RegExp(
  r'(?:^|\.)(?:youtube\.com|youtu\.be|youtube-nocookie\.com)$',
  caseSensitive: false,
);

final RegExp _youtubeComHostRegex = RegExp(
  r'(?:^|\.)youtube\.com$',
  caseSensitive: false,
);

const Set<String> _youtubeTrackingParams = {'si', 'is', 'pp'};

const Set<String> _youtubeComTrackingParams = {
  'feature',
  'app',
  'src',
  'lid',
  'cid',
  'embeds_referring_euri',
};

const int _maxRedirectDepth = 2;

final RegExp _invalidPercentEscapeRegex = RegExp('%(?![0-9a-fA-F]{2})');

const Set<String> _trackingParams = {
  'fbclid',
  'gclid',
  'gbraid',
  'wbraid',
  'dclid',
  'msclkid',
  'yclid',
  'igshid',
  'mc_eid',
  '_ga',
  '_gl',
  'vero_id',
  'mkt_tok',
  'oly_anon_id',
  'oly_enc_id',
  'ml_subscriber',
  'ml_subscriber_hash',
  's_cid',
  'at_recipient_id',
  'at_recipient_list',
  'ref_src',
  'ref_url',
  'rb_clickid',
  '__hssc',
  '__hstc',
  '__hsfp',
  'hsctatracking',
  'trk',
  'trkcampaign',
  'ic_source',
  'ic_medium',
  '_openstat',
  'share_token',
  'spm',
};

const List<String> _trackingPrefixes = [
  'utm_',
  'mc_',
  'pk_',
  'piwik_',
  'matomo_',
  'hsa_',
  'hmb_',
  'vero_',
];

bool matchOverlapsMarkdownCodeSpan(String content, Match match) {
  for (final Match code in _codeSpanRegex.allMatches(content)) {
    if (match.start < code.end && match.end > code.start) {
      return true;
    }
  }
  return false;
}

String sanitizeUrlsInContent(String content) {
  if (content.isEmpty) {
    return content;
  }
  final StringBuffer buffer = StringBuffer();
  int cursor = 0;
  for (final Match code in _codeSpanRegex.allMatches(content)) {
    if (code.start > cursor) {
      buffer.write(_sanitizeUrlsInGap(content.substring(cursor, code.start)));
    }
    buffer.write(content.substring(code.start, code.end));
    cursor = code.end;
  }
  if (cursor < content.length) {
    buffer.write(_sanitizeUrlsInGap(content.substring(cursor)));
  }
  return buffer.toString();
}

String _sanitizeUrlsInGap(String text) {
  return text.replaceAllMapped(_urlRegex, (match) {
    final String raw = match.group(0) ?? '';
    final Match? trailing = _trailingPunctRegex.firstMatch(raw);
    final String suffix = trailing?.group(0) ?? '';
    final String trimmed = suffix.isEmpty
        ? raw
        : raw.substring(0, raw.length - suffix.length);
    return _cleanSingleUrl(trimmed) + suffix;
  });
}

String _cleanSingleUrl(String url, {int depth = 0}) {
  final int questionIndex = url.indexOf('?');
  if (questionIndex == -1) {
    return url;
  }
  final int fragmentIndex = url.indexOf('#', questionIndex);
  final String basePart = url.substring(0, questionIndex);
  final String query = fragmentIndex == -1
      ? url.substring(questionIndex + 1)
      : url.substring(questionIndex + 1, fragmentIndex);
  final String fragmentPart = fragmentIndex == -1
      ? ''
      : url.substring(fragmentIndex);
  if (query.isEmpty) {
    return url;
  }
  final Uri? parsed = Uri.tryParse(url);
  if (parsed == null || parsed.host.isEmpty || !parsed.hasScheme) {
    return url;
  }
  final bool isYoutube = _youtubeHostRegex.hasMatch(parsed.host);
  final bool isYoutubeCom = _youtubeComHostRegex.hasMatch(parsed.host);
  if (isYoutubeCom && depth < _maxRedirectDepth) {
    final String? target = _youtubeRedirectTarget(parsed);
    if (target != null) {
      final String unwrapped = _cleanSingleUrl(
        _withSourceFragment(target, fragmentPart),
        depth: depth + 1,
      );
      return unwrapped.length <= url.length ? unwrapped : url;
    }
  }
  final List<String> kept = <String>[];
  bool mutated = false;
  for (final String part in query.split('&')) {
    if (part.isEmpty) {
      mutated = true;
      continue;
    }
    if (_isTrackingParam(
      _paramKey(part),
      isYoutube: isYoutube,
      isYoutubeCom: isYoutubeCom,
    )) {
      mutated = true;
      continue;
    }
    kept.add(part);
  }
  if (!mutated) {
    return url;
  }
  if (kept.isEmpty) {
    return '$basePart$fragmentPart';
  }
  return '$basePart?${kept.join('&')}$fragmentPart';
}

String? _youtubeRedirectTarget(Uri parsed) {
  final Map<String, List<String>> params;
  try {
    params = parsed.queryParametersAll;
  } on FormatException {
    return null;
  }
  for (final MapEntry<String, List<String>> entry in params.entries) {
    if (entry.key.toLowerCase() != 'q') {
      continue;
    }
    final String target = entry.value.first;
    if (_isHttpUrl(target)) {
      return target;
    }
    final String? decoded = _decodeComponentOrNull(target);
    return decoded != null && _isHttpUrl(decoded) ? decoded : null;
  }
  return null;
}

bool _isHttpUrl(String value) {
  final Uri? uri = Uri.tryParse(value);
  return uri != null &&
      (uri.scheme == 'http' || uri.scheme == 'https') &&
      uri.host.isNotEmpty;
}

String? _decodeComponentOrNull(String value) {
  // Uri.decodeComponent throws ArgumentError on a malformed escape.
  if (_invalidPercentEscapeRegex.hasMatch(value)) {
    return null;
  }
  try {
    return Uri.decodeComponent(value);
  } on FormatException {
    return null;
  }
}

String _withSourceFragment(String target, String fragment) {
  if (fragment.isEmpty) {
    return target;
  }
  final int hashIndex = target.indexOf('#');
  if (fragment == '#') {
    return hashIndex == -1 ? '$target#' : target;
  }
  final String base = hashIndex == -1 ? target : target.substring(0, hashIndex);
  return '$base$fragment';
}

String _paramKey(String pair) {
  final int eqIndex = pair.indexOf('=');
  final String raw = eqIndex == -1 ? pair : pair.substring(0, eqIndex);
  if (_invalidPercentEscapeRegex.hasMatch(raw)) {
    return raw.toLowerCase();
  }
  try {
    return Uri.decodeQueryComponent(raw).toLowerCase();
  } on FormatException {
    return raw.toLowerCase();
  }
}

bool _isTrackingParam(
  String name, {
  required bool isYoutube,
  required bool isYoutubeCom,
}) {
  if (_trackingParams.contains(name)) {
    return true;
  }
  if (isYoutube && _youtubeTrackingParams.contains(name)) {
    return true;
  }
  if (isYoutubeCom && _youtubeComTrackingParams.contains(name)) {
    return true;
  }
  for (final String prefix in _trackingPrefixes) {
    if (name.startsWith(prefix)) {
      return true;
    }
  }
  return false;
}
