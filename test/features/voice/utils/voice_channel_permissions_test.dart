import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/voice/utils/voice_channel_permissions.dart';

void main() {
  group('resolveVoiceChannelPermissions', () {
    test('includes priority speaker when bit is set', () {
      final VoiceChannelPermissions permissions = resolveVoiceChannelPermissions(
        Permission.prioritySpeaker.value,
      );

      expect(permissions.canPrioritySpeaker, isTrue);
      expect(permissions.canSpeak, isFalse);
    });

    test('defaults canPrioritySpeaker to false without bit', () {
      final VoiceChannelPermissions permissions = resolveVoiceChannelPermissions(
        Permission.speak.value | Permission.connect.value,
      );

      expect(permissions.canPrioritySpeaker, isFalse);
      expect(permissions.canSpeak, isTrue);
      expect(permissions.canConnect, isTrue);
    });
  });

  group('resolveVoiceChannelPermissionsForChannel', () {
    test('returns null when channel or bits are missing', () {
      expect(
        resolveVoiceChannelPermissionsForChannel(
          channelId: null,
          permissionBits: Permission.speak.value,
        ),
        isNull,
      );
      expect(
        resolveVoiceChannelPermissionsForChannel(
          channelId: 'voice-1',
          permissionBits: null,
        ),
        isNull,
      );
    });
  });
}
