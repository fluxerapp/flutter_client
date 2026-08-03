import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract final class Breakpoints {
  /// Shortest side breakpoint between phone and tablet sized layouts.
  static const double mobile = 600;

  /// Shortest side breakpoint between tablet and desktop sized layouts.
  static const double tablet = 1100;

  /// Guild list width at the default layout scale.
  static const double guildListWidth = 72;

  /// Channel sidebar width at the default layout scale.
  static const double channelSidebarWidth = 270;

  /// Minimum chat column width before showing the member list.
  static const double minChatWidth = 600;

  /// Minimum chat column width for the wide shell (member list gates itself).
  static const double minShellChatWidth = 800;

  /// Search results panel width, wider than the member list panel.
  static const double searchPanelWidth = 420;

  /// Minimum viewport width for guild list, channel list, and chat.
  static const double shellMinWidth =
      guildListWidth + channelSidebarWidth + 1 + minShellChatWidth;
}

enum LayoutMode { mobile, tablet, desktop }

/// Classifies layout from a reference extent, typically the viewport’s shortest
/// side so orientation does not flip phone vs tablet on rotation.
LayoutMode layoutModeOf(double referenceExtent) {
  if (referenceExtent < Breakpoints.mobile) {
    return LayoutMode.mobile;
  }
  if (referenceExtent < Breakpoints.tablet) {
    return LayoutMode.tablet;
  }
  return LayoutMode.desktop;
}

double layoutReferenceExtentOf(Size size) => math.min(size.width, size.height);

/// Classifies layout from the full viewport size, including a width floor so
/// devices only switch to wide layout when the shell panels can fit.
LayoutMode layoutModeOfSize(Size size) {
  final LayoutMode mode = layoutModeOf(layoutReferenceExtentOf(size));
  if (mode != LayoutMode.mobile && size.width < Breakpoints.shellMinWidth) {
    return LayoutMode.mobile;
  }
  return mode;
}

/// Whether the current layout is mobile ([layoutReferenceExtentOf] <
/// [Breakpoints.mobile]).
bool isMobileLayout(BuildContext context) =>
    layoutModeOfSize(MediaQuery.sizeOf(context)) == LayoutMode.mobile;

/// Whether the current layout is tablet ([layoutReferenceExtentOf] ≥
/// [Breakpoints.mobile] and &lt; [Breakpoints.tablet]).
bool isTabletLayout(BuildContext context) =>
    layoutModeOfSize(MediaQuery.sizeOf(context)) == LayoutMode.tablet;

/// Whether the current layout is desktop ([layoutReferenceExtentOf] ≥
/// [Breakpoints.tablet]).
bool isDesktopLayout(BuildContext context) =>
    layoutModeOfSize(MediaQuery.sizeOf(context)) == LayoutMode.desktop;

/// Non-mobile layout (tablet + desktop). Matches web `!MobileLayout.enabled`.
bool isWideLayout(BuildContext context) => !isMobileLayout(context);

/// Horizontal inset for wide settings modals when the viewport is narrower than
/// [maxModalWidth], so the sheet does not span edge to edge on iPad.
double wideSettingsModalHorizontalInset(
  BuildContext context, {
  double maxModalWidth = 1400,
}) {
  if (isMobileLayout(context)) {
    return 0;
  }
  final double width = MediaQuery.sizeOf(context).width;
  if (width >= maxModalWidth) {
    return 0;
  }
  return isTabletLayout(context) ? 60 : 44;
}

/// Insets for wide settings modals that float above the shell.
EdgeInsets wideSettingsModalInsets(
  BuildContext context, {
  double maxModalWidth = 1400,
}) {
  final double horizontal = wideSettingsModalHorizontalInset(
    context,
    maxModalWidth: maxModalWidth,
  );
  if (horizontal <= 0) {
    return EdgeInsets.zero;
  }
  const double vertical = 36;
  return EdgeInsets.fromLTRB(horizontal, vertical, horizontal, vertical);
}

class ResponsiveLayout extends StatelessWidget {
  final Widget Function(BuildContext context, LayoutMode mode) builder;

  const ResponsiveLayout({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutMode mode = layoutModeOfSize(MediaQuery.sizeOf(context));
    return builder(context, mode);
  }
}
