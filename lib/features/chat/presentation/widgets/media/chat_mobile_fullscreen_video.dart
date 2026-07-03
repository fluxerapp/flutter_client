import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_video_playback_failure_overlay.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_playback_utils.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/media_kit_bootstrap.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showChatMobileFullscreenVideo(
  BuildContext context, {
  required ChatVideoSource source,
}) async {
  if (!source.hasPlayableContent) {
    return;
  }
  final ShellManualGestureBlock shellGestureBlock = ProviderScope.containerOf(
    context,
  ).read(shellManualGestureBlockProvider.notifier);
  shellGestureBlock.setBlocked(value: true);
  try {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) =>
            _ChatMobileFullscreenVideoPage(source: source),
      ),
    );
  } finally {
    shellGestureBlock.setBlocked(value: false);
  }
}

class _ChatMobileFullscreenVideoPage extends StatefulWidget {
  const _ChatMobileFullscreenVideoPage({required this.source});

  final ChatVideoSource source;

  @override
  State<_ChatMobileFullscreenVideoPage> createState() =>
      _ChatMobileFullscreenVideoPageState();
}

class _ChatMobileFullscreenVideoPageState
    extends State<_ChatMobileFullscreenVideoPage> {
  static const Duration _hudHideDelay = Duration(seconds: 3);
  static const double _kUnmutedVolume = 100;

  Player? _player;
  mkv.VideoController? _controller;
  StreamSubscription<bool>? _playingSubscription;
  StreamSubscription<bool>? _bufferingSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  StreamSubscription<String>? _errorSubscription;
  bool _isOpening = true;
  bool _playbackFailed = false;
  bool _hasAttemptedPlayback = false;
  bool _isPlaying = false;
  bool _isBuffering = false;
  bool _hudVisible = true;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isMuted = false;
  Timer? _hudHideTimer;

  @override
  void initState() {
    super.initState();
    unawaited(_initPlayer());
  }

  Future<void> _initPlayer() async {
    await MediaKitBootstrap.ensureInitialized();
    if (!mounted) {
      return;
    }
    final Player player = Player();
    _player = player;
    unawaited(player.setVolume(_kUnmutedVolume));
    _controller = mkv.VideoController(player);
    _playingSubscription = player.stream.playing.listen((bool playing) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isPlaying = playing;
      });
      if (playing) {
        _scheduleHudHide();
      } else {
        _hudHideTimer?.cancel();
        setState(() {
          _hudVisible = true;
        });
      }
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
      setState(() {
        _playbackFailed = true;
        _isOpening = false;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_startPlayback());
    });
  }

  @override
  void dispose() {
    _hudHideTimer?.cancel();
    unawaited(_playingSubscription?.cancel());
    unawaited(_bufferingSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_errorSubscription?.cancel());
    unawaited(_player?.dispose());
    super.dispose();
  }

  void _markPlaybackFailed() {
    if (!mounted || _playbackFailed) {
      return;
    }
    setState(() {
      _playbackFailed = true;
      _isOpening = false;
    });
  }

  Future<void> _startPlayback() async {
    final Player? player = _player;
    if (player == null || !mounted || _playbackFailed) {
      return;
    }
    _hasAttemptedPlayback = true;
    try {
      final String playbackUrl = await resolvePlaybackUrl(widget.source);
      await player.open(Media(playbackUrl));
      if (!mounted || _playbackFailed) {
        return;
      }
      setState(() {
        _isOpening = false;
      });
      if (_isPlaying) {
        _scheduleHudHide();
      }
    } on Object {
      _markPlaybackFailed();
    }
  }

  void _scheduleHudHide() {
    _hudHideTimer?.cancel();
    if (!_isPlaying) {
      return;
    }
    _hudHideTimer = Timer(_hudHideDelay, () {
      if (!mounted || !_isPlaying) {
        return;
      }
      setState(() {
        _hudVisible = false;
      });
    });
  }

  void _toggleHudVisibility() {
    setState(() {
      _hudVisible = !_hudVisible;
    });
    if (_hudVisible) {
      if (_isPlaying) {
        _scheduleHudHide();
      }
    } else {
      _hudHideTimer?.cancel();
    }
  }

  Future<void> _togglePlayPause() async {
    final Player? player = _player;
    if (player == null) {
      return;
    }
    if (_isPlaying) {
      await player.pause();
      return;
    }
    await player.play();
  }

  Future<void> _toggleMute() async {
    _isMuted = !_isMuted;
    if (_isMuted) {
      await _player?.setVolume(0);
    } else {
      await _player?.setVolume(_kUnmutedVolume);
    }
    if (mounted) {
      setState(() {});
    }
    if (_isPlaying) {
      _scheduleHudHide();
    }
  }

  Future<void> _seekFromGlobalDx(
    double globalDx,
    BuildContext sliderContext,
  ) async {
    final RenderObject? renderObject = sliderContext.findRenderObject();
    if (renderObject is! RenderBox || _duration <= Duration.zero) {
      return;
    }
    final Offset local = renderObject.globalToLocal(Offset(globalDx, 0));
    final double relative = (local.dx / renderObject.size.width).clamp(0, 1);
    final int targetMs = (_duration.inMilliseconds * relative).round();
    await _player?.seek(Duration(milliseconds: targetMs));
    if (_isPlaying) {
      _scheduleHudHide();
    }
  }

  void _executeClose() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final mkv.VideoController? controller = _controller;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (controller != null && !_playbackFailed && !_isOpening)
            Positioned.fill(
              child: mkv.Video(controller: controller, controls: null),
            ),
          if (_isOpening || controller == null)
            const IgnorePointer(
              child: ColoredBox(
                color: Colors.black,
                child: Center(child: FluxerLoadingSpinner()),
              ),
            ),
          if (_isBuffering && !_isOpening && !_playbackFailed)
            IgnorePointer(
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.22),
                child: const Center(child: FluxerLoadingSpinner()),
              ),
            ),
          if (controller != null && !_playbackFailed && !_isOpening)
            Positioned.fill(
              child: _hudVisible
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: _toggleHudVisibility,
                      child: const SizedBox.expand(),
                    )
                  : Semantics(
                      label: l10n.chatAttachmentVideoToggleControls,
                      button: true,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: _toggleHudVisibility,
                        child: const SizedBox.expand(),
                      ),
                    ),
            ),
          if (_hudVisible && !_playbackFailed)
            _MobileVideoHud(
              l10n: l10n,
              onClose: _executeClose,
              isMuted: _isMuted,
              onMute: _toggleMute,
              isPlaying: _isPlaying,
              onPlayPause: _togglePlayPause,
              position: _position,
              duration: _duration,
              onSeekFromGlobalDx: _seekFromGlobalDx,
            ),
          if (_playbackFailed)
            ChatVideoPlaybackFailureOverlay(
              fallbackUrl: widget.source.fallbackUrl,
              useRootNavigator: true,
              onClose: _executeClose,
            ),
        ],
      ),
    );
  }
}

