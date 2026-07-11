import 'dart:math' as math;

import 'package:flutter/material.dart';

abstract final class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
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

/// Whether the current layout is mobile ([layoutReferenceExtentOf] <
/// [Breakpoints.mobile]).
bool isMobileLayout(BuildContext context) =>
    layoutModeOf(layoutReferenceExtentOf(MediaQuery.sizeOf(context))) ==
    LayoutMode.mobile;

/// Whether the current layout is tablet ([layoutReferenceExtentOf] ≥
/// [Breakpoints.mobile] and &lt; [Breakpoints.tablet]).
bool isTabletLayout(BuildContext context) =>
    layoutModeOf(layoutReferenceExtentOf(MediaQuery.sizeOf(context))) ==
    LayoutMode.tablet;

/// Whether the current layout is desktop ([layoutReferenceExtentOf] ≥
/// [Breakpoints.tablet]).
bool isDesktopLayout(BuildContext context) =>
    layoutModeOf(layoutReferenceExtentOf(MediaQuery.sizeOf(context))) ==
    LayoutMode.desktop;

/// Non-mobile layout (tablet + desktop). Matches web `!MobileLayout.enabled`.
bool isWideLayout(BuildContext context) => !isMobileLayout(context);

class ResponsiveLayout extends StatelessWidget {
  final Widget Function(BuildContext context, LayoutMode mode) builder;

  const ResponsiveLayout({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    final LayoutMode mode = layoutModeOf(
      layoutReferenceExtentOf(MediaQuery.sizeOf(context)),
    );
    return builder(context, mode);
  }
}
