import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/permission_resolver.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_participant_volume_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_stream_audio_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_effective_audio_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceParticipantMenuCapabilities {
  const VoiceParticipantMenuCapabilities({
    required this.isCurrentUser,
    required this.canFocus,
    required this.isFocused,
    required this.showSelfMute,
    required this.showSelfDeafen,
    required this.showCommunityMute,
    required this.showCommunityDeafen,
    required this.showDisconnect,
    required this.isSelfMuted,
    required this.isSelfDeafened,
    required this.isCommunityMuted,
    required this.isCommunityDeafened,
    required this.showVolume,
    required this.volumePercent,
    required this.showStreamControls,
    required this.streamVolumePercent,
    required this.isStreamMuted,
    this.streamKey,
  });

  final bool isCurrentUser;
  final bool canFocus;
  final bool isFocused;
  final bool showSelfMute;
  final bool showSelfDeafen;
  final bool showCommunityMute;
  final bool showCommunityDeafen;
  final bool showDisconnect;
  final bool isSelfMuted;
  final bool isSelfDeafened;
  final bool isCommunityMuted;
  final bool isCommunityDeafened;
  final bool showVolume;
  final int volumePercent;
  final bool showStreamControls;
  final int streamVolumePercent;
  final bool isStreamMuted;
  final String? streamKey;
}

VoiceState watchTargetVoiceState(
  WidgetRef ref,
  VoiceParticipantMenuTarget target,
) {
  final VoiceState fallback = target.participant.voice;
  return ref.watch(
    voiceStatesMapProvider.select((Map<String, VoiceState> map) {
      final String? connectionId = fallback.connectionId;
      if (connectionId != null) {
        for (final VoiceState voiceState in map.values) {
          if (voiceState.connectionId == connectionId) {
            return voiceState;
          }
        }
      }
      for (final VoiceState voiceState in map.values) {
        if (voiceState.userId != target.participant.userId) {
          continue;
        }
        if (voiceState.channelId != target.channelId) {
          continue;
        }
        final String? guildId = target.guildId;
        if (guildId == null) {
          if (voiceState.guildId != null && voiceState.guildId!.isNotEmpty) {
            continue;
          }
        } else if (voiceState.guildId != guildId) {
          continue;
        }
        return voiceState;
      }
      return fallback;
    }),
  );
}

