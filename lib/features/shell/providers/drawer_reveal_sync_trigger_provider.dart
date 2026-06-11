import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart'
    show SidebarDrawer;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_reveal_sync_trigger_provider.g.dart';

/// Bumped when [SidebarDrawer] should re-align its translate animation to
/// [currentRevealSideProvider], even if the side value did not change.
@Riverpod(keepAlive: true)
class DrawerRevealSyncTrigger extends _$DrawerRevealSyncTrigger {
  @override
  int build() => 0;

  void nudge() {
    state++;
  }
}
