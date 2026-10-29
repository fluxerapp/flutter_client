import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shell_popup_overlay_provider.g.dart';

@Riverpod(keepAlive: true)
class ShellHasPopupOverlay extends _$ShellHasPopupOverlay {
  @override
  bool build() => false;

  void setHasOverlay({required bool value}) {
    if (state == value) {
      return;
    }
    state = value;
  }
}
