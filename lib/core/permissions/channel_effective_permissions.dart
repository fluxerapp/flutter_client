import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;
import 'package:riverpod/riverpod.dart';

typedef ChannelPermissionBitsOutcome = ({int value, bool shouldCache});

bool bypassesChannelSlowmode(ChannelPermissionBitsOutcome? outcome) {
  if (outcome == null || !outcome.shouldCache) {
    return true;
  }
  return bypassesSlowmode(outcome.value);
}

Future<Guild?> _guildForPermissionResolution({
  required FluxerDatabase db,
  required String guildId,
}) async {
  final Server? row = await db.guildDao.getServerById(guildId);
  if (row == null) {
    return null;
  }
  return Guild.fromRow(row);
}

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
  if (channelRow == null) {
    return (value: 0, shouldCache: false);
  }
  if (channelRow.guildId.isEmpty) {
    return (value: 0, shouldCache: true);
  }
  final String guildId = channelRow.guildId;
  final Guild? guild = await _guildForPermissionResolution(
    db: db,
    guildId: guildId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
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
  Role? everyoneRole;
  for (final Role r in allRoles) {
    if (r.id == guildId) {
      everyoneRole = r;
      break;
    }
  }
  final int everyonePermissions = everyoneRolePermissionsFromString(
    everyoneRole?.permissions,
  );
  final List<String> memberRoleIds = memberRow.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
      : <String>[];
  final List<MemberRole> memberRoles = allRoles
      .where((r) => memberRoleIds.contains(r.id))
      .map(MemberRole.fromRow)
      .toList();
  final List<String?> layers = await db.channelDao.getPermissionOverwriteLayers(
    channelId,
  );
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
  return (
    value: isThreadChannelType(channelRow.type)
        ? threadViewPermissions(value)
        : value,
    shouldCache: true,
  );
}

Future<Map<String, ChannelPermissionBitsOutcome>>
computeEffectiveGuildChannelPermissionBitsOutcomesForGuild({
  required Ref ref,
  required String guildId,
  Set<String>? onlyChannelIds,
}) async {
  const ChannelPermissionBitsOutcome notResolved = (
    value: 0,
    shouldCache: false,
  );
  final db = ref.read(fluxerDatabaseProvider);
  final String currentUserId = ref.read(userSettingsViewModelProvider).userId;
  final List<Channel> channels = await db.channelDao.getChannels(
    guildId,
    includeThreads: true,
  );
  if (!ref.mounted) {
    return const <String, ChannelPermissionBitsOutcome>{};
  }
  final Map<String, Channel> byId = <String, Channel>{
    for (final Channel channel in channels) channel.id: channel,
  };
  final List<Channel> targets = onlyChannelIds == null
      ? channels
      : <Channel>[
          for (final String id in onlyChannelIds)
            if (byId[id] case final Channel channel) channel,
        ];
  Map<String, ChannelPermissionBitsOutcome> all(
    ChannelPermissionBitsOutcome outcome,
  ) => <String, ChannelPermissionBitsOutcome>{
    for (final Channel channel in targets) channel.id: outcome,
  };
  if (targets.isEmpty) {
    return const <String, ChannelPermissionBitsOutcome>{};
  }
  final Guild? guild = await _guildForPermissionResolution(
    db: db,
    guildId: guildId,
  );
  if (!ref.mounted) {
    return const <String, ChannelPermissionBitsOutcome>{};
  }
  if (guild == null) {
    return all(notResolved);
  }
  if (currentUserId == guild.ownerId) {
    return all((value: allPermissions, shouldCache: true));
  }
  final List<Role> allRoles = await db.roleDao.getRoles(guildId);
  if (!ref.mounted) {
    return const <String, ChannelPermissionBitsOutcome>{};
  }
  final memberRow = await db.memberDao.getMemberByUserId(
    currentUserId,
    guildId,
  );
  if (!ref.mounted) {
    return const <String, ChannelPermissionBitsOutcome>{};
  }
  if (memberRow == null) {
    return all(notResolved);
  }
  Role? everyoneRole;
  for (final Role r in allRoles) {
    if (r.id == guildId) {
      everyoneRole = r;
      break;
    }
  }
  final int everyonePermissions = everyoneRolePermissionsFromString(
    everyoneRole?.permissions,
  );
  final List<String> memberRoleIds = memberRow.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
      : <String>[];
  final List<MemberRole> memberRoles = allRoles
      .where((r) => memberRoleIds.contains(r.id))
      .map(MemberRole.fromRow)
      .toList();
  final String guildOwnerId = guild.ownerId ?? '';
  int evaluateWithOverwrites(List<String?> overwriteLayers) =>
      evaluateChannelEffectivePermissionBits(
        guildOwnerId: guildOwnerId,
        guildId: guildId,
        currentUserId: currentUserId,
        everyonePermissions: everyonePermissions,
        memberRoles: memberRoles,
        memberRecordPresent: true,
        overwriteJsonLayersRootToLeaf: overwriteLayers,
      );
  final int guildPermissionBits = evaluateWithOverwrites(const <String?>[]);
  return <String, ChannelPermissionBitsOutcome>{
    for (final Channel channel in targets)
      channel.id: () {
        final int value;
        if (isThreadChannelType(channel.type)) {
          final String? parentOverwrites =
              byId[channel.parentId]?.permissionOverwritesJson;
          final int parentBits =
              parentOverwrites == null ||
                  !_hasPermissionOverwritesJson(parentOverwrites)
              ? guildPermissionBits
              : evaluateWithOverwrites(<String?>[parentOverwrites]);
          value = threadViewPermissions(parentBits);
        } else if (!_hasPermissionOverwritesJson(
          channel.permissionOverwritesJson,
        )) {
          value = guildPermissionBits;
        } else {
          value = evaluateWithOverwrites(<String?>[
            channel.permissionOverwritesJson,
          ]);
        }
        return (value: value, shouldCache: true);
      }(),
  };
}

