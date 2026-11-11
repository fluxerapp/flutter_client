import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/gestures.dart' show kSecondaryButton;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_mix.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/foldable/crease_overlay_layout.dart';
import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

export 'package:fluxer_app/core/theme/fluxer_color_mix.dart';

part 'fluxer_desktop_elevation.dart';
part 'fluxer_desktop_menu.dart';
part 'fluxer_desktop_route.dart';
part 'fluxer_desktop_hover_flyout.dart';

const double kFluxerDesktopMenuMinWidth = 208;
const double kFluxerDesktopMenuMaxWidth = 344;
const double kFluxerDesktopMenuDefaultWidth = 240;
const double kFluxerDesktopMenuHintMaxWidth = 320;
const double kFluxerDesktopMenuPointerOffset = 4;
const double kFluxerDesktopMenuPadding = 6;
const double kFluxerDesktopMenuRowMinHeight = 32;
const double kFluxerDesktopMenuIconSize = 18;
const double kFluxerDesktopMenuCaretSize = 14;
const double kFluxerDesktopSurfaceEdgePadding = 12;
const double _kEdgePadding = kFluxerDesktopSurfaceEdgePadding;
const double _kAnchorGap = 4;
const double _kPopoutSideGap = 8;
const double _kAnchorMaxWidth = 420;
const double _kAnchorMaxHeight = 160;
const Duration _kFlyoutCloseDelay = Duration(milliseconds: 120);

enum FluxerDesktopSurface { menu, popout, modal }

enum FluxerDesktopPlacement {
  belowStart,
  belowEnd,
  aboveStart,
  rightStart,
  leftStart,
}

class FluxerDesktopPresentation {
  const FluxerDesktopPresentation({
    this.surface,
    this.width,
    this.placement = FluxerDesktopPlacement.belowStart,
    this.anchorContext,
    this.showPanelBorder = true,
    this.borderRadius,
  });

  final FluxerDesktopSurface? surface;
  final double? width;
  final FluxerDesktopPlacement placement;
  final BuildContext? anchorContext;
  final bool showPanelBorder;
  final double? borderRadius;
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
