import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/providers/drawer/drawer_providers.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/participant_tile_id.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_featured_selector.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_visibility.dart';

class VoicePipPlacement extends Notifier<Offset?> {
  @override
  Offset? build() => null;

  void setOffset(Offset offset) {
    if (state == offset) {
      return;
    }
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

typedef VoicePipSessionInputs = ({
  String? participantsKey,
  VoiceMediaRoom? media,
  String? localConnectionId,
});

VoicePipSessionInputs voicePipSessionInputs(VoiceSessionState voice) {
  return (
    participantsKey: voiceSessionParticipantsKey(voice),
    media: voice.media,
    localConnectionId: voice.activeConnectionId,
  );
}

List<VoicePipCandidate> buildVoicePipCandidates({
  required List<VoiceChannelParticipantData> participants,
  required VoiceMediaRoom? media,
  required String? currentUserId,
  required String? localConnectionId,
  bool includeScreenShares = true,
}) {
  final List<VoicePipCandidate> tiles = <VoicePipCandidate>[];
  for (final VoiceChannelParticipantData participant in participants) {
    final VoiceMediaParticipant? mediaParticipant = resolveVoiceParticipant(
      media: media,
      voice: participant.voice,
      userId: participant.userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
    final String speakingKey =
        mediaParticipant?.identity ??
        participant.voice.connectionId ??
        participant.voice.sessionId ??
        participant.userId;
    final String? connectionId = participant.voice.connectionId;
    final bool isLocal =
        currentUserId != null &&
        participant.userId == currentUserId &&
        (localConnectionId == null ||
            connectionId == null ||
            connectionId == localConnectionId);
    final bool muted =
        participant.voice.selfMute ||
        participant.voice.mute ||
        participant.voice.suppress;
    final bool hasCamera =
        participant.voice.selfVideo ||
        (mediaParticipant != null && mediaParticipant.hasCamera);
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
        (mediaParticipant != null && mediaParticipant.hasScreenShare);
    if (hasScreen && includeScreenShares) {
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
    final VoicePipSessionInputs voice = ref.watch(
      voiceSessionProvider.select(voicePipSessionInputs),
    );
    final String? key = voice.participantsKey;
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
      media: voice.media,
      currentUserId: ref.watch(currentUserIdProvider),
      localConnectionId: voice.localConnectionId,
      includeScreenShares: !ref.watch(
        voiceSettingsProvider.select(
          (VoiceSettingsState s) => s.disableScreenSharePip,
        ),
      ),
    );
    final VoicePipFeaturedResult next = selectVoicePipFeatured(
      previous: _result,
      now: DateTime.now(),
      tiles: tiles,
      watchedTileId: ref.watch(
        voiceScreenShareWatchTileProvider.select(
          (Set<String> ids) => ids.isEmpty ? null : ids.first,
        ),
      ),
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
  final VoicePipSessionInputs voice = ref.watch(
    voiceSessionProvider.select(voicePipSessionInputs),
  );
  final String? key = voice.participantsKey;
  if (key == null) {
    return false;
  }
  ref.watch(voiceChannelGridStructureProvider(key));
  final List<VoicePipCandidate> tiles = buildVoicePipCandidates(
    participants: ref.watch(voiceChannelParticipantsProvider(key)),
    media: voice.media,
    currentUserId: ref.watch(currentUserIdProvider),
    localConnectionId: voice.localConnectionId,
  );
  for (final VoicePipCandidate tile in tiles) {
    if (tile.tileId == featured) {
      return tile.hasVideo;
    }
  }
  return false;
});

final voicePipFeaturedBlockedProvider = Provider<bool>((Ref ref) {
  final String? featured = ref.watch(voicePipFeaturedTileIdProvider);
  final parsed = featured == null
      ? null
      : parseVoiceParticipantTileId(featured);
  if (parsed == null) {
    return false;
  }
  final String? key = ref.watch(
    voiceSessionProvider.select(voiceSessionParticipantsKey),
  );
  if (key == null) {
    return false;
  }
  for (final VoiceChannelParticipantData participant in ref.watch(
    voiceChannelParticipantsProvider(key),
  )) {
    if (voiceParticipantTileId(
          voice: participant.voice,
          userId: participant.userId,
          source: parsed.source,
        ) ==
        featured) {
      return participant.userId != ref.watch(currentUserIdProvider) &&
          ref.watch(
            blockedUserIdsProvider.select(
              (Set<String> ids) => ids.contains(participant.userId),
            ),
          );
    }
  }
  return false;
});

final voicePipCallViewObscuredProvider = Provider<bool>((Ref ref) {
  return ref.watch(drawerPastHalfScreenProvider);
});

final voicePipOnSessionCallRouteProvider = Provider<bool>((Ref ref) {
  final RouteState route = ref.watch(routeStateProvider);
  final bool callViewObscured = ref.watch(voicePipCallViewObscuredProvider);
  return ref.watch(
    voiceSessionProvider.select(
      (VoiceSessionState voice) => voicePipIsOnSessionCallRoute(
        voice: voice,
        location: route.location,
        routeGuildId: route.guildId,
        routeChannelId: route.channelId,
        callViewObscured: callViewObscured,
      ),
    ),
  );
});

final handheldVoiceImmersiveProvider = Provider<bool>((Ref ref) {
  return ref.watch(voicePipOnSessionCallRouteProvider) ||
      ref.watch(
        voiceCallOverlayProvider.select(
          (VoiceCallOverlayState s) => s.isExiting,
        ),
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
