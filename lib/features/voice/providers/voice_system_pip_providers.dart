import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_fullscreen_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/participant_tile_id.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/pip/system_pip_target.dart';
import 'package:livekit_client/livekit_client.dart';

const double kVoiceSystemPipLargeEdge = 360;

@immutable
class VoiceSystemPipTarget {
  const VoiceSystemPipTarget({
    required this.tileId,
    required this.participant,
    required this.isScreenShare,
  });

  final String tileId;
  final VoiceMediaParticipant participant;
  final bool isScreenShare;

  TrackSource get trackSource =>
      isScreenShare ? TrackSource.screenShareVideo : TrackSource.camera;

  VideoTrack? get track =>
      isScreenShare ? participant.screenShareTrack : participant.cameraTrack;

  @override
  bool operator ==(Object other) {
    return other is VoiceSystemPipTarget &&
        other.tileId == tileId &&
        identical(other.participant, participant) &&
        other.isScreenShare == isScreenShare;
  }

  @override
  int get hashCode =>
      Object.hash(tileId, identityHashCode(participant), isScreenShare);
}

VideoQuality voiceSystemPipQuality({
  required bool isScreenShare,
  required Size? pipSize,
}) {
  final bool large =
      pipSize != null &&
      math.max(pipSize.width, pipSize.height) >= kVoiceSystemPipLargeEdge;
  if (isScreenShare) {
    return large ? VideoQuality.HIGH : VideoQuality.MEDIUM;
  }
  return large ? VideoQuality.MEDIUM : VideoQuality.LOW;
}

typedef _VoiceSystemPipSession = ({
  String? participantsKey,
  VoiceMediaRoom? media,
  String? connectionId,
});

final voiceSystemPipTargetProvider = Provider<VoiceSystemPipTarget?>((Ref ref) {
  final String? expandedTileId = ref.watch(
    voiceScreenShareFullscreenProvider.select(
      (prefs) => prefs.userExpanded ? prefs.expandedTileId : null,
    ),
  );
  final String? pinnedTileId = ref.watch(
    voiceCallLayoutProvider.select(
      (VoiceCallLayoutState state) => state.pinnedTileId,
    ),
  );
  final Set<String> watchedTileIds = ref.watch(
    voiceScreenShareWatchTileProvider,
  );
  if (expandedTileId == null &&
      pinnedTileId == null &&
      watchedTileIds.isEmpty) {
    return null;
  }
  final _VoiceSystemPipSession session = ref.watch(
    voiceSessionProvider.select(
      (VoiceSessionState voice) => (
        participantsKey: voiceSessionParticipantsKey(voice),
        media: voice.media,
        connectionId: voice.activeConnectionId,
      ),
    ),
  );
  final String? key = session.participantsKey;
  if (key == null) {
    return null;
  }
  final List<VoiceChannelParticipantData> participants = ref.watch(
    voiceChannelParticipantsProvider(key),
  );
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final Set<String> blockedUserIds = ref.watch(blockedUserIdsProvider);
  final Set<String> blockedTileIds = <String>{
    for (final VoiceChannelParticipantData participant in participants)
      if (participant.userId != currentUserId &&
          blockedUserIds.contains(participant.userId))
        for (final VoiceParticipantTileSource source
            in VoiceParticipantTileSource.values)
          voiceParticipantTileId(
            voice: participant.voice,
            userId: participant.userId,
            source: source,
          ),
  };
  final bool inAppPipVisible =
      ref.watch(voicePipOverlayPhaseProvider) == VoicePipOverlayPhase.pip;
  final String? tileId = resolveVoiceSystemPipTileId(
    expandedTileId: expandedTileId,
    pinnedTileId: pinnedTileId,
    watchedTileIds: watchedTileIds,
    preferredTileId: inAppPipVisible
        ? ref.watch(voicePipFeaturedTileIdProvider)
        : null,
    blockedTileIds: blockedTileIds,
    candidates: buildVoicePipCandidates(
      participants: participants,
      media: session.media,
      currentUserId: currentUserId,
      localConnectionId: session.connectionId,
    ),
  );
  if (tileId == null) {
    return null;
  }
  final ({String identity, VoiceParticipantTileSource source})? parsed =
      parseVoiceParticipantTileId(tileId);
  if (parsed == null) {
    return null;
  }
  for (final VoiceChannelParticipantData participant in participants) {
    if (voiceParticipantTileId(
          voice: participant.voice,
          userId: participant.userId,
          source: parsed.source,
        ) !=
        tileId) {
      continue;
    }
    final VoiceMediaParticipant? media = resolveVoiceParticipant(
      media: session.media,
      voice: participant.voice,
      userId: participant.userId,
      currentUserId: currentUserId,
      localConnectionId: session.connectionId,
    );
    return media == null
        ? null
        : VoiceSystemPipTarget(
            tileId: tileId,
            participant: media,
            isScreenShare:
                parsed.source == VoiceParticipantTileSource.screenShare,
          );
  }
  return null;
});

class VoiceSystemPipActive extends Notifier<bool> {
  @override
  bool build() => false;

  void set({required bool active}) {
    if (state != active) {
      state = active;
    }
  }
}

final voiceSystemPipActiveProvider =
    NotifierProvider<VoiceSystemPipActive, bool>(VoiceSystemPipActive.new);
