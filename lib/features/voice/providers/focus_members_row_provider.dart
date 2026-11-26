import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_members_row_provider.g.dart';

class FocusMembersRowState {
  const FocusMembersRowState({this.visible = true, this.height});

  final bool visible;
  final double? height;
}

@Riverpod(keepAlive: true)
class FocusMembersRow extends _$FocusMembersRow {
  @override
  FocusMembersRowState build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const FocusMembersRowState();
    }
    final double? height = store.readAccount(
      LocalSettingKeys.voiceFocusMembersRowHeight,
      userId: userId,
    );
    return FocusMembersRowState(
      visible: store.readAccount(
        LocalSettingKeys.voiceFocusMembersRowVisible,
        userId: userId,
      ),
      height: height != null && height.isFinite && height > 0 ? height : null,
    );
  }

  void toggleVisible() {
    final bool visible = !state.visible;
    state = FocusMembersRowState(visible: visible, height: state.height);
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    ref
        .read(localSettingsStoreProvider)
        .writeAccount(
          LocalSettingKeys.voiceFocusMembersRowVisible,
          visible,
          userId: userId,
        );
  }

  void setHeight(double height, {required bool persist}) {
    final double rounded = height.roundToDouble();
    if (rounded != state.height) {
      state = FocusMembersRowState(visible: state.visible, height: rounded);
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (!persist || userId == null) {
      return;
    }
    ref
        .read(localSettingsStoreProvider)
        .writeAccount(
          LocalSettingKeys.voiceFocusMembersRowHeight,
          rounded,
          userId: userId,
        );
  }

  void resetHeight() {
    state = FocusMembersRowState(visible: state.visible);
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    ref
        .read(localSettingsStoreProvider)
        .removeAccount(
          LocalSettingKeys.voiceFocusMembersRowHeight,
          userId: userId,
        );
  }
}
