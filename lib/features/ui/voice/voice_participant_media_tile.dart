import 'dart:async' show unawaited;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

const double _kAreaAspect = 16 / 9;

enum VoiceParticipantTileSource { camera, screenShare }

VideoViewFit videoViewFitForSlot(
  VideoDimensions? dimensions,
  Orientation deviceOrientation,
) {
  if (dimensions != null && dimensions.width > 0 && dimensions.height > 0) {
    return dimensions.width >= dimensions.height
        ? VideoViewFit.cover
        : VideoViewFit.contain;
  }
  if (deviceOrientation == Orientation.portrait) {
    return VideoViewFit.contain;
  }
  return VideoViewFit.cover;
}

/// Fills a 16:9 area with a LiveKit camera track when available, else an
/// avatar, plus optional “video intent” loading when the voice state has video
/// enabled but the track is not ready.
class VoiceParticipantMediaTile extends StatelessWidget {
  const VoiceParticipantMediaTile({
    required this.room,
    required this.userId,
    required this.currentUserId,
    required this.localConnectionId,
    required this.voice,
    required this.display,
    required this.backgroundColor,
    required this.tileSource,
    required this.isActiveScreenShare,
    required this.streamPreviewUrl,
    required this.authToken,
    this.user,
    super.key,
  });

  final Room? room;
  final String userId;
  final String? currentUserId;
  final String? localConnectionId;
  final VoiceState voice;
  final String display;
  final Color backgroundColor;
  final VoiceParticipantTileSource tileSource;
  final bool isActiveScreenShare;
  final String? streamPreviewUrl;
  final String? authToken;
  final database.User? user;

