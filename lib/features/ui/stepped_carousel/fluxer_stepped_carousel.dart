import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSteppedCarousel<T> extends StatefulWidget {
  const FluxerSteppedCarousel({
    required this.step,
    required this.steps,
    required this.child,
    super.key,
  });

  final T step;
  final List<T> steps;
  final Widget child;

  @override
  State<FluxerSteppedCarousel<T>> createState() =>
      _FluxerSteppedCarouselState<T>();
}

class _FluxerSteppedCarouselState<T> extends State<FluxerSteppedCarousel<T>> {
  int _direction = 0;

  @override
  void didUpdateWidget(covariant FluxerSteppedCarousel<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.step == widget.step) {
      return;
    }
    final int oldIndex = widget.steps.indexOf(oldWidget.step);
    final int newIndex = widget.steps.indexOf(widget.step);
    if (oldIndex == -1 || newIndex == -1) {
      _direction = 0;
      return;
    }
    _direction = newIndex.compareTo(oldIndex);
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final motion = context.motion;

    return ClipRect(
      child: AnimatedSize(
        duration: reduceMotion ? Duration.zero : motion.panel,
        curve: motion.curve,
        alignment: Alignment.topCenter,
        child: AnimatedSwitcher(
          duration: reduceMotion ? Duration.zero : const Duration(milliseconds: 280),
          reverseDuration: reduceMotion
              ? Duration.zero
              : const Duration(milliseconds: 100),
          switchInCurve: motion.curve,
          switchOutCurve: Curves.easeIn,
          layoutBuilder:
              (Widget? currentChild, List<Widget> previousChildren) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    ...previousChildren,
                    ?currentChild,
                  ],
                );
              },
          transitionBuilder: (Widget child, Animation<double> animation) {
            return _SteppedCarouselTransition(
              animation: animation,
              direction: _direction,
              reduceMotion: reduceMotion,
              child: child,
            );
          },
          child: KeyedSubtree(
            key: ValueKey<T>(widget.step),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _SteppedCarouselTransition extends StatelessWidget {
  const _SteppedCarouselTransition({
    required this.animation,
    required this.direction,
    required this.reduceMotion,
    required this.child,
  });

  final Animation<double> animation;
  final int direction;
  final bool reduceMotion;
  final Widget child;

  static const double _slideDistance = 24;

  @override
  Widget build(BuildContext context) {
    if (reduceMotion) {
      return FadeTransition(opacity: animation, child: child);
    }

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (BuildContext context, Widget? child) {
        final bool isEntering = animation.status != AnimationStatus.reverse;
        final double slideDirection =
            (isEntering ? direction.sign : -direction.sign).toDouble();
        final double offset =
            (1 - animation.value) * _slideDistance * slideDirection;

        return Opacity(
          opacity: animation.value.clamp(0, 1),
          child: Transform.translate(
            offset: Offset(offset, 0),
            child: child,
          ),
        );
      },
    );
  }
}
