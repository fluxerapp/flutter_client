import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/accessibility_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

void main() {
  group('AccessibilitySyncedField', () {
    test('roundtrips mapped appearance fields', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: true,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.hidden,
        showSelectedChannelTypingIndicator: true,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.unreadOnly,
        showFavorites: false,
        useSystemLocaleForTimeFormat: true,
        messageGroupSpacing: 24,
        compactMessageGroupSpacing: 4,
        saturationFactor: 0.8,
        customThemeCss: ':root { --background-primary: #010203; }',
        advanced: kDefaultAdvancedAccessibility,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.hideKeyboardHints, isTrue);
      expect(
        restored.channelTypingIndicatorMode,
        ChannelTypingIndicatorMode.hidden,
      );
      expect(restored.showSelectedChannelTypingIndicator, isTrue);
      expect(restored.showFadedUnreadOnMutedChannels, isFalse);
      expect(restored.dmMessagePreviewMode, DmMessagePreviewMode.unreadOnly);
      expect(restored.showFavorites, isFalse);
      expect(restored.useSystemLocaleForTimeFormat, isTrue);
      expect(restored.messageGroupSpacing, 24);
      expect(restored.compactMessageGroupSpacing, 4);
      expect(restored.saturationFactor, 0.8);
      expect(restored.customThemeCss, local.customThemeCss);
    });

    test('maps proto channel typing indicator modes', () {
      final message = pb.SyncedPreferences(
        accessibility: accessibility_pb.AccessibilitySettings(
          channelTypingIndicatorMode: accessibility_pb
              .ChannelTypingIndicatorMode
              .CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY,
        ),
      );
      final restored = AccessibilitySyncedField.fromProto(
        message.accessibility,
      );
      expect(
        restored.channelTypingIndicatorMode,
        ChannelTypingIndicatorMode.indicatorOnly,
      );
    });

    test('defaults group spacing when proto omits the fields', () {
      final restored = AccessibilitySyncedField.fromProto(
        accessibility_pb.AccessibilitySettings(),
      );
      expect(restored.messageGroupSpacing, 16);
      expect(restored.compactMessageGroupSpacing, 0);
      expect(restored.saturationFactor, 1);
      expect(restored.customThemeCss, isNull);
      expect(restored.hdrDisplayMode, HdrDisplayMode.full);
      expect(restored.chatFontSize, 16);
      expect(restored.scaleFactor, 1);
      expect(restored.hasFontSizeInProto, isFalse);
      expect(restored.hasZoomLevelInProto, isFalse);
    });

    test('normalizes empty custom theme css to null on read', () {
      final restored = AccessibilitySyncedField.fromProto(
        accessibility_pb.AccessibilitySettings(customThemeCss: '   '),
      );
      expect(restored.customThemeCss, isNull);
    });

    test('roundtrips chat font size and zoom level', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        chatFontSize: 20,
        scaleFactor: 1.2,
        advanced: kDefaultAdvancedAccessibility,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.chatFontSize, 20);
      expect(restored.scaleFactor, 1.2);
      expect(restored.hasFontSizeInProto, isTrue);
      expect(restored.hasZoomLevelInProto, isTrue);
    });

    test('maps unspecified HDR proto to full', () {
      final restored = AccessibilitySyncedField.fromProto(
        accessibility_pb.AccessibilitySettings(),
      );
      expect(restored.hdrDisplayMode, HdrDisplayMode.full);
    });

    test('roundtrips HDR display mode', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        hdrDisplayMode: HdrDisplayMode.standard,
        advanced: kDefaultAdvancedAccessibility,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      expect(
        proto.hdrDisplayMode,
        accessibility_pb.HdrDisplayMode.HDR_DISPLAY_MODE_STANDARD,
      );
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.hdrDisplayMode, HdrDisplayMode.standard);
    });

    test('reads percent zoom level from proto', () {
      final restored = AccessibilitySyncedField.fromProto(
        accessibility_pb.AccessibilitySettings(zoomLevel: 120),
      );
      expect(restored.scaleFactor, 1.2);
      expect(restored.hasZoomLevelInProto, isTrue);
    });

    test('roundtrips screen reader announce preference', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        screenReaderAnnounceNewMessages: true,
        advanced: kDefaultAdvancedAccessibility,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.screenReaderAnnounceNewMessages, isTrue);
    });

    test('toProtoForPush preserves desktop-only fields from wire base', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: true,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        hasSaturationFactorInProto: false,
        hasCustomThemeCssInProto: false,
        advanced: kDefaultAdvancedAccessibility,
      );
      final wireBase = accessibility_pb.AccessibilitySettings(
        showMessageSendButton: true,
        autoSendKlipyGifs: true,
        syncReducedMotionWithSystem: false,
        reducedMotionOverride: true,
      );
      final pushed = AccessibilitySyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );
      expect(pushed.showMessageSendButton, isTrue);
      expect(pushed.autoSendKlipyGifs, isTrue);
      expect(pushed.hideKeyboardHints, isTrue);
      expect(pushed.syncReducedMotionWithSystem, isTrue);
      expect(pushed.reducedMotionOverride, isFalse);
    });

    test('roundtrips motion and underline accessibility fields', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        alwaysUnderlineLinks: true,
        dimStrikethroughText: false,
        showTextareaFocusRing: false,
        escapeExitsKeyboardMode: true,
        showContextMenuShortcuts: true,
        confirmBeforeStartingCalls: false,
        syncReducedMotionWithSystem: false,
        reducedMotionOverride: true,
        mobileGifAutoplayOverridden: true,
        mobileAnimateEmojiOverridden: true,
        mobileStickerAnimationOverridden: true,
        mobileAnimateEmojiValue: false,
        advanced: kDefaultAdvancedAccessibility,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.alwaysUnderlineLinks, isTrue);
      expect(restored.dimStrikethroughText, isFalse);
      expect(restored.showTextareaFocusRing, isFalse);
      expect(restored.escapeExitsKeyboardMode, isTrue);
      expect(restored.showContextMenuShortcuts, isTrue);
      expect(restored.confirmBeforeStartingCalls, isFalse);
      expect(restored.syncReducedMotionWithSystem, isFalse);
      expect(restored.reducedMotionOverride, isTrue);
      expect(restored.mobileGifAutoplayOverridden, isTrue);
      expect(restored.mobileAnimateEmojiOverridden, isTrue);
      expect(restored.mobileStickerAnimationOverridden, isTrue);
      expect(restored.mobileGifAutoplayValue, isTrue);
      expect(restored.mobileAnimateEmojiValue, isFalse);
    });

    test('defaults mobile splash zoom animation to enabled when unset', () {
      final restored = AccessibilitySyncedField.fromProto(
        accessibility_pb.AccessibilitySettings(),
      );
      expect(restored.mobileSplashZoomAnimation, isTrue);
    });

    test('roundtrips mobile splash zoom animation', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        mobileSplashZoomAnimation: false,
        advanced: kDefaultAdvancedAccessibility,
      );
      final proto = AccessibilitySyncedField.toProto(local);
      final restored = AccessibilitySyncedField.fromProto(proto);
      expect(restored.mobileSplashZoomAnimation, isFalse);
    });

    test('toProtoForPush keeps wire custom theme css when local has none', () {
      const local = AccessibilityLocalState(
        hideKeyboardHints: false,
        channelTypingIndicatorMode: ChannelTypingIndicatorMode.avatars,
        showSelectedChannelTypingIndicator: false,
        showFadedUnreadOnMutedChannels: false,
        dmMessagePreviewMode: DmMessagePreviewMode.all,
        showFavorites: true,
        useSystemLocaleForTimeFormat: false,
        messageGroupSpacing: 16,
        compactMessageGroupSpacing: 0,
        saturationFactor: 1,
        customThemeCss: null,
        hasSaturationFactorInProto: false,
        hasCustomThemeCssInProto: false,
        advanced: kDefaultAdvancedAccessibility,
      );
      const css = ':root { --brand-primary: #010203; }';
      final wireBase = accessibility_pb.AccessibilitySettings(
        customThemeCss: css,
      );
      final pushed = AccessibilitySyncedField.toProtoForPush(
        local: local,
        wireBase: wireBase,
      );
      expect(pushed.customThemeCss, css);
    });
  });
}
