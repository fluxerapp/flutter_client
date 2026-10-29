import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_providers.g.dart';

@Riverpod(keepAlive: true)
class DrawerRevealSyncTrigger extends _$DrawerRevealSyncTrigger {
  @override
  int build() => 0;

  void nudge() {
    state++;
  }
}

class DrawerPastHalfScreen extends Notifier<bool> {
  @override
  bool build() => false;

  void set({required bool pastHalf}) {
    if (state == pastHalf) {
      return;
    }
    state = pastHalf;
  }
}

final drawerPastHalfScreenProvider =
    NotifierProvider<DrawerPastHalfScreen, bool>(DrawerPastHalfScreen.new);