bool _hasPermissionOverwritesJson(String? json) {
  if (json == null || json.isEmpty) {
    return false;
  }
  final Object? decoded = jsonDecode(json);
  if (decoded is List) {
    return decoded.isNotEmpty;
  }
  if (decoded is Map) {
    return decoded.isNotEmpty;
  }
  return true;
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
  final Guild? guild = await _guildForPermissionResolution(
    db: db,
    guildId: guildId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
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
  Role? everyoneRole;
  for (final Role r in allRoles) {
    if (r.id == guildId) {
      everyoneRole = r;
      break;
    }
  }
  final int everyonePermissions = everyoneRolePermissionsFromString(
    everyoneRole?.permissions,
  );
  final List<String> memberRoleIds = memberRow.roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(memberRow.roleIdsJson) as List<dynamic>)
      : <String>[];
  final List<MemberRole> memberRoles = allRoles
      .where((r) => memberRoleIds.contains(r.id))
      .map(MemberRole.fromRow)
      .toList();
  final bool isThread = isThreadChannelType(channelRow.type);
  final String? threadParentId = isThread ? channelRow.parentId : null;
  final String? leafOverwritesJson = threadParentId == null
      ? channelRow.permissionOverwritesJson
      : (await db.channelDao.getChannelById(
          threadParentId,
        ))?.permissionOverwritesJson;
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
    overwriteJsonLayersRootToLeaf: [leafOverwritesJson],
  );
  return (
    value: isThread ? threadViewPermissions(value) : value,
    shouldCache: true,
  );
}

final FutureProviderFamily<int, String>
channelLocalGuildChannelPermissionBitsProvider =
    FutureProvider.family<int, String>((Ref ref, String channelId) {
      return readLocalGuildChannelPermissionBitsRef(
        ref: ref,
        channelId: channelId,
      );
    });
