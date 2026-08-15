import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:material_ui/material_ui.dart';

class VoiceMessageTrimWaveform extends StatefulWidget {
  const VoiceMessageTrimWaveform({
    required this.peaks,
    required this.startFraction,
    required this.endFraction,
    required this.playheadFraction,
    required this.onStartChanged,
    required this.onEndChanged,
    super.key,
  });

  final List<double> peaks;
  final double startFraction;
  final double endFraction;
  final double playheadFraction;
  final ValueChanged<double> onStartChanged;
  final ValueChanged<double> onEndChanged;

  @override
  State<VoiceMessageTrimWaveform> createState() =>
      _VoiceMessageTrimWaveformState();
}

class _VoiceMessageTrimWaveformState extends State<VoiceMessageTrimWaveform> {
  static const double _handleWidth = 12;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;
        final double startX = widget.startFraction * width;
        final double endX = widget.endFraction * width;
        final double playX = widget.playheadFraction * width;
        return SizedBox(
          height: 72,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _WaveformPeaksPainter(
                    peaks: widget.peaks,
                    color: colors.textTertiaryMuted.withValues(alpha: 0.35),
                  ),
                ),
              ),
              Positioned(
                left: startX,
                right: width - endX,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CustomPaint(
                    painter: _WaveformPeaksPainter(
                      peaks: widget.peaks,
                      color: colors.textPrimary,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: playX - 1,
                top: 0,
                bottom: 0,
                child: Container(width: 2, color: colors.brandPrimary),
              ),
              Positioned(
                left: startX - _handleWidth / 2,
                top: 0,
                bottom: 0,
                child: _TrimHandle(
                  color: colors.brandPrimary,
                  onDrag: (double delta) {
                    final double next = ((startX + delta) / width).clamp(
                      0,
                      widget.endFraction - 0.05,
                    );
                    widget.onStartChanged(next);
                  },
                ),
              ),
              Positioned(
                left: endX - _handleWidth / 2,
                top: 0,
                bottom: 0,
                child: _TrimHandle(
                  color: colors.brandPrimary,
                  onDrag: (double delta) {
                    final double next = ((endX + delta) / width).clamp(
                      widget.startFraction + 0.05,
                      1,
                    );
                    widget.onEndChanged(next);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TrimHandle extends StatelessWidget {
  const _TrimHandle({required this.color, required this.onDrag});

  final Color color;
  final ValueChanged<double> onDrag;

  @override
  Widget build(BuildContext context) {
    return FluxerGestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        onDrag(details.delta.dx);
      },
      child: Container(
        width: _VoiceMessageTrimWaveformState._handleWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

class _WaveformPeaksPainter extends CustomPainter {
  const _WaveformPeaksPainter({required this.peaks, required this.color});

  final List<double> peaks;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (peaks.isEmpty) {
      return;
    }
    final Paint paint = Paint()..color = color;
    final double barWidth = size.width / peaks.length;
    for (int i = 0; i < peaks.length; i++) {
      final double height = (peaks[i].clamp(0, 1) * size.height * 0.85).clamp(
        3,
        size.height,
      );
      final double x = i * barWidth;
      final double y = (size.height - height) / 2;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x + 1, y, barWidth - 2, height),
          const Radius.circular(2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPeaksPainter oldDelegate) {
    return oldDelegate.peaks != peaks || oldDelegate.color != color;
  }
}
