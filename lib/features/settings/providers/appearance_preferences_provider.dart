import 'dart:io' show Platform;

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/privacy_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/sidebar_synced_field.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_preferences_provider.g.dart';

enum ChannelTypingIndicatorMode { avatars, indicatorOnly, hidden }

enum DmMessagePreviewMode { all, unreadOnly, none }

DmMessagePreviewMode defaultDmMessagePreviewMode() {
  if (kIsWeb) {
    return DmMessagePreviewMode.none;
  }
  switch (Platform.operatingSystem) {
    case 'android':
    case 'ios':
      return DmMessagePreviewMode.all;
    default:
      return DmMessagePreviewMode.none;
  }
}

class AppearancePreferencesState {
  const AppearancePreferencesState({
    this.channelTypingIndicatorMode = ChannelTypingIndicatorMode.avatars,
    this.showSelectedChannelTypingIndicator = false,
    this.showNeko = false,
    this.collapseDMs = false,
    this.showFadedUnreadOnMutedChannels = false,
    this.dmMessagePreviewMode = DmMessagePreviewMode.none,
    this.showActiveNow = true,
    this.showFavorites = true,
    this.hideKeyboardHints = false,
    this.useSystemLocaleForTimeFormat = false,
    this.messageGroupSpacing = 16,
    this.compactMessageGroupSpacing = 0,
  });

  final ChannelTypingIndicatorMode channelTypingIndicatorMode;
  final bool showSelectedChannelTypingIndicator;
  final bool showNeko;
  final bool collapseDMs;
  final bool showFadedUnreadOnMutedChannels;
  final DmMessagePreviewMode dmMessagePreviewMode;
  final bool showActiveNow;
  final bool showFavorites;
  final bool hideKeyboardHints;
  final bool useSystemLocaleForTimeFormat;
  final double messageGroupSpacing;
  final double compactMessageGroupSpacing;

  AppearancePreferencesState copyWith({
    ChannelTypingIndicatorMode? channelTypingIndicatorMode,
    bool? showSelectedChannelTypingIndicator,
    bool? showNeko,
    bool? collapseDMs,
    bool? showFadedUnreadOnMutedChannels,
    DmMessagePreviewMode? dmMessagePreviewMode,
    bool? showActiveNow,
    bool? showFavorites,
    bool? hideKeyboardHints,
    bool? useSystemLocaleForTimeFormat,
    double? messageGroupSpacing,
    double? compactMessageGroupSpacing,
  }) {
    return AppearancePreferencesState(
      channelTypingIndicatorMode:
          channelTypingIndicatorMode ?? this.channelTypingIndicatorMode,
      showSelectedChannelTypingIndicator:
          showSelectedChannelTypingIndicator ??
          this.showSelectedChannelTypingIndicator,
      showNeko: showNeko ?? this.showNeko,
      collapseDMs: collapseDMs ?? this.collapseDMs,
      showFadedUnreadOnMutedChannels:
          showFadedUnreadOnMutedChannels ?? this.showFadedUnreadOnMutedChannels,
      dmMessagePreviewMode: dmMessagePreviewMode ?? this.dmMessagePreviewMode,
      showActiveNow: showActiveNow ?? this.showActiveNow,
      showFavorites: showFavorites ?? this.showFavorites,
      hideKeyboardHints: hideKeyboardHints ?? this.hideKeyboardHints,
      useSystemLocaleForTimeFormat:
          useSystemLocaleForTimeFormat ?? this.useSystemLocaleForTimeFormat,
      messageGroupSpacing: messageGroupSpacing ?? this.messageGroupSpacing,
      compactMessageGroupSpacing:
          compactMessageGroupSpacing ?? this.compactMessageGroupSpacing,
    );
  }
}

@Riverpod(keepAlive: true)
class AppearancePreferences extends _$AppearancePreferences {
  String? _userId;
  bool _isApplyingRemote = false;

  @override
  AppearancePreferencesState build() => AppearancePreferencesState(
    dmMessagePreviewMode: defaultDmMessagePreviewMode(),
  );

