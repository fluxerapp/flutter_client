import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_cached_video_track.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_avatar.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/ui/voice/voice_screen_share_audio.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_tile_id.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

class VoicePipVideo extends ConsumerWidget {
  const VoicePipVideo({required this.tileId, super.key});

  final String tileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final String? key = voiceSessionParticipantsKey(voice);
    final ({String identity, VoiceParticipantTileSource source})? parsed =
        parseVoiceParticipantTileId(tileId);
    if (key == null || parsed == null) {
      return const ColoredBox(color: Color(0xFF111111));
    }
    final List<VoiceChannelParticipantData> participants = ref.watch(
      voiceChannelParticipantsProvider(key),
    );
    VoiceChannelParticipantData? match;
    for (final VoiceChannelParticipantData participant in participants) {
      if (voiceParticipantTileId(
            voice: participant.voice,
            userId: participant.userId,
            source: parsed.source,
          ) ==
          tileId) {
        match = participant;
        break;
      }
    }
    if (match == null) {
      return const ColoredBox(color: Color(0xFF111111));
    }
    final String? me = ref.watch(currentUserIdProvider);
    final Participant? liveKit = resolveVoiceParticipant(
      room: voice.liveKitRoom,
      voice: match.voice,
      userId: match.userId,
      currentUserId: me,
      localConnectionId: voice.activeConnectionId,
    );
    final database.User? user = match.user;
    final Color background = user?.avatarColor == null
        ? context.colors.brandPrimary
        : Color(0xFF000000 | user!.avatarColor!);
    if (liveKit == null) {
      return _PipAvatarFallback(
        user: user,
        userId: match.userId,
        background: background,
      );
    }
    return _PipTrackView(
      participant: liveKit,
      source: parsed.source,
      isOwnCamera:
          parsed.source == VoiceParticipantTileSource.camera &&
          me != null &&
          match.userId == me,
      mirrorOwnCamera: ref.watch(
        voiceSettingsProvider.select(
          (VoiceSettingsState s) => s.shouldMirrorOwnCamera,
        ),
      ),
      voice: match.voice,
      user: user,
      userId: match.userId,
      background: background,
    );
  }
}

class _PipTrackView extends StatefulWidget {
  const _PipTrackView({
    required this.participant,
    required this.source,
    required this.isOwnCamera,
    required this.mirrorOwnCamera,
    required this.voice,
    required this.user,
    required this.userId,
    required this.background,
  });

  final Participant participant;
  final VoiceParticipantTileSource source;
  final bool isOwnCamera;
  final bool mirrorOwnCamera;
  final VoiceState voice;
  final database.User? user;
  final String userId;
  final Color background;

  @override
  State<_PipTrackView> createState() => _PipTrackViewState();
}

class _PipTrackViewState extends State<_PipTrackView> {
  bool _trackSyncScheduled = false;
  String? _lastVideoSid;
  String? _lastAudioSid;

  @override
  void didUpdateWidget(covariant _PipTrackView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scheduleTrackSync();
  }

  void _scheduleTrackSync() {
    if (_trackSyncScheduled) {
      return;
    }
    _trackSyncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _trackSyncScheduled = false;
      if (!mounted) {
        return;
      }
      _applyTrackSync();
    });
  }

  void _applyTrackSync() {
    final bool isScreen =
        widget.source == VoiceParticipantTileSource.screenShare;
    final TrackPublication? publication = isScreen
        ? resolveScreenShareVideoPublication(
            participant: widget.participant,
            requireTrack: false,
          )
        : resolveCameraPublicationAllowingNoTrack(widget.participant);
    _syncRemotePublication(
      publication: publication,
      lastSid: _lastVideoSid,
      onSid: (String sid) => _lastVideoSid = sid,
    );
    if (!isScreen) {
      return;
    }
    _syncRemotePublication(
      publication: resolveScreenShareAudioPublication(
        participant: widget.participant,
        requireTrack: false,
      ),
      lastSid: _lastAudioSid,
      onSid: (String sid) => _lastAudioSid = sid,
    );
  }

  void _syncRemotePublication({
    required TrackPublication? publication,
    required String? lastSid,
    required void Function(String sid) onSid,
  }) {
    if (publication is! RemoteTrackPublication) {
      return;
    }
    if (publication.sid == lastSid && publication.subscribed) {
      return;
    }
    onSid(publication.sid);
    if (!publication.subscribed) {
      unawaited(publication.subscribe());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.participant,
      builder: (BuildContext context, Widget? _) {
        _scheduleTrackSync();
        final bool isScreen =
            widget.source == VoiceParticipantTileSource.screenShare;
        final TrackPublication? publication = isScreen
            ? resolveScreenShareVideoPublication(
                participant: widget.participant,
                requireTrack: false,
              )
            : resolveCameraPublicationAllowingNoTrack(widget.participant);
        final Track? publicationTrack = publication?.track;
        final VideoTrack? track = publicationTrack is VideoTrack
            ? publicationTrack
            : null;
        AudioTrack? audioTrack;
        if (isScreen) {
          final Track? audioPublicationTrack =
              resolveScreenShareAudioPublication(
                participant: widget.participant,
                requireTrack: false,
              )?.track;
          audioTrack = audioPublicationTrack is AudioTrack
              ? audioPublicationTrack
              : null;
        }
        final Widget fallback = _PipAvatarFallback(
          user: widget.user,
          userId: widget.userId,
          background: widget.background,
        );
        if (track == null) {
          if (audioTrack == null) {
            return fallback;
          }
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              fallback,
              VoiceScreenShareAudio(
                streamKey: buildViewerStreamKey(
                  voice: widget.voice,
                  isScreenShareTile: true,
                ),
                audioTrack: audioTrack,
              ),
            ],
          );
        }
        final VideoViewFit fit = isScreen
            ? VideoViewFit.contain
            : VideoViewFit.cover;
        final VideoViewMirrorMode mirrorMode;
        if (!widget.isOwnCamera || isScreen) {
          mirrorMode = VideoViewMirrorMode.off;
        } else if (widget.mirrorOwnCamera) {
          mirrorMode = VideoViewMirrorMode.mirror;
        } else {
          mirrorMode = VideoViewMirrorMode.off;
        }
        final Widget video = ColoredBox(
          color: widget.background,
          child: IgnorePointer(
            child: VoiceCachedVideoTrack(
              track: track,
              fit: fit,
              mirrorMode: mirrorMode,
            ),
          ),
        );
        if (audioTrack == null) {
          return video;
        }
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            video,
            VoiceScreenShareAudio(
              streamKey: buildViewerStreamKey(
                voice: widget.voice,
                isScreenShareTile: true,
              ),
              audioTrack: audioTrack,
            ),
          ],
        );
      },
    );
  }
}

class _PipAvatarFallback extends StatelessWidget {
  const _PipAvatarFallback({
    required this.user,
    required this.userId,
    required this.background,
  });

  final database.User? user;
  final String userId;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return VoiceCallAvatar(background: background, userId: userId, user: user);
  }
}
