import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

final class FcmAndroidSystemNotificationCancelBridge {
  FcmAndroidSystemNotificationCancelBridge._();

  static const MethodChannel _channel = MethodChannel(
    'fluxer_app/android_notifications',
  );

  static Future<void> cancelFcmSystemDuplicates({
    required Iterable<String> messageIds,
    required int excludeNotificationId,
  }) async {
    final List<String> normalizedMessageIds = messageIds
        .where((String id) => id.isNotEmpty)
        .toList();
    if (normalizedMessageIds.isEmpty) {
      return;
    }
    try {
      await _channel
          .invokeMethod<Object?>('cancelFcmSystemDuplicates', <String, Object>{
            'messageIds': normalizedMessageIds,
            'excludeNotificationId': excludeNotificationId,
          });
    } on MissingPluginException {
      return;
    } on PlatformException catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          '[FcmAndroidSystemNotificationCancelBridge] cancel failed: '
          '$error\n$stackTrace',
        );
      }
    }
  }
}
