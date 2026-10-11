import 'package:flutter/physics.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerBadge extends StatelessWidget {
  const FluxerBadge.count({required this.count, this.cutoutColor, super.key})
    : text = null,
      size = height,
      isDot = false;

  const FluxerBadge.dot({this.size = 8, super.key})
    : count = null,
      text = null,
      cutoutColor = null,
      isDot = true;

  const FluxerBadge.label({required this.text, this.cutoutColor, super.key})
    : count = null,
      size = height,
      isDot = false;

  static const double height = 20;
  static const double cutoutWidth = 3;

  final int? count;
  final String? text;
  final double size;
  final bool isDot;

  final Color? cutoutColor;

  @override
  Widget build(BuildContext context) {
    if (isDot) {
      return _buildDot(context);
    }
    return _buildPill(context);
  }

  Widget _buildDot(BuildContext context) => ExcludeSemantics(
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.textPrimary,
        shape: BoxShape.circle,
      ),
      child: SizedBox(width: size, height: size),
    ),
  );

  Widget _buildPill(BuildContext context) {
    final Color? cutout = cutoutColor;
    return Container(
      height: height,
      constraints: const BoxConstraints(minWidth: height),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.statusDanger,
        borderRadius: BorderRadius.circular(height / 2),
        border: cutout == null
            ? null
            : Border.all(
                color: cutout,
                width: cutoutWidth,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
      ),
      child: Text(
        text ?? formatBadgeCount(count ?? 0),
        maxLines: 1,
        softWrap: false,
        textScaler: TextScaler.noScaling,
        style: context.textStyles.smallText.copyWith(
          color: context.colors.textOnBrandPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    );
  }
}

String formatBadgeCount(int count) => count > 99 ? '99+' : '$count';

class FluxerBadgeEntrance extends StatefulWidget {
  const FluxerBadgeEntrance({required this.child, super.key});

  static const SpringDescription spring = SpringDescription(
    mass: 1,
    stiffness: 500,
    damping: 22,
  );
  static const double initialScale = 0.85;

  final Widget child;

  @override
  State<FluxerBadgeEntrance> createState() => _FluxerBadgeEntranceState();
}

class _FluxerBadgeEntranceState extends State<FluxerBadgeEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController.unbounded(
    vsync: this,
  );
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) {
      return;
    }
    _started = true;
    if (context.motion.panel == Duration.zero) {
      _controller.value = 1;
      return;
    }
    _controller
        .animateWith(SpringSimulation(FluxerBadgeEntrance.spring, 0, 1, 0))
        .whenCompleteOrCancel(() {
          if (mounted) {
            _controller.value = 1;
          }
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        final double t = _controller.value;
        return Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.scale(
            scale:
                FluxerBadgeEntrance.initialScale +
                (1 - FluxerBadgeEntrance.initialScale) * t,
            child: child,
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Dot', group: 'FluxerBadge')
Widget fluxerBadgeDotPreview() {
  return const FluxerBadge.dot();
}

@FluxerWidgetPreview(name: 'Count', group: 'FluxerBadge')
Widget fluxerBadgeCountPreview() {
  return const FluxerBadge.count(count: 12);
}

@FluxerWidgetPreview(name: 'Label', group: 'FluxerBadge')
Widget fluxerBadgeLabelPreview() {
  return const FluxerBadge.label(text: 'NEW');
}
