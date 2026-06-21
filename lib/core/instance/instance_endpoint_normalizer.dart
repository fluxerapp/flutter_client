import 'package:fluxer_app/core/instance/instance_constants.dart';

abstract final class InstanceEndpointPatterns {
  static final RegExp schemePrefix = RegExp(
    r'^[a-zA-Z][a-zA-Z0-9+\-.]*://',
  );
  static final RegExp trailingSlashes = RegExp(r'/+$');
  static final RegExp apiPathSuffix = RegExp(r'/api/?$');
  static const String wellKnownPathOfficial = '/.well-known/fluxer';
  static const String wellKnownPathSelfHosted = '/api/.well-known/fluxer';
}

class InstanceEndpointNormalizer {
  const InstanceEndpointNormalizer();

  String normalizeEndpoint(String input) {
    final String trimmed = input.trim();
    if (trimmed.isEmpty) {
      throw const FormatException('API endpoint is required');
    }
    String candidate = trimmed;
    if (!InstanceEndpointPatterns.schemePrefix.hasMatch(candidate)) {
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
    final String normalizedPath =
        path.replaceAll(InstanceEndpointPatterns.trailingSlashes, '');
    return url.replace(path: normalizedPath).toString();
  }

  String buildWellKnownUrl(String apiEndpoint) {
    try {
      final Uri url = Uri.parse(apiEndpoint);
      final bool isOfficialApiHost =
          url.host == 'api.fluxer.app' || url.host == 'api.canary.fluxer.app';
      final String wellKnownPath = isOfficialApiHost
          ? InstanceEndpointPatterns.wellKnownPathOfficial
          : InstanceEndpointPatterns.wellKnownPathSelfHosted;
      return url.replace(path: wellKnownPath).toString();
    } on FormatException {
      final String base =
          apiEndpoint.replaceAll(InstanceEndpointPatterns.apiPathSuffix, '');
      return '$base${InstanceEndpointPatterns.wellKnownPathSelfHosted}';
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
