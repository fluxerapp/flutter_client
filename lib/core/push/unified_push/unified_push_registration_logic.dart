bool shouldSkipMobilePushRegistration({
  required String currentUserId,
  required String? persistedUserId,
  required String? pushSubscriptionId,
  required String endpointUrl,
  required String encryptionKey,
  required String authSecret,
  required String? persistedEndpointUrl,
  required String? persistedEncryptionKey,
  required String? persistedAuthSecret,
}) {
  if (persistedUserId != currentUserId) {
    return false;
  }
  if (pushSubscriptionId == null || pushSubscriptionId.isEmpty) {
    return false;
  }
  return persistedEndpointUrl == endpointUrl &&
      persistedEncryptionKey == encryptionKey &&
      persistedAuthSecret == authSecret;
}

bool shouldDeletePriorUnifiedPushRegistration({
  required bool endpointRotated,
  required String? oldSubscriptionId,
  required String? oldEndpointUrl,
  required String newDeviceId,
}) {
  if (!endpointRotated) {
    return false;
  }
  if (oldSubscriptionId == null ||
      oldSubscriptionId.isEmpty ||
      oldEndpointUrl == null ||
      oldEndpointUrl.isEmpty) {
    return false;
  }
  return oldSubscriptionId != newDeviceId;
}

bool hasUnifiedPushEndpointRotated({
  required String endpointUrl,
  required String encryptionKey,
  required String authSecret,
  required String? persistedEndpointUrl,
  required String? persistedEncryptionKey,
  required String? persistedAuthSecret,
}) {
  if (persistedEndpointUrl == null || persistedEndpointUrl.isEmpty) {
    return false;
  }
  return persistedEndpointUrl != endpointUrl ||
      persistedEncryptionKey != encryptionKey ||
      persistedAuthSecret != authSecret;
}
