import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
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
  ProfileMenuCapabilities guildCapabilities = ProfileMenuCapabilities.none,
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
  final bool showCommunityMute =
      target.guildId != null && guildCapabilities.showCommunityMute;
  final bool showCommunityDeafen =
      target.guildId != null && guildCapabilities.showCommunityDeafen;
  final bool showModeratorDisconnect =
      target.guildId != null && guildCapabilities.showDisconnectFromVoice;
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
  final bool showConnectionVolumeControls = ref.watch(
    voiceSettingsProvider.select((state) => state.showConnectionVolumeControls),
  );
  final bool showStreamControls =
      showConnectionVolumeControls &&
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
      showConnectionVolumeControls &&
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
    showDisconnect: showSelfDisconnect || showModeratorDisconnect,
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
