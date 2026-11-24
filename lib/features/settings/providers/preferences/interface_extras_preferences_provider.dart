import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'interface_extras_preferences_provider.g.dart';

enum InterfaceExtraFlag {
  messageDoubleClickActions(LocalSettingKeys.messageDoubleClickActions),
  animateGifPicker(LocalSettingKeys.animateGifPicker),
  hideBlockedMessages(LocalSettingKeys.hideBlockedMessages),
  keepAttachmentsOnEmptyEdit(LocalSettingKeys.keepAttachmentsOnEmptyEdit),
  sequentialFileSend(LocalSettingKeys.sequentialFileSend);

  const InterfaceExtraFlag(this.setting);

  final DeviceFlag setting;

  bool get defaultValue => setting.defaultValue;
}

@immutable
class InterfaceExtrasState {
  const InterfaceExtrasState(this._values);

  final Map<InterfaceExtraFlag, bool> _values;

  bool operator [](InterfaceExtraFlag flag) =>
      _values[flag] ?? flag.defaultValue;

  InterfaceExtrasState withFlag(InterfaceExtraFlag flag, bool value) =>
      InterfaceExtrasState(<InterfaceExtraFlag, bool>{..._values, flag: value});

  @override
  bool operator ==(Object other) =>
      other is InterfaceExtrasState &&
      InterfaceExtraFlag.values.every(
        (InterfaceExtraFlag flag) => other[flag] == this[flag],
      );

  @override
  int get hashCode => Object.hashAll(
    InterfaceExtraFlag.values.map((InterfaceExtraFlag flag) => this[flag]),
  );
}

@Riverpod(keepAlive: true)
class InterfaceExtrasPreferences extends _$InterfaceExtrasPreferences {
  @override
  InterfaceExtrasState build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    return InterfaceExtrasState(<InterfaceExtraFlag, bool>{
      for (final InterfaceExtraFlag flag in InterfaceExtraFlag.values)
        flag: store.read(flag.setting),
    });
  }

  Future<void> set(InterfaceExtraFlag flag, {required bool value}) async {
    state = state.withFlag(flag, value);
    ref.read(localSettingsStoreProvider).write(flag.setting, value);
  }
}
