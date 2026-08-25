import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thumbhash/flutter_thumbhash.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_video_playback_failure_overlay.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_hdr_player_config.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_playback_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/shared_video_controls.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;

typedef ChatVideoControlsBuilder = Widget Function(mkv.VideoState state);

class ChatInlineVideoPlayer extends ConsumerStatefulWidget {
  const ChatInlineVideoPlayer({
    required this.source,
    this.launchContext,
    this.dimensionSize = MediaDimensionSize.small,
    this.controlsBuilder,
    this.posterFit = BoxFit.cover,
    this.applyMaxHeight = true,
    super.key,
  });

  final ChatVideoSource source;
  final ChatFullscreenVideoLaunchContext? launchContext;
  final MediaDimensionSize dimensionSize;
  final ChatVideoControlsBuilder? controlsBuilder;
  final BoxFit posterFit;
  final bool applyMaxHeight;

  @override
  ConsumerState<ChatInlineVideoPlayer> createState() =>
      _ChatInlineVideoPlayerState();
}

class _ChatInlineVideoPlayerState extends ConsumerState<ChatInlineVideoPlayer> {
  Player? _player;
  mkv.VideoController? _controller;
  StreamSubscription<bool>? _playingSubscription;
  StreamSubscription<bool>? _bufferingSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<String>? _errorSubscription;
  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _isLoading = false;
  bool _hasLoadedMedia = false;
  bool _playbackFailed = false;
  bool _hasAttemptedPlayback = false;
  bool _showControls = true;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  double _volume = 1;
  bool _isMuted = false;
  double _playbackRate = 1;
  Timer? _controlsHideTimer;

  @override
  void dispose() {
    _controlsHideTimer?.cancel();
    unawaited(_playingSubscription?.cancel());
    unawaited(_bufferingSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_errorSubscription?.cancel());
    unawaited(_player?.dispose());
    super.dispose();
  }

  double _resolveAspectRatio() {
    return resolveChatVideoAspectRatio(
      width: widget.source.width,
      height: widget.source.height,
    );
  }

  Future<void> _openMobileFullscreen() async {
    final ChatFullscreenVideoLaunchContext launchContext =
        widget.launchContext ??
        ChatFullscreenVideoLaunchContext(source: widget.source);
    if (!launchContext.source.hasPlayableContent) {
      return;
    }
    await showChatMobileFullscreenVideo(context, launchContext: launchContext);
  }

  void _markPlaybackFailed() {
    if (!mounted || _playbackFailed) {
      return;
    }
    setState(() {
      _playbackFailed = true;
      _isLoading = false;
    });
  }

