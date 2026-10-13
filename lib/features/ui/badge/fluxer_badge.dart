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
  static const double radius = 6;
  static const double cutoutWidth = 3;
  static const List<BoxShadow> shadows = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
    ),
  ];

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
    final Widget pill = Container(
      height: height,
      constraints: const BoxConstraints(minWidth: height),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: context.colors.statusDanger,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: shadows,
      ),
      child: Center(
        widthFactor: 1,
        child: Text(
          text ?? formatBadgeCount(count ?? 0),
          maxLines: 1,
          softWrap: false,
          textScaler: TextScaler.noScaling,
          style: context.textStyles.smallText.copyWith(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            height: 1,
            leadingDistribution: TextLeadingDistribution.even,
          ),
        ),
      ),
    );
    final Color? cutout = cutoutColor;
    if (cutout == null) {
      return pill;
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: cutout,
          width: cutoutWidth,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: pill,
    );
  }
}

String formatBadgeCount(int count) => count > 99 ? '99+' : '$count';

class FluxerEntranceSettleScope extends StatefulWidget {
  const FluxerEntranceSettleScope({required this.child, super.key});

  final Widget child;

  static bool isSettling(BuildContext context) {
    final _FluxerEntranceSettleMarker? marker = context
        .getInheritedWidgetOfExactType<_FluxerEntranceSettleMarker>();
    return marker != null && !marker.state._settled;
  }

  @override
  State<FluxerEntranceSettleScope> createState() =>
      _FluxerEntranceSettleScopeState();
}

class _FluxerEntranceSettleScopeState extends State<FluxerEntranceSettleScope> {
  bool _settled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _settled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FluxerEntranceSettleMarker(state: this, child: widget.child);
  }
}

class _FluxerEntranceSettleMarker extends InheritedWidget {
  const _FluxerEntranceSettleMarker({
    required this.state,
    required super.child,
  });

  final _FluxerEntranceSettleScopeState state;

  @override
  bool updateShouldNotify(_FluxerEntranceSettleMarker oldWidget) => false;
}

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
    if (context.motion.panel == Duration.zero ||
        FluxerEntranceSettleScope.isSettling(context)) {
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
