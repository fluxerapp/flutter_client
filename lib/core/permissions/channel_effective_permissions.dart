import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;
import 'package:riverpod/riverpod.dart';

/// Result of channel permission resolution. When `shouldCache` is false, `value`
/// may be 0 only because guild membership or roles are not loaded yet.
typedef ChannelPermissionBitsOutcome = ({int value, bool shouldCache});

Future<ChannelPermissionBitsOutcome>
computeEffectiveGuildChannelPermissionBitsOutcome({
  required Ref ref,
  required String channelId,
}) async {
  final db = ref.read(fluxerDatabaseProvider);
  final String currentUserId = ref.read(userSettingsViewModelProvider).userId;
  final channelRow = await db.channelDao.getChannelById(channelId);
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  if (channelRow == null || channelRow.guildId.isEmpty) {
    return (value: 0, shouldCache: true);
  }
  final String guildId = channelRow.guildId;
  final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
  Guild? guild;
  for (final Guild g in guilds) {
    if (g.id == guildId) {
      guild = g;
      break;
    }
  }
  if (guild == null) {
    return (value: 0, shouldCache: false);
  }
  if (currentUserId == guild.ownerId) {
    return (value: allPermissions, shouldCache: true);
  }
  final allRoles = await db.roleDao.getRoles(guildId);
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  final memberRow = await db.memberDao.getMemberByUserId(
    currentUserId,
    guildId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  if (memberRow == null) {
    return (value: 0, shouldCache: false);
  }
  final List<String> memberRoleIds = memberRow.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
      : <String>[];
  Role? everyoneRole;
  for (final Role r in allRoles) {
    if (r.id == guildId) {
      everyoneRole = r;
      break;
    }
  }
  final int everyonePermissions =
      int.tryParse(everyoneRole?.permissions ?? '0') ?? 0;
  final List<MemberRole> memberRoles = allRoles
      .where((r) => memberRoleIds.contains(r.id))
      .map(MemberRole.fromRow)
      .toList();
  final List<String?> layers = await db.channelDao
      .getPermissionOverwriteLayersRootToLeaf(channelId);
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  final int value = evaluateChannelEffectivePermissionBits(
    guildOwnerId: guild.ownerId ?? '',
    guildId: guildId,
    currentUserId: currentUserId,
    everyonePermissions: everyonePermissions,
    memberRoles: memberRoles,
    memberRecordPresent: true,
    overwriteJsonLayersRootToLeaf: layers,
  );
  return (value: value, shouldCache: true);
}

Future<int> computeEffectiveGuildChannelPermissionBits({
  required Ref ref,
  required String channelId,
}) async {
  final ChannelPermissionBitsOutcome outcome =
      await computeEffectiveGuildChannelPermissionBitsOutcome(
        ref: ref,
        channelId: channelId,
      );
  return outcome.value;
}

final FutureProviderFamily<int, String>
effectiveGuildChannelPermissionBitsProvider =
    FutureProvider.family<int, String>((Ref ref, String channelId) {
      return readEffectiveGuildChannelPermissionBitsRef(
        ref: ref,
        channelId: channelId,
      );
    });

Future<ChannelPermissionBitsOutcome>
computeChannelLocalGuildChannelPermissionBitsOutcome({
  required Ref ref,
  required String channelId,
}) async {
  final db = ref.read(fluxerDatabaseProvider);
  final String currentUserId = ref.read(userSettingsViewModelProvider).userId;
  final channelRow = await db.channelDao.getChannelById(channelId);
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  if (channelRow == null) {
    return (value: 0, shouldCache: false);
  }
  final String guildId = channelRow.guildId;
  if (guildId.isEmpty) {
    return (value: allPermissions, shouldCache: true);
  }
  final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
  Guild? guild;
  for (final Guild g in guilds) {
    if (g.id == guildId) {
      guild = g;
      break;
    }
  }
  if (guild == null) {
    return (value: 0, shouldCache: false);
  }
  if (currentUserId == guild.ownerId) {
    return (value: allPermissions, shouldCache: true);
  }
  final allRoles = await db.roleDao.getRoles(guildId);
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  final memberRow = await db.memberDao.getMemberByUserId(
    currentUserId,
    guildId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  if (memberRow == null) {
    return (value: 0, shouldCache: false);
  }
  final List<String> memberRoleIds = memberRow.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
      : <String>[];
  Role? everyoneRole;
  for (final Role r in allRoles) {
    if (r.id == guildId) {
      everyoneRole = r;
      break;
    }
  }
  final int everyonePermissions =
      int.tryParse(everyoneRole?.permissions ?? '0') ?? 0;
  final List<MemberRole> memberRoles = allRoles
      .where((r) => memberRoleIds.contains(r.id))
      .map(MemberRole.fromRow)
      .toList();
  // Only apply this channel's own overwrites, not parent category layers.
  final int value = evaluateChannelEffectivePermissionBits(
    guildOwnerId: guild.ownerId ?? '',
    guildId: guildId,
    currentUserId: currentUserId,
    everyonePermissions: everyonePermissions,
    memberRoles: memberRoles,
    memberRecordPresent: true,
    overwriteJsonLayersRootToLeaf: [channelRow.permissionOverwritesJson],
  );
  return (value: value, shouldCache: true);
}

Future<int> computeChannelLocalGuildChannelPermissionBits({
  required Ref ref,
  required String channelId,
}) async {
  final ChannelPermissionBitsOutcome outcome =
      await computeChannelLocalGuildChannelPermissionBitsOutcome(
        ref: ref,
        channelId: channelId,
      );
  return outcome.value;
}

final FutureProviderFamily<int, String>
channelLocalGuildChannelPermissionBitsProvider =
    FutureProvider.family<int, String>((Ref ref, String channelId) {
      return readLocalGuildChannelPermissionBitsRef(
        ref: ref,
        channelId: channelId,
      );
    });