class _MobileVideoHud extends StatelessWidget {
  const _MobileVideoHud({
    required this.l10n,
    required this.onClose,
    required this.isMuted,
    required this.onMute,
    required this.isPlaying,
    required this.onPlayPause,
    required this.position,
    required this.duration,
    required this.onSeekFromGlobalDx,
  });

  final FluxerLocalizations l10n;
  final VoidCallback onClose;
  final bool isMuted;
  final Future<void> Function() onMute;
  final bool isPlaying;
  final Future<void> Function() onPlayPause;
  final Duration position;
  final Duration duration;
  final Future<void> Function(double globalDx, BuildContext sliderContext)
  onSeekFromGlobalDx;

  @override
  Widget build(BuildContext context) {
    final double progress = duration.inMilliseconds <= 0
        ? 0
        : (position.inMilliseconds / duration.inMilliseconds).clamp(0, 1);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: onClose,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.5),
                      foregroundColor: Colors.white,
                    ),
                    tooltip: l10n.mediaViewerClose,
                    icon: const PhosphorIcon(
                      PhosphorIconsBold.x,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      unawaited(onMute());
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withValues(alpha: 0.5),
                      foregroundColor: Colors.white,
                    ),
                    tooltip: isMuted
                        ? l10n.chatAttachmentVideoUnmute
                        : l10n.chatAttachmentVideoMute,
                    icon: PhosphorIcon(
                      isMuted
                          ? PhosphorIconsFill.speakerSlash
                          : PhosphorIconsFill.speakerHigh,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              unawaited(onPlayPause());
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints.tightFor(
                              width: 32,
                              height: 32,
                            ),
                            tooltip: isPlaying
                                ? l10n.chatAttachmentVideoPause
                                : l10n.chatAttachmentVideoPlay,
                            icon: PhosphorIcon(
                              isPlaying
                                  ? PhosphorIconsFill.pause
                                  : PhosphorIconsFill.play,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Builder(
                              builder: (BuildContext sliderContext) {
                                return Semantics(
                                  label: l10n.chatAttachmentVideoProgress,
                                  value: '${(progress * 100).round()}%',
                                  slider: true,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTapDown: (TapDownDetails details) {
                                      unawaited(
                                        onSeekFromGlobalDx(
                                          details.globalPosition.dx,
                                          sliderContext,
                                        ),
                                      );
                                    },
                                    onHorizontalDragUpdate:
                                        (DragUpdateDetails details) {
                                          unawaited(
                                            onSeekFromGlobalDx(
                                              details.globalPosition.dx,
                                              sliderContext,
                                            ),
                                          );
                                        },
                                    child: SizedBox(
                                      height: 24,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                          child: LinearProgressIndicator(
                                            value: progress,
                                            minHeight: 4,
                                            backgroundColor: Colors.white
                                                .withValues(alpha: 0.3),
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                  Color
                                                >(Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatAttachmentElapsedTotalMmSs(
                              elapsed: position,
                              total: duration,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFeatures: <FontFeature>[
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
