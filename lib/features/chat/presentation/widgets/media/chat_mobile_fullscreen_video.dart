import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/mobile_media_options_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_video_playback_failure_overlay.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_youtube_webview.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_hdr_player_config.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_playback_utils.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';
import 'package:fluxer_app/features/chat/utils/save_message_media_favorite.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_manual_gesture_block_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismiss.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismissible.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showChatMobileFullscreenVideo(
  BuildContext context, {
  required ChatFullscreenVideoLaunchContext launchContext,
}) async {
  if (!launchContext.hasPlayableContent) {
    return;
  }
  final ShellManualGestureBlock shellGestureBlock = ProviderScope.containerOf(
    context,
  ).read(shellManualGestureBlockProvider.notifier)..setBlocked(value: true);
  try {
    await showGeneralDialog<void>(
      context: context,
      barrierLabel: FluxerLocalizations.of(context).mediaViewerImagePreview,
      barrierColor: Colors.transparent,
      pageBuilder: (_, _, _) {
        if (launchContext.isYouTubeEmbed) {
          return _ChatMobileFullscreenYouTubePage(launchContext: launchContext);
        }
        return _ChatMobileFullscreenVideoPage(launchContext: launchContext);
      },
      transitionBuilder: (_, animation, _, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  } finally {
    shellGestureBlock.setBlocked(value: false);
  }
}

class _ChatMobileFullscreenVideoPage extends ConsumerStatefulWidget {
  const _ChatMobileFullscreenVideoPage({required this.launchContext});

  final ChatFullscreenVideoLaunchContext launchContext;

  @override
  ConsumerState<_ChatMobileFullscreenVideoPage> createState() =>
      _ChatMobileFullscreenVideoPageState();
}

class _ChatMobileFullscreenVideoPageState
    extends ConsumerState<_ChatMobileFullscreenVideoPage> {
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
  double _dismissProgress = 0;

  ChatVideoSource get _source => widget.launchContext.source;

  Widget? _buildFavoriteButton() {
    final MessageMediaActionScope? actionScope =
        widget.launchContext.actionScope;
    final Attachment? attachment = widget.launchContext.attachment;
    final MessageMediaFavoriteTarget? target = favoriteTargetForMessageMedia(
      actionScope: actionScope,
      attachmentId: attachment?.id,
      embedIndex: widget.launchContext.embedIndex,
      filename: attachment?.filename,
      fallbackContentHash: attachment?.contentHash,
      attachment: attachment,
      forMediaViewerToolbar: true,
    );
    if (target == null || actionScope == null) {
      return null;
    }
    return SavedMediaFavoriteToolbarButton(
      message: actionScope.message,
      target: target,
      useHudStyle: true,
    );
  }

  @override
  void initState() {
    super.initState();
    unawaited(_initPlayer());
  }

  Future<void> _initPlayer() async {
    try {
      if (!mounted) {
        return;
      }
      final Player player = Player();
      _player = player;
      unawaited(player.setVolume(_kUnmutedVolume));
      _controller = mkv.VideoController(player);
      unawaited(
        applyChatVideoHdrProperties(
          player,
          ref.read(appearancePreferencesProvider).hdrDisplayMode,
        ),
      );
      _playingSubscription = player.stream.playing.listen((bool playing) {
        if (!mounted || _playbackFailed) {
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
        if (!mounted || _playbackFailed) {
          return;
        }
        setState(() {
          _isBuffering = buffering;
        });
      });
      _positionSubscription = player.stream.position.listen((
        Duration position,
      ) {
        if (!mounted || _playbackFailed) {
          return;
        }
        setState(() {
          _position = position;
        });
      });
      _durationSubscription = player.stream.duration.listen((
        Duration duration,
      ) {
        if (!mounted || _playbackFailed) {
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
        unawaited(_handlePlaybackFailure());
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_startPlayback());
      });
    } on Object {
      _markPlaybackFailed();
    }
  }

  @override
  void dispose() {
    _hudHideTimer?.cancel();
    unawaited(_disposePlayer());
    super.dispose();
  }

  Future<void> _disposePlayer() async {
    await _playingSubscription?.cancel();
    await _bufferingSubscription?.cancel();
    await _positionSubscription?.cancel();
    await _durationSubscription?.cancel();
    await _errorSubscription?.cancel();
    _playingSubscription = null;
    _bufferingSubscription = null;
    _positionSubscription = null;
    _durationSubscription = null;
    _errorSubscription = null;
    final Player? player = _player;
    _player = null;
    _controller = null;
    if (player != null) {
      await player.dispose();
    }
  }

  Future<void> _handlePlaybackFailure() async {
    if (!mounted || _playbackFailed) {
      return;
    }
    _hudHideTimer?.cancel();
    setState(() {
      _playbackFailed = true;
      _isOpening = false;
      _isPlaying = false;
      _isBuffering = false;
      _hudVisible = true;
    });
    await _playingSubscription?.cancel();
    await _bufferingSubscription?.cancel();
    await _positionSubscription?.cancel();
    await _durationSubscription?.cancel();
    await _errorSubscription?.cancel();
    _playingSubscription = null;
    _bufferingSubscription = null;
    _positionSubscription = null;
    _durationSubscription = null;
    _errorSubscription = null;
    final Player? player = _player;
    _player = null;
    _controller = null;
    if (player == null) {
      return;
    }
    try {
      await player.pause();
      await player.stop();
    } on Object {
      // Player may already be in a failed native state.
    }
    try {
      await player.dispose();
    } on Object {
      // Ignore cleanup errors after playback failure.
    }
  }

  void _markPlaybackFailed() {
    unawaited(_handlePlaybackFailure());
  }

  Future<void> _startPlayback() async {
    final Player? player = _player;
    if (player == null || !mounted || _playbackFailed) {
      return;
    }
    _hasAttemptedPlayback = true;
    try {
      final String playbackUrl = await resolvePlaybackUrl(_source);
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

  void _keepHudVisible() {
    _hudHideTimer?.cancel();
    if (!_hudVisible) {
      setState(() {
        _hudVisible = true;
      });
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

  void _handleDismissProgress(double progress) {
    if (_dismissProgress == progress) {
      return;
    }
    setState(() {
      _dismissProgress = progress;
    });
  }

  Future<void> _openOptions() async {
    _keepHudVisible();
    await showMobileMediaOptionsSheet(
      context: context,
      ref: ref,
      launchContext: MediaOptionsLaunchContext.fromVideoLaunchContext(
        widget.launchContext,
      ),
      onCloseViewer: _executeClose,
    );
    if (mounted && _isPlaying) {
      _scheduleHudHide();
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
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final mkv.VideoController? controller = _controller;
    final bool showOptionsButton = widget.launchContext.hasOptionsMenu;
    final double backdropOpacity = mediaViewerDismissBackdropOpacity(
      baseOpacity: 1,
      dismissProgress: _dismissProgress,
    );
    final double chromeOpacity = mediaViewerDismissChromeOpacity(
      dismissProgress: _dismissProgress,
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          ColoredBox(color: Colors.black.withValues(alpha: backdropOpacity)),
          MediaViewerDismissible(
            onDismissProgress: _handleDismissProgress,
            onClose: _executeClose,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: <Widget>[
                if (controller != null && !_playbackFailed && !_isOpening)
                  Positioned.fill(
                    child: mkv.Video(controller: controller, controls: null),
                  ),
                if ((_isOpening || controller == null) && !_playbackFailed)
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
                        ? FluxerGestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: _toggleHudVisibility,
                            child: const SizedBox.expand(),
                          )
                        : Semantics(
                            label: l10n.chatAttachmentVideoToggleControls,
                            button: true,
                            child: FluxerGestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: _toggleHudVisibility,
                              child: const SizedBox.expand(),
                            ),
                          ),
                  ),
                if (_hudVisible && !_playbackFailed)
                  Opacity(
                    opacity: chromeOpacity,
                    child: _MobileVideoHud(
                      l10n: l10n,
                      onClose: _executeClose,
                      onOpenOptions: showOptionsButton ? _openOptions : null,
                      favoriteButton: _buildFavoriteButton(),
                      isMuted: _isMuted,
                      onMute: _toggleMute,
                      isPlaying: _isPlaying,
                      onPlayPause: _togglePlayPause,
                      position: _position,
                      duration: _duration,
                      onSeekFromGlobalDx: _seekFromGlobalDx,
                    ),
                  ),
                if (_playbackFailed)
                  Opacity(
                    opacity: chromeOpacity,
                    child: ChatVideoPlaybackFailureOverlay(
                      fallbackUrl: _source.fallbackUrl,
                      useRootNavigator: true,
                      onClose: _executeClose,
                      onOpenOptions: showOptionsButton ? _openOptions : null,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMobileFullscreenYouTubePage extends ConsumerStatefulWidget {
  const _ChatMobileFullscreenYouTubePage({required this.launchContext});

  final ChatFullscreenVideoLaunchContext launchContext;

  @override
  ConsumerState<_ChatMobileFullscreenYouTubePage> createState() =>
      _ChatMobileFullscreenYouTubePageState();
}

class _ChatMobileFullscreenYouTubePageState
    extends ConsumerState<_ChatMobileFullscreenYouTubePage> {
  double _dismissProgress = 0;

  ChatFullscreenVideoLaunchContext get _launchContext => widget.launchContext;

  Embed get _embed => _launchContext.youtubeEmbed!;

  Widget? _buildFavoriteButton() {
    final MessageMediaActionScope? actionScope = _launchContext.actionScope;
    final MessageMediaFavoriteTarget? target = favoriteTargetForMessageMedia(
      actionScope: actionScope,
      embedIndex: _launchContext.embedIndex,
      filename: _embed.title,
      attachment: _launchContext.attachment,
      forMediaViewerToolbar: true,
    );
    if (target == null || actionScope == null) {
      return null;
    }
    return SavedMediaFavoriteToolbarButton(
      message: actionScope.message,
      target: target,
      useHudStyle: true,
    );
  }

  void _executeClose() {
    Navigator.of(context).pop();
  }

  void _handleDismissProgress(double progress) {
    if (_dismissProgress == progress) {
      return;
    }
    setState(() {
      _dismissProgress = progress;
    });
  }

  Future<void> _openOptions() async {
    await showMobileMediaOptionsSheet(
      context: context,
      ref: ref,
      launchContext: MediaOptionsLaunchContext.fromVideoLaunchContext(
        _launchContext,
      ),
      onCloseViewer: _executeClose,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? embedUrl = _launchContext.youtubeEmbedUrl;
    final String pageOrigin = _launchContext.youtubePageOrigin;
    final bool showOptionsButton = _launchContext.hasOptionsMenu;
    final double backdropOpacity = mediaViewerDismissBackdropOpacity(
      baseOpacity: 1,
      dismissProgress: _dismissProgress,
    );
    final double chromeOpacity = mediaViewerDismissChromeOpacity(
      dismissProgress: _dismissProgress,
    );
    final double aspectRatio = resolveChatVideoAspectRatio(
      width: _embed.video?.width,
      height: _embed.video?.height,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: <Widget>[
          ColoredBox(color: Colors.black.withValues(alpha: backdropOpacity)),
          MediaViewerDismissible(
            onDismissProgress: _handleDismissProgress,
            onClose: _executeClose,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: <Widget>[
                if (embedUrl != null)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: AspectRatio(
                        aspectRatio: aspectRatio,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ChatYouTubeWebView(
                            embedUrl: embedUrl,
                            pageOrigin: pageOrigin,
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  Opacity(
                    opacity: chromeOpacity,
                    child: ChatVideoPlaybackFailureOverlay(
                      fallbackUrl: _launchContext.source.fallbackUrl,
                      useRootNavigator: true,
                      onClose: _executeClose,
                      onOpenOptions: showOptionsButton ? _openOptions : null,
                    ),
                  ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: chromeOpacity,
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: _executeClose,
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.black.withValues(
                                  alpha: 0.5,
                                ),
                                foregroundColor: Colors.white,
                              ),
                              tooltip: l10n.mediaViewerClose,
                              icon: const PhosphorIcon(
                                PhosphorIconsBold.x,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const Spacer(),
                            ?_buildFavoriteButton(),
                            if (showOptionsButton)
                              IconButton(
                                onPressed: _openOptions,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withValues(
                                    alpha: 0.5,
                                  ),
                                  foregroundColor: Colors.white,
                                ),
                                tooltip: l10n.mediaViewerOptions,
                                icon: const PhosphorIcon(
                                  PhosphorIconsBold.dotsThree,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
    this.onOpenOptions,
    this.favoriteButton,
  });

  final FluxerLocalizations l10n;
  final VoidCallback onClose;
  final VoidCallback? onOpenOptions;
  final Widget? favoriteButton;
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
                  const Spacer(),
                  ?favoriteButton,
                  if (onOpenOptions != null)
                    IconButton(
                      onPressed: onOpenOptions,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black.withValues(alpha: 0.5),
                        foregroundColor: Colors.white,
                      ),
                      tooltip: l10n.mediaViewerOptions,
                      icon: const PhosphorIcon(
                        PhosphorIconsBold.dotsThree,
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
                                  child: FluxerGestureDetector(
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
                            style: context.textStyles.timestamp.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFeatures: const <FontFeature>[
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
