import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_tile_id.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_featured_selector.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_visibility.dart';
import 'package:livekit_client/livekit_client.dart';

class VoicePipPlacement extends Notifier<Offset?> {
  @override
  Offset? build() => null;

  void setOffset(Offset offset) {
    state = offset;
  }
}

final voicePipPlacementProvider = NotifierProvider<VoicePipPlacement, Offset?>(
  VoicePipPlacement.new,
);

String? voiceSessionParticipantsKey(VoiceSessionState voice) {
  final String? channelId = voice.channelId;
  if (!voice.isInVoice || channelId == null || channelId.isEmpty) {
    return null;
  }
  final String? guildId = voice.guildId;
  if (guildId == null || guildId.isEmpty) {
    return voiceDmChannelParticipantsFamilyKey(channelId);
  }
  return voiceChannelParticipantsFamilyKey(guildId, channelId);
}

List<VoicePipCandidate> buildVoicePipCandidates({
  required List<VoiceChannelParticipantData> participants,
  required Room? room,
  required String? currentUserId,
  required String? localConnectionId,
}) {
  final List<VoicePipCandidate> tiles = <VoicePipCandidate>[];
  for (final VoiceChannelParticipantData participant in participants) {
    final Participant? liveKit = resolveVoiceParticipant(
      room: room,
      voice: participant.voice,
      userId: participant.userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    final String speakingKey =
        liveKit?.identity ??
        participant.voice.connectionId ??
        participant.voice.sessionId ??
        participant.userId;
    final bool isLocal =
        currentUserId != null && participant.userId == currentUserId;
    final bool muted =
        participant.voice.selfMute ||
        participant.voice.mute ||
        participant.voice.suppress;
    final bool hasCamera =
        participant.voice.selfVideo ||
        (liveKit != null &&
            resolveCameraPublicationAllowingNoTrack(liveKit) != null);
    tiles.add(
      VoicePipCandidate(
        tileId: voiceParticipantTileId(
          voice: participant.voice,
          userId: participant.userId,
          source: VoiceParticipantTileSource.camera,
        ),
        speakingKey: speakingKey,
        source: VoiceParticipantTileSource.camera,
        hasVideo: hasCamera,
        isLocal: isLocal,
        isMuted: muted,
      ),
    );
    final bool hasScreen =
        participant.voice.selfStream ||
        (liveKit != null && hasUnmutedScreenSharePublication(liveKit));
    if (hasScreen) {
      tiles.add(
        VoicePipCandidate(
          tileId: voiceParticipantTileId(
            voice: participant.voice,
            userId: participant.userId,
            source: VoiceParticipantTileSource.screenShare,
          ),
          speakingKey: speakingKey,
          source: VoiceParticipantTileSource.screenShare,
          hasVideo: true,
          isLocal: isLocal,
          isMuted: false,
        ),
      );
    }
  }
  return tiles;
}

class VoicePipFeatured extends Notifier<String?> {
  VoicePipFeaturedResult _result = const VoicePipFeaturedResult();
  Timer? _hysteresisTimer;

  @override
  String? build() {
    ref.onDispose(() {
      _hysteresisTimer?.cancel();
    });
    return _compute();
  }

  String? _compute() {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final String? key = voiceSessionParticipantsKey(voice);
    if (key == null) {
      _result = const VoicePipFeaturedResult();
      _hysteresisTimer?.cancel();
      return null;
    }
    ref.watch(voiceChannelGridStructureProvider(key));
    final List<VoiceChannelParticipantData> participants = ref.watch(
      voiceChannelParticipantsProvider(key),
    );
    final List<VoicePipCandidate> tiles = buildVoicePipCandidates(
      participants: participants,
      room: voice.liveKitRoom,
      currentUserId: ref.watch(currentUserIdProvider),
      localConnectionId: voice.activeConnectionId,
    );
    final VoicePipFeaturedResult next = selectVoicePipFeatured(
      previous: _result,
      now: DateTime.now(),
      tiles: tiles,
      watchedTileId: ref.watch(voiceScreenShareWatchTileProvider),
      pinnedTileId: ref.watch(
        voiceCallLayoutProvider.select(
          (VoiceCallLayoutState s) => s.pinnedTileId,
        ),
      ),
      speakingKeys: ref.watch(
        voiceActiveSpeakersProvider.select(
          (VoiceActiveSpeakersState s) => s.speakingKeys,
        ),
      ),
      recentlySpokeKeys: ref.watch(
        voiceActiveSpeakersProvider.select(
          (VoiceActiveSpeakersState s) => s.recentlySpokeKeys,
        ),
      ),
    );
    _result = next;
    _hysteresisTimer?.cancel();
    final DateTime? pending = next.pendingSwitchAt;
    if (pending != null) {
      final Duration wait = pending.difference(DateTime.now());
      _hysteresisTimer = Timer(wait.isNegative ? Duration.zero : wait, () {
        if (!ref.mounted) {
          return;
        }
        ref.invalidateSelf();
      });
    }
    return next.tileId;
  }
}

final voicePipFeaturedTileIdProvider =
    NotifierProvider<VoicePipFeatured, String?>(VoicePipFeatured.new);

final voicePipFeaturedHasVideoProvider = Provider<bool>((Ref ref) {
  final String? featured = ref.watch(voicePipFeaturedTileIdProvider);
  if (featured == null) {
    return false;
  }
  final VoiceSessionState voice = ref.watch(voiceSessionProvider);
  final String? key = voiceSessionParticipantsKey(voice);
  if (key == null) {
    return false;
  }
  ref.watch(voiceChannelGridStructureProvider(key));
  final List<VoicePipCandidate> tiles = buildVoicePipCandidates(
    participants: ref.watch(voiceChannelParticipantsProvider(key)),
    room: voice.liveKitRoom,
    currentUserId: ref.watch(currentUserIdProvider),
    localConnectionId: voice.activeConnectionId,
  );
  for (final VoicePipCandidate tile in tiles) {
    if (tile.tileId == featured) {
      return tile.hasVideo;
    }
  }
  return false;
});

final voicePipCallViewObscuredProvider = Provider<bool>((Ref ref) {
  return ref.watch(currentRevealSideProvider) == RevealSide.left;
});

final voicePipOnSessionCallRouteProvider = Provider<bool>((Ref ref) {
  final VoiceSessionState voice = ref.watch(voiceSessionProvider);
  final RouteState route = ref.watch(routeStateProvider);
  return voicePipIsOnSessionCallRoute(
    voice: voice,
    location: route.location,
    routeGuildId: route.guildId,
    routeChannelId: route.channelId,
    callViewObscured: ref.watch(voicePipCallViewObscuredProvider),
  );
});

class VoicePipOverlayPhaseController extends Notifier<VoicePipOverlayPhase> {
  @override
  VoicePipOverlayPhase build() => VoicePipOverlayPhase.hidden;

  void setPhase(VoicePipOverlayPhase phase) {
    if (state == phase) {
      return;
    }
    state = phase;
  }
}

final voicePipOverlayPhaseProvider =
    NotifierProvider<VoicePipOverlayPhaseController, VoicePipOverlayPhase>(
      VoicePipOverlayPhaseController.new,
    );

final voicePipHostsFeaturedProvider = Provider<bool>((Ref ref) {
  return voicePipHostsFeatured(ref.watch(voicePipOverlayPhaseProvider));
});
