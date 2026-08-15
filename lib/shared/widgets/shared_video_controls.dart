import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/shared/widgets/volume_popout_control.dart';
import 'package:material_ui/material_ui.dart';

class SharedVideoControls extends StatelessWidget {
  const SharedVideoControls({
    required this.isPlaying,
    required this.showControls,
    required this.isMuted,
    required this.volume,
    required this.playbackRate,
    required this.positionLabel,
    required this.durationLabel,
    required this.progress,
    required this.onShowControls,
    required this.onTogglePlayPause,
    required this.onToggleMute,
    required this.onVolumeChanged,
    required this.onCyclePlaybackRate,
    required this.onToggleFullscreen,
    required this.onSeekFromGlobalDx,
    super.key,
  });

  final bool isPlaying;
  final bool showControls;
  final bool isMuted;
  final double volume;
  final double playbackRate;
  final String positionLabel;
  final String durationLabel;
  final double progress;
  final VoidCallback onShowControls;
  final Future<void> Function() onTogglePlayPause;
  final Future<void> Function() onToggleMute;
  final Future<void> Function(double value) onVolumeChanged;
  final Future<void> Function() onCyclePlaybackRate;
  final Future<void> Function() onToggleFullscreen;
  final Future<void> Function(double globalDx, BuildContext context)
  onSeekFromGlobalDx;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onHover: (_) => onShowControls(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: FluxerGestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onShowControls,
            ),
          ),
          AnimatedOpacity(
            opacity: showControls ? 1 : 0,
            duration: const Duration(milliseconds: 140),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(
                    builder: (BuildContext sliderContext) {
                      return FluxerGestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTapDown: (TapDownDetails details) =>
                            onSeekFromGlobalDx(
                              details.globalPosition.dx,
                              sliderContext,
                            ),
                        onHorizontalDragUpdate: (DragUpdateDetails details) =>
                            onSeekFromGlobalDx(
                              details.globalPosition.dx,
                              sliderContext,
                            ),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 4,
                          backgroundColor: Colors.white.withValues(alpha: 0.24),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.colors.brandPrimary,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    color: Colors.black.withValues(alpha: 0.8),
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 4),
                    child: Row(
                      children: [
                        IconButton(
                          constraints: const BoxConstraints.tightFor(
                            width: 28,
                            height: 28,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: onTogglePlayPause,
                          icon: Icon(
                            isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: colors.textOnBrandPrimary,
                            size: 18,
                          ),
                        ),
                        VolumePopoutControl(
                          volume: volume,
                          isMuted: isMuted,
                          onVolumeChanged: onVolumeChanged,
                          onToggleMute: onToggleMute,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: onCyclePlaybackRate,
                          style: TextButton.styleFrom(
                            minimumSize: const Size(36, 28),
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                          ),
                          child: Text(
                            '${playbackRate}x',
                            style: context.textStyles.smallText.copyWith(
                              color: colors.textOnBrandPrimary,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        IconButton(
                          constraints: const BoxConstraints.tightFor(
                            width: 28,
                            height: 28,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: onToggleFullscreen,
                          icon: Icon(
                            Icons.fullscreen_rounded,
                            color: colors.textOnBrandPrimary,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