  Future<void> _startPlayback() async {
    if (_isLoading || !widget.source.hasPlayableContent || _playbackFailed) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _hasAttemptedPlayback = true;
    try {
      final Player player = _ensurePlayer();
      if (_hasLoadedMedia) {
        await player.play();
      } else {
        final String playbackUrl = await resolvePlaybackUrl(widget.source);
        await player.open(Media(playbackUrl));
        _hasLoadedMedia = true;
      }
      if (!mounted || _playbackFailed) {
        return;
      }
      _showControlsTemporarily();
    } on Object {
      _markPlaybackFailed();
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<HdrDisplayMode>(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState state) => state.hdrDisplayMode,
      ),
      (HdrDisplayMode? previous, HdrDisplayMode next) {
        final Player? player = _player;
        if (player == null || previous == next) {
          return;
        }
        unawaited(applyChatVideoHdrProperties(player, next));
      },
    );
    final bool isMobile = isMobileLayout(context);
    final FluxerMediaDimensions dimensions = mediaDimensionsForSize(
      widget.dimensionSize,
    );
    final Widget player = AspectRatio(
      aspectRatio: _resolveAspectRatio(),
      child: isMobile
          ? FluxerGestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _openMobileFullscreen,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  _buildPoster(),
                  const VideoPlayButtonOverlay(),
                ],
              ),
            )
          : _playbackFailed
          ? Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _buildPoster(),
                ChatVideoPlaybackFailureOverlay(
                  fallbackUrl: widget.source.fallbackUrl,
                ),
              ],
            )
          : _hasLoadedMedia
          ? Stack(
              fit: StackFit.expand,
              children: <Widget>[
                mkv.Video(
                  controller: _controller!,
                  controls: widget.controlsBuilder ?? _buildDefaultControls,
                ),
                if (_isBuffering)
                  IgnorePointer(
                    child: ColoredBox(
                      color: Colors.black.withValues(alpha: 0.22),
                      child: const Center(child: FluxerLoadingSpinner()),
                    ),
                  ),
              ],
            )
          : FluxerGestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _startPlayback,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  _buildPoster(),
                  if (_isLoading)
                    const Center(child: FluxerLoadingSpinner())
                  else
                    const VideoPlayButtonOverlay(),
                ],
              ),
            ),
    );
    if (!widget.applyMaxHeight) {
      return player;
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: dimensions.maxHeight),
      child: player,
    );
  }

  Player _ensurePlayer() {
    final Player? existingPlayer = _player;
    if (existingPlayer != null) {
      return existingPlayer;
    }
    final Player player = Player();
    _player = player;
    unawaited(player.setVolume(_volume));
    unawaited(player.setRate(_playbackRate));
    _controller = mkv.VideoController(player);
    unawaited(
      applyChatVideoHdrProperties(
        player,
        ref.read(appearancePreferencesProvider).hdrDisplayMode,
      ),
    );
    _playingSubscription = player.stream.playing.listen((bool playing) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isPlaying = playing;
      });
    });
    _bufferingSubscription = player.stream.buffering.listen((bool buffering) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isBuffering = buffering;
      });
    });
    _positionSubscription = player.stream.position.listen((Duration position) {
      if (!mounted) {
        return;
      }
      setState(() {
        _position = position;
      });
    });
    _durationSubscription = player.stream.duration.listen((Duration duration) {
      if (!mounted) {
        return;
      }
      setState(() {
        _duration = duration;
      });
    });
    _errorSubscription = player.stream.error.listen((String error) {
      if (!mounted || !_hasAttemptedPlayback || _playbackFailed) {
        return;
      }
      _markPlaybackFailed();
    });
    return player;
  }

  Widget _buildDefaultControls(mkv.VideoState state) {
    return SharedVideoControls(
      isPlaying: _isPlaying,
      showControls: _showControls,
      isMuted: _isMuted,
      volume: _volume,
      playbackRate: _playbackRate,
      positionLabel: formatAttachmentDurationMmSs(_position),
      durationLabel: formatAttachmentDurationMmSs(_duration),
      progress: _duration.inMilliseconds <= 0
          ? 0
          : (_position.inMilliseconds / _duration.inMilliseconds).clamp(0, 1),
      onShowControls: _showControlsTemporarily,
      onTogglePlayPause: _togglePlayPause,
      onToggleMute: _toggleMute,
      onVolumeChanged: _setVolume,
      onCyclePlaybackRate: _cyclePlaybackRate,
      onToggleFullscreen: _toggleFullscreen,
      onSeekFromGlobalDx: _seekFromGlobalDx,
    );
  }

  Future<void> _togglePlayPause() async {
    final Player? player = _player;
    if (player == null) {
      return;
    }
    if (_isPlaying) {
      await player.pause();
      _controlsHideTimer?.cancel();
      if (mounted) {
        setState(() {
          _showControls = true;
        });
      }
      return;
    }
    await player.play();
    _showControlsTemporarily();
  }

  Future<void> _seekFromGlobalDx(double globalDx, BuildContext context) async {
    final RenderObject? renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || _duration <= Duration.zero) {
      return;
    }
    final Offset local = renderObject.globalToLocal(Offset(globalDx, 0));
    final double relative = (local.dx / renderObject.size.width).clamp(0, 1);
    final int targetMs = (_duration.inMilliseconds * relative).round();
    await _player?.seek(Duration(milliseconds: targetMs));
    _showControlsTemporarily();
  }

  Future<void> _toggleMute() async {
    _isMuted = !_isMuted;
    if (_isMuted) {
      await _player?.setVolume(0);
    } else {
      await _player?.setVolume(_volume);
    }
    if (mounted) {
      setState(() {});
    }
    _showControlsTemporarily();
  }

  Future<void> _setVolume(double value) async {
    _volume = value.clamp(0, 1);
    if (!_isMuted) {
      await _player?.setVolume(_volume);
    }
    if (mounted) {
      setState(() {});
    }
    _showControlsTemporarily();
  }

  Future<void> _cyclePlaybackRate() async {
    const List<double> rates = <double>[1, 1.25, 1.5, 2];
    final int index = rates.indexOf(_playbackRate);
    final int next = index < 0 || index == rates.length - 1 ? 0 : index + 1;
    _playbackRate = rates[next];
    await _player?.setRate(_playbackRate);
    if (mounted) {
      setState(() {});
    }
    _showControlsTemporarily();
  }

  Future<void> _toggleFullscreen() async {
    if (!mounted || _controller == null) {
      return;
    }
    await showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.94),
      builder: (BuildContext dialogContext) {
        return FluxerGestureDetector(
          onTap: () => Navigator.of(dialogContext).pop(),
          child: ColoredBox(
            color: Colors.transparent,
            child: Center(
              child: AspectRatio(
                aspectRatio: _resolveAspectRatio(),
                child: mkv.Video(controller: _controller!, controls: null),
              ),
            ),
          ),
        );
      },
    );
    _showControlsTemporarily();
  }

  void _showControlsTemporarily() {
    if (!_showControls && mounted) {
      setState(() {
        _showControls = true;
      });
    }
    _controlsHideTimer?.cancel();
    if (!_isPlaying) {
      return;
    }
    _controlsHideTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted || !_isPlaying) {
        return;
      }
      setState(() {
        _showControls = false;
      });
    });
  }

  Widget _buildPoster() {
    final ChatVideoSource source = widget.source;
    final String? placeholder = source.placeholder;
    final String? posterUrl = source.posterUrl;
    final Widget base = placeholder != null && placeholder.isNotEmpty
        ? Image(
            image: ThumbHash.fromBase64(placeholder).toImage(),
            fit: widget.posterFit,
          )
        : ColoredBox(
            color: Colors.black,
            child: Center(
              child: Icon(
                Icons.videocam_rounded,
                color: Colors.white.withValues(alpha: 0.5),
                size: 38,
              ),
            ),
          );
    if (posterUrl == null) {
      return base;
    }
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        base,
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double dpr = MediaQuery.devicePixelRatioOf(context);
              final cache = widget.posterFit == BoxFit.cover
                  ? coverDecodeCacheSize(
                      cellWidth: constraints.maxWidth,
                      cellHeight: constraints.maxHeight,
                      devicePixelRatio: dpr,
                      sourceWidth: widget.source.width,
                      sourceHeight: widget.source.height,
                    )
                  : containDecodeCacheSize(
                      cellWidth: constraints.maxWidth,
                      cellHeight: constraints.maxHeight,
                      devicePixelRatio: dpr,
                      sourceWidth: widget.source.width,
                      sourceHeight: widget.source.height,
                    );
              return CachedNetworkImage(
                imageUrl: posterUrl,
                fit: widget.posterFit,
                memCacheWidth: cache.width,
                memCacheHeight: cache.height,
                placeholder: (_, _) => const SizedBox.shrink(),
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ],
    );
  }
}

class VideoPlayButtonOverlay extends StatelessWidget {
  const VideoPlayButtonOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.6),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.play_arrow,
          color: context.colors.textOnBrandPrimary,
          size: 28,
        ),
      ),
    );
  }
}
