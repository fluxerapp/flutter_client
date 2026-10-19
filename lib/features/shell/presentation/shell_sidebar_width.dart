import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/features/shell/foldable/crease_overlay_layout.dart';
import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

const double kShellSidebarWidthMin = 200;
const double kShellSidebarWidthMax = 480;

const String kShellSidebarWidthStorageKeyPrefix = 'fluxer:ui:sidebar-width';

String shellSidebarWidthStorageKey(String userId) =>
    '$kShellSidebarWidthStorageKeyPrefix:$userId';

double clampShellSidebarWidth(double value) {
  return value
      .clamp(kShellSidebarWidthMin, kShellSidebarWidthMax)
      .roundToDouble();
}

double? parseStoredShellSidebarWidth(String? raw) {
  if (raw == null || raw.isEmpty) {
    return null;
  }
  final double? parsed = double.tryParse(raw);
  if (parsed == null || !parsed.isFinite) {
    return null;
  }
  return clampShellSidebarWidth(parsed);
}

bool shellSidebarResizeEnabled(BuildContext context) {
  return shellShowsConcurrentChannelList(context);
}

double shellSidebarWidthViewportMax({
  required Size windowSize,
  required FluxerLayoutTheme layout,
}) {
  return windowSize.width -
      layout.guildListWidth -
      Breakpoints.pinnedChatPaneMinWidth -
      1;
}

double resolveShellSidebarWidthForPreference({
  required Size windowSize,
  required FluxerLayoutTheme layout,
  required bool resizeEnabled,
  double? userPreference,
}) {
  if (!resizeEnabled) {
    return layout.sidebarWidth;
  }
  final double requested = userPreference ?? layout.sidebarWidth;
  final double viewportMax = shellSidebarWidthViewportMax(
    windowSize: windowSize,
    layout: layout,
  );
  final double maxAllowed = viewportMax < kShellSidebarWidthMin
      ? kShellSidebarWidthMin
      : viewportMax.clamp(kShellSidebarWidthMin, kShellSidebarWidthMax);
  return requested.clamp(kShellSidebarWidthMin, maxAllowed).roundToDouble();
}

double resolveShellSidebarWidth({
  required BuildContext context,
  required Size windowSize,
  required FluxerLayoutTheme layout,
  double? userPreference,
}) {
  return resolveShellSidebarWidthForPreference(
    windowSize: windowSize,
    layout: layout,
    userPreference: userPreference,
    resizeEnabled: shellSidebarResizeEnabled(context),
  );
}

double pinnedChannelSidebarWidthForSize(
  Size size,
  FluxerLayoutTheme layout, {
  double? userPreference,
}) {
  final double preferred = userPreference ?? layout.sidebarWidth;
  final double guild = layout.guildListWidth;
  final double maxSidebar =
      size.width - guild - Breakpoints.pinnedChatPaneMinWidth - 1;
  final double minSidebar = math.max(
    kShellSidebarWidthMin,
    Breakpoints.pinnedChannelSidebarMinWidth,
  );
  return preferred.clamp(minSidebar, maxSidebar).roundToDouble();
}

bool shellSidebarResizeEnabledForSize(Size size) {
  if (layoutReferenceExtentOf(size) < Breakpoints.mobile) {
    return false;
  }
  if (layoutModeOfSize(size) != LayoutMode.mobile) {
    return true;
  }
  return isPinnedSidebarLayoutSize(size);
}

double pinnedLeftPanelWidth(
  Size size,
  FluxerLayoutTheme layout, {
  double? userPreference,
}) {
  final double guild = layout.guildListWidth;
  final double sidebar = resolveShellSidebarWidthForPreference(
    windowSize: size,
    layout: layout,
    userPreference: userPreference,
    resizeEnabled: shellSidebarResizeEnabledForSize(size),
  );
  final double fullPanel = guild + sidebar;
  if (size.width >= fullPanel + 1 + Breakpoints.pinnedChatPaneMinWidth) {
    return fullPanel;
  }
  return guild +
      pinnedChannelSidebarWidthForSize(
        size,
        layout,
        userPreference: userPreference,
      );
}

double resolveShellLeftPanelWidth({
  required BuildContext context,
  required Size windowSize,
  required FluxerLayoutTheme layout,
  double? userPreference,
}) {
  if (isPinnedSidebarSplitAtHinge(context)) {
    return pinnedSidebarWidthForPosture(
      window: windowSize,
      layout: layout,
      posture: deviceFoldPostureOf(context),
      userPreference: userPreference,
    );
  }
  if (isMobileLayout(context) && isPinnedSidebarLayout(context)) {
    return pinnedLeftPanelWidth(
      windowSize,
      layout,
      userPreference: userPreference,
    );
  }
  final double sidebar = resolveShellSidebarWidth(
    context: context,
    windowSize: windowSize,
    layout: layout,
    userPreference: userPreference,
  );
  return layout.guildListWidth + sidebar;
}
