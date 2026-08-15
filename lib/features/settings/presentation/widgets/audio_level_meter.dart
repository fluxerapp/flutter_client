import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:material_ui/material_ui.dart';

const int _barCount = 20;
const double _barGap = 1.28;

class AudioLevelMeter extends StatelessWidget {
  const AudioLevelMeter({
    required this.level,
    required this.inactiveColor,
    required this.inactiveBorderColor,
    super.key,
  });

  final double level;
  final Color inactiveColor;
  final Color inactiveBorderColor;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return RepaintBoundary(
      child: SizedBox(
        height: layout.s10,
        width: double.infinity,
        child: CustomPaint(
          painter: _AudioLevelMeterPainter(
            level: level.clamp(0, 1),
            inactiveColor: inactiveColor,
            inactiveBorderColor: inactiveBorderColor,
          ),
        ),
      ),
    );
  }
}

class _AudioLevelMeterPainter extends CustomPainter {
  _AudioLevelMeterPainter({
    required this.level,
    required this.inactiveColor,
    required this.inactiveBorderColor,
  });

  final double level;
  final Color inactiveColor;
  final Color inactiveBorderColor;

  static final List<_BarGradient> _barGradients = List<_BarGradient>.generate(
    _barCount,
    _barGradientForIndex,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final double barWidth =
        (size.width - _barGap * (_barCount - 1)) / _barCount;

    for (int index = 0; index < _barCount; index++) {
      final double normalized = (index + 1) / _barCount;
      final bool active = level >= normalized;
      final double heightFactor = ((28 + normalized * 72).clamp(22, 100)) / 100;
      final double barHeight = size.height * heightFactor;
      final double left = index * (barWidth + _barGap);
      final Rect rect = Rect.fromLTWH(
        left,
        size.height - barHeight,
        barWidth,
        barHeight,
      );
      final Path path = _trapezoidPath(rect);

      if (active) {
        final _BarGradient gradient = _barGradients[index];
        final Paint fillPaint = Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[gradient.top, gradient.bottom],
          ).createShader(rect);
        canvas.drawPath(path, fillPaint);

        final Paint borderPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = gradient.top.withValues(alpha: 0.5);
        canvas.drawPath(path, borderPaint);
      } else {
        canvas.drawPath(path, Paint()..color = inactiveColor);

        final Paint borderPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = inactiveBorderColor;
        canvas.drawPath(path, borderPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _AudioLevelMeterPainter oldDelegate) {
    return oldDelegate.level != level ||
        oldDelegate.inactiveColor != inactiveColor ||
        oldDelegate.inactiveBorderColor != inactiveBorderColor;
  }
}

class _BarGradient {
  const _BarGradient({required this.top, required this.bottom});

  final Color top;
  final Color bottom;
}

_BarGradient _barGradientForIndex(int index) {
  final double positionBias = index / (_barCount - 1);
  final double hue = 124 - positionBias * 124;
  final double topLightness = 62 - positionBias * 8;
  final double bottomLightness = 42 - positionBias * 10;
  return _BarGradient(
    top: HSLColor.fromAHSL(1, hue, 0.94, topLightness / 100).toColor(),
    bottom: HSLColor.fromAHSL(
      1,
      (hue - 8).clamp(0, 360),
      0.90,
      bottomLightness / 100,
    ).toColor(),
  );
}

Path _trapezoidPath(Rect rect) {
  return Path()
    ..moveTo(rect.left + rect.width * 0.2, rect.top)
    ..lineTo(rect.right, rect.top)
    ..lineTo(rect.left + rect.width * 0.8, rect.bottom)
    ..lineTo(rect.left, rect.bottom)
    ..close();
}

@FluxerWidgetPreview(name: 'Idle', group: 'AudioLevelMeter')
Widget audioLevelMeterIdlePreview() {
  return const _AudioLevelMeterPreview(level: 0);
}

@FluxerWidgetPreview(name: 'Active', group: 'AudioLevelMeter')
Widget audioLevelMeterActivePreview() {
  return const _AudioLevelMeterPreview(level: 0.65);
}

class _AudioLevelMeterPreview extends StatelessWidget {
  const _AudioLevelMeterPreview({required this.level});

  final double level;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    return AudioLevelMeter(
      level: level,
      inactiveColor: colors.backgroundModifierAccent,
      inactiveBorderColor: colors.textPrimary.withValues(alpha: 0.1),
    );
  }
}
