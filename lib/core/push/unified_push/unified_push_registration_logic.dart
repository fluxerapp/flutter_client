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
