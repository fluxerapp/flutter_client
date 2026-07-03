import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_fcm/fcm_background_handler_policy.dart';
import 'package:fluxer_fcm/fcm_background_local_notifications.dart';
import 'package:fluxer_fcm/fcm_message_mapper.dart';
import 'package:fluxer_fcm/fcm_push_message.dart';
import 'package:fluxer_fcm/firebase_options.dart';
import 'package:fluxer_fcm/fluxer_fcm_bootstrap.dart';

@pragma('vm:entry-point')
Future<void> fcmBackgroundMessageHandler(RemoteMessage message) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    if (kDebugMode) {
      debugPrint(
        '[FCM] background message id=${message.messageId} '
        'hasNotification=${message.notification != null} '
        'data=${message.data}',
      );
    }
    final FcmPushMessage mapped = mapRemoteMessage(message);
    if (FluxerFcmBootstrap.shouldSaveTapPayloadCache(mapped.payload)) {
      await FluxerFcmBootstrap.saveTapPayloadCache(
        payload: mapped.payload,
        gcmMessageId: message.messageId,
      );
    }
    if (shouldDisplayFcmBackgroundLocalNotification(message, mapped)) {
      await showFcmBackgroundNotification(mapped);
    }
  } on Object catch (error, stackTrace) {
    if (kDebugMode) {
      debugPrint('[FCM] background handler failed: $error\n$stackTrace');
    }
  }
}
