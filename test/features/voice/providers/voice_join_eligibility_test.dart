import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';

void main() {
  group('canJoinGuildVoiceChannelFromBits', () {
    test('allows join when permission bits are null', () {
      expect(
        canJoinGuildVoiceChannelFromBits(
          guildId: 'g1',
          channelType: ChannelType.guildVoice,
          permissionBits: null,
        ),
        isTrue,
      );
    });

    test('denies join without Connect on guild voice channels', () {
      final int bitsWithoutConnect = allPermissions & ~Permission.connect.value;
      expect(
        canJoinGuildVoiceChannelFromBits(
          guildId: 'g1',
          channelType: ChannelType.guildVoice,
          permissionBits: bitsWithoutConnect,
        ),
        isFalse,
      );
    });

    test('allows join with Connect on guild voice channels', () {
      expect(
        canJoinGuildVoiceChannelFromBits(
          guildId: 'g1',
          channelType: ChannelType.guildVoice,
          permissionBits: Permission.connect.value,
        ),
        isTrue,
      );
    });

    test('allows join for non-guild-voice channel types', () {
      expect(
        canJoinGuildVoiceChannelFromBits(
          guildId: 'g1',
          channelType: ChannelType.guildText,
          permissionBits: 0,
        ),
        isTrue,
      );
    });

    test('allows join when guild id is empty', () {
      expect(
        canJoinGuildVoiceChannelFromBits(
          guildId: '',
          channelType: ChannelType.guildVoice,
          permissionBits: 0,
        ),
        isTrue,
      );
    });
  });
}
