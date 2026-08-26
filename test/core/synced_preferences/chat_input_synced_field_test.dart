import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/chat_input_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/chat_input_preferences_provider.dart';

void main() {
  group('ChatInputSyncedField', () {
    test('defaults saveCameraCapturesToDevice to true when proto field absent', () {
      final state = ChatInputSyncedField.fromProtoSettings(pb.ChatInputSettings());
      expect(state.saveCameraCapturesToDevice, isTrue);
    });

    test('writes absent proto value when enabled (default)', () {
      final proto = pb.ChatInputSettings();
      ChatInputSyncedField.writeProtoSettings(
        proto,
        const ChatInputPreferencesState(),
      );
      expect(proto.hasSaveCameraCapturesToDevice(), isFalse);
    });

    test('writes false when disabled', () {
      final proto = pb.ChatInputSettings();
      ChatInputSyncedField.writeProtoSettings(
        proto,
        const ChatInputPreferencesState(saveCameraCapturesToDevice: false),
      );
      expect(proto.saveCameraCapturesToDevice, isFalse);
    });
  });
}
