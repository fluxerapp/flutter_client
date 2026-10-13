import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/material_ui.dart';

abstract final class Breakpoints {
  static const double mobile = 600;

  static const double tablet = 1100;

  static const double compactWide = 700;

  static const double guildListWidth = 72;

  static const double channelSidebarWidth = 270;

  static const double minShellChatWidth = 800;

  static const double shellMinWidth =
      guildListWidth + channelSidebarWidth + 1 + minShellChatWidth;

  static const double guildBannerMaxViewportHeightFraction = 0.3;

  static const double guildBannerAspectRatio = 16 / 9;
}

enum LayoutMode { mobile, tablet, desktop }

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

LayoutMode layoutModeOfSize(Size size) {
  final LayoutMode mode = layoutModeOf(layoutReferenceExtentOf(size));
  if (mode != LayoutMode.mobile && size.width < Breakpoints.shellMinWidth) {
    return LayoutMode.mobile;
  }
  return mode;
}

bool isMobileLayout(BuildContext context) =>
    layoutModeOfSize(MediaQuery.sizeOf(context)) == LayoutMode.mobile;

bool isTabletLayout(BuildContext context) =>
    layoutModeOfSize(MediaQuery.sizeOf(context)) == LayoutMode.tablet;

bool isDesktopLayout(BuildContext context) =>
    layoutModeOfSize(MediaQuery.sizeOf(context)) == LayoutMode.desktop;

bool isWideLayout(BuildContext context) => !isMobileLayout(context);

bool isForumHandheldLayout(BuildContext context) => !isDesktopLayout(context);

bool isPhoneVoiceOverlay(BuildContext context) {
  return layoutReferenceExtentOf(MediaQuery.sizeOf(context)) <
      Breakpoints.mobile;
}

bool isCompactWideMobileLayout(BuildContext context) {
  final Size size = MediaQuery.sizeOf(context);
  if (size.width < Breakpoints.compactWide || !isMobileLayout(context)) {
    return false;
  }
  return layoutReferenceExtentOf(size) >= Breakpoints.mobile;
}

double mobileDrawerPeekWidth(BuildContext context) {
  final FluxerLayoutTheme? layout = Theme.of(
    context,
  ).extension<FluxerLayoutTheme>();
  if (layout != null) {
    return layout.guildListWidth + layout.sidebarWidth;
  }
  return Breakpoints.guildListWidth + Breakpoints.channelSidebarWidth;
}

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
