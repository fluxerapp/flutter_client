import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as prefs;
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/motion_preferences.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';
import 'package:fluxer_dart/export.dart' show StickerAnimationOptions;
import 'package:protobuf/protobuf.dart' as $pb;

class AccessibilityLocalState {
  const AccessibilityLocalState({
    required this.hideKeyboardHints,
    required this.channelTypingIndicatorMode,
    required this.showSelectedChannelTypingIndicator,
    required this.showFadedUnreadOnMutedChannels,
    required this.dmMessagePreviewMode,
    required this.showFavorites,
    required this.useSystemLocaleForTimeFormat,
    required this.messageGroupSpacing,
    required this.compactMessageGroupSpacing,
    required this.saturationFactor,
    required this.customThemeCss,
    required this.advanced,
    this.showUserAvatarsInCompactMode = false,
    this.screenReaderAnnounceNewMessages = false,
    this.showMediaDeleteButton = true,
    this.showMediaDownloadButton = true,
    this.showMediaFavoriteButton = true,
    this.showSuppressEmbedsButton = true,
    this.hasSaturationFactorInProto = true,
    this.hasCustomThemeCssInProto = true,
    this.enableTtsCommand = true,
    this.ttsRate = kDefaultTtsRate,
    this.alwaysUnderlineLinks = false,
    this.dimStrikethroughText = true,
    this.showTextareaFocusRing = true,
    this.escapeExitsKeyboardMode = false,
    this.showContextMenuShortcuts = false,
    this.confirmBeforeStartingCalls = true,
    this.syncReducedMotionWithSystem = true,
    this.reducedMotionOverride = false,
    this.mobileGifAutoplayOverridden = false,
    this.mobileAnimateEmojiOverridden = false,
    this.mobileStickerAnimationOverridden = false,
    this.mobileGifAutoplayValue = kDefaultMobileGifAutoPlay,
    this.mobileAnimateEmojiValue = true,
    this.mobileStickerAnimationValue = kDefaultMobileStickerAnimation,
    this.mobileSplashZoomAnimation = true,
    this.chatFontSize = kDefaultChatFontSize,
    this.scaleFactor = kDefaultLayoutZoomLevel,
    this.hasFontSizeInProto = false,
    this.hasZoomLevelInProto = false,
    this.hdrDisplayMode = HdrDisplayMode.full,
  });

  final bool hideKeyboardHints;
  final ChannelTypingIndicatorMode channelTypingIndicatorMode;
  final bool showSelectedChannelTypingIndicator;
  final bool showFadedUnreadOnMutedChannels;
  final DmMessagePreviewMode dmMessagePreviewMode;
  final bool showFavorites;
  final bool useSystemLocaleForTimeFormat;
  final double messageGroupSpacing;
  final double compactMessageGroupSpacing;
  final bool showUserAvatarsInCompactMode;
  final double saturationFactor;
  final String? customThemeCss;
  final AdvancedAccessibilityLocalState advanced;
  final bool screenReaderAnnounceNewMessages;
  final bool showMediaDeleteButton;
  final bool showMediaDownloadButton;
  final bool showMediaFavoriteButton;
  final bool showSuppressEmbedsButton;
  final bool hasSaturationFactorInProto;
  final bool hasCustomThemeCssInProto;
  final bool enableTtsCommand;
  final double ttsRate;
  final bool alwaysUnderlineLinks;
  final bool dimStrikethroughText;
  final bool showTextareaFocusRing;
  final bool escapeExitsKeyboardMode;
  final bool showContextMenuShortcuts;
  final bool confirmBeforeStartingCalls;
  final bool syncReducedMotionWithSystem;
  final bool reducedMotionOverride;
  final bool mobileGifAutoplayOverridden;
  final bool mobileAnimateEmojiOverridden;
  final bool mobileStickerAnimationOverridden;
  final bool mobileGifAutoplayValue;
  final bool mobileAnimateEmojiValue;
  final StickerAnimationOptions mobileStickerAnimationValue;
  final bool mobileSplashZoomAnimation;
  final int chatFontSize;
  final double scaleFactor;
  final bool hasFontSizeInProto;
  final bool hasZoomLevelInProto;
  final HdrDisplayMode hdrDisplayMode;
}

