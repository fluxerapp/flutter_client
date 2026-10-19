import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/wide_layout_test_sizes.dart';

void main() {
  group('clampShellSidebarWidth', () {
    test('clamps to web bounds', () {
      expect(clampShellSidebarWidth(100), kShellSidebarWidthMin);
      expect(clampShellSidebarWidth(600), kShellSidebarWidthMax);
      expect(clampShellSidebarWidth(320), 320);
    });
  });

  group('resolveShellSidebarWidthForPreference', () {
    test('uses theme default when preference is null', () {
      final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();
      expect(
        resolveShellSidebarWidthForPreference(
          windowSize: kWideTestViewportSize,
          layout: layout,
          resizeEnabled: true,
        ),
        layout.sidebarWidth,
      );
    });

    test('clamps preference to max 480', () {
      final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();
      expect(
        resolveShellSidebarWidthForPreference(
          windowSize: kDesktopTestViewportSize,
          layout: layout,
          userPreference: 500,
          resizeEnabled: true,
        ),
        kShellSidebarWidthMax,
      );
    });

    test('ignores preference when resize disabled', () {
      final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();
      expect(
        resolveShellSidebarWidthForPreference(
          windowSize: kWideTestViewportSize,
          layout: layout,
          userPreference: 400,
          resizeEnabled: false,
        ),
        layout.sidebarWidth,
      );
    });
  });

  group('pinnedLeftPanelWidth', () {
    test('uses user preference when the shell is wide enough', () {
      final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();
      const double sidebar = 350;
      final Size size = Size(
        layout.guildListWidth +
            sidebar +
            1 +
            Breakpoints.pinnedChatPaneMinWidth,
        900,
      );
      final double panel = pinnedLeftPanelWidth(
        size,
        layout,
        userPreference: sidebar,
      );
      expect(panel - layout.guildListWidth, sidebar);
    });
  });
}
