import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_reveal_sync_trigger_provider.g.dart';

@Riverpod(keepAlive: true)
class DrawerRevealSyncTrigger extends _$DrawerRevealSyncTrigger {
  @override
  int build() => 0;

  void nudge() {
    state++;
  }
}
