import 'package:flutter_riverpod/flutter_riverpod.dart';

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
