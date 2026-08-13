import 'package:fluxer_app/core/push/push_notification_payload.dart';

enum UnifiedPushIncomingAction {
  ignore,
  healUndecrypted,
  handleClear,
  showLocally,
  emitToCoordinator,
}

UnifiedPushIncomingAction resolveUnifiedPushIncomingAction({
  required String instance,
  required String expectedInstance,
  required bool decrypted,
  required bool backgroundMode,
  required Map<String, String> payload,
}) {
  if (instance != expectedInstance) {
    return UnifiedPushIncomingAction.ignore;
  }
  if (!decrypted) {
    return UnifiedPushIncomingAction.healUndecrypted;
  }
  if (isNotificationClearPayload(payload)) {
    return backgroundMode
        ? UnifiedPushIncomingAction.handleClear
        : UnifiedPushIncomingAction.emitToCoordinator;
  }
  if (backgroundMode) {
    return UnifiedPushIncomingAction.showLocally;
  }
  return UnifiedPushIncomingAction.emitToCoordinator;
}
