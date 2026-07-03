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
            activeBranchIndex: shellNotificationsBranchIndex,
            activeBranchLocation: '/notifications',
            topLocation: '/notifications',
          ),
          ShellLayoutMode.mainTab,
        );
      },
    );

    test(
      'home tab during stale notifications top uses channelsRoot not channelDrawer',
      () {
        expect(
          resolveMobileShellLayoutMode(
            navigationShellIndex: shellHomeBranchIndex,
            activeBranchIndex: shellNotificationsBranchIndex,
            activeBranchLocation: '/channels/@me/dm',
            topLocation: '/notifications',
          ),
          ShellLayoutMode.channelsRoot,
        );
      },
    );
  });
}
