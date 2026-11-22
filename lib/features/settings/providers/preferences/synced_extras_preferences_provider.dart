import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/shared/utils/shared_preferences_or_null.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

const String _kSpellcheckKey = 'synced_extras_spellcheck_enabled';
const String _kConvertEmoticonsKey = 'synced_extras_convert_emoticons';
const String _kHideHelpButtonKey = 'synced_extras_hide_help_button';
const String _kHideDownloadButtonKey = 'synced_extras_hide_download_button';

@Riverpod(keepAlive: true)
class SyncedExtrasPreferences extends _$SyncedExtrasPreferences {
  @override
  SyncedExtrasState build() {
    unawaited(_load());
    return const SyncedExtrasState();
  }

  Future<void> _load() async {
    final SharedPreferences? preferences = await sharedPreferencesOrNull();
    if (preferences == null || !ref.mounted) {
      return;
    }
    state = SyncedExtrasState(
      spellcheckEnabled: preferences.getBool(_kSpellcheckKey) ?? true,
      convertEmoticons: preferences.getBool(_kConvertEmoticonsKey) ?? false,
      hideHelpButton: preferences.getBool(_kHideHelpButtonKey) ?? false,
      hideDownloadButton: preferences.getBool(_kHideDownloadButtonKey) ?? false,
    );
  }

  Future<void> _persist() async {
    final SharedPreferences? preferences = await sharedPreferencesOrNull();
    if (preferences == null) {
      return;
    }
    await preferences.setBool(_kSpellcheckKey, state.spellcheckEnabled);
    await preferences.setBool(_kConvertEmoticonsKey, state.convertEmoticons);
    await preferences.setBool(_kHideHelpButtonKey, state.hideHelpButton);
    await preferences.setBool(
      _kHideDownloadButtonKey,
      state.hideDownloadButton,
    );
  }

  Future<void> applySpellcheck({required bool enabled}) async {
    state = state.copyWith(spellcheckEnabled: enabled);
    await _persist();
  }

  Future<void> applyConvertEmoticons({required bool enabled}) async {
    state = state.copyWith(convertEmoticons: enabled);
    await _persist();
  }

  Future<void> applyHiddenGuildButtons({
    required bool help,
    required bool download,
  }) async {
    state = state.copyWith(hideHelpButton: help, hideDownloadButton: download);
    await _persist();
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
