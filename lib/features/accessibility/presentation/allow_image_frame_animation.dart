import 'package:flutter/widgets.dart';

class AllowImageFrameAnimation extends StatelessWidget {
  const AllowImageFrameAnimation({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!MediaQuery.disableAnimationsOf(context)) {
      return child;
    }
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(disableAnimations: false),
      child: child,
    );
  }
}
