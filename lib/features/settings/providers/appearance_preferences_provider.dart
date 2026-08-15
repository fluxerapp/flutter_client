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
import 'package:fluxer_app/features/accessibility/motion_preferences.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appearance_preferences_provider.g.dart';

enum ChannelTypingIndicatorMode { avatars, indicatorOnly, hidden }

enum DmMessagePreviewMode { all, unreadOnly, none }

enum HdrDisplayMode { full, standard }

HdrDisplayMode hdrDisplayModeFromName(String? name) {
  return HdrDisplayMode.values.firstWhere(
    (HdrDisplayMode mode) => mode.name == name,
    orElse: () => HdrDisplayMode.full,
  );
}

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

DmMessagePreviewMode dmMessagePreviewModeFromName(String? name) {
  return DmMessagePreviewMode.values.firstWhere(
    (DmMessagePreviewMode mode) => mode.name == name,
    orElse: defaultDmMessagePreviewMode,
  );
}

StickerAnimationOptions stickerAnimationFromJson(int? value) {
  if (value == null) {
    return kDefaultMobileStickerAnimation;
  }
  return StickerAnimationOptions.fromJson(value);
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
    this.showUserAvatarsInCompactMode = false,
    this.showMediaDeleteButton = true,
    this.showMediaDownloadButton = true,
    this.showMediaFavoriteButton = true,
    this.showSuppressEmbedsButton = true,
    this.screenReaderAnnounceNewMessages = false,
    this.syncReducedMotionWithSystem = true,
    this.reducedMotionOverride = false,
    this.enableTtsCommand = true,
    this.ttsRate = kDefaultTtsRate,
    this.alwaysUnderlineLinks = false,
    this.dimStrikethroughText = true,
    this.showTextareaFocusRing = true,
    this.escapeExitsKeyboardMode = false,
    this.showContextMenuShortcuts = false,
    this.confirmBeforeStartingCalls = true,
    this.mobileGifAutoplayOverridden = false,
    this.mobileAnimateEmojiOverridden = false,
    this.mobileStickerAnimationOverridden = false,
    this.mobileGifAutoplayValue = kDefaultMobileGifAutoPlay,
    this.mobileAnimateEmojiValue = true,
    this.mobileStickerAnimationValue = kDefaultMobileStickerAnimation,
    this.keepAnimatedEmojiUnderReducedMotion = false,
    this.keepGifAutoPlayUnderReducedMotion = false,
    this.keepStickerAnimationUnderReducedMotion = false,
    this.mobileSplashZoomAnimation = true,
    this.hdrDisplayMode = HdrDisplayMode.full,
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
  final bool showUserAvatarsInCompactMode;
  final bool showMediaDeleteButton;
  final bool showMediaDownloadButton;
  final bool showMediaFavoriteButton;
  final bool showSuppressEmbedsButton;
  final bool screenReaderAnnounceNewMessages;
  final bool syncReducedMotionWithSystem;
  final bool reducedMotionOverride;
  final bool enableTtsCommand;
  final double ttsRate;
  final bool alwaysUnderlineLinks;
  final bool dimStrikethroughText;
  final bool showTextareaFocusRing;
  final bool escapeExitsKeyboardMode;
  final bool showContextMenuShortcuts;
  final bool confirmBeforeStartingCalls;
  final bool mobileGifAutoplayOverridden;
  final bool mobileAnimateEmojiOverridden;
  final bool mobileStickerAnimationOverridden;
  final bool mobileGifAutoplayValue;
  final bool mobileAnimateEmojiValue;
  final StickerAnimationOptions mobileStickerAnimationValue;
  final bool keepAnimatedEmojiUnderReducedMotion;
  final bool keepGifAutoPlayUnderReducedMotion;
  final bool keepStickerAnimationUnderReducedMotion;
  final bool mobileSplashZoomAnimation;
  final HdrDisplayMode hdrDisplayMode;

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
    bool? showUserAvatarsInCompactMode,
    bool? showMediaDeleteButton,
    bool? showMediaDownloadButton,
    bool? showMediaFavoriteButton,
    bool? showSuppressEmbedsButton,
    bool? screenReaderAnnounceNewMessages,
    bool? syncReducedMotionWithSystem,
    bool? reducedMotionOverride,
    bool? enableTtsCommand,
    double? ttsRate,
    bool? alwaysUnderlineLinks,
    bool? dimStrikethroughText,
    bool? showTextareaFocusRing,
    bool? escapeExitsKeyboardMode,
    bool? showContextMenuShortcuts,
    bool? confirmBeforeStartingCalls,
    bool? mobileGifAutoplayOverridden,
    bool? mobileAnimateEmojiOverridden,
    bool? mobileStickerAnimationOverridden,
    bool? mobileGifAutoplayValue,
    bool? mobileAnimateEmojiValue,
    StickerAnimationOptions? mobileStickerAnimationValue,
    bool? keepAnimatedEmojiUnderReducedMotion,
    bool? keepGifAutoPlayUnderReducedMotion,
    bool? keepStickerAnimationUnderReducedMotion,
    bool? mobileSplashZoomAnimation,
    HdrDisplayMode? hdrDisplayMode,
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
      showUserAvatarsInCompactMode:
          showUserAvatarsInCompactMode ?? this.showUserAvatarsInCompactMode,
      showMediaDeleteButton:
          showMediaDeleteButton ?? this.showMediaDeleteButton,
      showMediaDownloadButton:
          showMediaDownloadButton ?? this.showMediaDownloadButton,
      showMediaFavoriteButton:
          showMediaFavoriteButton ?? this.showMediaFavoriteButton,
      showSuppressEmbedsButton:
          showSuppressEmbedsButton ?? this.showSuppressEmbedsButton,
      screenReaderAnnounceNewMessages:
          screenReaderAnnounceNewMessages ??
          this.screenReaderAnnounceNewMessages,
      syncReducedMotionWithSystem:
          syncReducedMotionWithSystem ?? this.syncReducedMotionWithSystem,
      reducedMotionOverride:
          reducedMotionOverride ?? this.reducedMotionOverride,
      enableTtsCommand: enableTtsCommand ?? this.enableTtsCommand,
      ttsRate: ttsRate ?? this.ttsRate,
      alwaysUnderlineLinks: alwaysUnderlineLinks ?? this.alwaysUnderlineLinks,
      dimStrikethroughText: dimStrikethroughText ?? this.dimStrikethroughText,
      showTextareaFocusRing:
          showTextareaFocusRing ?? this.showTextareaFocusRing,
      escapeExitsKeyboardMode:
          escapeExitsKeyboardMode ?? this.escapeExitsKeyboardMode,
      showContextMenuShortcuts:
          showContextMenuShortcuts ?? this.showContextMenuShortcuts,
      confirmBeforeStartingCalls:
          confirmBeforeStartingCalls ?? this.confirmBeforeStartingCalls,
      mobileGifAutoplayOverridden:
          mobileGifAutoplayOverridden ?? this.mobileGifAutoplayOverridden,
      mobileAnimateEmojiOverridden:
          mobileAnimateEmojiOverridden ?? this.mobileAnimateEmojiOverridden,
      mobileStickerAnimationOverridden:
          mobileStickerAnimationOverridden ??
          this.mobileStickerAnimationOverridden,
      mobileGifAutoplayValue:
          mobileGifAutoplayValue ?? this.mobileGifAutoplayValue,
      mobileAnimateEmojiValue:
          mobileAnimateEmojiValue ?? this.mobileAnimateEmojiValue,
      mobileStickerAnimationValue:
          mobileStickerAnimationValue ?? this.mobileStickerAnimationValue,
      keepAnimatedEmojiUnderReducedMotion:
          keepAnimatedEmojiUnderReducedMotion ??
          this.keepAnimatedEmojiUnderReducedMotion,
      keepGifAutoPlayUnderReducedMotion:
          keepGifAutoPlayUnderReducedMotion ??
          this.keepGifAutoPlayUnderReducedMotion,
      keepStickerAnimationUnderReducedMotion:
          keepStickerAnimationUnderReducedMotion ??
          this.keepStickerAnimationUnderReducedMotion,
      mobileSplashZoomAnimation:
          mobileSplashZoomAnimation ?? this.mobileSplashZoomAnimation,
      hdrDisplayMode: hdrDisplayMode ?? this.hdrDisplayMode,
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
        dmMessagePreviewMode: dmMessagePreviewModeFromName(
          prefs.dmMessagePreviewMode,
        ),
        showActiveNow: prefs.showActiveNow,
        showFavorites: prefs.showFavorites,
        hideKeyboardHints: prefs.hideKeyboardHints,
        messageGroupSpacing: prefs.messageGroupSpacing,
        compactMessageGroupSpacing: prefs.compactMessageGroupSpacing,
        showMediaDeleteButton: prefs.showMediaDeleteButton,
        showMediaDownloadButton: prefs.showMediaDownloadButton,
        showMediaFavoriteButton: prefs.showMediaFavoriteButton,
        showSuppressEmbedsButton: prefs.showSuppressEmbedsButton,
        screenReaderAnnounceNewMessages: prefs.screenReaderAnnounceNewMessages,
        syncReducedMotionWithSystem: prefs.syncReducedMotionWithSystem,
        reducedMotionOverride: prefs.reducedMotionOverride,
        enableTtsCommand: prefs.enableTtsCommand,
        ttsRate: prefs.ttsRate,
        alwaysUnderlineLinks: prefs.alwaysUnderlineLinks,
        dimStrikethroughText: prefs.dimStrikethroughText,
        showTextareaFocusRing: prefs.showTextareaFocusRing,
        escapeExitsKeyboardMode: prefs.escapeExitsKeyboardMode,
        showContextMenuShortcuts: prefs.showContextMenuShortcuts,
        confirmBeforeStartingCalls: prefs.confirmBeforeStartingCalls,
        mobileGifAutoplayOverridden: prefs.mobileGifAutoplayOverridden,
        mobileAnimateEmojiOverridden: prefs.mobileAnimateEmojiOverridden,
        mobileStickerAnimationOverridden:
            prefs.mobileStickerAnimationOverridden,
        mobileGifAutoplayValue: prefs.mobileGifAutoplayValue,
        mobileAnimateEmojiValue: prefs.mobileAnimateEmojiValue,
        mobileStickerAnimationValue: stickerAnimationFromJson(
          prefs.mobileStickerAnimationValue,
        ),
        keepAnimatedEmojiUnderReducedMotion:
            prefs.keepAnimatedEmojiUnderReducedMotion,
        keepGifAutoPlayUnderReducedMotion:
            prefs.keepGifAutoPlayUnderReducedMotion,
        keepStickerAnimationUnderReducedMotion:
            prefs.keepStickerAnimationUnderReducedMotion,
        mobileSplashZoomAnimation: prefs.mobileSplashZoomAnimation,
        hdrDisplayMode: hdrDisplayModeFromName(prefs.hdrDisplayMode),
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
        showUserAvatarsInCompactMode: value.showUserAvatarsInCompactMode,
        showMediaDeleteButton: value.showMediaDeleteButton,
        showMediaDownloadButton: value.showMediaDownloadButton,
        showMediaFavoriteButton: value.showMediaFavoriteButton,
        showSuppressEmbedsButton: value.showSuppressEmbedsButton,
        screenReaderAnnounceNewMessages: value.screenReaderAnnounceNewMessages,
        enableTtsCommand: value.enableTtsCommand,
        ttsRate: value.ttsRate,
        alwaysUnderlineLinks: value.alwaysUnderlineLinks,
        dimStrikethroughText: value.dimStrikethroughText,
        showTextareaFocusRing: value.showTextareaFocusRing,
        escapeExitsKeyboardMode: value.escapeExitsKeyboardMode,
        showContextMenuShortcuts: value.showContextMenuShortcuts,
        confirmBeforeStartingCalls: value.confirmBeforeStartingCalls,
        syncReducedMotionWithSystem: value.syncReducedMotionWithSystem,
        reducedMotionOverride: value.reducedMotionOverride,
        mobileGifAutoplayOverridden: value.mobileGifAutoplayOverridden,
        mobileAnimateEmojiOverridden: value.mobileAnimateEmojiOverridden,
        mobileStickerAnimationOverridden:
            value.mobileStickerAnimationOverridden,
        mobileGifAutoplayValue: value.mobileGifAutoplayValue,
        mobileAnimateEmojiValue: value.mobileAnimateEmojiValue,
        mobileStickerAnimationValue: value.mobileStickerAnimationValue,
        mobileSplashZoomAnimation: value.mobileSplashZoomAnimation,
        hdrDisplayMode: value.hdrDisplayMode,
      );
      await _persist();
    } finally {
      _isApplyingRemote = false;
    }
  }

  Future<void> applySyncedAccessibilityOverrides({
    required bool keepAnimatedEmojiUnderReducedMotion,
    required bool keepGifAutoPlayUnderReducedMotion,
    required bool keepStickerAnimationUnderReducedMotion,
  }) async {
    _isApplyingRemote = true;
    try {
      state = state.copyWith(
        keepAnimatedEmojiUnderReducedMotion:
            keepAnimatedEmojiUnderReducedMotion,
        keepGifAutoPlayUnderReducedMotion: keepGifAutoPlayUnderReducedMotion,
        keepStickerAnimationUnderReducedMotion:
            keepStickerAnimationUnderReducedMotion,
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

  Future<void> setMobileSplashZoomAnimation({required bool value}) async {
    state = state.copyWith(mobileSplashZoomAnimation: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setDmMessagePreviewMode(DmMessagePreviewMode mode) async {
    state = state.copyWith(dmMessagePreviewMode: mode);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setHdrDisplayMode(HdrDisplayMode mode) async {
    state = state.copyWith(hdrDisplayMode: mode);
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

  Future<void> setMessageGroupSpacing({
    required bool messageDisplayCompact,
    required double spacing,
  }) async {
    state = state.copyWith(
      messageGroupSpacing: messageDisplayCompact
          ? state.messageGroupSpacing
          : spacing,
      compactMessageGroupSpacing: messageDisplayCompact
          ? spacing
          : state.compactMessageGroupSpacing,
    );
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowUserAvatarsInCompactMode({required bool value}) async {
    state = state.copyWith(showUserAvatarsInCompactMode: value);
    _markAccessibilityDirty();
  }

  Future<void> setUseSystemLocaleForTimeFormat({required bool value}) async {
    state = state.copyWith(useSystemLocaleForTimeFormat: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMediaDeleteButton({required bool value}) async {
    state = state.copyWith(showMediaDeleteButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMediaDownloadButton({required bool value}) async {
    state = state.copyWith(showMediaDownloadButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowMediaFavoriteButton({required bool value}) async {
    state = state.copyWith(showMediaFavoriteButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowSuppressEmbedsButton({required bool value}) async {
    state = state.copyWith(showSuppressEmbedsButton: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setScreenReaderAnnounceNewMessages({required bool value}) async {
    state = state.copyWith(screenReaderAnnounceNewMessages: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setSyncReducedMotionWithSystem({required bool value}) async {
    state = state.copyWith(syncReducedMotionWithSystem: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setReducedMotionOverride({required bool value}) async {
    state = state.copyWith(reducedMotionOverride: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setEnableTtsCommand({required bool value}) async {
    state = state.copyWith(enableTtsCommand: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setTtsRate(double rate) async {
    state = state.copyWith(ttsRate: clampTtsRate(rate));
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setAlwaysUnderlineLinks({required bool value}) async {
    state = state.copyWith(alwaysUnderlineLinks: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setDimStrikethroughText({required bool value}) async {
    state = state.copyWith(dimStrikethroughText: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowTextareaFocusRing({required bool value}) async {
    state = state.copyWith(showTextareaFocusRing: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setEscapeExitsKeyboardMode({required bool value}) async {
    state = state.copyWith(escapeExitsKeyboardMode: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setShowContextMenuShortcuts({required bool value}) async {
    state = state.copyWith(showContextMenuShortcuts: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> setConfirmBeforeStartingCalls({required bool value}) async {
    state = state.copyWith(confirmBeforeStartingCalls: value);
    await _persist();
    _markAccessibilityDirty();
  }

  Future<void> applyMotionPreferencesWrite(MotionPreferencesWrite write) async {
    final bool hasAppearanceChange =
        write.mobileGifAutoPlayOverridden != null ||
        write.mobileGifAutoPlayValue != null ||
        write.mobileAnimateEmojiOverridden != null ||
        write.mobileAnimateEmojiValue != null ||
        write.mobileStickerAnimationOverridden != null ||
        write.mobileStickerAnimationValue != null ||
        write.keepAnimatedEmojiUnderReducedMotion != null ||
        write.keepGifAutoPlayUnderReducedMotion != null ||
        write.keepStickerAnimationUnderReducedMotion != null;
    if (!hasAppearanceChange) {
      return;
    }
    state = state.copyWith(
      mobileGifAutoplayOverridden: write.mobileGifAutoPlayOverridden,
      mobileGifAutoplayValue: write.mobileGifAutoPlayValue,
      mobileAnimateEmojiOverridden: write.mobileAnimateEmojiOverridden,
      mobileAnimateEmojiValue: write.mobileAnimateEmojiValue,
      mobileStickerAnimationOverridden: write.mobileStickerAnimationOverridden,
      mobileStickerAnimationValue: write.mobileStickerAnimationValue,
      keepAnimatedEmojiUnderReducedMotion:
          write.keepAnimatedEmojiUnderReducedMotion,
      keepGifAutoPlayUnderReducedMotion:
          write.keepGifAutoPlayUnderReducedMotion,
      keepStickerAnimationUnderReducedMotion:
          write.keepStickerAnimationUnderReducedMotion,
    );
    await _persist();
    if (write.mobileGifAutoPlayOverridden != null ||
        write.mobileGifAutoPlayValue != null ||
        write.mobileAnimateEmojiOverridden != null ||
        write.mobileAnimateEmojiValue != null ||
        write.mobileStickerAnimationOverridden != null ||
        write.mobileStickerAnimationValue != null) {
      _markAccessibilityDirty();
    }
    if (write.keepAnimatedEmojiUnderReducedMotion != null ||
        write.keepGifAutoPlayUnderReducedMotion != null ||
        write.keepStickerAnimationUnderReducedMotion != null) {
      _markAccessibilityOverridesDirty();
    }
  }

  void _markAccessibilityDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.accessibility);
  }

  void _markAccessibilityOverridesDirty() {
    if (_isApplyingRemote) {
      return;
    }
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.accessibilityOverrides);
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
        dmMessagePreviewMode: Value(state.dmMessagePreviewMode.name),
        showActiveNow: Value(state.showActiveNow),
        showFavorites: Value(state.showFavorites),
        hideKeyboardHints: Value(state.hideKeyboardHints),
        messageGroupSpacing: Value(state.messageGroupSpacing),
        compactMessageGroupSpacing: Value(state.compactMessageGroupSpacing),
        showMediaDeleteButton: Value(state.showMediaDeleteButton),
        showMediaDownloadButton: Value(state.showMediaDownloadButton),
        showMediaFavoriteButton: Value(state.showMediaFavoriteButton),
        showSuppressEmbedsButton: Value(state.showSuppressEmbedsButton),
        screenReaderAnnounceNewMessages: Value(
          state.screenReaderAnnounceNewMessages,
        ),
        syncReducedMotionWithSystem: Value(state.syncReducedMotionWithSystem),
        reducedMotionOverride: Value(state.reducedMotionOverride),
        enableTtsCommand: Value(state.enableTtsCommand),
        ttsRate: Value(state.ttsRate),
        alwaysUnderlineLinks: Value(state.alwaysUnderlineLinks),
        dimStrikethroughText: Value(state.dimStrikethroughText),
        showTextareaFocusRing: Value(state.showTextareaFocusRing),
        escapeExitsKeyboardMode: Value(state.escapeExitsKeyboardMode),
        showContextMenuShortcuts: Value(state.showContextMenuShortcuts),
        confirmBeforeStartingCalls: Value(state.confirmBeforeStartingCalls),
        mobileGifAutoplayOverridden: Value(state.mobileGifAutoplayOverridden),
        mobileAnimateEmojiOverridden: Value(state.mobileAnimateEmojiOverridden),
        mobileStickerAnimationOverridden: Value(
          state.mobileStickerAnimationOverridden,
        ),
        mobileGifAutoplayValue: Value(state.mobileGifAutoplayValue),
        mobileAnimateEmojiValue: Value(state.mobileAnimateEmojiValue),
        mobileStickerAnimationValue: Value(
          state.mobileStickerAnimationValue.json ?? 1,
        ),
        keepAnimatedEmojiUnderReducedMotion: Value(
          state.keepAnimatedEmojiUnderReducedMotion,
        ),
        keepGifAutoPlayUnderReducedMotion: Value(
          state.keepGifAutoPlayUnderReducedMotion,
        ),
        keepStickerAnimationUnderReducedMotion: Value(
          state.keepStickerAnimationUnderReducedMotion,
        ),
        mobileSplashZoomAnimation: Value(state.mobileSplashZoomAnimation),
        hdrDisplayMode: Value(state.hdrDisplayMode.name),
      ),
    );
  }
}
