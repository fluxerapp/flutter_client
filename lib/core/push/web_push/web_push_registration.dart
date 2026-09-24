import 'package:dio/dio.dart';
import 'package:fluxer_app/core/push/web_push/web_push_key_store.dart';

bool shouldSkipWebPushRegistration({
  required String currentUserId,
  required String relayUrl,
  required String publicKey,
  required String? lastRegisteredUserId,
  required String? lastRegisteredRelayUrl,
  required String? lastRegisteredPublicKey,
}) {
  if (lastRegisteredUserId != currentUserId) {
    return false;
  }
  if (lastRegisteredRelayUrl == null || lastRegisteredRelayUrl.isEmpty) {
    return false;
  }
  if (lastRegisteredPublicKey == null || lastRegisteredPublicKey.isEmpty) {
    return false;
  }
  return lastRegisteredRelayUrl == relayUrl &&
      lastRegisteredPublicKey == publicKey;
}

Future<void> unregisterLegacyRawTokenOnce({
  required WebPushKeyStore keyStore,
  required String platform,
  required String userId,
  required Future<void> Function() unregister,
}) async {
  if (await keyStore.isLegacyRawCleared(platform: platform, userId: userId)) {
    return;
  }
  try {
    await unregister();
    await keyStore.markLegacyRawCleared(platform: platform, userId: userId);
  } on DioException catch (error) {
    final int? statusCode = error.response?.statusCode;
    if (statusCode == 404 || statusCode == 400 || statusCode == 204) {
      await keyStore.markLegacyRawCleared(platform: platform, userId: userId);
    }
  }
}