VoiceParticipantMenuCapabilities buildVoiceParticipantMenuCapabilities({
  required WidgetRef ref,
  required VoiceParticipantMenuTarget target,
  required VoiceState voice,
  ModerationAccess? moderation,
}) {
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final String userId = target.participant.userId;
  final bool isCurrentUser = currentUserId != null && userId == currentUserId;
  final VoiceSessionState session = ref.watch(voiceSessionProvider);
  final bool isViewerInVoice =
      session.isInVoice && session.channelId == target.channelId;
  final VoiceCallLayoutState layout = ref.watch(voiceCallLayoutProvider);
  final bool isFocused = layout.isPinned(target.tileId);
  final bool canFocus = isViewerInVoice;
  final EffectiveAudioState selfAudio = effectiveAudioStateFromVoiceState(
    voiceState: isCurrentUser ? voice : null,
    fallbackSelfMute: false,
    fallbackSelfDeaf: false,
  );
  final bool isCommunityMuted = voice.mute || voice.suppress;
  final bool isCommunityDeafened = voice.deaf;
  bool showCommunityMute = false;
  bool showCommunityDeafen = false;
  bool showDisconnect = false;
  if (!isCurrentUser && target.guildId != null && currentUserId != null) {
    final ModerationAccess access =
        moderation ??
        const ModerationAccess(
          canManageTarget: false,
          canMuteMembers: false,
          canMoveMembers: false,
        );
    if (access.canManageTarget) {
      if (access.canMuteMembers) {
        showCommunityMute = true;
        showCommunityDeafen = true;
      }
      if (access.canMoveMembers) {
        showDisconnect = true;
      }
    }
  }
  final bool showSelfMute = isCurrentUser && isViewerInVoice;
  final bool showSelfDeafen = isCurrentUser && isViewerInVoice;
  final bool showSelfDisconnect = isCurrentUser && isViewerInVoice;
  final bool isOwnDevice = _isOwnCurrentDeviceTile(
    isCurrentUser: isCurrentUser,
    participantConnectionId: voice.connectionId,
    localConnectionId: session.activeConnectionId,
  );
  final bool isOwnScreenShare = target.isScreenShareTile && isOwnDevice;
  final String? streamKey = buildViewerStreamKey(
    voice: voice,
    isScreenShareTile: target.isScreenShareTile,
  );
  final bool hasScreenShareAudio =
      streamKey != null &&
      _hasScreenShareAudio(
        room: session.liveKitRoom,
        target: target,
        voice: voice,
        currentUserId: currentUserId,
        localConnectionId: session.activeConnectionId,
      );
  final bool showStreamControls =
      target.isScreenShareTile &&
      !isOwnScreenShare &&
      hasScreenShareAudio &&
      isViewerInVoice;
  final VoiceStreamAudioPrefsState streamAudioPrefs = ref.watch(
    voiceStreamAudioProvider,
  );
  final int streamVolumePercent = streamKey == null
      ? kDefaultVoiceVolumePercent
      : streamAudioPrefs.volumeFor(streamKey);
  final bool isStreamMuted =
      streamKey != null && streamAudioPrefs.isMuted(streamKey);
  final int volumePercent = ref
      .watch(voiceParticipantVolumeProvider.notifier)
      .volumeFor(userId);
  final bool showVolume =
      !isCurrentUser &&
      isViewerInVoice &&
      !target.isScreenShareTile &&
      !isOwnDevice;
  return VoiceParticipantMenuCapabilities(
    isCurrentUser: isCurrentUser,
    canFocus: canFocus,
    isFocused: isFocused,
    showSelfMute: showSelfMute,
    showSelfDeafen: showSelfDeafen,
    showCommunityMute: showCommunityMute,
    showCommunityDeafen: showCommunityDeafen,
    showDisconnect: showSelfDisconnect || showDisconnect,
    isSelfMuted: selfAudio.selfMute,
    isSelfDeafened: selfAudio.selfDeaf,
    isCommunityMuted: isCommunityMuted,
    isCommunityDeafened: isCommunityDeafened,
    showVolume: showVolume,
    volumePercent: volumePercent,
    showStreamControls: showStreamControls,
    streamVolumePercent: streamVolumePercent,
    isStreamMuted: isStreamMuted,
    streamKey: streamKey,
  );
}

Future<VoiceParticipantMenuCapabilities>
resolveVoiceParticipantMenuCapabilities({
  required WidgetRef ref,
  required VoiceParticipantMenuTarget target,
}) async {
  final String? currentUserId = ref.read(currentUserIdProvider);
  ModerationAccess? moderation;
  if (target.guildId != null &&
      currentUserId != null &&
      currentUserId != target.participant.userId) {
    moderation = await resolveModerationAccess(
      ref: ref,
      guildId: target.guildId!,
      currentUserId: currentUserId,
      targetUserId: target.participant.userId,
    );
  }
  return buildVoiceParticipantMenuCapabilities(
    ref: ref,
    target: target,
    voice: target.participant.voice,
    moderation: moderation,
  );
}

VoiceParticipantMenuTarget voiceParticipantMenuTargetWithVoice({
  required VoiceParticipantMenuTarget target,
  required VoiceState voice,
}) {
  return VoiceParticipantMenuTarget(
    participant: VoiceChannelParticipantData(
      userId: target.participant.userId,
      voice: voice,
      user: target.participant.user,
    ),
    tileId: target.tileId,
    channelId: target.channelId,
    tileSource: target.tileSource,
    guildId: target.guildId,
  );
}

