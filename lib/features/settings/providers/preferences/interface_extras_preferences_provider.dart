import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/shared/utils/shared_preferences_or_null.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'interface_extras_preferences_provider.g.dart';

enum InterfaceExtraFlag {
  messageDoubleClickActions('interface_message_double_click_actions', false),
  animateGifPicker('interface_animate_gif_picker', true),
  hideBlockedMessages('interface_hide_blocked_messages', false),
  keepAttachmentsOnEmptyEdit('interface_keep_attachments_on_empty_edit', false),
  sequentialFileSend('interface_sequential_file_send', false);

  const InterfaceExtraFlag(this.storageKey, this.defaultValue);

  final String storageKey;
  final bool defaultValue;
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
    unawaited(_load());
    return const InterfaceExtrasState(<InterfaceExtraFlag, bool>{});
  }

  Future<void> _load() async {
    final SharedPreferences? preferences = await sharedPreferencesOrNull();
    if (preferences == null || !ref.mounted) {
      return;
    }
    state = InterfaceExtrasState(<InterfaceExtraFlag, bool>{
      for (final InterfaceExtraFlag flag in InterfaceExtraFlag.values)
        flag: preferences.getBool(flag.storageKey) ?? flag.defaultValue,
    });
  }

  Future<void> set(InterfaceExtraFlag flag, {required bool value}) async {
    state = state.withFlag(flag, value);
    final SharedPreferences? preferences = await sharedPreferencesOrNull();
    if (preferences == null) {
      return;
    }
    await preferences.setBool(flag.storageKey, value);
  }
}
