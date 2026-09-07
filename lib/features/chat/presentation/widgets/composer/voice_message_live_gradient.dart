import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const Color kVoiceMessageGradientBase = Color(0xFF0B0C10);

double voiceMessageGradientVoiceLevel(double rmsLevel) {
  final double shaped = math.min(1, math.sqrt(rmsLevel.clamp(0.0, 1.0)) * 1.45);
  return math.max(kVoiceMessageGradientIdleLevel, shaped);
}

double voiceMessageGradientGlowHeight({
  required double level,
  required double maxHeight,
}) {
  return maxHeight * level.clamp(0.0, 1.0);
}

double voiceMessageGradientWaveUnit({
  required double x,
  required double width,
  required double time,
  required double frequency,
  required double phase,
}) {
  if (width <= 0) {
    return 0;
  }
  final double nx = (x / width) * math.pi * 2;
  final double mix =
      0.58 * math.sin(nx * frequency + phase + time) +
      0.27 * math.sin(nx * (frequency + 1.8) + phase * 1.4 + time * 1.55) +
      0.15 * math.sin(nx * (frequency + 3.4) + phase * 0.7 + time * 1.1);
  return ((mix * 1.45 + 1) / 2).clamp(0.0, 1.0);
}

class VoiceMessageLiveGradient extends StatefulWidget {
  const VoiceMessageLiveGradient({
    required this.rmsLevel,
    this.borderRadius = kVoiceMessageRecordingBarRadiusPx,
    super.key,
  });

  final ValueListenable<double> rmsLevel;
  final double borderRadius;

  @override
  State<VoiceMessageLiveGradient> createState() =>
      _VoiceMessageLiveGradientState();
}

