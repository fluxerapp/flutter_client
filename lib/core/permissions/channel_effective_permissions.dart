import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart'
    show ResultSetImplementation, TableUpdate, TableUpdateQuery;

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;
import 'package:riverpod/riverpod.dart';

typedef ChannelPermissionBitsOutcome = ({int value, bool shouldCache});

bool _guildIsListed(Ref ref, String guildId) {
  return ref
      .read(guildListViewModelProvider)
      .guilds
      .any((Guild guild) => guild.id == guildId);
}

typedef _GuildPermissionInputs = ({
  String? ownerId,
  int mfaLevel,
  int everyonePermissions,
  List<MemberRole> memberRoles,
  bool memberRecordPresent,
});

class _GuildPermissionInputsCache {
  _GuildPermissionInputsCache(this._db);

  final FluxerDatabase _db;
  final Map<(String, String), Future<_GuildPermissionInputs?>> _loads =
      <(String, String), Future<_GuildPermissionInputs?>>{};

  Future<_GuildPermissionInputs?> read({
    required String guildId,
    required String currentUserId,
  }) {
    final (String, String) key = (guildId, currentUserId);
    return _loads[key] ??= _load(key: key);
  }

  void clear() => _loads.clear();

  Future<_GuildPermissionInputs?> _load({required (String, String) key}) async {
    try {
      return await _loadUncached(guildId: key.$1, currentUserId: key.$2);
    } catch (_) {
      unawaited(_loads.remove(key));
      rethrow;
    }
  }

  Future<_GuildPermissionInputs?> _loadUncached({
    required String guildId,
    required String currentUserId,
  }) async {
    final Server? server = await _db.guildDao.getServerById(guildId);
    if (server == null) {
      return null;
    }
    if (currentUserId == server.ownerId) {
      return (
        ownerId: server.ownerId,
        mfaLevel: server.mfaLevel,
        everyonePermissions: 0,
        memberRoles: const <MemberRole>[],
        memberRecordPresent: false,
      );
    }
    final List<Role> allRoles = await _db.roleDao.getRoles(guildId);
    final memberRow = await _db.memberDao.getMemberByUserId(
      currentUserId,
      guildId,
    );
    Role? everyoneRole;
    for (final Role r in allRoles) {
      if (r.id == guildId) {
        everyoneRole = r;
        break;
      }
    }
    final String? roleIdsJson = memberRow?.roleIdsJson;
    final Set<String> memberRoleIds = roleIdsJson == null || roleIdsJson.isEmpty
        ? const <String>{}
        : Set<String>.from(jsonDecode(roleIdsJson) as List<dynamic>);
    return (
      ownerId: server.ownerId,
      mfaLevel: server.mfaLevel,
      everyonePermissions: everyoneRolePermissionsFromString(
        everyoneRole?.permissions,
      ),
      memberRoles: <MemberRole>[
        for (final Role role in allRoles)
          if (memberRoleIds.contains(role.id)) MemberRole.fromRow(role),
      ],
      memberRecordPresent: memberRow != null,
    );
  }
}

final Provider<_GuildPermissionInputsCache>
_guildPermissionInputsCacheProvider = Provider<_GuildPermissionInputsCache>((
  Ref ref,
) {
  final FluxerDatabase db = ref.watch(fluxerDatabaseProvider);
  final _GuildPermissionInputsCache cache = _GuildPermissionInputsCache(db);
  final StreamSubscription<Set<TableUpdate>> subscription = db
      .tableUpdates(
        TableUpdateQuery.onAllTables(
          <ResultSetImplementation<dynamic, dynamic>>[
            db.servers,
            db.roles,
            db.members,
          ],
        ),
      )
      .listen((_) => cache.clear());
  ref.onDispose(subscription.cancel);
  return cache;
});

Future<_GuildPermissionInputs?> _readGuildPermissionInputs({
  required Ref ref,
  required String guildId,
  required String currentUserId,
}) {
  return ref
      .read(_guildPermissionInputsCacheProvider)
      .read(guildId: guildId, currentUserId: currentUserId);
}

bool _isMfaRestricted(
  Ref ref,
  _GuildPermissionInputs inputs,
  String currentUserId,
) => isGuildMfaRestricted(
  guildMfaLevel: inputs.mfaLevel,
  isGuildOwner: currentUserId == inputs.ownerId,
  userLacksMfa: ref.read(userSettingsViewModelProvider).lacksMfa,
);

