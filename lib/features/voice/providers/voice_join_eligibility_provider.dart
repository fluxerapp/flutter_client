import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_join_eligibility_provider.g.dart';

class VoiceJoinEligibility {
  const VoiceJoinEligibility({required this.canJoin});

  final bool canJoin;
}

bool canJoinGuildVoiceChannelFromBits({
  required String guildId,
  required ChannelType channelType,
  required int? permissionBits,
}) {
  if (guildId.isEmpty) {
    return true;
  }
  if (channelType != ChannelType.guildVoice) {
    return true;
  }
  if (permissionBits == null) {
    return true;
  }
  return hasPermission(permissionBits, Permission.connect);
}

int occupiedVoiceConnectionsForJoinLimit({
  required Iterable<VoiceState> voiceStates,
  required String? currentConnectionId,
}) {
  var count = 0;
  for (final VoiceState voiceState in voiceStates) {
    if (currentConnectionId != null &&
        voiceState.connectionId == currentConnectionId) {
      continue;
    }
    count += 1;
  }
  return count;
}

VoiceJoinEligibility resolveVoiceJoinEligibility({
  required bool channelExists,
  required String guildId,
  required ChannelType channelType,
  required bool isTimedOut,
  required int? connectPermissionBits,
  required bool isUnclaimed,
  required bool isGuildOwner,
  required int userLimit,
  required int occupiedConnectionCount,
}) {
  if (!channelExists) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final bool inGuild = guildId.isNotEmpty;
  if (inGuild && isTimedOut) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  if (!canJoinGuildVoiceChannelFromBits(
    guildId: guildId,
    channelType: channelType,
    permissionBits: connectPermissionBits,
  )) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  if (isUnclaimed) {
    if (inGuild) {
      if (!isGuildOwner) {
        return const VoiceJoinEligibility(canJoin: false);
      }
    } else if (channelType == ChannelType.dm) {
      return const VoiceJoinEligibility(canJoin: false);
    }
  }
  if (inGuild && userLimit > 0 && occupiedConnectionCount >= userLimit) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  return const VoiceJoinEligibility(canJoin: true);
}

@riverpod
Future<VoiceJoinEligibility> voiceJoinEligibility(
  Ref ref,
  String channelId,
) async {
  if (channelId.isEmpty) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final channelRow = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (channelRow == null) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final String guildId = channelRow.guildId;
  final UserSettingsViewState settings = ref.watch(
    userSettingsViewModelProvider,
  );
  final String userId = settings.userId;
  ref
    ..watch(channelPermissionCacheProvider)
    ..watch(guildListViewModelProvider)
    ..watch(currentUserMemberIdentityProvider(guildId))
    ..watch(guildRolePermissionsIdentityProvider(guildId));
  if (guildId.isNotEmpty && userId.isNotEmpty) {
    ref.watch(memberRowByGuildProvider((userId, guildId)));
  }
  if (guildId.isEmpty) {
    ref.watch(voiceStatesInPrivateChannelProvider(channelId));
  } else {
    ref.watch(voiceStatesInChannelProvider(guildId, channelId));
  }
  return readVoiceJoinEligibility(ref, channelId);
}

Future<VoiceJoinEligibility> readVoiceJoinEligibility(
  Ref ref,
  String channelId,
) async {
  if (channelId.isEmpty) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
  final channelRow = await database.channelDao.getChannelById(channelId);
  if (channelRow == null) {
    return const VoiceJoinEligibility(canJoin: false);
  }
  final ChannelType channelType = ChannelType.fromWire(channelRow.type);
  final String guildId = channelRow.guildId;
  final UserSettingsViewState settings = ref.read(
    userSettingsViewModelProvider,
  );
  final String userId = settings.userId;
  DateTime? timeoutUntil;
  if (guildId.isNotEmpty && userId.isNotEmpty) {
    final db.Member? member = await database.memberDao.getMemberByUserId(
      userId,
      guildId,
    );
    timeoutUntil = member?.communicationDisabledUntil;
  }
  String? ownerId;
  if (guildId.isNotEmpty) {
    for (final Guild guild in ref.read(guildListViewModelProvider).guilds) {
      if (guild.id == guildId) {
        ownerId = guild.ownerId;
        break;
      }
    }
  }
  ChannelPermissionBitsOutcome? connectOutcome;
  if (guildId.isNotEmpty) {
    connectOutcome = await computeChannelLocalGuildChannelPermissionBitsOutcome(
      ref: ref,
      channelId: channelId,
    );
    if (!ref.mounted) {
      return const VoiceJoinEligibility(canJoin: true);
    }
  }
  final Map<String, VoiceState> voiceStatesMap = ref.read(
    voiceStatesMapProvider,
  );
  final List<VoiceState> voiceStates = <VoiceState>[
    for (final VoiceState vs in voiceStatesMap.values)
      if (vs.channelId == channelId &&
          (guildId.isEmpty
              ? vs.guildId == null || vs.guildId!.isEmpty
              : vs.guildId == guildId))
        vs,
  ];
  return resolveVoiceJoinEligibility(
    channelExists: true,
    guildId: guildId,
    channelType: channelType,
    isTimedOut: timeoutUntil != null && timeoutUntil.isAfter(DateTime.now()),
    connectPermissionBits: connectOutcome == null
        ? null
        : (connectOutcome.shouldCache ? connectOutcome.value : null),
    isUnclaimed: settings.isKnownUnclaimed,
    isGuildOwner: userId.isNotEmpty && ownerId != null && userId == ownerId,
    userLimit: channelRow.userLimit ?? 0,
    occupiedConnectionCount: occupiedVoiceConnectionsForJoinLimit(
      voiceStates: voiceStates,
      currentConnectionId: null,
    ),
  );
}
