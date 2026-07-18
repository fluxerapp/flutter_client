import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  final BigInt viewChannelBit = BigInt.from(Permission.viewChannel.value);
  final ChannelPermissionOverwriteEntry baseEntry =
      ChannelPermissionOverwriteEntry(
        id: 'role-1',
        type: 0,
        allow: BigInt.zero,
        deny: BigInt.zero,
        label: 'Moderator',
      );
  const Channel textChannel = Channel(
    id: 'text-1',
    guildId: 'guild-1',
    name: 'general',
  );

  group('resolvePermissionState', () {
    test('returns allow when bit is set in allow mask', () {
      expect(
        resolvePermissionState(
          permissionBit: viewChannelBit,
          allow: viewChannelBit,
          deny: BigInt.zero,
        ),
        ChannelPermissionState.allow,
      );
    });

    test('returns deny when bit is set in deny mask', () {
      expect(
        resolvePermissionState(
          permissionBit: viewChannelBit,
          allow: BigInt.zero,
          deny: viewChannelBit,
        ),
        ChannelPermissionState.deny,
      );
    });

    test('returns inherit when bit is unset', () {
      expect(
        resolvePermissionState(
          permissionBit: viewChannelBit,
          allow: BigInt.zero,
          deny: BigInt.zero,
        ),
        ChannelPermissionState.inherit,
      );
    });
  });

  group('setPermissionState', () {
    test('sets allow and clears deny for the same bit', () {
      final ChannelPermissionOverwriteEntry updated = setPermissionState(
        entry: baseEntry.copyWith(deny: viewChannelBit),
        permissionBit: viewChannelBit,
        state: ChannelPermissionState.allow,
      );
      expect(
        resolvePermissionState(
          permissionBit: viewChannelBit,
          allow: updated.allow,
          deny: updated.deny,
        ),
        ChannelPermissionState.allow,
      );
      expect(updated.deny & viewChannelBit, BigInt.zero);
    });

    test('sets deny and clears allow for the same bit', () {
      final ChannelPermissionOverwriteEntry updated = setPermissionState(
        entry: baseEntry.copyWith(allow: viewChannelBit),
        permissionBit: viewChannelBit,
        state: ChannelPermissionState.deny,
      );
      expect(
        resolvePermissionState(
          permissionBit: viewChannelBit,
          allow: updated.allow,
          deny: updated.deny,
        ),
        ChannelPermissionState.deny,
      );
      expect(updated.allow & viewChannelBit, BigInt.zero);
    });

    test('clears both masks when inheriting', () {
      final ChannelPermissionOverwriteEntry updated = setPermissionState(
        entry: baseEntry.copyWith(allow: viewChannelBit, deny: viewChannelBit),
        permissionBit: viewChannelBit,
        state: ChannelPermissionState.inherit,
      );
      expect(
        resolvePermissionState(
          permissionBit: viewChannelBit,
          allow: updated.allow,
          deny: updated.deny,
        ),
        ChannelPermissionState.inherit,
      );
    });
  });

  group('buildChannelPermissionOverwritesUpdate', () {
    test('serializes overwrite entries for PATCH', () {
      final ChannelPermissionOverwriteEntry entry = baseEntry.copyWith(
        allow: viewChannelBit,
      );
      final request = buildChannelPermissionOverwritesUpdate(
        channel: textChannel,
        overwrites: <ChannelPermissionOverwriteEntry>[entry],
      );
      final Map<String, dynamic> body = channelUpdateRequestToPatchBody(
        request,
      );
      final List<dynamic> overwrites =
          body['permission_overwrites'] as List<dynamic>;
      expect(overwrites, hasLength(1));
      final Map<String, dynamic> firstJson =
          (overwrites.first
                  as GuildTextChannelUpdateRequestPermissionOverwrites)
              .toJson();
      expect(firstJson['id'], 'role-1');
      expect(
        firstJson['type'],
        GuildTextChannelUpdateRequestPermissionOverwritesTypeType.role,
      );
      expect(firstJson['allow'], viewChannelBit.toString());
      expect(firstJson['deny'], '0');
    });
  });
}
