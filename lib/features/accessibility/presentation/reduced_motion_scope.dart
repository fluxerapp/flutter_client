import 'package:flutter/widgets.dart';

const ScrollPhysics kReducedMotionScrollPhysics = ClampingScrollPhysics(
  parent: RangeMaintainingScrollPhysics(),
);

class ReducedMotionScope extends StatelessWidget {
  const ReducedMotionScope({
    required this.enabled,
    required this.child,
    super.key,
  });

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(disableAnimations: true),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(
          context,
        ).copyWith(physics: kReducedMotionScrollPhysics, overscroll: false),
        child: child,
      ),
    );
  }
}