  Future<void> load(String userId) async {
    _userId = userId;
    final db = ref.read(fluxerDatabaseProvider);
    final prefs = await db.userPreferencesDao.getPreferences(userId);
    if (prefs != null) {
      state = AppearancePreferencesState(
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.values
            .firstWhere(
              (m) => m.name == prefs.channelTypingIndicatorMode,
              orElse: () => ChannelTypingIndicatorMode.avatars,
            ),
        showSelectedChannelTypingIndicator:
            prefs.showSelectedChannelTypingIndicator,
        showNeko: prefs.showNeko,
        collapseDMs: prefs.collapseDMs,
        showFadedUnreadOnMutedChannels: prefs.showFadedUnreadOnMutedChannels,
        showActiveNow: prefs.showActiveNow,
        showFavorites: prefs.showFavorites,
        hideKeyboardHints: prefs.hideKeyboardHints,
        messageGroupSpacing: prefs.messageGroupSpacing,
        compactMessageGroupSpacing: prefs.compactMessageGroupSpacing,
      );
    }
  }

  Future<void> applySyncedAccessibility(AccessibilityLocalState value) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(
        hideKeyboardHints: value.hideKeyboardHints,
        channelTypingIndicatorMode: value.channelTypingIndicatorMode,
        showSelectedChannelTypingIndicator:
            value.showSelectedChannelTypingIndicator,
        showFadedUnreadOnMutedChannels: value.showFadedUnreadOnMutedChannels,
        dmMessagePreviewMode: value.dmMessagePreviewMode,
        showFavorites: value.showFavorites,
        useSystemLocaleForTimeFormat: value.useSystemLocaleForTimeFormat,
        messageGroupSpacing: value.messageGroupSpacing,
        compactMessageGroupSpacing: value.compactMessageGroupSpacing,
      );
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> applySyncedSidebar(SidebarLocalState value) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(collapseDMs: value.inlineDmsCollapsed);
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> applySyncedPrivacy(PrivacyLocalState value) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(showActiveNow: value.showActiveNow);
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> setChannelTypingIndicatorMode(
    ChannelTypingIndicatorMode mode,
  ) async {
    state = state.copyWith(channelTypingIndicatorMode: mode);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowSelectedChannelTypingIndicator({
    required bool value,
  }) async {
    state = state.copyWith(showSelectedChannelTypingIndicator: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setCollapseDMs({required bool value}) async {
    state = state.copyWith(collapseDMs: value);
    await _persist();
    _markSidebarDirty();
  }

  Future<void> setShowNeko({required bool value}) async {
    state = state.copyWith(showNeko: value);
    await _persist();
  }

  Future<void> setDmMessagePreviewMode(DmMessagePreviewMode mode) async {
    state = state.copyWith(dmMessagePreviewMode: mode);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowFadedUnreadOnMutedChannels({required bool value}) async {
    state = state.copyWith(showFadedUnreadOnMutedChannels: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowActiveNow({required bool value}) async {
    state = state.copyWith(showActiveNow: value);
    await _persist();
    _markPrivacyDirty();
  }

  Future<void> setShowFavorites({required bool value}) async {
    state = state.copyWith(showFavorites: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setHideKeyboardHints({required bool value}) async {
    state = state.copyWith(hideKeyboardHints: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setUseSystemLocaleForTimeFormat({required bool value}) async {
    state = state.copyWith(useSystemLocaleForTimeFormat: value);
    await _persist();
    _markAccessibilityDirty();
  }

  void _markAccessibilityDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.accessibility);
  }

  void _markSidebarDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.sidebar);
  }

  void _markPrivacyDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.privacy);
  }

  Future<void> _persist() async {
    final userId = _userId;
    if (userId == null) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    await db.userPreferencesDao.savePreferences(
      UserPreferencesTableCompanion(
        userId: Value(userId),
        channelTypingIndicatorMode: Value(
          state.channelTypingIndicatorMode.name,
        ),
        showSelectedChannelTypingIndicator: Value(
          state.showSelectedChannelTypingIndicator,
        ),
        showNeko: Value(state.showNeko),
        collapseDMs: Value(state.collapseDMs),
        showFadedUnreadOnMutedChannels: Value(
          state.showFadedUnreadOnMutedChannels,
        ),
        showActiveNow: Value(state.showActiveNow),
        showFavorites: Value(state.showFavorites),
        hideKeyboardHints: Value(state.hideKeyboardHints),
        messageGroupSpacing: Value(state.messageGroupSpacing),
        compactMessageGroupSpacing: Value(state.compactMessageGroupSpacing),
      ),
    );
  }
}
