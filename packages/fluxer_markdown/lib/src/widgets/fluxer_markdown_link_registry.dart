import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class FluxerMarkdownLinkRegistry extends InheritedWidget {
  const FluxerMarkdownLinkRegistry({
    required this.obtainRecognizer,
    required super.child,
    super.key,
  });

  final TapGestureRecognizer Function(VoidCallback onTap) obtainRecognizer;

  static FluxerMarkdownLinkRegistry? maybeOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<FluxerMarkdownLinkRegistry>();
  }

  @override
  bool updateShouldNotify(covariant FluxerMarkdownLinkRegistry oldWidget) {
    return false;
  }
}
