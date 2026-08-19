import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';

VoiceJoinEligibility _resolve({
  bool channelExists = true,
  String guildId = 'g1',
  ChannelType channelType = ChannelType.guildVoice,
  bool isTimedOut = false,
  int? connectPermissionBits = 1 << 20,
  bool isUnclaimed = false,
  bool isGuildOwner = false,
  int userLimit = 0,
  int occupiedConnectionCount = 0,
}) {
  return resolveVoiceJoinEligibility(
    channelExists: channelExists,
    guildId: guildId,
    channelType: channelType,
    isTimedOut: isTimedOut,
    connectPermissionBits: connectPermissionBits,
    isUnclaimed: isUnclaimed,
    isGuildOwner: isGuildOwner,
    userLimit: userLimit,
    occupiedConnectionCount: occupiedConnectionCount,
  );
}

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

  group('resolveVoiceJoinEligibility', () {
    test('denies when the channel is missing', () {
      expect(_resolve(channelExists: false).canJoin, isFalse);
    });

    test('denies timed out guild members', () {
      expect(_resolve(isTimedOut: true).canJoin, isFalse);
    });

    test('allows timed out users in DMs', () {
      expect(
        _resolve(
          guildId: '',
          channelType: ChannelType.dm,
          isTimedOut: true,
        ).canJoin,
        isTrue,
      );
    });

    test('denies guild voice without Connect', () {
      expect(_resolve(connectPermissionBits: 0).canJoin, isFalse);
    });

    test('allows guild voice when Connect bits are unresolved', () {
      expect(_resolve(connectPermissionBits: null).canJoin, isTrue);
    });

    test('denies unclaimed non-owners in a guild', () {
      expect(_resolve(isUnclaimed: true).canJoin, isFalse);
    });

    test('allows unclaimed guild owners', () {
      expect(_resolve(isUnclaimed: true, isGuildOwner: true).canJoin, isTrue);
    });

    test('denies unclaimed 1:1 DMs', () {
      expect(
        _resolve(
          guildId: '',
          channelType: ChannelType.dm,
          isUnclaimed: true,
        ).canJoin,
        isFalse,
      );
    });

    test('allows unclaimed group DMs', () {
      expect(
        _resolve(
          guildId: '',
          channelType: ChannelType.groupDm,
          isUnclaimed: true,
        ).canJoin,
        isTrue,
      );
    });

    test('denies when the voice channel user limit is full', () {
      expect(
        _resolve(userLimit: 2, occupiedConnectionCount: 2).canJoin,
        isFalse,
      );
    });

    test('allows when under the voice channel user limit', () {
      expect(
        _resolve(userLimit: 2, occupiedConnectionCount: 1).canJoin,
        isTrue,
      );
    });

    test('ignores user limit in DMs', () {
      expect(
        _resolve(
          guildId: '',
          channelType: ChannelType.dm,
          userLimit: 1,
          occupiedConnectionCount: 8,
        ).canJoin,
        isTrue,
      );
    });
  });
}
