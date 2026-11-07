import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/voice/voice_blocked_participant_placeholder.dart';
import 'package:fluxer_app/features/ui/voice/voice_cached_video_track.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_avatar.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_tracks_builder.dart';
import 'package:fluxer_app/features/ui/voice/voice_screen_share_audio.dart';
import 'package:fluxer_app/features/ui/voice/voice_stream_preview_image.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/media/video_subscription.dart';
import 'package:fluxer_app/features/voice/utils/media/voice_video_claims.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum VoiceParticipantTileSource { camera, screenShare }

class VoiceParticipantMediaTile extends StatefulWidget {
  const VoiceParticipantMediaTile({
    required this.media,
    required this.userId,
    required this.currentUserId,
    required this.localConnectionId,
    required this.voice,
    required this.display,
    required this.backgroundColor,
    required this.tileSource,
    required this.isActiveScreenShare,
    required this.streamPreviewUrl,
    this.isTileFocused = true,
    this.pauseOwnScreenSharePreviewOnUnfocus = true,
    this.fillContainer = false,
    this.videoCornerRadius = 12,
    this.user,
    this.userDisplay,
    this.mirrorCamera = false,
    this.omitVideoTrack = false,
    this.subscribeQuality = kVoiceCameraSubscribeQuality,
    this.blocked = false,
    super.key,
  });

  final VoiceMediaRoom? media;
  final String userId;
  final String? currentUserId;
  final String? localConnectionId;
  final VoiceState voice;
  final String display;
  final Color backgroundColor;
  final VoiceParticipantTileSource tileSource;
  final bool isActiveScreenShare;
  final bool fillContainer;
  final double videoCornerRadius;
  final bool isTileFocused;
  final bool pauseOwnScreenSharePreviewOnUnfocus;
  final String? streamPreviewUrl;
  final database.User? user;
  final GuildUserDisplay? userDisplay;
  final bool mirrorCamera;
  final bool omitVideoTrack;
  final VideoQuality subscribeQuality;
  final bool blocked;

  @override
  State<VoiceParticipantMediaTile> createState() =>
      _VoiceParticipantMediaTileState();
}

class _VoiceParticipantMediaTileState extends State<VoiceParticipantMediaTile> {
  bool _tileVisible = false;
  bool _trackSyncScheduled = false;
  bool _hadScreenShareFrame = false;
  VoiceVideoClaim? _claim;
  VoiceMediaParticipant? _claimedParticipant;
  TrackSource? _claimedSource;

  @override
  void initState() {
    super.initState();
    _scheduleRemoteTrackSync();
  }

