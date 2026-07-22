import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as prefs;
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
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
    this.showMediaDeleteButton = true,
    this.showMediaDownloadButton = true,
    this.showMediaFavoriteButton = true,
    this.showSuppressEmbedsButton = true,
    this.hasSaturationFactorInProto = true,
    this.hasCustomThemeCssInProto = true,
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
  final double saturationFactor;
  final String? customThemeCss;
  final bool showMediaDeleteButton;
  final bool showMediaDownloadButton;
  final bool showMediaFavoriteButton;
  final bool showSuppressEmbedsButton;
  final bool hasSaturationFactorInProto;
  final bool hasCustomThemeCssInProto;
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
      saturationFactor: theme.saturationFactor,
      customThemeCss: theme.customThemeCss,
      showMediaDeleteButton: appearance.showMediaDeleteButton,
      showMediaDownloadButton: appearance.showMediaDownloadButton,
      showMediaFavoriteButton: appearance.showMediaFavoriteButton,
      showSuppressEmbedsButton: appearance.showSuppressEmbedsButton,
    );
  }

  @override
  Future<void> applyRemote(AccessibilityLocalState value) async {
    final appearanceNotifier = _ref.read(
      appearancePreferencesProvider.notifier,
    );
    final themeNotifier = _ref.read(themePreferenceProvider.notifier);
    await appearanceNotifier.applySyncedAccessibility(value);
    await themeNotifier.applySyncedThemeCustomization(
      saturationFactor: value.saturationFactor,
      customThemeCss: value.customThemeCss,
      updateSaturationFactor: value.hasSaturationFactorInProto,
      updateCustomThemeCss:
          value.hasCustomThemeCssInProto && value.customThemeCss != null,
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
        a.saturationFactor == b.saturationFactor &&
        a.showMediaDeleteButton == b.showMediaDeleteButton &&
        a.showMediaDownloadButton == b.showMediaDownloadButton &&
        a.showMediaFavoriteButton == b.showMediaFavoriteButton &&
        a.showSuppressEmbedsButton == b.showSuppressEmbedsButton &&
        normalizeCustomThemeCss(a.customThemeCss) ==
            normalizeCustomThemeCss(b.customThemeCss);
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
      hasSaturationFactorInProto:
          remote.hasSaturationFactorInProto || local.hasSaturationFactorInProto,
      hasCustomThemeCssInProto:
          remote.hasCustomThemeCssInProto || local.hasCustomThemeCssInProto,
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
      hasSaturationFactorInProto: proto.hasSaturationFactor(),
      hasCustomThemeCssInProto: proto.hasCustomThemeCss(),
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
          ..saturationFactor = local.saturationFactor
          ..showMediaDeleteButton = local.showMediaDeleteButton
          ..showMediaDownloadButton = local.showMediaDownloadButton
          ..showMediaFavoriteButton = local.showMediaFavoriteButton
          ..showSuppressEmbedsButton = local.showSuppressEmbedsButton;
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
      saturationFactor: local.saturationFactor,
      showMediaDeleteButton: local.showMediaDeleteButton,
      showMediaDownloadButton: local.showMediaDownloadButton,
      showMediaFavoriteButton: local.showMediaFavoriteButton,
      showSuppressEmbedsButton: local.showSuppressEmbedsButton,
    );
    if (effectiveCss != null) {
      settings.customThemeCss = effectiveCss;
    }
    return settings;
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
}