bool _hasScreenShareAudio({
  required Room? room,
  required VoiceParticipantMenuTarget target,
  required VoiceState voice,
  required String? currentUserId,
  required String? localConnectionId,
}) {
  if (room == null) {
    return false;
  }
  final Participant? participant = resolveVoiceParticipant(
    room: room,
    voice: voice,
    userId: target.participant.userId,
    currentUserId: currentUserId,
    localConnectionId: localConnectionId,
  );
  if (participant == null) {
    return false;
  }
  return resolveScreenShareAudioPublication(
        participant: participant,
        requireTrack: false,
      ) !=
      null;
}

bool _isOwnCurrentDeviceTile({
  required bool isCurrentUser,
  required String? participantConnectionId,
  required String? localConnectionId,
}) {
  return isCurrentUser &&
      localConnectionId != null &&
      participantConnectionId == localConnectionId;
}

class ModerationAccess {
  const ModerationAccess({
    required this.canManageTarget,
    required this.canMuteMembers,
    required this.canMoveMembers,
  });

  final bool canManageTarget;
  final bool canMuteMembers;
  final bool canMoveMembers;
}

Future<ModerationAccess> resolveModerationAccess({
  required WidgetRef ref,
  required String guildId,
  required String currentUserId,
  required String targetUserId,
}) async {
  final db = ref.read(fluxerDatabaseProvider);
  final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
  Guild? guild;
  for (final Guild g in guilds) {
    if (g.id == guildId) {
      guild = g;
      break;
    }
  }
  if (guild == null) {
    return const ModerationAccess(
      canManageTarget: false,
      canMuteMembers: false,
      canMoveMembers: false,
    );
  }
  final String? ownerId = guild.ownerId;
  final bool targetIsOwner = ownerId != null && ownerId == targetUserId;
  final allRoles = await db.roleDao.getRoles(guildId);
  final roleById = {
    for (final role in allRoles) role.id: MemberRole.fromRow(role),
  };
  final everyoneRole = roleById[guildId];
  final int everyonePermissions = everyoneRole?.permissions ?? 0;
  final viewerMember = await db.memberDao.getMemberByUserId(
    currentUserId,
    guildId,
  );
  final targetMember = await db.memberDao.getMemberByUserId(
    targetUserId,
    guildId,
  );
  if (viewerMember == null) {
    return const ModerationAccess(
      canManageTarget: false,
      canMuteMembers: false,
      canMoveMembers: false,
    );
  }
  final List<MemberRole> viewerRoles = _memberRoles(
    viewerMember.roleIdsJson,
    roleById,
    guildId,
  );
  final List<MemberRole> targetRoles = targetMember == null
      ? const <MemberRole>[]
      : _memberRoles(targetMember.roleIdsJson, roleById, guildId);
  final int viewerPermissions = ownerId == currentUserId
      ? allPermissions
      : resolveGuildPermissions(
          guildOwnerId: ownerId ?? '',
          currentUserId: currentUserId,
          everyonePermissions: everyonePermissions,
          memberRoles: viewerRoles,
        );
  final bool managesTarget = canManageTarget(
    currentUserId: currentUserId,
    ownerId: ownerId,
    viewerHighest: highestRole(viewerRoles),
    targetHighest: highestRole(targetRoles),
    targetIsOwner: targetIsOwner,
  );
  return ModerationAccess(
    canManageTarget: managesTarget,
    canMuteMembers:
        managesTarget &&
        hasPermission(viewerPermissions, Permission.muteMembers),
    canMoveMembers:
        managesTarget &&
        hasPermission(viewerPermissions, Permission.moveMembers),
  );
}

List<MemberRole> _memberRoles(
  String roleIdsJson,
  Map<String, MemberRole> roleById,
  String guildId,
) {
  final List<String> roleIds = roleIdsJson.isNotEmpty
      ? List<String>.from(jsonDecode(roleIdsJson) as List<dynamic>)
      : <String>[];
  return roleIds
      .where((String id) => id != guildId)
      .map((String id) => roleById[id])
      .whereType<MemberRole>()
      .toList(growable: false);
}
