import 'package:fluxer_fcm/fcm_push_message.dart';

typedef FcmBackgroundDisplayPredicate = bool Function(FcmPushMessage message);

abstract final class FcmBackgroundDisplayHooks {
  static FcmBackgroundDisplayPredicate? shouldDisplay;

  static bool shouldDisplayLocalNotification(FcmPushMessage message) {
    final FcmBackgroundDisplayPredicate? predicate = shouldDisplay;
    if (predicate == null) {
      return false;
    }
    return predicate(message);
  }

  static void resetForTesting() {
    shouldDisplay = null;
  }
}