class _VoiceMessageLiveGradientState extends State<VoiceMessageLiveGradient>
    with SingleTickerProviderStateMixin {
  static const Duration _driftDuration = Duration(seconds: 8);

  late final AnimationController _drift;
  double _shownLevel = kVoiceMessageGradientIdleLevel;

  @override
  void initState() {
    super.initState();
    _drift = AnimationController(vsync: this, duration: _driftDuration)
      ..addListener(_smoothLevel);
    widget.rmsLevel.addListener(_smoothLevel);
  }

  @override
  void didUpdateWidget(covariant VoiceMessageLiveGradient oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rmsLevel != widget.rmsLevel) {
      oldWidget.rmsLevel.removeListener(_smoothLevel);
      widget.rmsLevel.addListener(_smoothLevel);
    }
  }

  @override
  void dispose() {
    widget.rmsLevel.removeListener(_smoothLevel);
    _drift.dispose();
    super.dispose();
  }

  void _smoothLevel() {
    final bool reduceMotion =
        !mounted || MediaQuery.disableAnimationsOf(context);
    final double target = voiceMessageGradientVoiceLevel(widget.rmsLevel.value);
    if (reduceMotion) {
      _shownLevel = target;
      return;
    }
    _shownLevel += (target - _shownLevel) * 0.28;
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final bool tickerEnabled = TickerMode.valuesOf(context).enabled;
    _drift.syncWithVisibility(
      isVisible: tickerEnabled,
      animationsEnabled: !reduceMotion,
    );
    final FluxerColorTheme colors = context.colors;
    return RepaintBoundary(
      child: CustomPaint(
        painter: _VoiceMessageLiveGradientPainter(
          drift: _drift,
          rmsLevel: widget.rmsLevel,
          shownLevel: () => _shownLevel,
          colors: <Color>[
            colors.brandPrimary,
            colors.brandSecondary,
            colors.brandPrimaryLight,
          ],
          reduceMotion: reduceMotion,
          borderRadius: widget.borderRadius,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _VoiceMessageLiveGradientPainter extends CustomPainter {
  _VoiceMessageLiveGradientPainter({
    required this.drift,
    required this.rmsLevel,
    required this.shownLevel,
    required this.colors,
    required this.reduceMotion,
    required this.borderRadius,
  }) : super(
         repaint: reduceMotion
             ? rmsLevel
             : Listenable.merge(<Listenable>[drift, rmsLevel]),
       );

  final Animation<double> drift;
  final ValueListenable<double> rmsLevel;
  final double Function() shownLevel;
  final List<Color> colors;
  final bool reduceMotion;
  final double borderRadius;

  static const int _waveSteps = 48;
  static const double _blurSigmaX = 20;
  static const double _blurSigmaY = 8;
  static const List<double> _frequencies = <double>[2.8, 3.6, 4.4];
  static const List<double> _phases = <double>[0.2, 2.1, 4];
  static const List<double> _heightScales = <double>[1.12, 1.02, 0.92];
  static const List<double> _blobCenters = <double>[0.12, 0.34, 0.58, 0.82];

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }
    final RRect clip = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );
    canvas
      ..clipRRect(clip)
      ..drawRect(
        Offset.zero & size,
        Paint()..color = kVoiceMessageGradientBase,
      );

    final double level = shownLevel();
    if (level <= 0) {
      return;
    }
    final double t = reduceMotion ? 0 : drift.value * math.pi * 2;
    if (reduceMotion) {
      _paintWaves(canvas, size, t: t, level: level);
      return;
    }
    canvas.saveLayer(
      Offset.zero & size,
      Paint()
        ..imageFilter = ui.ImageFilter.blur(
          sigmaX: _blurSigmaX,
          sigmaY: _blurSigmaY,
          tileMode: TileMode.decal,
        ),
    );
    _paintWaves(canvas, size, t: t, level: level);
    canvas.restore();
  }

  void _paintWaves(
    Canvas canvas,
    Size size, {
    required double t,
    required double level,
  }) {
    final double glowHeight = voiceMessageGradientGlowHeight(
      level: level,
      maxHeight: size.height,
    );
    if (glowHeight < 1) {
      return;
    }
    final int layerCount = math.min(3, colors.length);
    for (int i = 0; i < _blobCenters.length; i++) {
      final Color color = colors[i % layerCount];
      final double cx =
          size.width * (_blobCenters[i] + 0.05 * math.sin(t * 0.8 + i * 1.1));
      final double rx = size.width * 0.2;
      final double ry = glowHeight * (1.05 + 0.18 * (i % 3));
      final Offset center = Offset(cx, size.height - glowHeight * 0.08);
      canvas.drawOval(
        Rect.fromCenter(center: center, width: rx * 2, height: ry * 2),
        Paint()
          ..blendMode = i == 0 ? BlendMode.srcOver : BlendMode.plus
          ..shader = ui.Gradient.radial(center, math.max(rx, ry), <Color>[
            color.withValues(alpha: i == 0 ? 0.95 : 0.65),
            color.withValues(alpha: 0),
          ]),
      );
    }
    for (int i = 0; i < layerCount; i++) {
      final Color color = colors[i];
      final double layerHeight = glowHeight * _heightScales[i];
      final Path wave = Path()..moveTo(0, size.height);
      for (int step = 0; step <= _waveSteps; step++) {
        final double x = size.width * step / _waveSteps;
        final double unit = voiceMessageGradientWaveUnit(
          x: x,
          width: size.width,
          time: t * (0.85 + 0.15 * i),
          frequency: _frequencies[i],
          phase: _phases[i],
        );
        wave.lineTo(x, size.height - layerHeight * unit);
      }
      wave
        ..lineTo(size.width, size.height)
        ..close();
      canvas.drawPath(
        wave,
        Paint()
          ..blendMode = i == 0 ? BlendMode.srcOver : BlendMode.plus
          ..shader = ui.Gradient.linear(
            Offset(0, size.height),
            Offset(0, size.height - layerHeight),
            <Color>[
              color.withValues(alpha: i == 0 ? 0.9 : 0.55),
              color.withValues(alpha: i == 0 ? 0.45 : 0.28),
              color.withValues(alpha: 0),
            ],
            const <double>[0, 0.55, 1],
          ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _VoiceMessageLiveGradientPainter oldDelegate) {
    return oldDelegate.drift != drift ||
        oldDelegate.rmsLevel != rmsLevel ||
        oldDelegate.shownLevel != shownLevel ||
        oldDelegate.reduceMotion != reduceMotion ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.colors != colors;
  }
}