  @override
  void didUpdateWidget(covariant VoiceParticipantMediaTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.omitVideoTrack && !widget.omitVideoTrack) {
      _tileVisible = true;
    }
    _scheduleRemoteTrackSync();
  }

  @override
  void dispose() {
    _releaseClaim();
    super.dispose();
  }

  Key get _visibilityKey {
    return ValueKey<String>(
      'voice-tile-vis-${widget.userId}-'
      '${widget.voice.connectionId}-${widget.tileSource.name}-'
      '${identityHashCode(this)}',
    );
  }

  void _scheduleRemoteTrackSync() {
    if (_trackSyncScheduled) {
      return;
    }
    _trackSyncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _trackSyncScheduled = false;
      if (!mounted) {
        return;
      }
      _applyRemoteTrackSync();
    });
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) {
      return;
    }
    final bool visible = info.visibleFraction > 0;
    if (visible == _tileVisible) {
      return;
    }
    _tileVisible = visible;
    _applyRemoteTrackSync();
  }

  void _applyRemoteTrackSync() {
    final VoiceMediaParticipant? participant = _resolveParticipant();
    final bool screenShare =
        widget.tileSource == VoiceParticipantTileSource.screenShare;
    final bool wanted =
        !widget.blocked &&
        (screenShare
            ? shouldSubscribeRemoteScreenShare(
                isActiveScreenShare: widget.isActiveScreenShare,
              )
            : shouldSubscribeRemoteCamera(
                tileVisible: _tileVisible,
                omitVideoTrack: widget.omitVideoTrack,
              ));
    if (participant == null || !wanted) {
      _releaseClaim();
      return;
    }
    final TrackSource source = screenShare
        ? TrackSource.screenShareVideo
        : TrackSource.camera;
    if (_claim != null &&
        identical(_claimedParticipant, participant) &&
        _claimedSource == source) {
      _claim!.update(widget.subscribeQuality);
      return;
    }
    _releaseClaim();
    _claimedParticipant = participant;
    _claimedSource = source;
    _claim = VoiceVideoClaims.of(
      participant,
    ).claim(source, quality: widget.subscribeQuality);
  }

  void _releaseClaim() {
    _claim?.release();
    _claim = null;
    _claimedParticipant = null;
    _claimedSource = null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.blocked) {
      return VisibilityDetector(
        key: _visibilityKey,
        onVisibilityChanged: _onVisibilityChanged,
        child: VoiceBlockedParticipantPlaceholder(
          cornerRadius: widget.videoCornerRadius,
        ),
      );
    }
    final VoiceMediaParticipant? participant = _resolveParticipant();
    final bool isScreenShareTile =
        widget.tileSource == VoiceParticipantTileSource.screenShare;
    final bool isOwnScreenShareTile =
        isScreenShareTile &&
        widget.currentUserId != null &&
        widget.userId == widget.currentUserId &&
        widget.localConnectionId != null &&
        widget.voice.connectionId == widget.localConnectionId;
    final bool showRemoteStreamPreview =
        isScreenShareTile &&
        !isOwnScreenShareTile &&
        !widget.isActiveScreenShare;
    if (participant == null) {
      return VisibilityDetector(
        key: _visibilityKey,
        onVisibilityChanged: _onVisibilityChanged,
        child: showRemoteStreamPreview
            ? _nonWatchingPreviewLayer(_emptyStreamSurface())
            : _avatarStack(
                context,
                showVideoPending: false,
                backgroundColor: widget.backgroundColor,
              ),
      );
    }
    final String? streamKey = isScreenShareTile
        ? buildViewerStreamKey(voice: widget.voice, isScreenShareTile: true)
        : null;
    final bool hasOwnScreenSharePublication =
        isScreenShareTile && participant.hasScreenShare;
    if (isOwnScreenShareTile &&
        hasOwnScreenSharePublication &&
        widget.pauseOwnScreenSharePreviewOnUnfocus &&
        !widget.isTileFocused) {
      return _buildOwnScreenShareBroadcastingTile(
        context,
        widget.backgroundColor,
      );
    }
    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: VoiceParticipantTracksBuilder(
        participant: participant,
        isScreenShare: isScreenShareTile,
        builder:
            (BuildContext context, VideoTrack? track, AudioTrack? audioTrack) {
              if (track != null) {
                if (widget.omitVideoTrack) {
                  if (showRemoteStreamPreview) {
                    return _nonWatchingPreviewLayer(_emptyStreamSurface());
                  }
                  Widget hole = ColoredBox(color: widget.backgroundColor);
                  if (isScreenShareTile &&
                      widget.isActiveScreenShare &&
                      audioTrack != null) {
                    hole = Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        hole,
                        Positioned.fill(
                          child: IgnorePointer(
                            child: VoiceScreenShareAudio(
                              streamKey: streamKey,
                              audioTrack: audioTrack,
                              enabled: widget.isActiveScreenShare,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return hole;
                }
                final bool isOwnCameraTile =
                    widget.tileSource == VoiceParticipantTileSource.camera &&
                    widget.currentUserId != null &&
                    widget.userId == widget.currentUserId;
                final VideoViewFit fit = isScreenShareTile
                    ? VideoViewFit.contain
                    : VideoViewFit.cover;
                final VideoViewMirrorMode mirrorMode;
                if (!isOwnCameraTile || isScreenShareTile) {
                  mirrorMode = VideoViewMirrorMode.off;
                } else if (widget.mirrorCamera) {
                  mirrorMode = VideoViewMirrorMode.mirror;
                } else {
                  mirrorMode = VideoViewMirrorMode.off;
                }
                final Widget videoChild = _SettledVideoSize(
                  child: VoiceCachedVideoTrack(
                    track: track,
                    fit: fit,
                    mirrorMode: mirrorMode,
                  ),
                );
                Widget videoWidget = ColoredBox(
                  color: widget.backgroundColor,
                  child: SizedBox.expand(child: videoChild),
                );
                if (widget.videoCornerRadius > 0) {
                  videoWidget = ClipRRect(
                    borderRadius: BorderRadius.circular(
                      widget.videoCornerRadius,
                    ),
                    child: videoWidget,
                  );
                }
                if (showRemoteStreamPreview) {
                  return _nonWatchingPreviewLayer(videoWidget);
                }
                if (!isScreenShareTile) {
                  return videoWidget;
                }
                _hadScreenShareFrame = true;
                if (!widget.isActiveScreenShare || audioTrack == null) {
                  return videoWidget;
                }
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    videoWidget,
                    Positioned.fill(
                      child: IgnorePointer(
                        child: VoiceScreenShareAudio(
                          streamKey: streamKey,
                          audioTrack: audioTrack,
                          enabled: widget.isActiveScreenShare,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (isScreenShareTile &&
                  widget.isActiveScreenShare &&
                  _hadScreenShareFrame) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    ColoredBox(color: widget.backgroundColor),
                    const Positioned.fill(
                      child: ColoredBox(color: Color(0x66000000)),
                    ),
                    const Center(
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: FluxerLoadingSpinner(),
                      ),
                    ),
                  ],
                );
              }
              final Widget fallbackWidget = showRemoteStreamPreview
                  ? _nonWatchingPreviewLayer(_emptyStreamSurface())
                  : _avatarStack(
                      context,
                      showVideoPending: isScreenShareTile
                          ? widget.voice.selfStream
                          : widget.voice.selfVideo,
                      backgroundColor: widget.backgroundColor,
                    );
              if (!isScreenShareTile ||
                  !widget.isActiveScreenShare ||
                  audioTrack == null) {
                return fallbackWidget;
              }
              return Stack(
                children: <Widget>[
                  fallbackWidget,
                  Positioned.fill(
                    child: IgnorePointer(
                      child: VoiceScreenShareAudio(
                        streamKey: streamKey,
                        audioTrack: audioTrack,
                        enabled: widget.isActiveScreenShare,
                      ),
                    ),
                  ),
                ],
              );
            },
      ),
    );
  }

  VoiceMediaParticipant? _resolveParticipant() {
    return resolveVoiceParticipant(
      media: widget.media,
      voice: widget.voice,
      userId: widget.userId,
      currentUserId: widget.currentUserId,
      localConnectionId: widget.localConnectionId,
    );
  }

  Widget _avatarStack(
    BuildContext context, {
    required bool showVideoPending,
    required Color backgroundColor,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          VoiceCallAvatar(
            background: backgroundColor,
            userId: widget.userId,
            user: widget.user,
            userDisplay: widget.userDisplay,
            fallbackText: widget.display,
          ),
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
    );
  }

  Widget _emptyStreamSurface() {
    return ColoredBox(color: widget.backgroundColor);
  }

  Widget _nonWatchingPreviewLayer(Widget fallbackVideo) {
    final String? previewUrl = widget.streamPreviewUrl;
    if (previewUrl == null || previewUrl.isEmpty) {
      return fallbackVideo;
    }
    return SizedBox.expand(
      child: VoiceStreamPreviewImage(
        previewUrl: previewUrl,
        fallback: fallbackVideo,
      ),
    );
  }

  Widget _buildOwnScreenShareBroadcastingTile(
    BuildContext context,
    Color backgroundColor,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.88),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.screen_share_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.voiceOwnScreenShareTitle,
                  textAlign: TextAlign.center,
                  style: context.textStyles.channelName.copyWith(
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.voiceOwnScreenShareSubtitle,
                  textAlign: TextAlign.center,
                  style: context.textStyles.timestamp.copyWith(
                    color: const Color(0xCCFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettledVideoSize extends StatefulWidget {
  const _SettledVideoSize({required this.child});

  final Widget child;

  @override
  State<_SettledVideoSize> createState() => _SettledVideoSizeState();
}

class _SettledVideoSizeState extends State<_SettledVideoSize> {
  Size? _layoutSize;
  Size? _pendingSize;
  int _generation = 0;

  bool _near(Size a, Size b) {
    return (a.width - b.width).abs() < 0.5 && (a.height - b.height).abs() < 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;
        if (!width.isFinite || !height.isFinite || width < 1 || height < 1) {
          return widget.child;
        }
        final Size frame = Size(width, height);
        final Size layout = _layoutSize ?? frame;
        if (_layoutSize == null) {
          _layoutSize = frame;
        } else if (!_near(frame, layout)) {
          _scheduleAdopt(frame);
        }
        return FittedBox(
          fit: BoxFit.fill,
          alignment: AlignmentDirectional.topStart,
          child: SizedBox(
            width: layout.width,
            height: layout.height,
            child: widget.child,
          ),
        );
      },
    );
  }

  void _scheduleAdopt(Size frame) {
    final Size? pending = _pendingSize;
    if (pending != null && _near(pending, frame)) {
      return;
    }
    _pendingSize = frame;
    _generation++;
    final int generation = _generation;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || generation != _generation) {
          return;
        }
        _pendingSize = null;
        if (_layoutSize != null && _near(_layoutSize!, frame)) {
          return;
        }
        setState(() => _layoutSize = frame);
      });
    });
  }
}
