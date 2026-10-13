import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';

String unifiedPushInstanceIdForApiBase(String apiBaseUrl) {
  final String normalized = _normalizeApiBase(apiBaseUrl);
  if (normalized.isEmpty) {
    return '';
  }
  final String high = _fnv1a32(normalized).toRadixString(16).padLeft(8, '0');
  final String low = _fnv1a32('$normalized#').toRadixString(16).padLeft(8, '0');
  return 'f$high$low';
}

String _normalizeApiBase(String apiBaseUrl) {
  final String trimmed = apiBaseUrl.trim();
  if (trimmed.isEmpty) {
    return '';
  }
  try {
    return const InstanceEndpointNormalizer().normalizeEndpoint(trimmed);
  } on FormatException {
    return trimmed;
  }
}

int _fnv1a32(String input) {
  var hash = 0x811c9dc5;
  for (final int unit in input.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0xFFFFFFFF;
  }
  return hash;
}
