import 'package:fluxer_app/core/push/unified_push/unified_push_incoming_policy.dart';
import 'package:test/test.dart';

const String _kInstance = 'fluxer';

UnifiedPushIncomingAction _resolve({
  String instance = _kInstance,
  bool decrypted = true,
  bool backgroundMode = false,
  Map<String, String> payload = const <String, String>{},
}) {
  return resolveUnifiedPushIncomingAction(
    instance: instance,
    expectedInstance: _kInstance,
    decrypted: decrypted,
    backgroundMode: backgroundMode,
    payload: payload,
  );
}

void main() {
  group('resolveUnifiedPushIncomingAction', () {
    test('ignores a different instance', () {
      expect(_resolve(instance: 'other'), UnifiedPushIncomingAction.ignore);
    });

    test('does not map undecrypted payloads', () {
      expect(
        _resolve(decrypted: false),
        UnifiedPushIncomingAction.healUndecrypted,
      );
      expect(
        _resolve(decrypted: false, backgroundMode: true),
        UnifiedPushIncomingAction.healUndecrypted,
      );
    });

    test('shows locally on the background isolate', () {
      expect(
        _resolve(backgroundMode: true),
        UnifiedPushIncomingAction.showLocally,
      );
    });

    test('emits to the coordinator on the main isolate', () {
      expect(_resolve(), UnifiedPushIncomingAction.emitToCoordinator);
    });

    test('handles clear payloads on the background isolate', () {
      expect(
        _resolve(
          backgroundMode: true,
          payload: const <String, String>{'type': 'notification_clear'},
        ),
        UnifiedPushIncomingAction.handleClear,
      );
    });

    test('emits clear payloads on the main isolate', () {
      expect(
        _resolve(payload: const <String, String>{'action': 'clear_channel'}),
        UnifiedPushIncomingAction.emitToCoordinator,
      );
    });
  });
}
