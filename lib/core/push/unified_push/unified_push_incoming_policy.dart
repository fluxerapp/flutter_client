import 'package:fluxer_app/core/push/android/android_push_pipeline.dart';

enum UnifiedPushIncomingAction {
  ignore,
  healUndecrypted,
  handleClear,
  showLocally,
  showIncomingCall,
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
  switch (resolveAndroidPushIncomingAction(
    decrypted: decrypted,
    backgroundMode: backgroundMode,
    payload: payload,
  )) {
    case AndroidPushIncomingAction.discard:
      return UnifiedPushIncomingAction.ignore;
    case AndroidPushIncomingAction.handleClear:
      return UnifiedPushIncomingAction.handleClear;
    case AndroidPushIncomingAction.showLocally:
      return UnifiedPushIncomingAction.showLocally;
    case AndroidPushIncomingAction.showIncomingCall:
    case AndroidPushIncomingAction.showFallbackCall:
      return UnifiedPushIncomingAction.showIncomingCall;
    case AndroidPushIncomingAction.emit:
      return UnifiedPushIncomingAction.emitToCoordinator;
  }
}
