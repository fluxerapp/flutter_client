class KlipyPath {
  const KlipyPath({required this.type, required this.slug});

  final String type;
  final String slug;
}

final RegExp _klipyPathRegex = RegExp(
  '^/(gif|gifs|clip|clips)/([^/]+)',
  caseSensitive: false,
);

KlipyPath? parseKlipyPath(String url) {
  if (url.isEmpty) {
    return null;
  }

  try {
    final parsed = Uri.parse(url);
    final host = parsed.host.toLowerCase();
    if (host != 'klipy.com' && host != 'www.klipy.com') {
      return null;
    }

    final match = _klipyPathRegex.firstMatch(parsed.path);
    final pathType = match?.group(1);
    final rawSlug = match?.group(2);
    if (pathType == null || rawSlug == null) {
      return null;
    }

    final slug = Uri.decodeComponent(rawSlug).trim();
    if (slug.isEmpty) {
      return null;
    }

    return KlipyPath(
      type: pathType.toLowerCase().startsWith('clip') ? 'clip' : 'gif',
      slug: slug,
    );
  } on FormatException {
    return null;
  }
}

String? extractKlipySlug(String url) => parseKlipyPath(url)?.slug;

String buildKlipyShareUrl({required String slug, String type = 'gif'}) {
  final normalizedSlug = slug.trim();
  if (normalizedSlug.isEmpty) {
    return 'https://klipy.com/gifs';
  }

  final path = type == 'clip' ? 'clips' : 'gifs';
  return 'https://klipy.com/$path/${Uri.encodeComponent(normalizedSlug)}';
}

String resolveKlipyShareUrl({
  required String url,
  String? fallbackSlug,
  String fallbackType = 'gif',
}) {
  final parsed = parseKlipyPath(url);
  if (parsed != null) {
    return buildKlipyShareUrl(slug: parsed.slug, type: parsed.type);
  }

  final normalizedFallback = fallbackSlug?.trim();
  if (normalizedFallback != null && normalizedFallback.isNotEmpty) {
    return buildKlipyShareUrl(slug: normalizedFallback, type: fallbackType);
  }

  return url;
}

String parseKlipyTitleFromUrl(String url) {
  if (url.isEmpty) {
    return '';
  }

  final klipyPath = parseKlipyPath(url);
  if (klipyPath != null) {
    return _titleFromSlug(klipyPath.slug);
  }

  final path = Uri.tryParse(url)?.path ?? url;
  final segments = path.split('/');
  if (segments.isEmpty) {
    return 'GIF';
  }

  final filename = segments.last.split('.').first;
  if (filename.isEmpty) {
    return 'GIF';
  }

  return _titleFromSlug(filename);
}

String _titleFromSlug(String slug) {
  final title = slug
      .split('-')
      .where((word) => word.isNotEmpty)
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
  return title.isEmpty ? 'GIF' : title;
}