class AccessibilitySyncedField
    extends SyncedFieldAdapter<AccessibilityLocalState> {
  AccessibilitySyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.accessibility;

  @override
  AccessibilityLocalState readLocal() {
    final appearance = _ref.read(appearancePreferencesProvider);
    final advanced = _ref.read(advancedPreferencesProvider);
    final theme = _ref.read(themePreferenceProvider);
    return AccessibilityLocalState(
      hideKeyboardHints: appearance.hideKeyboardHints,
      channelTypingIndicatorMode: appearance.channelTypingIndicatorMode,
      showSelectedChannelTypingIndicator:
          appearance.showSelectedChannelTypingIndicator,
      showFadedUnreadOnMutedChannels: appearance.showFadedUnreadOnMutedChannels,
      dmMessagePreviewMode: appearance.dmMessagePreviewMode,
      showFavorites: appearance.showFavorites,
      useSystemLocaleForTimeFormat: appearance.useSystemLocaleForTimeFormat,
      messageGroupSpacing: appearance.messageGroupSpacing,
      compactMessageGroupSpacing: appearance.compactMessageGroupSpacing,
      showUserAvatarsInCompactMode: appearance.showUserAvatarsInCompactMode,
      saturationFactor: theme.saturationFactor,
      customThemeCss: theme.customThemeCss,
      screenReaderAnnounceNewMessages:
          appearance.screenReaderAnnounceNewMessages,
      showMediaDeleteButton: appearance.showMediaDeleteButton,
      showMediaDownloadButton: appearance.showMediaDownloadButton,
      showMediaFavoriteButton: appearance.showMediaFavoriteButton,
      showSuppressEmbedsButton: appearance.showSuppressEmbedsButton,
      enableTtsCommand: appearance.enableTtsCommand,
      ttsRate: appearance.ttsRate,
      alwaysUnderlineLinks: appearance.alwaysUnderlineLinks,
      dimStrikethroughText: appearance.dimStrikethroughText,
      showTextareaFocusRing: appearance.showTextareaFocusRing,
      escapeExitsKeyboardMode: appearance.escapeExitsKeyboardMode,
      showContextMenuShortcuts: appearance.showContextMenuShortcuts,
      confirmBeforeStartingCalls: appearance.confirmBeforeStartingCalls,
      syncReducedMotionWithSystem: appearance.syncReducedMotionWithSystem,
      reducedMotionOverride: appearance.reducedMotionOverride,
      mobileGifAutoplayOverridden: appearance.mobileGifAutoplayOverridden,
      mobileAnimateEmojiOverridden: appearance.mobileAnimateEmojiOverridden,
      mobileStickerAnimationOverridden:
          appearance.mobileStickerAnimationOverridden,
      mobileGifAutoplayValue: appearance.mobileGifAutoplayValue,
      mobileAnimateEmojiValue: appearance.mobileAnimateEmojiValue,
      mobileStickerAnimationValue: appearance.mobileStickerAnimationValue,
      mobileSplashZoomAnimation: appearance.mobileSplashZoomAnimation,
      hdrDisplayMode: appearance.hdrDisplayMode,
      chatFontSize: theme.chatFontSize,
      scaleFactor: theme.scaleFactor,
      advanced: AdvancedAccessibilityLocalState(
        enableTextSelection: advanced.enableTextSelection,
        voiceChannelJoinRequiresDoubleClick:
            advanced.voiceChannelJoinRequiresDoubleClick,
        confirmBeforeJoiningVoiceChannels:
            advanced.confirmBeforeJoiningVoiceChannels,
        showGifIndicator: advanced.showGifIndicator,
        showAttachmentExpiryIndicator: advanced.showAttachmentExpiryIndicator,
        showMessageActionBar: advanced.showMessageActionBar,
        showMessageActionBarQuickReactions:
            advanced.showMessageActionBarQuickReactions,
        showMessageActionBarShiftExpand:
            advanced.showMessageActionBarShiftExpand,
        showMessageActionBarOnlyMoreButton:
            advanced.showMessageActionBarOnlyMoreButton,
        showGifButton: advanced.showGifButton,
        showMemesButton: advanced.showMemesButton,
        showStickersButton: advanced.showStickersButton,
        showEmojiButton: advanced.showEmojiButton,
        showMessageSendButton: advanced.showMessageSendButton,
        scrollToBottomOnMessageSend: advanced.scrollToBottomOnMessageSend,
      ),
    );
  }

  @override
  Future<void> applyRemote(AccessibilityLocalState value) async {
    final appearanceNotifier = _ref.read(
      appearancePreferencesProvider.notifier,
    );
    final advancedNotifier = _ref.read(advancedPreferencesProvider.notifier);
    final themeNotifier = _ref.read(themePreferenceProvider.notifier);
    await appearanceNotifier.applySyncedAccessibility(value);
    await advancedNotifier.applySyncedAccessibility(value.advanced);
    await themeNotifier.applySyncedThemeCustomization(
      saturationFactor: value.saturationFactor,
      customThemeCss: value.customThemeCss,
      chatFontSize: value.chatFontSize,
      scaleFactor: value.scaleFactor,
      updateSaturationFactor: value.hasSaturationFactorInProto,
      updateCustomThemeCss:
          value.hasCustomThemeCssInProto && value.customThemeCss != null,
      updateChatFontSize: value.hasFontSizeInProto,
      updateScaleFactor: value.hasZoomLevelInProto,
    );
  }

  @override
  AccessibilityLocalState? readFromProto(prefs.SyncedPreferences message) {
    if (!message.hasAccessibility()) {
      return null;
    }
    return fromProto(message.accessibility);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(AccessibilityLocalState local) {
    return toProto(local);
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(prefs.SyncedPreferences wire) {
    return wire.hasAccessibility() ? wire.accessibility : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    AccessibilityLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as pb.AccessibilitySettings?,
    );
  }

  @override
  bool statesEqual(AccessibilityLocalState a, AccessibilityLocalState b) {
    return a.hideKeyboardHints == b.hideKeyboardHints &&
        a.channelTypingIndicatorMode == b.channelTypingIndicatorMode &&
        a.showSelectedChannelTypingIndicator ==
            b.showSelectedChannelTypingIndicator &&
        a.showFadedUnreadOnMutedChannels == b.showFadedUnreadOnMutedChannels &&
        a.dmMessagePreviewMode == b.dmMessagePreviewMode &&
        a.showFavorites == b.showFavorites &&
        a.useSystemLocaleForTimeFormat == b.useSystemLocaleForTimeFormat &&
        a.messageGroupSpacing == b.messageGroupSpacing &&
        a.compactMessageGroupSpacing == b.compactMessageGroupSpacing &&
        a.showUserAvatarsInCompactMode == b.showUserAvatarsInCompactMode &&
        a.saturationFactor == b.saturationFactor &&
        a.showMediaDeleteButton == b.showMediaDeleteButton &&
        a.showMediaDownloadButton == b.showMediaDownloadButton &&
        a.showMediaFavoriteButton == b.showMediaFavoriteButton &&
        a.showSuppressEmbedsButton == b.showSuppressEmbedsButton &&
        a.screenReaderAnnounceNewMessages ==
            b.screenReaderAnnounceNewMessages &&
        a.enableTtsCommand == b.enableTtsCommand &&
        a.ttsRate == b.ttsRate &&
        a.alwaysUnderlineLinks == b.alwaysUnderlineLinks &&
        a.dimStrikethroughText == b.dimStrikethroughText &&
        a.showTextareaFocusRing == b.showTextareaFocusRing &&
        a.escapeExitsKeyboardMode == b.escapeExitsKeyboardMode &&
        a.showContextMenuShortcuts == b.showContextMenuShortcuts &&
        a.confirmBeforeStartingCalls == b.confirmBeforeStartingCalls &&
        a.syncReducedMotionWithSystem == b.syncReducedMotionWithSystem &&
        a.reducedMotionOverride == b.reducedMotionOverride &&
        a.mobileGifAutoplayOverridden == b.mobileGifAutoplayOverridden &&
        a.mobileAnimateEmojiOverridden == b.mobileAnimateEmojiOverridden &&
        a.mobileStickerAnimationOverridden ==
            b.mobileStickerAnimationOverridden &&
        a.mobileGifAutoplayValue == b.mobileGifAutoplayValue &&
        a.mobileAnimateEmojiValue == b.mobileAnimateEmojiValue &&
        a.mobileStickerAnimationValue == b.mobileStickerAnimationValue &&
        a.mobileSplashZoomAnimation == b.mobileSplashZoomAnimation &&
        a.hdrDisplayMode == b.hdrDisplayMode &&
        a.chatFontSize == b.chatFontSize &&
        a.scaleFactor == b.scaleFactor &&
        normalizeCustomThemeCss(a.customThemeCss) ==
            normalizeCustomThemeCss(b.customThemeCss) &&
        _advancedStatesEqual(a.advanced, b.advanced);
  }

  static bool _advancedStatesEqual(
    AdvancedAccessibilityLocalState a,
    AdvancedAccessibilityLocalState b,
  ) {
    return a.enableTextSelection == b.enableTextSelection &&
        a.voiceChannelJoinRequiresDoubleClick ==
            b.voiceChannelJoinRequiresDoubleClick &&
        a.confirmBeforeJoiningVoiceChannels ==
            b.confirmBeforeJoiningVoiceChannels &&
        a.showGifIndicator == b.showGifIndicator &&
        a.showAttachmentExpiryIndicator == b.showAttachmentExpiryIndicator &&
        a.showMessageActionBar == b.showMessageActionBar &&
        a.showMessageActionBarQuickReactions ==
            b.showMessageActionBarQuickReactions &&
        a.showMessageActionBarShiftExpand ==
            b.showMessageActionBarShiftExpand &&
        a.showMessageActionBarOnlyMoreButton ==
            b.showMessageActionBarOnlyMoreButton &&
        a.showGifButton == b.showGifButton &&
        a.showMemesButton == b.showMemesButton &&
        a.showStickersButton == b.showStickersButton &&
        a.showEmojiButton == b.showEmojiButton &&
        a.showMessageSendButton == b.showMessageSendButton &&
        a.scrollToBottomOnMessageSend == b.scrollToBottomOnMessageSend;
  }

  @override
  AccessibilityLocalState mergeForMigration({
    required AccessibilityLocalState local,
    required AccessibilityLocalState remote,
  }) {
    return AccessibilityLocalState(
      hideKeyboardHints: remote.hideKeyboardHints,
      channelTypingIndicatorMode: remote.channelTypingIndicatorMode,
      showSelectedChannelTypingIndicator:
          remote.showSelectedChannelTypingIndicator,
      showFadedUnreadOnMutedChannels: remote.showFadedUnreadOnMutedChannels,
      dmMessagePreviewMode: remote.dmMessagePreviewMode,
      showFavorites: remote.showFavorites,
      useSystemLocaleForTimeFormat: remote.useSystemLocaleForTimeFormat,
      messageGroupSpacing: remote.messageGroupSpacing,
      compactMessageGroupSpacing: remote.compactMessageGroupSpacing,
      showUserAvatarsInCompactMode: remote.showUserAvatarsInCompactMode,
      saturationFactor: remote.hasSaturationFactorInProto
          ? remote.saturationFactor
          : local.saturationFactor,
      customThemeCss:
          remote.hasCustomThemeCssInProto && remote.customThemeCss != null
          ? remote.customThemeCss
          : local.customThemeCss,
      showMediaDeleteButton: remote.showMediaDeleteButton,
      showMediaDownloadButton: remote.showMediaDownloadButton,
      showMediaFavoriteButton: remote.showMediaFavoriteButton,
      showSuppressEmbedsButton: remote.showSuppressEmbedsButton,
      screenReaderAnnounceNewMessages: remote.screenReaderAnnounceNewMessages,
      enableTtsCommand: remote.enableTtsCommand,
      ttsRate: remote.ttsRate,
      alwaysUnderlineLinks: remote.alwaysUnderlineLinks,
      dimStrikethroughText: remote.dimStrikethroughText,
      showTextareaFocusRing: remote.showTextareaFocusRing,
      escapeExitsKeyboardMode: remote.escapeExitsKeyboardMode,
      showContextMenuShortcuts: remote.showContextMenuShortcuts,
      confirmBeforeStartingCalls: remote.confirmBeforeStartingCalls,
      syncReducedMotionWithSystem: remote.syncReducedMotionWithSystem,
      reducedMotionOverride: remote.reducedMotionOverride,
      mobileGifAutoplayOverridden: remote.mobileGifAutoplayOverridden,
      mobileAnimateEmojiOverridden: remote.mobileAnimateEmojiOverridden,
      mobileStickerAnimationOverridden: remote.mobileStickerAnimationOverridden,
      mobileGifAutoplayValue: remote.mobileGifAutoplayValue,
      mobileAnimateEmojiValue: remote.mobileAnimateEmojiValue,
      mobileStickerAnimationValue: remote.mobileStickerAnimationValue,
      mobileSplashZoomAnimation: remote.mobileSplashZoomAnimation,
      hdrDisplayMode: remote.hdrDisplayMode,
      chatFontSize: remote.hasFontSizeInProto
          ? remote.chatFontSize
          : local.chatFontSize,
      scaleFactor: remote.hasZoomLevelInProto
          ? remote.scaleFactor
          : local.scaleFactor,
      advanced: remote.advanced,
      hasSaturationFactorInProto:
          remote.hasSaturationFactorInProto || local.hasSaturationFactorInProto,
      hasCustomThemeCssInProto:
          remote.hasCustomThemeCssInProto || local.hasCustomThemeCssInProto,
      hasFontSizeInProto: remote.hasFontSizeInProto || local.hasFontSizeInProto,
      hasZoomLevelInProto:
          remote.hasZoomLevelInProto || local.hasZoomLevelInProto,
    );
  }

  @override
  bool hasInboundUpdatesWhileProtected(
    AccessibilityLocalState local,
    AccessibilityLocalState remote,
  ) {
    return local.saturationFactor != remote.saturationFactor ||
        normalizeCustomThemeCss(local.customThemeCss) !=
            normalizeCustomThemeCss(remote.customThemeCss);
  }

  @override
  bool verifyRoundtrip(AccessibilityLocalState candidate) {
    final roundtripped = fromProto(toProto(candidate));
    return statesEqual(candidate, roundtripped);
  }

  static AccessibilityLocalState fromProto(pb.AccessibilitySettings proto) {
    return AccessibilityLocalState(
      hideKeyboardHints: proto.hideKeyboardHints,
      channelTypingIndicatorMode: _fromProtoTypingMode(
        proto.channelTypingIndicatorMode,
      ),
      showSelectedChannelTypingIndicator:
          proto.hasShowSelectedChannelTypingIndicator() &&
          proto.showSelectedChannelTypingIndicator,
      showFadedUnreadOnMutedChannels:
          proto.hasShowFadedUnreadOnMutedChannels() &&
          proto.showFadedUnreadOnMutedChannels,
      dmMessagePreviewMode: _fromProtoDmPreviewMode(proto.dmMessagePreviewMode),
      showFavorites: !proto.hasShowFavorites() || proto.showFavorites,
      useSystemLocaleForTimeFormat:
          proto.hasUseBrowserLocaleForTimeFormat() &&
          proto.useBrowserLocaleForTimeFormat,
      messageGroupSpacing: proto.hasMessageGroupSpacing()
          ? proto.messageGroupSpacing
          : 16,
      compactMessageGroupSpacing: proto.hasCompactMessageGroupSpacing()
          ? proto.compactMessageGroupSpacing
          : 0,
      showUserAvatarsInCompactMode:
          proto.hasShowUserAvatarsInCompactMode() &&
          proto.showUserAvatarsInCompactMode,
      saturationFactor: proto.hasSaturationFactor()
          ? clampSaturationFactor(proto.saturationFactor)
          : 1,
      customThemeCss: proto.hasCustomThemeCss()
          ? normalizeCustomThemeCss(proto.customThemeCss)
          : null,
      showMediaDeleteButton:
          !proto.hasShowMediaDeleteButton() || proto.showMediaDeleteButton,
      showMediaDownloadButton:
          !proto.hasShowMediaDownloadButton() || proto.showMediaDownloadButton,
      showMediaFavoriteButton:
          !proto.hasShowMediaFavoriteButton() || proto.showMediaFavoriteButton,
      showSuppressEmbedsButton:
          !proto.hasShowSuppressEmbedsButton() ||
          proto.showSuppressEmbedsButton,
      screenReaderAnnounceNewMessages:
          proto.hasScreenReaderAnnounceNewMessages() &&
          proto.screenReaderAnnounceNewMessages,
      advanced: AdvancedAccessibilityLocalState(
        enableTextSelection:
            proto.hasEnableTextSelection() && proto.enableTextSelection,
        voiceChannelJoinRequiresDoubleClick:
            proto.hasVoiceChannelJoinRequiresDoubleClick() &&
            proto.voiceChannelJoinRequiresDoubleClick,
        confirmBeforeJoiningVoiceChannels:
            proto.hasConfirmBeforeJoiningVoiceChannels() &&
            proto.confirmBeforeJoiningVoiceChannels,
        showGifIndicator:
            !proto.hasShowGifIndicator() || proto.showGifIndicator,
        showAttachmentExpiryIndicator:
            !proto.hasShowAttachmentExpiryIndicator() ||
            proto.showAttachmentExpiryIndicator,
        showMessageActionBar:
            !proto.hasShowMessageActionBar() || proto.showMessageActionBar,
        showMessageActionBarQuickReactions:
            !proto.hasShowMessageActionBarQuickReactions() ||
            proto.showMessageActionBarQuickReactions,
        showMessageActionBarShiftExpand:
            !proto.hasShowMessageActionBarShiftExpand() ||
            proto.showMessageActionBarShiftExpand,
        showMessageActionBarOnlyMoreButton:
            proto.hasShowMessageActionBarOnlyMoreButton() &&
            proto.showMessageActionBarOnlyMoreButton,
        showGifButton: !proto.hasShowGifButton() || proto.showGifButton,
        showMemesButton: !proto.hasShowMemesButton() || proto.showMemesButton,
        showStickersButton:
            !proto.hasShowStickersButton() || proto.showStickersButton,
        showEmojiButton: !proto.hasShowEmojiButton() || proto.showEmojiButton,
        showMessageSendButton:
            proto.hasShowMessageSendButton() && proto.showMessageSendButton,
        scrollToBottomOnMessageSend:
            !proto.hasScrollToBottomOnMessageSend() ||
            proto.scrollToBottomOnMessageSend,
      ),
      hasSaturationFactorInProto: proto.hasSaturationFactor(),
      hasCustomThemeCssInProto: proto.hasCustomThemeCss(),
      enableTtsCommand: !proto.hasEnableTtsCommand() || proto.enableTtsCommand,
      ttsRate: proto.hasTtsRate()
          ? clampTtsRate(proto.ttsRate)
          : kDefaultTtsRate,
      alwaysUnderlineLinks: proto.alwaysUnderlineLinks,
      dimStrikethroughText:
          !proto.hasDimStrikethroughText() || proto.dimStrikethroughText,
      showTextareaFocusRing:
          !proto.hasShowTextareaFocusRing() || proto.showTextareaFocusRing,
      escapeExitsKeyboardMode:
          proto.hasEscapeExitsKeyboardMode() && proto.escapeExitsKeyboardMode,
      showContextMenuShortcuts:
          proto.hasShowContextMenuShortcuts() && proto.showContextMenuShortcuts,
      confirmBeforeStartingCalls:
          !proto.hasConfirmBeforeStartingCalls() ||
          proto.confirmBeforeStartingCalls,
      syncReducedMotionWithSystem:
          !proto.hasSyncReducedMotionWithSystem() ||
          proto.syncReducedMotionWithSystem,
      reducedMotionOverride:
          proto.hasReducedMotionOverride() && proto.reducedMotionOverride,
      mobileGifAutoplayOverridden: proto.mobileGifAutoplayOverridden,
      mobileAnimateEmojiOverridden: proto.mobileAnimateEmojiOverridden,
      mobileStickerAnimationOverridden: proto.mobileStickerAnimationOverridden,
      mobileGifAutoplayValue: proto.hasMobileGifAutoplayValue()
          ? proto.mobileGifAutoplayValue
          : kDefaultMobileGifAutoPlay,
      mobileAnimateEmojiValue:
          !proto.hasMobileAnimateEmojiValue() || proto.mobileAnimateEmojiValue,
      mobileStickerAnimationValue: stickerAnimationFromJson(
        proto.hasMobileStickerAnimationValue()
            ? proto.mobileStickerAnimationValue
            : null,
      ),
      mobileSplashZoomAnimation:
          !proto.hasMobileSplashZoomAnimation() ||
          proto.mobileSplashZoomAnimation,
      hdrDisplayMode: _fromProtoHdrDisplayMode(proto.hdrDisplayMode),
      chatFontSize: proto.hasFontSize()
          ? snapChatFontSize(proto.fontSize)
          : kDefaultChatFontSize,
      scaleFactor: proto.hasZoomLevel()
          ? clampLayoutZoomLevel(protoZoomLevelToFactor(proto.zoomLevel))
          : kDefaultLayoutZoomLevel,
      hasFontSizeInProto: proto.hasFontSize(),
      hasZoomLevelInProto: proto.hasZoomLevel(),
    );
  }

  static pb.AccessibilitySettings toProtoForPush({
    required AccessibilityLocalState local,
    pb.AccessibilitySettings? wireBase,
  }) {
    final String? effectiveCss = normalizeCustomThemeCss(local.customThemeCss);
    final pb.AccessibilitySettings settings =
        (wireBase != null
              ? (pb.AccessibilitySettings()..mergeFromMessage(wireBase))
              : pb.AccessibilitySettings())
          ..hideKeyboardHints = local.hideKeyboardHints
          ..channelTypingIndicatorMode = _toProtoTypingMode(
            local.channelTypingIndicatorMode,
          )
          ..showSelectedChannelTypingIndicator =
              local.showSelectedChannelTypingIndicator
          ..showFadedUnreadOnMutedChannels =
              local.showFadedUnreadOnMutedChannels
          ..dmMessagePreviewMode = _toProtoDmPreviewMode(
            local.dmMessagePreviewMode,
          )
          ..showFavorites = local.showFavorites
          ..useBrowserLocaleForTimeFormat = local.useSystemLocaleForTimeFormat
          ..messageGroupSpacing = local.messageGroupSpacing
          ..compactMessageGroupSpacing = local.compactMessageGroupSpacing
          ..showUserAvatarsInCompactMode = local.showUserAvatarsInCompactMode
          ..saturationFactor = local.saturationFactor
          ..showMediaDeleteButton = local.showMediaDeleteButton
          ..showMediaDownloadButton = local.showMediaDownloadButton
          ..showMediaFavoriteButton = local.showMediaFavoriteButton
          ..showSuppressEmbedsButton = local.showSuppressEmbedsButton
          ..screenReaderAnnounceNewMessages =
              local.screenReaderAnnounceNewMessages
          ..enableTtsCommand = local.enableTtsCommand
          ..ttsRate = local.ttsRate
          ..alwaysUnderlineLinks = local.alwaysUnderlineLinks
          ..dimStrikethroughText = local.dimStrikethroughText
          ..showTextareaFocusRing = local.showTextareaFocusRing
          ..escapeExitsKeyboardMode = local.escapeExitsKeyboardMode
          ..showContextMenuShortcuts = local.showContextMenuShortcuts
          ..confirmBeforeStartingCalls = local.confirmBeforeStartingCalls
          ..syncReducedMotionWithSystem = local.syncReducedMotionWithSystem
          ..reducedMotionOverride = local.reducedMotionOverride
          ..mobileGifAutoplayOverridden = local.mobileGifAutoplayOverridden
          ..mobileAnimateEmojiOverridden = local.mobileAnimateEmojiOverridden
          ..mobileStickerAnimationOverridden =
              local.mobileStickerAnimationOverridden
          ..mobileGifAutoplayValue = local.mobileGifAutoplayValue
          ..mobileAnimateEmojiValue = local.mobileAnimateEmojiValue
          ..mobileStickerAnimationValue =
              local.mobileStickerAnimationValue.json ?? 1
          ..mobileSplashZoomAnimation = local.mobileSplashZoomAnimation
          ..hdrDisplayMode = _toProtoHdrDisplayMode(local.hdrDisplayMode)
          ..fontSize = local.chatFontSize.toDouble()
          ..zoomLevel = local.scaleFactor;
    _applyAdvancedToProto(settings, local.advanced, wireBase: wireBase);
    if (effectiveCss != null) {
      return settings..customThemeCss = effectiveCss;
    }
    return settings;
  }

  static pb.AccessibilitySettings toProto(AccessibilityLocalState local) {
    final String? effectiveCss = normalizeCustomThemeCss(local.customThemeCss);
    final pb.AccessibilitySettings settings = pb.AccessibilitySettings(
      hideKeyboardHints: local.hideKeyboardHints,
      channelTypingIndicatorMode: _toProtoTypingMode(
        local.channelTypingIndicatorMode,
      ),
      showSelectedChannelTypingIndicator:
          local.showSelectedChannelTypingIndicator,
      showFadedUnreadOnMutedChannels: local.showFadedUnreadOnMutedChannels,
      dmMessagePreviewMode: _toProtoDmPreviewMode(local.dmMessagePreviewMode),
      showFavorites: local.showFavorites,
      useBrowserLocaleForTimeFormat: local.useSystemLocaleForTimeFormat,
      messageGroupSpacing: local.messageGroupSpacing,
      compactMessageGroupSpacing: local.compactMessageGroupSpacing,
      showUserAvatarsInCompactMode: local.showUserAvatarsInCompactMode,
      saturationFactor: local.saturationFactor,
      showMediaDeleteButton: local.showMediaDeleteButton,
      showMediaDownloadButton: local.showMediaDownloadButton,
      showMediaFavoriteButton: local.showMediaFavoriteButton,
      showSuppressEmbedsButton: local.showSuppressEmbedsButton,
      screenReaderAnnounceNewMessages: local.screenReaderAnnounceNewMessages,
      enableTtsCommand: local.enableTtsCommand,
      ttsRate: local.ttsRate,
      alwaysUnderlineLinks: local.alwaysUnderlineLinks,
      dimStrikethroughText: local.dimStrikethroughText,
      showTextareaFocusRing: local.showTextareaFocusRing,
      escapeExitsKeyboardMode: local.escapeExitsKeyboardMode,
      showContextMenuShortcuts: local.showContextMenuShortcuts,
      confirmBeforeStartingCalls: local.confirmBeforeStartingCalls,
      syncReducedMotionWithSystem: local.syncReducedMotionWithSystem,
      reducedMotionOverride: local.reducedMotionOverride,
      mobileGifAutoplayOverridden: local.mobileGifAutoplayOverridden,
      mobileAnimateEmojiOverridden: local.mobileAnimateEmojiOverridden,
      mobileStickerAnimationOverridden: local.mobileStickerAnimationOverridden,
      mobileGifAutoplayValue: local.mobileGifAutoplayValue,
      mobileAnimateEmojiValue: local.mobileAnimateEmojiValue,
      mobileStickerAnimationValue: local.mobileStickerAnimationValue.json ?? 1,
      mobileSplashZoomAnimation: local.mobileSplashZoomAnimation,
      hdrDisplayMode: _toProtoHdrDisplayMode(local.hdrDisplayMode),
      fontSize: local.chatFontSize.toDouble(),
      zoomLevel: local.scaleFactor,
    );
    _applyAdvancedToProto(settings, local.advanced);
    if (effectiveCss != null) {
      settings.customThemeCss = effectiveCss;
    }
    return settings;
  }

  static void _applyAdvancedToProto(
    pb.AccessibilitySettings settings,
    AdvancedAccessibilityLocalState advanced, {
    pb.AccessibilitySettings? wireBase,
  }) {
    settings
      ..enableTextSelection = advanced.enableTextSelection
      ..voiceChannelJoinRequiresDoubleClick =
          advanced.voiceChannelJoinRequiresDoubleClick
      ..confirmBeforeJoiningVoiceChannels =
          advanced.confirmBeforeJoiningVoiceChannels
      ..showGifIndicator = advanced.showGifIndicator
      ..showAttachmentExpiryIndicator = advanced.showAttachmentExpiryIndicator
      ..showMessageActionBar = advanced.showMessageActionBar
      ..showMessageActionBarQuickReactions =
          advanced.showMessageActionBarQuickReactions
      ..showMessageActionBarShiftExpand =
          advanced.showMessageActionBarShiftExpand
      ..showMessageActionBarOnlyMoreButton =
          advanced.showMessageActionBarOnlyMoreButton
      ..showGifButton = advanced.showGifButton
      ..showMemesButton = advanced.showMemesButton
      ..showStickersButton = advanced.showStickersButton
      ..showEmojiButton = advanced.showEmojiButton
      ..scrollToBottomOnMessageSend = advanced.scrollToBottomOnMessageSend;
    if (wireBase == null || !wireBase.hasShowMessageSendButton()) {
      settings.showMessageSendButton = advanced.showMessageSendButton;
      return;
    }
    if (advanced.showMessageSendButton || !wireBase.showMessageSendButton) {
      settings.showMessageSendButton = advanced.showMessageSendButton;
    }
  }

  static ChannelTypingIndicatorMode _fromProtoTypingMode(
    pb.ChannelTypingIndicatorMode mode,
  ) {
    return switch (mode) {
      pb.ChannelTypingIndicatorMode.CHANNEL_TYPING_INDICATOR_MODE_HIDDEN =>
        ChannelTypingIndicatorMode.hidden,
      pb
          .ChannelTypingIndicatorMode
          .CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY =>
        ChannelTypingIndicatorMode.indicatorOnly,
      _ => ChannelTypingIndicatorMode.avatars,
    };
  }

  static pb.ChannelTypingIndicatorMode _toProtoTypingMode(
    ChannelTypingIndicatorMode mode,
  ) {
    return switch (mode) {
      ChannelTypingIndicatorMode.hidden =>
        pb.ChannelTypingIndicatorMode.CHANNEL_TYPING_INDICATOR_MODE_HIDDEN,
      ChannelTypingIndicatorMode.indicatorOnly =>
        pb
            .ChannelTypingIndicatorMode
            .CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY,
      ChannelTypingIndicatorMode.avatars =>
        pb.ChannelTypingIndicatorMode.CHANNEL_TYPING_INDICATOR_MODE_AVATARS,
    };
  }

  static DmMessagePreviewMode _fromProtoDmPreviewMode(
    pb.DmMessagePreviewMode mode,
  ) {
    return switch (mode) {
      pb.DmMessagePreviewMode.DM_MESSAGE_PREVIEW_MODE_ALL =>
        DmMessagePreviewMode.all,
      pb.DmMessagePreviewMode.DM_MESSAGE_PREVIEW_MODE_UNREAD_ONLY =>
        DmMessagePreviewMode.unreadOnly,
      pb.DmMessagePreviewMode.DM_MESSAGE_PREVIEW_MODE_NONE =>
        DmMessagePreviewMode.none,
      _ => DmMessagePreviewMode.all,
    };
  }

  static pb.DmMessagePreviewMode _toProtoDmPreviewMode(
    DmMessagePreviewMode mode,
  ) {
    return switch (mode) {
      DmMessagePreviewMode.all =>
        pb.DmMessagePreviewMode.DM_MESSAGE_PREVIEW_MODE_ALL,
      DmMessagePreviewMode.unreadOnly =>
        pb.DmMessagePreviewMode.DM_MESSAGE_PREVIEW_MODE_UNREAD_ONLY,
      DmMessagePreviewMode.none =>
        pb.DmMessagePreviewMode.DM_MESSAGE_PREVIEW_MODE_NONE,
    };
  }

  static HdrDisplayMode _fromProtoHdrDisplayMode(pb.HdrDisplayMode mode) {
    return switch (mode) {
      pb.HdrDisplayMode.HDR_DISPLAY_MODE_STANDARD => HdrDisplayMode.standard,
      _ => HdrDisplayMode.full,
    };
  }

  static pb.HdrDisplayMode _toProtoHdrDisplayMode(HdrDisplayMode mode) {
    return switch (mode) {
      HdrDisplayMode.standard => pb.HdrDisplayMode.HDR_DISPLAY_MODE_STANDARD,
      HdrDisplayMode.full => pb.HdrDisplayMode.HDR_DISPLAY_MODE_FULL,
    };
  }
}
