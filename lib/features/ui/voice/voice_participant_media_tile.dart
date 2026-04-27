import 'package:flutter/material.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kAreaAspect = 16 / 9;

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
    required this.voice,
    required this.display,
    required this.backgroundColor,
    this.user,
    super.key,
  });

  final Room? room;
  final String userId;
  final String? currentUserId;
  final VoiceState voice;
  final String display;
  final Color backgroundColor;
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
            final TrackPublication<VideoTrack>? publication =
                _cameraPublication(participant);
            final VideoTrack? track = publication?.track;
            if (track != null) {
              final VideoViewFit fit = videoViewFitForSlot(
                publication?.dimensions,
                deviceOrientation,
              );
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
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
            }
            return _avatarStack(
              context,
              showVideoPending: voice.selfVideo,
              backgroundColor: backgroundColor,
            );
          },
        );
      },
    );
  }

  Participant? _resolveParticipant() {
    final Room? r = room;
    if (r == null) {
      return null;
    }
    final String? me = currentUserId;
    if (me != null && userId == me) {
      return r.localParticipant;
    }
    return r.remoteParticipants[userId];
  }

  static TrackPublication<VideoTrack>? _cameraPublication(
    Participant participant,
  ) {
    for (final Object pub in participant.videoTrackPublications) {
      if (pub is! TrackPublication<VideoTrack>) {
        continue;
      }
      if (pub.isScreenShare) {
        continue;
      }
      if (pub.muted) {
        continue;
      }
      if (pub.track != null) {
        return pub;
      }
    }
    return null;
  }

  Widget _avatarStack(
    BuildContext context, {
    required bool showVideoPending,
    required Color backgroundColor,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
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
                Center(
                  child: FluxerAvatar(
                    fallbackText: display,
                    size: 72,
                  ),
                ),
              if (showVideoPending)
                const Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class VoiceParticipantStateBadges extends StatelessWidget {
  const VoiceParticipantStateBadges({
    required this.showMute,
    required this.showDeaf,
    super.key,
  });

  final bool showMute;
  final bool showDeaf;

  @override
  Widget build(BuildContext context) {
    if (!showMute && !showDeaf) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showMute)
          const _StateBadge(
            icon: PhosphorIconsFill.microphoneSlash,
          ),
        if (showDeaf) ...<Widget>[
          if (showMute) const SizedBox(width: 2),
          const _StateBadge(
            icon: PhosphorIconsFill.speakerSlash,
          ),
        ],
      ],
    );
  }
}

class _StateBadge extends StatelessWidget {
  const _StateBadge({required this.icon});

  final PhosphorIconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.backgroundPrimary,
      borderRadius: BorderRadius.circular(99),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: PhosphorIcon(
          icon,
          size: 12,
          color: context.colors.statusDanger,
        ),
      ),
    );
  }
}