  @override
  Widget build(BuildContext context) {
    final Participant? participant = _resolveParticipant();
    if (participant == null) {
      return _avatarStack(
        context,
        showVideoPending: false,
        backgroundColor: backgroundColor,
      );
    }
    return OrientationBuilder(
      builder: (BuildContext context, Orientation deviceOrientation) {
        return ListenableBuilder(
          listenable: participant,
          builder: (BuildContext context, Widget? _) {
            final bool isScreenShareTile =
                tileSource == VoiceParticipantTileSource.screenShare;
            final TrackPublication? publication = isScreenShareTile
                ? _screenShareVideoPublication(participant, false)
                : _cameraPublication(participant);
            final Track? publicationTrack = publication?.track;
            final VideoTrack? track = publicationTrack is VideoTrack
                ? publicationTrack
                : null;
            if (isScreenShareTile && publication is RemoteTrackPublication) {
              if (isActiveScreenShare && !publication.subscribed) {
                unawaited(publication.subscribe());
              }
              if (!isActiveScreenShare && publication.subscribed) {
                unawaited(publication.unsubscribe());
              }
            }
            TrackPublication? audioPublication;
            AudioTrack? audioTrack;
            if (isScreenShareTile) {
              audioPublication = _screenShareAudioPublication(
                participant,
                false,
              );
              if (audioPublication is RemoteTrackPublication) {
                if (isActiveScreenShare && !audioPublication.subscribed) {
                  unawaited(audioPublication.subscribe());
                }
                if (!isActiveScreenShare && audioPublication.subscribed) {
                  unawaited(audioPublication.unsubscribe());
                }
              }
              final Track? audioPublicationTrack = audioPublication?.track;
              audioTrack = audioPublicationTrack is AudioTrack
                  ? audioPublicationTrack
                  : null;
            }
            if (track != null) {
              final VideoViewFit fit = videoViewFitForSlot(
                publication?.dimensions,
                deviceOrientation,
              );
              final Widget videoWidget = ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ColoredBox(
                  color: backgroundColor,
                  child: AspectRatio(
                    aspectRatio: _kAreaAspect,
                    child: VideoTrackRenderer(
                      track,
                      fit: fit,
                      autoCenter: false,
                    ),
                  ),
                ),
              );
              if (isScreenShareTile && !isActiveScreenShare) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _nonWatchingPreviewLayer(videoWidget),
                    Positioned.fill(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: _nonWatchingPreviewLayer(videoWidget),
                      ),
                    ),
                    Positioned.fill(
                      child: ColoredBox(color: const Color(0x55000000)),
                    ),
                  ],
                );
              }
              if (!isScreenShareTile) {
                return videoWidget;
              }
              if (!isActiveScreenShare || audioTrack == null) {
                return videoWidget;
              }
              return Stack(
                children: <Widget>[
                  videoWidget,
                  Positioned.fill(
                    child: IgnorePointer(
                      child: _ScreenShareAudioPlayback(
                        audioTrack: audioTrack,
                        isEnabled: isActiveScreenShare,
                      ),
                    ),
                  ),
                ],
              );
            }
            final Widget fallbackWidget = _avatarStack(
              context,
              showVideoPending: isScreenShareTile
                  ? voice.selfStream
                  : voice.selfVideo,
              backgroundColor: backgroundColor,
            );
            if (!isScreenShareTile ||
                !isActiveScreenShare ||
                audioTrack == null) {
              return fallbackWidget;
            }
            return Stack(
              children: <Widget>[
                fallbackWidget,
                Positioned.fill(
                  child: IgnorePointer(
                    child: _ScreenShareAudioPlayback(
                      audioTrack: audioTrack,
                      isEnabled: true,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Participant? _resolveParticipant() {
    return resolveVoiceParticipant(
      room: room,
      voice: voice,
      userId: userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
    );
  }

  static TrackPublication? _cameraPublication(Participant participant) {
    return resolveCameraPublication(participant);
  }

  static TrackPublication? _screenShareVideoPublication(
    Participant participant,
    bool requireTrack,
  ) {
    return resolveScreenShareVideoPublication(
      participant: participant,
      requireTrack: requireTrack,
    );
  }

  static TrackPublication? _screenShareAudioPublication(
    Participant participant,
    bool requireTrack,
  ) {
    return resolveScreenShareAudioPublication(
      participant: participant,
      requireTrack: requireTrack,
    );
  }

  Widget _avatarStack(
    BuildContext context, {
    required bool showVideoPending,
    required Color backgroundColor,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: _kAreaAspect,
        child: ColoredBox(
          color: backgroundColor,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (user != null)
                Center(
                  child: FluxerAvatar.fromUserRow(
                    user!,
                    size: 72,
                    showStatus: false,
                  ),
                )
              else
                Center(child: FluxerAvatar(fallbackText: display, size: 72)),
              if (showVideoPending)
                const Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: FluxerLoadingSpinner(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nonWatchingPreviewLayer(Widget fallbackVideo) {
    final String? previewUrl = streamPreviewUrl;
    final String? token = authToken;
    if (previewUrl == null || previewUrl.isEmpty) {
      return fallbackVideo;
    }
    final Map<String, String>? headers = token == null || token.isEmpty
        ? null
        : <String, String>{'Authorization': 'Bearer $token'};
    return Image.network(
      previewUrl,
      fit: BoxFit.cover,
      headers: headers,
      errorBuilder: (BuildContext _, Object __, StackTrace? ___) {
        return fallbackVideo;
      },
      loadingBuilder:
          (BuildContext _, Widget child, ImageChunkEvent? progress) {
            if (progress == null) {
              return child;
            }
            return fallbackVideo;
          },
    );
  }
}

class _ScreenShareAudioPlayback extends StatefulWidget {
  const _ScreenShareAudioPlayback({
    required this.audioTrack,
    required this.isEnabled,
  });

  final AudioTrack audioTrack;
  final bool isEnabled;

  @override
  State<_ScreenShareAudioPlayback> createState() =>
      _ScreenShareAudioPlaybackState();
}

class _ScreenShareAudioPlaybackState extends State<_ScreenShareAudioPlayback> {
  AudioTrack? currentTrack;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _syncPlayback();
  }

  @override
  void didUpdateWidget(covariant _ScreenShareAudioPlayback oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.audioTrack != widget.audioTrack ||
        oldWidget.isEnabled != widget.isEnabled) {
      _syncPlayback();
    }
  }

  @override
  void dispose() {
    _stopTrack();
    super.dispose();
  }

  void _syncPlayback() {
    if (widget.isEnabled) {
      _startTrack(widget.audioTrack);
      return;
    }
    _stopTrack();
  }

  void _startTrack(AudioTrack track) {
    if (currentTrack == track && isPlaying) {
      return;
    }
    _stopTrack();
    currentTrack = track;
    isPlaying = true;
    unawaited(track.start());
  }

  void _stopTrack() {
    final AudioTrack? track = currentTrack;
    if (track == null) {
      return;
    }
    currentTrack = null;
    isPlaying = false;
    unawaited(track.stop());
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
