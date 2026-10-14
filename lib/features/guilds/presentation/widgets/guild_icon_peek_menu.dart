import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kGuildPeekHoldDelay = Duration(milliseconds: 400);
const double kGuildPeekHoldCancelThreshold = 4;

enum PeekSelection { dismiss, keepOpen }

abstract class SidebarPeekContent {
  Widget buildPanel({
    required BuildContext context,
    required ValueChanged<Object> onSelect,
  });

  Object? hitTestAction(Offset globalPosition);

  Future<PeekSelection> handleSelection(BuildContext context, Object action);
}

bool shouldCancelGuildPeekHold({
  required Offset? pointerDownPosition,
  required Offset currentPosition,
  double threshold = kGuildPeekHoldCancelThreshold,
}) {
  if (pointerDownPosition == null) {
    return false;
  }
  return (currentPosition.dy - pointerDownPosition.dy).abs() >= threshold;
}

bool shouldSuppressPeekForDrag({
  required Offset? pointerDownPosition,
  required Offset currentPosition,
  double threshold = kGuildDragCollapseThreshold,
}) {
  return shouldCancelGuildPeekHold(
    pointerDownPosition: pointerDownPosition,
    currentPosition: currentPosition,
    threshold: threshold,
  );
}

T? hitTestKeyedPeekTarget<T extends Object>({
  required Offset globalPosition,
  required Map<T, GlobalKey> itemKeys,
  required Iterable<T> visibleKeys,
}) {
  for (final T key in visibleKeys) {
    final BuildContext? itemContext = itemKeys[key]?.currentContext;
    if (itemContext == null) {
      continue;
    }
    final RenderBox? box = itemContext.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) {
      continue;
    }
    final Offset topLeft = box.localToGlobal(Offset.zero);
    final Rect rect = topLeft & box.size;
    if (rect.contains(globalPosition)) {
      return key;
    }
  }
  return null;
}
