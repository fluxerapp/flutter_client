const Set<String> _sensitiveDeepLinkQueryKeys = <String>{
  'token',
  'code',
  'state',
  'key',
  'password',
  'secret',
  'access_token',
  'refresh_token',
  'client_secret',
};

const Set<String> _redactedPathSegmentRoots = <String>{'invite', 'gift'};

/// Safe deep-link string for logs. Omits the fragment and redacts secrets.
String sanitizeDeepLinkForLog(Uri uri) {
  final List<String> segments = List<String>.from(uri.pathSegments);
  final String hostRoot = uri.host.toLowerCase();
  if (_redactedPathSegmentRoots.contains(hostRoot) && segments.isNotEmpty) {
    segments[0] = '<redacted>';
  }
  if (segments.isNotEmpty) {
    final String root = segments.first.toLowerCase();
    if (_redactedPathSegmentRoots.contains(root) && segments.length >= 2) {
      segments[1] = '<redacted>';
    }
  }

  final String path = segments.isEmpty
      ? (uri.path.isEmpty ? '/' : uri.path)
      : '/${segments.join('/')}';

  final Map<String, String> query = <String, String>{};
  for (final MapEntry<String, String> entry in uri.queryParameters.entries) {
    query[entry.key] = _isSensitiveDeepLinkQueryKey(entry.key)
        ? '<redacted>'
        : entry.value;
  }

  final StringBuffer buffer = StringBuffer();
  if (uri.hasScheme) {
    buffer
      ..write(uri.scheme)
      ..write('://');
    if (uri.hasAuthority) {
      buffer.write(uri.authority);
    }
  }
  buffer.write(path);
  if (query.isNotEmpty) {
    buffer
      ..write('?')
      ..write(
        query.entries
            .map(
              (MapEntry<String, String> entry) =>
                  '${Uri.encodeQueryComponent(entry.key)}=${Uri.encodeQueryComponent(entry.value)}',
            )
            .join('&'),
      );
  }
  return buffer.toString();
}

bool _isSensitiveDeepLinkQueryKey(String key) {
  final String normalized = key.toLowerCase();
  if (_sensitiveDeepLinkQueryKeys.contains(normalized)) {
    return true;
  }
  return normalized.contains('token') || normalized.contains('secret');
}
