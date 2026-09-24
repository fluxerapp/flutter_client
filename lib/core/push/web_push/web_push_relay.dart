const String kPushRelayOrigin = 'https://push.fluxer.com';

String fcmRelayUrl({required String appId, required String deviceToken}) {
  return '$kPushRelayOrigin/relay/v1/fcm/${_segment(appId)}/${_segment(deviceToken)}';
}

String apnsRelayUrl({
  required String appId,
  required String environment,
  required String deviceTokenHex,
}) {
  return '$kPushRelayOrigin/relay/v1/apns/'
      '${_segment(appId)}/${_segment(environment)}/${_segment(deviceTokenHex)}';
}

String apnsVoipRelayUrl({
  required String appId,
  required String environment,
  required String deviceTokenHex,
}) {
  return '$kPushRelayOrigin/relay/v1/apns-voip/'
      '${_segment(appId)}/${_segment(environment)}/${_segment(deviceTokenHex)}';
}

String _segment(String value) => Uri.encodeComponent(value);
