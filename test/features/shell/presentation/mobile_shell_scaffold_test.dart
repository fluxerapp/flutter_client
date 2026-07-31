import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/shell_location_resolver.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';

void main() {
  group('MobileShellScaffold layout race', () {
    test(
      'notifications tab never selects channelDrawer while home stack has dm',
      () {
        expect(
          resolveMobileShellLayoutMode(
            navigationShellIndex: shellNotificationsBranchIndex,
            activeBranchLocation: '/notifications',
          ),
          ShellLayoutMode.mainTab,
        );
      },
    );

    test('home tab during a stale notifications read keeps the shell', () {
      expect(
        resolveMobileShellLayoutMode(
          navigationShellIndex: shellHomeBranchIndex,
          activeBranchLocation: '/channels/@me/dm',
        ),
        ShellLayoutMode.channelDrawer,
      );
    });

    test('community root renders the drawer layout, not a shell-less one', () {
      expect(
        resolveMobileShellLayoutMode(
          navigationShellIndex: shellHomeBranchIndex,
          activeBranchLocation: '/channels/guild',
        ),
        ShellLayoutMode.channelDrawer,
      );
    });
  });
}
