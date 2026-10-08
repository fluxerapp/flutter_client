import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

void main() {
  group('guildSidebarBannerHeight', () {
    test('uses 16:9 height when under the viewport cap', () {
      expect(
        guildSidebarBannerHeight(width: 270, viewportHeight: 900),
        closeTo(270 / Breakpoints.guildBannerAspectRatio, 0.001),
      );
    });

    test('caps height at 30% of viewport height', () {
      expect(
        guildSidebarBannerHeight(width: 1060, viewportHeight: 500),
        500 * Breakpoints.guildBannerMaxViewportHeightFraction,
      );
    });

    test('never goes below the header minimum', () {
      expect(guildSidebarBannerHeight(width: 90, viewportHeight: 200), 56);
    });

    test('returns zero for non-positive width', () {
      expect(guildSidebarBannerHeight(width: 0, viewportHeight: 900), 0);
      expect(guildSidebarBannerHeight(width: -10, viewportHeight: 900), 0);
    });
  });
}
