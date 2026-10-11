import 'package:fluxer_app/material_ui.dart';

class GuildNavbarDmTransition extends StatefulWidget {
  const GuildNavbarDmTransition({
    required this.visible,
    required this.animateIn,
    required this.onExited,
    required this.child,
    super.key,
  });

  static const Duration enterDuration = Duration(milliseconds: 260);
  static const Duration exitDuration = Duration(milliseconds: 200);
  static const Curve enterCurve = Cubic(0.165, 0.84, 0.44, 1);
  static const Curve exitCurve = Cubic(0.645, 0.045, 0.355, 1);
  static const double slideDistance = 88;

  final bool visible;
  final bool animateIn;
  final VoidCallback onExited;
  final Widget child;

  @override
  State<GuildNavbarDmTransition> createState() =>
      _GuildNavbarDmTransitionState();
}

class _GuildNavbarDmTransitionState extends State<GuildNavbarDmTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: GuildNavbarDmTransition.enterDuration,
    reverseDuration: GuildNavbarDmTransition.exitDuration,
    value: widget.animateIn ? 0 : 1,
  );
  late final CurvedAnimation _curve = CurvedAnimation(
    parent: _controller,
    curve: GuildNavbarDmTransition.enterCurve,
    reverseCurve: GuildNavbarDmTransition.exitCurve,
  );

  @override
  void initState() {
    super.initState();
    if (widget.animateIn) {
      _controller.forward();
    }
    if (!widget.visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !widget.visible) {
          _exit();
        }
      });
    }
  }

  @override
  void didUpdateWidget(GuildNavbarDmTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible == oldWidget.visible) {
      return;
    }
    if (widget.visible) {
      _controller.forward();
    } else {
      _exit();
    }
  }

  void _exit() {
    _controller.reverse().whenCompleteOrCancel(() {
      if (mounted && !widget.visible && _controller.isDismissed) {
        widget.onExited();
      }
    });
  }

  @override
  void dispose() {
    _curve.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      child: widget.child,
      builder: (BuildContext context, Widget? child) => ClipRect(
        clipBehavior: _controller.isCompleted ? Clip.none : Clip.hardEdge,
        child: Align(
          alignment: Alignment.topLeft,
          heightFactor: _curve.value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(
              -GuildNavbarDmTransition.slideDistance * (1 - _curve.value),
              0,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
