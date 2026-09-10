import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Last-built flag: while a parent vertical list is coasting, competing
/// horizontal drags should drop out on pointer down so a catch-fling can
/// take over.
class DeferHorizontalDragWhileCoasting extends InheritedWidget {
  const DeferHorizontalDragWhileCoasting({
    required this.defer,
    required super.child,
    super.key,
  });

  final bool defer;

  static bool of(BuildContext context) {
    final DeferHorizontalDragWhileCoasting? scope = context
        .getInheritedWidgetOfExactType<DeferHorizontalDragWhileCoasting>();
    return scope?.defer ?? false;
  }

  @override
  bool updateShouldNotify(DeferHorizontalDragWhileCoasting oldWidget) {
    return defer != oldWidget.defer;
  }
}

/// True when [globalPosition] is over a descendant that is currently
/// asking horizontal competitors to defer (message list ballistic coast).
bool isPointerOverHorizontalDragCoastDefer(
  BuildContext searchRoot,
  Offset globalPosition, {
  required int viewId,
}) {
  final Element rootElement = searchRoot as Element;
  Element? marked;
  void find(Element element) {
    if (marked != null) {
      return;
    }
    final Widget widget = element.widget;
    if (widget is DeferHorizontalDragWhileCoasting && widget.defer) {
      marked = element;
      return;
    }
    element.visitChildren(find);
  }

  find(rootElement);
  final Element? resolved = marked;
  if (resolved == null) {
    return false;
  }
  final RenderObject? markedRender = resolved.findRenderObject();
  if (markedRender == null) {
    return false;
  }
  final HitTestResult result = HitTestResult();
  WidgetsBinding.instance.hitTestInView(result, globalPosition, viewId);
  for (final HitTestEntry entry in result.path) {
    if (entry.target is! RenderObject) {
      continue;
    }
    if (_isRenderDescendantOf(entry.target as RenderObject, markedRender)) {
      return true;
    }
  }
  return false;
}

bool _isRenderDescendantOf(RenderObject descendant, RenderObject ancestor) {
  RenderObject? current = descendant;
  while (current != null) {
    if (current == ancestor) {
      return true;
    }
    current = current.parent;
  }
  return false;
}
