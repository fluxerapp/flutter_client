import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar/guild_sidebar.dart';

void main() {
  group('guildSidebarBannerCollapseRatio', () {
    test('is zero at scroll offset zero', () {
      expect(
        guildSidebarBannerCollapseRatio(
          scrollOffset: 0,
          fullBannerHeight: guildSidebarBannerHeight(
            width: 240,
            viewportHeight: 900,
          ),
        ),
        0,
      );
    });

    test('reaches one when scrolled past collapse distance', () {
      const double full = 150;
      const double distance = full - kGuildSidebarHeaderMinHeight;
      expect(
        guildSidebarBannerCollapseRatio(
          scrollOffset: distance + 20,
          fullBannerHeight: full,
        ),
        1,
      );
    });
  });
}
