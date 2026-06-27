import 'package:fluxer_app/core/instance/instance_constants.dart';

final RegExp _schemePrefixPattern = RegExp(r'^[a-zA-Z][a-zA-Z0-9+\-.]*://');
final RegExp _trailingSlashesPattern = RegExp(r'/+$');
final RegExp _apiPathSuffixPattern = RegExp(r'/api/?$');
const String _wellKnownPathOfficial = '/.well-known/fluxer';
const String _wellKnownPathSelfHosted = '/api/.well-known/fluxer';

class InstanceEndpointNormalizer {
  const InstanceEndpointNormalizer();

  String normalizeEndpoint(String input) {
    final String trimmed = input.trim();
    if (trimmed.isEmpty) {
      throw const FormatException('API endpoint is required');
    }
    String candidate = trimmed;
    if (!_schemePrefixPattern.hasMatch(candidate)) {
      candidate = 'https://$candidate';
    }
    final Uri url = Uri.parse(candidate);
    if (url.scheme != 'http' && url.scheme != 'https') {
      throw const FormatException('Instance URL must use http or https');
    }
    String path = url.path;
    if (path.isEmpty || path == '/') {
      path = '/api';
    }
    final String normalizedPath = path.replaceAll(_trailingSlashesPattern, '');
    return url.replace(path: normalizedPath).toString();
  }

  String buildWellKnownUrl(String apiEndpoint) {
    try {
      final Uri url = Uri.parse(apiEndpoint);
      final bool isOfficialApiHost =
          url.host == 'api.fluxer.app' || url.host == 'api.canary.fluxer.app';
      final String wellKnownPath = isOfficialApiHost
          ? _wellKnownPathOfficial
          : _wellKnownPathSelfHosted;
      return url.replace(path: wellKnownPath).toString();
    } on FormatException {
      final String base = apiEndpoint.replaceAll(_apiPathSuffixPattern, '');
      return '$base$_wellKnownPathSelfHosted';
    }
  }

  String describeApiEndpoint(String endpoint) {
    if (endpoint.isEmpty) {
      return describeApiEndpoint(InstanceConstants.defaultApiBaseUrl);
    }
    try {
      final Uri url = Uri.parse(endpoint);
      final String path = url.path == '/api' ? '' : url.path;
      return '${url.host}$path';
    } on FormatException {
      return endpoint;
    }
  }

  bool isOfficialInstanceInput(String input) {
    final String trimmed = input.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    try {
      String candidate = trimmed;
      if (!_schemePrefixPattern.hasMatch(candidate)) {
        candidate = 'https://$candidate';
      }
      final String host = Uri.parse(candidate).host.toLowerCase();
      return InstanceConstants.officialInstanceHosts.contains(host);
    } on FormatException {
      final String host = trimmed.split('/').first.toLowerCase();
      return InstanceConstants.officialInstanceHosts.contains(host);
    }
  }

  String extractDisplayDomain(String apiEndpoint) {
    try {
      return formatDisplayDomain(Uri.parse(apiEndpoint).host);
    } on FormatException {
      return formatDisplayDomain(apiEndpoint);
    }
  }

  String formatDisplayDomain(String domain) {
    final String trimmed = domain.trim().toLowerCase();
    const String apiPrefix = 'api.';
    if (trimmed.startsWith(apiPrefix)) {
      return trimmed.substring(apiPrefix.length);
    }
    return trimmed;
  }
}