bool bypassesChannelSlowmode(ChannelPermissionBitsOutcome? outcome) {
  if (outcome == null || !outcome.shouldCache) {
    return true;
  }
  return bypassesSlowmode(outcome.value);
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
  final _GuildPermissionInputs? inputs = await _readGuildPermissionInputs(
    ref: ref,
    guildId: guildId,
    currentUserId: currentUserId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  if (inputs == null) {
    return (value: 0, shouldCache: false);
  }
  if (currentUserId == inputs.ownerId) {
    return (value: allPermissions, shouldCache: true);
  }
  final List<String?> layers = await db.channelDao.getPermissionOverwriteLayers(
    channelId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  final int value = evaluateChannelEffectivePermissionBits(
    guildOwnerId: inputs.ownerId ?? '',
    guildId: guildId,
    currentUserId: currentUserId,
    everyonePermissions: inputs.everyonePermissions,
    memberRoles: inputs.memberRoles,
    memberRecordPresent: inputs.memberRecordPresent,
    overwriteJsonLayersRootToLeaf: layers,
    guildMfaRestricted: _isMfaRestricted(ref, inputs, currentUserId),
  );
  return (
    value: isThreadChannelType(channelRow.type)
        ? threadViewPermissions(value)
        : value,
    shouldCache: inputs.memberRecordPresent,
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
  final _GuildPermissionInputs? inputs = await _readGuildPermissionInputs(
    ref: ref,
    guildId: guildId,
    currentUserId: currentUserId,
  );
  if (!ref.mounted) {
    return const <String, ChannelPermissionBitsOutcome>{};
  }
  if (inputs == null) {
    return all(notResolved);
  }
  if (currentUserId == inputs.ownerId) {
    return all((value: allPermissions, shouldCache: true));
  }
  final bool guildMfaRestricted = _isMfaRestricted(ref, inputs, currentUserId);
  int evaluateWithOverwrites(List<List<ChannelOverwriteEntry>> layers) =>
      evaluateChannelPermissionBitsWithOverwrites(
        guildOwnerId: inputs.ownerId ?? '',
        guildId: guildId,
        currentUserId: currentUserId,
        everyonePermissions: inputs.everyonePermissions,
        memberRoles: inputs.memberRoles,
        memberRecordPresent: inputs.memberRecordPresent,
        overwriteLayersRootToLeaf: layers,
        guildMfaRestricted: guildMfaRestricted,
      );
  final int guildPermissionBits = evaluateWithOverwrites(
    const <List<ChannelOverwriteEntry>>[],
  );
  int evaluateChannel(String? overwritesJson) {
    final List<ChannelOverwriteEntry> overwrites =
        parseChannelPermissionOverwritesJson(overwritesJson);
    return overwrites.isEmpty
        ? guildPermissionBits
        : evaluateWithOverwrites(<List<ChannelOverwriteEntry>>[overwrites]);
  }

  return <String, ChannelPermissionBitsOutcome>{
    for (final Channel channel in targets)
      channel.id: (
        value: isThreadChannelType(channel.type)
            ? threadViewPermissions(
                evaluateChannel(
                  byId[channel.parentId]?.permissionOverwritesJson,
                ),
              )
            : evaluateChannel(channel.permissionOverwritesJson),
        shouldCache: inputs.memberRecordPresent,
      ),
  };
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
  final _GuildPermissionInputs? inputs = await _readGuildPermissionInputs(
    ref: ref,
    guildId: guildId,
    currentUserId: currentUserId,
  );
  if (!ref.mounted) {
    return (value: 0, shouldCache: false);
  }
  if (inputs == null) {
    return (value: 0, shouldCache: false);
  }
  if (currentUserId == inputs.ownerId) {
    return (value: allPermissions, shouldCache: true);
  }
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
    guildOwnerId: inputs.ownerId ?? '',
    guildId: guildId,
    currentUserId: currentUserId,
    everyonePermissions: inputs.everyonePermissions,
    memberRoles: inputs.memberRoles,
    memberRecordPresent: inputs.memberRecordPresent,
    overwriteJsonLayersRootToLeaf: [leafOverwritesJson],
    guildMfaRestricted: _isMfaRestricted(ref, inputs, currentUserId),
  );
  return (
    value: isThread ? threadViewPermissions(value) : value,
    shouldCache: inputs.memberRecordPresent || _guildIsListed(ref, guildId),
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
