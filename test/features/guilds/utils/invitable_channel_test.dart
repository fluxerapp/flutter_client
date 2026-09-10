import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/utils/invitable_channel.dart';

void main() {
  const String guildId = 'guild-1';
  const Channel announcements = Channel(
    id: 'announcements',
    guildId: guildId,
    name: 'announcements',
  );
  const Channel general = Channel(
    id: 'general',
    guildId: guildId,
    name: 'general',
    position: 1,
  );
  const Channel voice = Channel(
    id: 'voice-1',
    guildId: guildId,
    name: 'voice',
    type: ChannelType.guildVoice,
    position: 2,
  );

  group('resolveInvitableChannel', () {
    test('prefers the selected channel when it is invitable', () {
      final InvitableChannelMatch? match = resolveInvitableChannel(
        channels: <Channel>[announcements, general],
        guildId: guildId,
        permissionBitsFor: (String id) {
          return id == general.id ? Permission.createInstantInvite.value : 0;
        },
        selectedChannelId: general.id,
      );
      expect(match?.channel.id, general.id);
      expect(match?.capability.useVanityUrl, isFalse);
    });

    test('skips the selected channel when it cannot be invited to', () {
      final InvitableChannelMatch? match = resolveInvitableChannel(
        channels: <Channel>[announcements, general],
        guildId: guildId,
        permissionBitsFor: (String id) {
          return id == general.id ? Permission.createInstantInvite.value : 0;
        },
        selectedChannelId: announcements.id,
      );
      expect(match?.channel.id, general.id);
    });

    test('walks sidebar order when no selected channel is invitable', () {
      final InvitableChannelMatch? match = resolveInvitableChannel(
        channels: <Channel>[announcements, general, voice],
        guildId: guildId,
        permissionBitsFor: (String id) {
          return id == voice.id ? Permission.createInstantInvite.value : 0;
        },
      );
      expect(match?.channel.id, voice.id);
    });

    test('uses vanity URL when create invite is denied', () {
      final InvitableChannelMatch? match = resolveInvitableChannel(
        channels: <Channel>[announcements, general],
        guildId: guildId,
        permissionBitsFor: (_) => Permission.viewChannel.value,
        vanityUrlCode: 'fluxer',
      );
      expect(match?.channel.id, announcements.id);
      expect(match?.capability.useVanityUrl, isTrue);
      expect(match?.capability.vanityUrlCode, 'fluxer');
    });

    test('skips channels whose permission bits are unknown', () {
      final InvitableChannelMatch? match = resolveInvitableChannel(
        channels: <Channel>[announcements, general],
        guildId: guildId,
        permissionBitsFor: (String id) {
          return id == general.id ? Permission.createInstantInvite.value : null;
        },
      );
      expect(match?.channel.id, general.id);
    });

    test('returns null when no channel is invitable', () {
      final InvitableChannelMatch? match = resolveInvitableChannel(
        channels: <Channel>[announcements, general],
        guildId: guildId,
        permissionBitsFor: (_) => Permission.viewChannel.value,
      );
      expect(match, isNull);
    });
  });
}
