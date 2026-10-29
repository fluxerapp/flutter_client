import 'package:fluxer_app/core/build/push_provider_kind.dart';

enum FluxerRelayDeliveryStatus { inUse, off, notUsed }

bool _pushBuildUsesFluxerRelay(PushProviderKind kind) {
  return kind == PushProviderKind.apple ||
      kind == PushProviderKind.firebaseMessaging;
}

FluxerRelayDeliveryStatus resolveFluxerRelayDeliveryStatus({
  required PushProviderKind kind,
  required bool isOfficialInstance,
  required bool relayConsentGranted,
}) {
  if (!_pushBuildUsesFluxerRelay(kind)) {
    return FluxerRelayDeliveryStatus.notUsed;
  }
  if (isOfficialInstance || relayConsentGranted) {
    return FluxerRelayDeliveryStatus.inUse;
  }
  return FluxerRelayDeliveryStatus.off;
}

String pushProviderDisplayName(PushProviderKind kind) {
  return switch (kind) {
    PushProviderKind.apple => 'Apple Push Notifications',
    PushProviderKind.firebaseMessaging => 'Firebase Cloud Messaging',
    PushProviderKind.unifiedPush => 'UnifiedPush',
  };
}

const Map<String, String> _knownUnifiedPushDistributorLabels = <String, String>{
  'org.unifiedpush.android.connector': 'UnifiedPush Connector',
  'io.heckel.ntfy': 'ntfy',
  'com.github.ntfy': 'ntfy',
};

String formatUnifiedPushDistributor(String? packageId) {
  if (packageId == null || packageId.trim().isEmpty) {
    return '';
  }
  final String trimmed = packageId.trim();
  final String? known = _knownUnifiedPushDistributorLabels[trimmed];
  if (known != null) {
    return known;
  }
  final int lastDot = trimmed.lastIndexOf('.');
  if (lastDot == -1 || lastDot == trimmed.length - 1) {
    return trimmed;
  }
  return trimmed.substring(lastDot + 1);
}

String? unifiedPushGatewayHost(String? endpointUrl) {
  if (endpointUrl == null || endpointUrl.trim().isEmpty) {
    return null;
  }
  final Uri? parsed = Uri.tryParse(endpointUrl.trim());
  final String? host = parsed?.host;
  if (host == null || host.isEmpty) {
    return null;
  }
  return host;
}
