import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

void main() {
  group('Channel-local vs inherited permissions', () {
    const String guildId = 'guild-1';
    const String userId = 'user-1';
    const String everyoneRoleId = 'guild-1';
    const String roleAId = 'role-a';

    String categoryDenyConnectOverwrites() => jsonEncode([
      {
        'id': everyoneRoleId,
        'type': 0,
        'allow': '0',
        'deny': '${Permission.connect.value}',
      },
    ]);

    String categoryNeutralOverwrites() => jsonEncode([
      {'id': everyoneRoleId, 'type': 0, 'allow': '0', 'deny': '0'},
    ]);

    group('Inherited permissions (full category chain)', () {
      test(
        'category denies CONNECT: child voice channel without own overwrites is denied',
        () {
          // Channel has no permissionOverwritesJson -> empty layer
          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions: Permission.viewChannel.value,
            memberRoles: const [],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: [
              categoryDenyConnectOverwrites(), // category layer denies CONNECT
              null, // channel has no overwrites
            ],
          );

          expect(hasPermission(result, Permission.viewChannel), isTrue);
          expect(hasPermission(result, Permission.connect), isFalse);
        },
      );

      test(
        'category allows CONNECT: child voice channel without own overwrites is allowed',
        () {
          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions:
                Permission.viewChannel.value | Permission.connect.value,
            memberRoles: const [],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: [
              categoryNeutralOverwrites(), // category doesn't remove CONNECT
              null,
            ],
          );

          expect(hasPermission(result, Permission.connect), isTrue);
        },
      );
    });

    group('Channel-local permissions (desktop-aligned)', () {
      test(
        'category denies CONNECT: channel-local allows CONNECT when channel has no overwrites',
        () {
          // Channel-local only applies the single channel layer
          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions:
                Permission.viewChannel.value | Permission.connect.value,
            memberRoles: const [],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: [null], // only channel layer (empty)
          );

          expect(hasPermission(result, Permission.viewChannel), isTrue);
          expect(hasPermission(result, Permission.connect), isTrue);
        },
      );

      test('channel itself denies CONNECT via @everyone overwrite', () {
        String channelDenyConnect() => jsonEncode([
          {
            'id': everyoneRoleId,
            'type': 0,
            'allow': '0',
            'deny': '${Permission.connect.value}',
          },
        ]);

        // Channel-local: single layer with deny
        final int localResult = evaluateChannelEffectivePermissionBits(
          guildOwnerId: 'owner',
          guildId: guildId,
          currentUserId: userId,
          everyonePermissions:
              Permission.viewChannel.value | Permission.connect.value,
          memberRoles: const [],
          memberRecordPresent: true,
          overwriteJsonLayersRootToLeaf: [channelDenyConnect()],
        );

        // Inherited: also has channel layer (last in chain)
        final int inheritedResult = evaluateChannelEffectivePermissionBits(
          guildOwnerId: 'owner',
          guildId: guildId,
          currentUserId: userId,
          everyonePermissions:
              Permission.viewChannel.value | Permission.connect.value,
          memberRoles: const [],
          memberRecordPresent: true,
          overwriteJsonLayersRootToLeaf: [
            categoryNeutralOverwrites(),
            channelDenyConnect(),
          ],
        );

        expect(
          hasPermission(localResult, Permission.connect),
          isFalse,
          reason: 'channel-local should deny CONNECT',
        );
        expect(
          hasPermission(inheritedResult, Permission.connect),
          isFalse,
          reason: 'inherited should also deny CONNECT when channel denies',
        );
      });

      test(
        'role overwrite on channel grants CONNECT despite @everyone deny',
        () {
          String everyoneDenyConnect() => jsonEncode([
            {
              'id': everyoneRoleId,
              'type': 0,
              'allow': '0',
              'deny': '${Permission.connect.value}',
            },
          ]);

          String roleACount() => jsonEncode([
            {
              'id': roleAId,
              'type': 0,
              'allow': '${Permission.connect.value}',
              'deny': '0',
            },
          ]);

          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions: Permission.viewChannel.value,
            memberRoles: [
              const MemberRole(id: roleAId, name: 'Moderator', color: 0),
            ],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: [
              everyoneDenyConnect(),
              roleACount(),
            ],
          );

          // Role allow grants CONNECT even though @everyone denies it
          expect(
            hasPermission(result, Permission.connect),
            isTrue,
            reason: 'role grant should override @everyone deny',
          );
          expect(hasPermission(result, Permission.viewChannel), isTrue);
        },
      );

      test(
        '@everyone fully deny CONNECT: role-required lock applies even with role grant',
        () {
          String everyoneDenyConnect() => jsonEncode([
            {
              'id': everyoneRoleId,
              'type': 0,
              'allow': '0',
              'deny': '${Permission.connect.value}',
            },
          ]);

          String roleACount() => jsonEncode([
            {
              'id': roleAId,
              'type': 0,
              'allow': '${Permission.connect.value}',
              'deny': '0',
            },
          ]);

          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions: Permission.viewChannel.value,
            memberRoles: [
              const MemberRole(id: roleAId, name: 'Moderator', color: 0),
            ],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: [
              everyoneDenyConnect(),
              roleACount(),
            ],
          );

          expect(
            hasPermission(result, Permission.connect),
            isTrue,
            reason: 'user can connect via role override',
          );
        },
      );
    });

    group('Empty/null permissionOverwritesJson edge cases', () {
      test(
        'null channel overwrites with neutral category grants all base permissions',
        () {
          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions:
                Permission.viewChannel.value | Permission.connect.value,
            memberRoles: const [],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: [null, null],
          );

          expect(hasPermission(result, Permission.connect), isTrue);
        },
      );

      test(
        'empty string channel overwrites with neutral category grants all base permissions',
        () {
          final int result = evaluateChannelEffectivePermissionBits(
            guildOwnerId: 'owner',
            guildId: guildId,
            currentUserId: userId,
            everyonePermissions:
                Permission.viewChannel.value | Permission.connect.value,
            memberRoles: const [],
            memberRecordPresent: true,
            overwriteJsonLayersRootToLeaf: ['', null],
          );

          expect(hasPermission(result, Permission.connect), isTrue);
        },
      );
    });
  });
}
