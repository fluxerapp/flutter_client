import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluxer_app/shared/gestures/defer_horizontal_drag_while_coasting.dart';

const Key kExpressionPanelShellGestureBlockKey = Key('chat-expression-sheet');
const Key kPlaybackSeekShellGestureBlockKey = Key('playback-seek');

/// True when [globalPosition] is over a horizontal [Scrollable] under
/// [searchRoot] that has room to scroll.
bool isPointerOverOverflowingHorizontalScrollable(
  BuildContext searchRoot,
  Offset globalPosition, {
  required int viewId,
}) {
  return _isPointerOverRegion(
    searchRoot,
    _hitRenderObjectsAndAncestors(globalPosition, viewId),
    _overflowingHorizontalScrollableRender,
  );
}

/// True when [globalPosition] is over a region under [searchRoot] that the
/// shell drawer must not claim horizontal drags from: a coasting message
/// list, an overflowing horizontal [Scrollable], the expression sheet, or an
/// active playback seek bar.
bool isPointerOverShellHorizontalGestureBlock(
  BuildContext searchRoot,
  Offset globalPosition, {
  required int viewId,
}) {
  return _isPointerOverRegion(
    searchRoot,
    _hitRenderObjectsAndAncestors(globalPosition, viewId),
    (Element element) {
      final Widget widget = element.widget;
      if (widget is DeferHorizontalDragWhileCoasting) {
        return widget.defer ? element.findRenderObject() : null;
      }
      if (widget.key == kExpressionPanelShellGestureBlockKey ||
          widget.key == kPlaybackSeekShellGestureBlockKey) {
        return element.findRenderObject();
      }
      return _overflowingHorizontalScrollableRender(element);
    },
  );
}

Set<RenderObject> _hitRenderObjectsAndAncestors(
  Offset globalPosition,
  int viewId,
) {
  final HitTestResult result = HitTestResult();
  WidgetsBinding.instance.hitTestInView(result, globalPosition, viewId);
  final Set<RenderObject> hit = <RenderObject>{};
  for (final HitTestEntry entry in result.path) {
    RenderObject? current = switch (entry.target) {
      final RenderObject target => target,
      _ => null,
    };
    while (current != null && hit.add(current)) {
      current = current.parent;
    }
  }
  return hit;
}

bool _isPointerOverRegion(
  BuildContext searchRoot,
  Set<RenderObject> hit,
  RenderObject? Function(Element element) regionRender,
) {
  bool found = false;
  void visit(Element element) {
    if (found) {
      return;
    }
    final RenderObject? region = regionRender(element);
    if (region != null && hit.contains(region)) {
      found = true;
      return;
    }
    element.visitChildren(visit);
  }

  visit(searchRoot as Element);
  return found;
}

RenderObject? _overflowingHorizontalScrollableRender(Element element) {
  if (element case StatefulElement(state: final ScrollableState state)
      when state.widget.axis == Axis.horizontal &&
          state.position.maxScrollExtent > 0) {
    return element.findRenderObject();
  }
  return null;
}
