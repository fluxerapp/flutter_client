import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/action_menu/sidebar_peek_menu_panel.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('computeSidebarPeekMenuTop', () {
    const MediaQueryData media = MediaQueryData(size: Size(400, 800));

    test('centers on anchor when menu fits', () {
      final double top = computeSidebarPeekMenuTop(
        anchorCenterY: 400,
        menuHeight: 200,
        mediaQuery: media,
      );
      expect(top, 300);
    });

    test('shifts menu down when anchor is near the top', () {
      final double top = computeSidebarPeekMenuTop(
        anchorCenterY: 40,
        menuHeight: 200,
        mediaQuery: media,
      );
      expect(top, greaterThanOrEqualTo(kSidebarPeekMenuEdgePadding));
    });

    test('shifts menu up when anchor is near the bottom', () {
      final double top = computeSidebarPeekMenuTop(
        anchorCenterY: 760,
        menuHeight: 200,
        mediaQuery: media,
      );
      expect(top + 200, lessThanOrEqualTo(800 - kSidebarPeekMenuEdgePadding));
    });
  });
}
