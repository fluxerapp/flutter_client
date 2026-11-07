import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';

final RegExp _schemePrefixPattern = RegExp(r'^[a-zA-Z][a-zA-Z0-9+\-.]*://');
final RegExp _trailingSlashesPattern = RegExp(r'/+$');
final RegExp _apiPathSuffixPattern = RegExp(r'/api/?$');
const String _wellKnownPath = '/api/.well-known/fluxer';

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
      return url.replace(path: _wellKnownPath).toString();
    } on FormatException {
      final String base = apiEndpoint.replaceAll(_apiPathSuffixPattern, '');
      return '$base$_wellKnownPath';
    }
  }

  String describeApiEndpoint(String endpoint) {
    if (endpoint.isEmpty || isOfficialInstanceInput(endpoint)) {
      return InstanceConstants.defaultInstanceInputUrl;
    }
    try {
      final String trimmed = endpoint.trim();
      final Uri url = Uri.parse(
        _schemePrefixPattern.hasMatch(trimmed) ? trimmed : 'https://$trimmed',
      );
      final String path = url.path == '/api' ? '' : url.path;
      final bool bareHost = url.scheme == 'https' && !url.hasPort;
      final String origin = bareHost
          ? url.host
          : Uri(
              scheme: url.scheme,
              host: url.host,
              port: url.hasPort ? url.port : null,
            ).toString();
      return '$origin$path';
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

bool passkeysSupportedFor(String apiBaseUrl) {
  return defaultTargetPlatform != TargetPlatform.iOS ||
      const InstanceEndpointNormalizer().isOfficialInstanceInput(apiBaseUrl);
}

const List<String> _localNetworkHostSuffixes = <String>[
  '.local',
  '.lan',
  '.home.arpa',
  '.internal',
];

bool isLocalNetworkHost(String host) {
  String normalized = host.trim().toLowerCase();
  if (normalized.startsWith('[') && normalized.endsWith(']')) {
    normalized = normalized.substring(1, normalized.length - 1);
  }
  if (normalized.isEmpty) {
    return false;
  }
  final InternetAddress? address = InternetAddress.tryParse(normalized);
  if (address != null) {
    return _isLocalNetworkAddress(address);
  }
  if (normalized == 'localhost' || !normalized.contains('.')) {
    return true;
  }
  return _localNetworkHostSuffixes.any(normalized.endsWith);
}

bool _isLocalNetworkAddress(InternetAddress address) {
  final List<int> bytes = address.rawAddress;
  if (address.type == InternetAddressType.IPv4) {
    final int a = bytes[0];
    final int b = bytes[1];
    return a == 127 ||
        a == 10 ||
        (a == 172 && b >= 16 && b <= 31) ||
        (a == 192 && b == 168) ||
        (a == 169 && b == 254) ||
        (a == 100 && b >= 64 && b <= 127);
  }
  if (address.isLoopback) {
    return true;
  }
  final bool uniqueLocal = (bytes[0] & 0xfe) == 0xfc;
  final bool linkLocal = bytes[0] == 0xfe && (bytes[1] & 0xc0) == 0x80;
  return uniqueLocal || linkLocal;
}

bool isPublicCleartextEndpoint(String endpoint) {
  final Uri? url = Uri.tryParse(endpoint);
  if (url == null || (url.scheme != 'http' && url.scheme != 'ws')) {
    return false;
  }
  return !isLocalNetworkHost(url.host);
}

bool isHostWithinInstance(String host, String instanceHost) {
  final String candidate = host.trim().toLowerCase();
  final String reference = instanceHost.trim().toLowerCase();
  if (candidate.isEmpty || reference.isEmpty) {
    return false;
  }
  if (candidate == reference) {
    return true;
  }
  if (InternetAddress.tryParse(candidate) != null ||
      InternetAddress.tryParse(reference) != null) {
    return false;
  }
  final String root = reference.startsWith('api.')
      ? reference.substring('api.'.length)
      : reference;
  return candidate == root || candidate.endsWith('.$root');
}

bool isGatewayTrustedForApi(String gatewayUrl, String apiBaseUrl) {
  final Uri? gateway = Uri.tryParse(gatewayUrl.trim());
  final Uri? api = Uri.tryParse(apiBaseUrl.trim());
  if (gateway == null || api == null) {
    return false;
  }
  final String gatewayHost = gateway.host;
  switch (gateway.scheme.toLowerCase()) {
    case 'wss':
      break;
    case 'ws':
      if (!isLocalNetworkHost(gatewayHost)) {
        return false;
      }
    default:
      return false;
  }
  return isHostWithinInstance(gatewayHost, api.host);
}
