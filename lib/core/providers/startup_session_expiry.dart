/// True when startup is still current and the 401 hit that session's API host.
bool startupShouldExpireSession({
  required bool mounted,
  required String requestBaseUrl,
  required String storedApiBaseUrl,
}) {
  if (!mounted) {
    return false;
  }
  final String request = _normalizeApiBase(requestBaseUrl);
  final String stored = _normalizeApiBase(storedApiBaseUrl);
  if (request.isEmpty || stored.isEmpty) {
    return false;
  }
  return request == stored;
}

String _normalizeApiBase(String raw) {
  var trimmed = raw.trim();
  while (trimmed.length > 1 && trimmed.endsWith('/')) {
    trimmed = trimmed.substring(0, trimmed.length - 1);
  }
  if (trimmed.isEmpty) {
    return '';
  }
  final Uri? uri = Uri.tryParse(trimmed);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
    return trimmed;
  }
  final String port = uri.hasPort ? ':${uri.port}' : '';
  return '${uri.scheme}://${uri.host}$port${uri.path}';
}
