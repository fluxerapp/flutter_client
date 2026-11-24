import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/local_settings/local_setting_key.dart';
import 'package:fluxer_app/core/local_settings/local_setting_keys.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store.dart';
import 'package:fluxer_app/core/local_settings/local_settings_store_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'synced_extras_preferences_provider.g.dart';

@immutable
class SyncedExtrasState {
  const SyncedExtrasState({
    this.spellcheckEnabled = true,
    this.convertEmoticons = false,
    this.hideHelpButton = false,
    this.hideDownloadButton = false,
  });

  final bool spellcheckEnabled;
  final bool convertEmoticons;
  final bool hideHelpButton;
  final bool hideDownloadButton;

  SyncedExtrasState copyWith({
    bool? spellcheckEnabled,
    bool? convertEmoticons,
    bool? hideHelpButton,
    bool? hideDownloadButton,
  }) {
    return SyncedExtrasState(
      spellcheckEnabled: spellcheckEnabled ?? this.spellcheckEnabled,
      convertEmoticons: convertEmoticons ?? this.convertEmoticons,
      hideHelpButton: hideHelpButton ?? this.hideHelpButton,
      hideDownloadButton: hideDownloadButton ?? this.hideDownloadButton,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is SyncedExtrasState &&
      other.spellcheckEnabled == spellcheckEnabled &&
      other.convertEmoticons == convertEmoticons &&
      other.hideHelpButton == hideHelpButton &&
      other.hideDownloadButton == hideDownloadButton;

  @override
  int get hashCode => Object.hash(
    spellcheckEnabled,
    convertEmoticons,
    hideHelpButton,
    hideDownloadButton,
  );
}

@Riverpod(keepAlive: true)
class SyncedExtrasPreferences extends _$SyncedExtrasPreferences {
  @override
  SyncedExtrasState build() {
    final LocalSettingsStore store = ref.watch(localSettingsStoreProvider);
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const SyncedExtrasState();
    }
    return SyncedExtrasState(
      spellcheckEnabled: store.readAccount(
        LocalSettingKeys.spellcheckEnabled,
        userId: userId,
      ),
      convertEmoticons: store.readAccount(
        LocalSettingKeys.convertEmoticons,
        userId: userId,
      ),
      hideHelpButton: store.readAccount(
        LocalSettingKeys.hideHelpButton,
        userId: userId,
      ),
      hideDownloadButton: store.readAccount(
        LocalSettingKeys.hideDownloadButton,
        userId: userId,
      ),
    );
  }

  void _write(AccountFlag key, {required bool value}) {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    ref
        .read(localSettingsStoreProvider)
        .writeAccount(key, value, userId: userId);
  }

  Future<void> applySpellcheck({required bool enabled}) async {
    state = state.copyWith(spellcheckEnabled: enabled);
    _write(LocalSettingKeys.spellcheckEnabled, value: enabled);
  }

  Future<void> applyConvertEmoticons({required bool enabled}) async {
    state = state.copyWith(convertEmoticons: enabled);
    _write(LocalSettingKeys.convertEmoticons, value: enabled);
  }

  Future<void> applyHiddenGuildButtons({
    required bool help,
    required bool download,
  }) async {
    state = state.copyWith(hideHelpButton: help, hideDownloadButton: download);
    _write(LocalSettingKeys.hideHelpButton, value: help);
    _write(LocalSettingKeys.hideDownloadButton, value: download);
  }

  Future<void> setSpellcheckEnabled({required bool value}) async {
    await applySpellcheck(enabled: value);
    ref.markSyncedDirty(SyncedPreferenceField.spellcheck);
  }

  Future<void> setConvertEmoticons({required bool value}) async {
    await applyConvertEmoticons(enabled: value);
    ref.markSyncedDirty(SyncedPreferenceField.chatInput);
  }

  Future<void> setHideHelpButton({required bool value}) async {
    await applyHiddenGuildButtons(
      help: value,
      download: state.hideDownloadButton,
    );
    ref.markSyncedDirty(SyncedPreferenceField.hiddenGuildButtons);
  }

  Future<void> setHideDownloadButton({required bool value}) async {
    await applyHiddenGuildButtons(help: state.hideHelpButton, download: value);
    ref.markSyncedDirty(SyncedPreferenceField.hiddenGuildButtons);
  }
}
