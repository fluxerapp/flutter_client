import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

void main() {
  group('guildSidebarBannerHeight', () {
    test('uses full 16:9 height on non-mobile layouts', () {
      expect(
        guildSidebarBannerHeight(width: 270, isMobile: false),
        closeTo(270 / Breakpoints.guildBannerAspectRatio, 0.001),
      );
      expect(
        guildSidebarBannerHeight(width: 1060, isMobile: false),
        closeTo(1060 / Breakpoints.guildBannerAspectRatio, 0.001),
      );
    });

    test('caps height on mobile wide viewports', () {
      expect(
        guildSidebarBannerHeight(width: 1060, isMobile: true),
        Breakpoints.mobileGuildBannerMaxHeight,
      );
    });

    test('keeps natural height on mobile when under the cap', () {
      expect(
        guildSidebarBannerHeight(width: 240, isMobile: true),
        closeTo(240 / Breakpoints.guildBannerAspectRatio, 0.001),
      );
    });

    test('returns zero for non-positive width', () {
      expect(guildSidebarBannerHeight(width: 0, isMobile: true), 0);
      expect(guildSidebarBannerHeight(width: -10, isMobile: true), 0);
    });
  });
}
