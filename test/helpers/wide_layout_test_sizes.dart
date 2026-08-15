import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:material_ui/material_ui.dart';

/// Viewport wide enough to leave mobile shell layout.
const Size kWideTestViewportSize = Size(1400, 800);

/// iPad 11" landscape; should qualify for wide shell layout.
const Size kTabletLandscapeTestViewportSize = Size(1194, 834);

/// Below [Breakpoints.shellMinWidth].
const Size kBelowShellTestViewportSize = Size(1100, 800);

/// Viewport that classifies as desktop in [layoutModeOfSize].
const Size kDesktopTestViewportSize = Size(1400, Breakpoints.tablet);
