import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';

final RegExp _discoveryTagPattern = RegExp(
  r'^[\p{L}\p{N}][\p{L}\p{N} \-_+&]*$',
  unicode: true,
);

String normalizeDiscoveryTag(String tag) {
  return tag.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}

bool isValidDiscoveryTag(String tag) {
  final String normalized = normalizeDiscoveryTag(tag);
  if (normalized.length < DiscoveryConstants.tagMinLength ||
      normalized.length > DiscoveryConstants.tagMaxLength) {
    return false;
  }
  return _discoveryTagPattern.hasMatch(normalized);
}
