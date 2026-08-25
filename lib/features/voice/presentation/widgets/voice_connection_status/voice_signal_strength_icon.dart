import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceSignalStrengthIcon extends StatelessWidget {
  const VoiceSignalStrengthIcon({
    required this.latencyMs,
    required this.tone,
    this.size = 16,
    super.key,
  });

  final int? latencyMs;
  final VoiceLatencySignalTone tone;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color arcColor = switch (tone) {
      VoiceLatencySignalTone.green => colors.statusOnline,
      VoiceLatencySignalTone.yellow => colors.statusIdle,
      VoiceLatencySignalTone.orange => colors.statusWarning,
      VoiceLatencySignalTone.red => colors.statusDanger,
      VoiceLatencySignalTone.loading => colors.textTertiary,
    };

    return SizedBox(
      width: 24,
      height: 24,
      child: CustomPaint(
        painter: _SignalStrengthPainter(
          tone: tone,
          arcColor: arcColor,
          dotColor: tone == VoiceLatencySignalTone.loading
              ? colors.textTertiary
              : arcColor,
          size: size,
        ),
      ),
    );
  }
}

class _SignalStrengthPainter extends CustomPainter {
  _SignalStrengthPainter({
    required this.tone,
    required this.arcColor,
    required this.dotColor,
    required this.size,
  });

  final VoiceLatencySignalTone tone;
  final Color arcColor;
  final Color dotColor;
  final double size;

  @override
  void paint(Canvas canvas, Size canvasSize) {
    const int arcCount = 4;
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final double viewSize = size;
    const double ox = 1;
    final double oy = viewSize - 1;
    final double maxR = viewSize - 1;
    final double step = maxR / arcCount;
    final int activeArcs = switch (tone) {
      VoiceLatencySignalTone.loading => 0,
      VoiceLatencySignalTone.green => 4,
      VoiceLatencySignalTone.yellow => 3,
      VoiceLatencySignalTone.orange => 2,
      VoiceLatencySignalTone.red => 1,
    };

    for (int i = 0; i < arcCount; i++) {
      final double r = step * (i + 1);
      paint.color = i < activeArcs ? arcColor : arcColor.withValues(alpha: 0.2);
      final Rect rect = Rect.fromCircle(center: Offset(ox, oy), radius: r);
      canvas.drawArc(rect, -3.14 / 2, 3.14 / 2, false, paint);
    }

    canvas.drawCircle(Offset(ox, oy), 1.5, Paint()..color = dotColor);
  }

  @override
  bool shouldRepaint(covariant _SignalStrengthPainter oldDelegate) {
    return oldDelegate.tone != tone ||
        oldDelegate.arcColor != arcColor ||
        oldDelegate.dotColor != dotColor;
  }
}
