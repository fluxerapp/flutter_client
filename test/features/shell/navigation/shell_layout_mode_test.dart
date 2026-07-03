import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';

void main() {
  group('inferShellBranchIndex', () {
    test('maps home branch locations to index 0', () {
      expect(inferShellBranchIndex('/channels/@me'), shellHomeBranchIndex);
      expect(inferShellBranchIndex('/bookmarks'), shellHomeBranchIndex);
      expect(inferShellBranchIndex('/mentions'), shellHomeBranchIndex);
    });

    test('maps notifications and you to their branch indices', () {
      expect(
        inferShellBranchIndex('/notifications'),
        shellNotificationsBranchIndex,
      );
      expect(inferShellBranchIndex('/you'), shellYouBranchIndex);
    });
  });

  group('resolveMobileShellLayoutMode', () {
    test(
      'notifications branch uses mainTab regardless of stale home location',
      () {
        expect(
          resolveMobileShellLayoutMode(
            navigationShellIndex: shellNotificationsBranchIndex,
            activeBranchIndex: shellHomeBranchIndex,
            activeBranchLocation: '/channels/@me/dm',
            topLocation: '/notifications',
          ),
          ShellLayoutMode.mainTab,
        );
      },
    );

    test('home branch with stale top location uses channelsRoot', () {
      expect(
        resolveMobileShellLayoutMode(
          navigationShellIndex: shellHomeBranchIndex,
          activeBranchIndex: shellNotificationsBranchIndex,
          activeBranchLocation: '/notifications',
          topLocation: '/notifications',
        ),
        ShellLayoutMode.channelsRoot,
      );
    });

    test('home branch chat route uses channelDrawer', () {
      expect(
        resolveMobileShellLayoutMode(
          navigationShellIndex: shellHomeBranchIndex,
          activeBranchIndex: shellHomeBranchIndex,
          activeBranchLocation: '/channels/@me/dm',
          topLocation: '/channels/@me/dm',
        ),
        ShellLayoutMode.channelDrawer,
      );
    });
  });

  group('shellLayoutModeForLocation', () {
    test('maps channel routes to channelDrawer', () {
      expect(
        shellLayoutModeForLocation('/channels/guild/channel'),
        ShellLayoutMode.channelDrawer,
      );
      expect(
        shellLayoutModeForLocation('/channels/@favorites/abc'),
        ShellLayoutMode.channelDrawer,
      );
    });

    test('maps root channel routes to channelsRoot', () {
      expect(
        shellLayoutModeForLocation('/channels/@me'),
        ShellLayoutMode.channelsRoot,
      );
      expect(
        shellLayoutModeForLocation('/channels/guild'),
        ShellLayoutMode.channelsRoot,
      );
    });

    test('maps tab routes to mainTab', () {
      expect(
        shellLayoutModeForLocation('/notifications'),
        ShellLayoutMode.mainTab,
      );
      expect(shellLayoutModeForLocation('/you'), ShellLayoutMode.mainTab);
    });

    test('maps bookmarks and mentions to homeUtility', () {
      expect(
        shellLayoutModeForLocation('/bookmarks'),
        ShellLayoutMode.homeUtility,
      );
      expect(
        shellLayoutModeForLocation('/mentions'),
        ShellLayoutMode.homeUtility,
      );
    });
  });
}
