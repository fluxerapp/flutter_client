import 'package:flutter/widgets.dart';

class AllowImageFrameAnimation extends StatelessWidget {
  const AllowImageFrameAnimation({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    if (!data.disableAnimations) {
      return child;
    }
    return MediaQuery(
      data: data.copyWith(disableAnimations: false),
      child: child,
    );
  }
}
