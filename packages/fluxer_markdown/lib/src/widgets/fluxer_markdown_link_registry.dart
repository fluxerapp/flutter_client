import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Tap recognizer that carries the link href so hit tests can resolve it.
class FluxerMarkdownLinkRecognizer extends TapGestureRecognizer {
  FluxerMarkdownLinkRecognizer({required this.href});

  final String href;
}

class FluxerMarkdownLinkRegistry extends InheritedWidget {
  const FluxerMarkdownLinkRegistry({
    required this.obtainRecognizer,
    required super.child,
    super.key,
  });

  final FluxerMarkdownLinkRecognizer Function(String href, VoidCallback onTap)
  obtainRecognizer;

  static FluxerMarkdownLinkRegistry? maybeOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<FluxerMarkdownLinkRegistry>();
  }

  @override
  bool updateShouldNotify(covariant FluxerMarkdownLinkRegistry oldWidget) {
    return false;
  }
}

/// Returns the markdown link href at [globalPosition] in [root], or null.
String? fluxerMarkdownLinkHrefAt(RenderBox root, Offset globalPosition) {
  final BoxHitTestResult result = BoxHitTestResult();
  root.hitTest(result, position: root.globalToLocal(globalPosition));
  for (final HitTestEntry<HitTestTarget> entry in result.path) {
    final HitTestTarget target = entry.target;
    if (target is TextSpan) {
      final GestureRecognizer? recognizer = target.recognizer;
      if (recognizer is FluxerMarkdownLinkRecognizer) {
        return recognizer.href;
      }
    }
  }
  return null;
}
