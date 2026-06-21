import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class FluxerLoadingSpinner extends StatefulWidget {
  const FluxerLoadingSpinner({super.key, this.color, this.inverted = false});

  final Color? color;
  final bool inverted;

  @override
  State<FluxerLoadingSpinner> createState() => _FluxerLoadingSpinnerState();
}

class _FluxerLoadingSpinnerState extends State<FluxerLoadingSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const _kDotCount = 3;
  static const _kDotSize = 6.0;
  static const _kDotSpacing = 2.0;
  static const _kDuration = Duration(milliseconds: 1400);
  static const List<double> _kDelays = [0.0, 0.2 / 1.4, 0.4 / 1.4];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _kDuration);
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dotColor =
        widget.color ?? (widget.inverted ? Colors.black : Colors.white);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return Semantics(
      label: l10n.uiLoading,
      child: ExcludeSemantics(
        child: SizedBox(
          width: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(_kDotCount, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < _kDotCount - 1 ? _kDotSpacing : 0,
                ),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) {
                    final phase = (_controller.value - _kDelays[index]) % 1.0;
                    final wave = (math.cos(phase * 2 * math.pi) + 1) / 2;
                    final opacity = 0.3 + 0.7 * wave;
                    final scale = 0.8 + 0.2 * wave;

                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        width: _kDotSize,
                        height: _kDotSize,
                        decoration: BoxDecoration(
                          color: dotColor.withValues(
                            alpha: opacity * dotColor.a,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerPreview() {
  return const FluxerLoadingSpinner();
}

@FluxerWidgetPreview(name: 'Inverted', group: 'FluxerLoadingSpinner')
Widget fluxerLoadingSpinnerInvertedPreview() {
  return const ColoredBox(
    color: Color(0xFF5865F2),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FluxerLoadingSpinner(inverted: true),
    ),
  );
}
