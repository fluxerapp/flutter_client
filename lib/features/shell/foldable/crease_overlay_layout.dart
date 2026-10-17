import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

const double _creaseMargin = 8;

class CreaseAwareAlign extends StatelessWidget {
  const CreaseAwareAlign({
    required this.child,
    this.alignment = Alignment.center,
    this.anchor,
    super.key,
  });

  final Widget child;
  final Alignment alignment;
  final Rect? anchor;

  @override
  Widget build(BuildContext context) {
    final DeviceFoldPosture posture = deviceFoldPostureOf(context);
    if (!posture.avoidsFloatingSurfaces) {
      return Align(alignment: alignment, child: child);
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size window = Size(constraints.maxWidth, constraints.maxHeight);
        final Offset shift = shiftOffHingeForAlignment(
          window: window,
          hinge: posture.hingeBounds!,
          alignment: alignment,
          anchor: anchor,
        );
        return Transform.translate(
          offset: shift,
          child: Align(alignment: alignment, child: child),
        );
      },
    );
  }
}

Offset shiftOffHingeForPoint({
  required Size window,
  required Rect hinge,
  required Offset point,
  Size childSize = const Size(240, 320),
}) {
  final Rect surface = Rect.fromCenter(
    center: point,
    width: childSize.width,
    height: childSize.height,
  );
  if (!surface.overlaps(hinge.inflate(_creaseMargin))) {
    return Offset.zero;
  }
  final bool verticalHinge = hinge.width <= hinge.height;
  if (verticalHinge) {
    if (point.dx < hinge.center.dx) {
      return Offset(hinge.left - _creaseMargin - surface.right, 0);
    }
    return Offset(hinge.right + _creaseMargin - surface.left, 0);
  }
  if (point.dy < hinge.center.dy) {
    return Offset(0, hinge.top - _creaseMargin - surface.bottom);
  }
  return Offset(0, hinge.bottom + _creaseMargin - surface.top);
}

Offset shiftOffHingeForAlignment({
  required Size window,
  required Rect hinge,
  required Alignment alignment,
  Rect? anchor,
}) {
  final Offset base = alignment.alongSize(window);
  const Size childGuess = Size(400, 200);
  Rect surface = Rect.fromCenter(
    center: base,
    width: childGuess.width,
    height: childGuess.height,
  );
  if (anchor != null) {
    surface = surface.shift(anchor.center - base);
  }
  if (!surface.overlaps(hinge.inflate(_creaseMargin))) {
    return Offset.zero;
  }
  final bool verticalHinge = hinge.width <= hinge.height;
  if (verticalHinge) {
    if (surface.center.dx < hinge.center.dx) {
      final double right = hinge.left - _creaseMargin;
      return Offset(right - surface.right, 0);
    }
    final double left = hinge.right + _creaseMargin;
    return Offset(left - surface.left, 0);
  }
  if (surface.center.dy < hinge.center.dy) {
    final double bottom = hinge.top - _creaseMargin;
    return Offset(0, bottom - surface.bottom);
  }
  final double top = hinge.bottom + _creaseMargin;
  return Offset(0, top - surface.top);
}

double pinnedSidebarWidthForPosture({
  required Size window,
  required FluxerLayoutTheme layout,
  required DeviceFoldPosture posture,
}) {
  final double guild = layout.guildListWidth;
  final double base = pinnedLeftPanelWidth(window, layout);
  final Rect? hinge = posture.hingeBounds;
  if (!posture.splitSidebarAtHinge ||
      posture.kind != FoldPostureKind.book ||
      hinge == null ||
      hinge.isEmpty) {
    return base;
  }
  final double gutterCenter = hinge.center.dx;
  final double minSidebar = guild + Breakpoints.pinnedChannelSidebarMinWidth;
  final double maxSidebar =
      window.width - Breakpoints.pinnedChatPaneMinWidth - 1;
  return gutterCenter.clamp(minSidebar, maxSidebar);
}
