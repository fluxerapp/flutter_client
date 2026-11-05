import 'dart:async';
import 'dart:ui' show ImageFilter;

import 'package:flutter/gestures.dart' show kSecondaryButton;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/foldable/crease_overlay_layout.dart';
import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

part 'fluxer_desktop_menu.dart';
part 'fluxer_desktop_route.dart';
part 'fluxer_desktop_hover_flyout.dart';

const double kFluxerDesktopMenuMinWidth = 208;
const double kFluxerDesktopMenuDefaultWidth = 240;
const double kFluxerDesktopMenuPadding = 6;
const double kFluxerDesktopMenuRowMinHeight = 32;
const double kFluxerDesktopMenuIconSize = 18;
const double kFluxerDesktopMenuCaretSize = 14;
const double _kEdgePadding = 12;
const double _kAnchorGap = 4;
const double _kPopoutSideGap = 8;
const double _kAnchorMaxWidth = 420;
const double _kAnchorMaxHeight = 160;
const Duration _kAnchoredTransition = Duration(milliseconds: 100);
const Duration _kFlyoutCloseDelay = Duration(milliseconds: 120);

enum FluxerDesktopSurface { menu, popout, modal }

enum FluxerDesktopPlacement { belowStart, belowEnd, aboveStart, rightStart }

class FluxerDesktopPresentation {
  const FluxerDesktopPresentation({
    this.surface,
    this.width,
    this.placement = FluxerDesktopPlacement.belowStart,
    this.anchorContext,
    this.showPanelBorder = true,
  });

  final FluxerDesktopSurface? surface;
  final double? width;
  final FluxerDesktopPlacement placement;
  final BuildContext? anchorContext;
  final bool showPanelBorder;
}

class FluxerDesktopSurfaceScope extends InheritedWidget {
  const FluxerDesktopSurfaceScope({
    required this.surface,
    required super.child,
    super.key,
  });

  final FluxerDesktopSurface surface;

  static FluxerDesktopSurface? maybeOf(BuildContext context) => context
      .getInheritedWidgetOfExactType<FluxerDesktopSurfaceScope>()
      ?.surface;

  static bool isMenu(BuildContext context) =>
      maybeOf(context) == FluxerDesktopSurface.menu;

  @override
  bool updateShouldNotify(FluxerDesktopSurfaceScope oldWidget) =>
      surface != oldWidget.surface;
}
