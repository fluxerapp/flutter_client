// This is a generated file - do not edit.
//
// Generated from fluxer/user/preferences/v1/accessibility.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'accessibility.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'accessibility.pbenum.dart';

class AccessibilitySettings extends $pb.GeneratedMessage {
  factory AccessibilitySettings({
    $core.double? saturationFactor,
    $core.bool? alwaysUnderlineLinks,
    $core.bool? enableTextSelection,
    $core.bool? showMessageSendButton,
    $core.bool? showTextareaFocusRing,
    $core.bool? hideKeyboardHints,
    $core.bool? escapeExitsKeyboardMode,
    $core.bool? syncReducedMotionWithSystem,
    $core.bool? reducedMotionOverride,
    $core.double? messageGroupSpacing,
    $core.double? messageGutter,
    $core.double? fontSize,
    $core.bool? showUserAvatarsInCompactMode,
    $core.bool? mobileStickerAnimationOverridden,
    $core.bool? mobileGifAutoplayOverridden,
    $core.bool? mobileAnimateEmojiOverridden,
    $core.int? mobileStickerAnimationValue,
    $core.bool? mobileGifAutoplayValue,
    $core.bool? mobileAnimateEmojiValue,
    $core.bool? autoSendKlipyGifs,
    $core.bool? showGifButton,
    $core.bool? showMemesButton,
    $core.bool? showStickersButton,
    $core.bool? showEmojiButton,
    $core.bool? showMediaFavoriteButton,
    $core.bool? showMediaDownloadButton,
    $core.bool? showMediaDeleteButton,
    $core.bool? showSuppressEmbedsButton,
    $core.bool? showGifIndicator,
    $core.bool? showAttachmentExpiryIndicator,
    $core.bool? useBrowserLocaleForTimeFormat,
    ChannelTypingIndicatorMode? channelTypingIndicatorMode,
    $core.bool? showSelectedChannelTypingIndicator,
    $core.bool? showMessageActionBar,
    $core.bool? showMessageActionBarQuickReactions,
    $core.bool? showMessageActionBarShiftExpand,
    $core.bool? showMessageActionBarOnlyMoreButton,
    $core.bool? showDefaultEmojisInAutocomplete,
    $core.bool? showCustomEmojisInAutocomplete,
    $core.bool? showStickersInAutocomplete,
    $core.bool? showMemesInAutocomplete,
    MediaDimensionSize? attachmentMediaDimensionSize,
    MediaDimensionSize? embedMediaDimensionSize,
    $core.bool? voiceChannelJoinRequiresDoubleClick,
    $core.String? customThemeCss,
    $core.bool? showFavorites,
    $core.double? zoomLevel,
    DmMessagePreviewMode? dmMessagePreviewMode,
    $core.bool? enableTtsCommand,
    $core.double? ttsRate,
    $core.bool? showFadedUnreadOnMutedChannels,
    $core.bool? showContextMenuShortcuts,
    $core.bool? confirmBeforeStartingCalls,
    HdrDisplayMode? hdrDisplayMode,
    $core.bool? preserveEditDraft,
    $core.bool? stayInteractiveWhenUnfocused,
    $core.bool? confirmBeforeJoiningVoiceChannels,
    $core.bool? screenReaderAnnounceNewMessages,
    $core.bool? firstClickPassThroughWhenUnfocused,
    $core.double? compactMessageGroupSpacing,
    $core.bool? scrollToBottomOnMessageSend,
    $core.bool? dimStrikethroughText,
    $core.bool? sequentialFileSend,
    $core.bool? mobileSplashZoomAnimation,
  }) {
    final result = create();
    if (saturationFactor != null) result.saturationFactor = saturationFactor;
    if (alwaysUnderlineLinks != null)
      result.alwaysUnderlineLinks = alwaysUnderlineLinks;
    if (enableTextSelection != null)
      result.enableTextSelection = enableTextSelection;
    if (showMessageSendButton != null)
      result.showMessageSendButton = showMessageSendButton;
    if (showTextareaFocusRing != null)
      result.showTextareaFocusRing = showTextareaFocusRing;
    if (hideKeyboardHints != null) result.hideKeyboardHints = hideKeyboardHints;
    if (escapeExitsKeyboardMode != null)
      result.escapeExitsKeyboardMode = escapeExitsKeyboardMode;
    if (syncReducedMotionWithSystem != null)
      result.syncReducedMotionWithSystem = syncReducedMotionWithSystem;
    if (reducedMotionOverride != null)
      result.reducedMotionOverride = reducedMotionOverride;
    if (messageGroupSpacing != null)
      result.messageGroupSpacing = messageGroupSpacing;
    if (messageGutter != null) result.messageGutter = messageGutter;
    if (fontSize != null) result.fontSize = fontSize;
    if (showUserAvatarsInCompactMode != null)
      result.showUserAvatarsInCompactMode = showUserAvatarsInCompactMode;
    if (mobileStickerAnimationOverridden != null)
      result.mobileStickerAnimationOverridden =
          mobileStickerAnimationOverridden;
    if (mobileGifAutoplayOverridden != null)
      result.mobileGifAutoplayOverridden = mobileGifAutoplayOverridden;
    if (mobileAnimateEmojiOverridden != null)
      result.mobileAnimateEmojiOverridden = mobileAnimateEmojiOverridden;
    if (mobileStickerAnimationValue != null)
      result.mobileStickerAnimationValue = mobileStickerAnimationValue;
    if (mobileGifAutoplayValue != null)
      result.mobileGifAutoplayValue = mobileGifAutoplayValue;
    if (mobileAnimateEmojiValue != null)
      result.mobileAnimateEmojiValue = mobileAnimateEmojiValue;
    if (autoSendKlipyGifs != null) result.autoSendKlipyGifs = autoSendKlipyGifs;
    if (showGifButton != null) result.showGifButton = showGifButton;
    if (showMemesButton != null) result.showMemesButton = showMemesButton;
    if (showStickersButton != null)
      result.showStickersButton = showStickersButton;
    if (showEmojiButton != null) result.showEmojiButton = showEmojiButton;
    if (showMediaFavoriteButton != null)
      result.showMediaFavoriteButton = showMediaFavoriteButton;
    if (showMediaDownloadButton != null)
      result.showMediaDownloadButton = showMediaDownloadButton;
    if (showMediaDeleteButton != null)
      result.showMediaDeleteButton = showMediaDeleteButton;
    if (showSuppressEmbedsButton != null)
      result.showSuppressEmbedsButton = showSuppressEmbedsButton;
    if (showGifIndicator != null) result.showGifIndicator = showGifIndicator;
    if (showAttachmentExpiryIndicator != null)
      result.showAttachmentExpiryIndicator = showAttachmentExpiryIndicator;
    if (useBrowserLocaleForTimeFormat != null)
      result.useBrowserLocaleForTimeFormat = useBrowserLocaleForTimeFormat;
    if (channelTypingIndicatorMode != null)
      result.channelTypingIndicatorMode = channelTypingIndicatorMode;
    if (showSelectedChannelTypingIndicator != null)
      result.showSelectedChannelTypingIndicator =
          showSelectedChannelTypingIndicator;
    if (showMessageActionBar != null)
      result.showMessageActionBar = showMessageActionBar;
    if (showMessageActionBarQuickReactions != null)
      result.showMessageActionBarQuickReactions =
          showMessageActionBarQuickReactions;
    if (showMessageActionBarShiftExpand != null)
      result.showMessageActionBarShiftExpand = showMessageActionBarShiftExpand;
    if (showMessageActionBarOnlyMoreButton != null)
      result.showMessageActionBarOnlyMoreButton =
          showMessageActionBarOnlyMoreButton;
    if (showDefaultEmojisInAutocomplete != null)
      result.showDefaultEmojisInAutocomplete = showDefaultEmojisInAutocomplete;
    if (showCustomEmojisInAutocomplete != null)
      result.showCustomEmojisInAutocomplete = showCustomEmojisInAutocomplete;
    if (showStickersInAutocomplete != null)
      result.showStickersInAutocomplete = showStickersInAutocomplete;
    if (showMemesInAutocomplete != null)
      result.showMemesInAutocomplete = showMemesInAutocomplete;
    if (attachmentMediaDimensionSize != null)
      result.attachmentMediaDimensionSize = attachmentMediaDimensionSize;
    if (embedMediaDimensionSize != null)
      result.embedMediaDimensionSize = embedMediaDimensionSize;
    if (voiceChannelJoinRequiresDoubleClick != null)
      result.voiceChannelJoinRequiresDoubleClick =
          voiceChannelJoinRequiresDoubleClick;
    if (customThemeCss != null) result.customThemeCss = customThemeCss;
    if (showFavorites != null) result.showFavorites = showFavorites;
    if (zoomLevel != null) result.zoomLevel = zoomLevel;
    if (dmMessagePreviewMode != null)
      result.dmMessagePreviewMode = dmMessagePreviewMode;
    if (enableTtsCommand != null) result.enableTtsCommand = enableTtsCommand;
    if (ttsRate != null) result.ttsRate = ttsRate;
    if (showFadedUnreadOnMutedChannels != null)
      result.showFadedUnreadOnMutedChannels = showFadedUnreadOnMutedChannels;
    if (showContextMenuShortcuts != null)
      result.showContextMenuShortcuts = showContextMenuShortcuts;
    if (confirmBeforeStartingCalls != null)
      result.confirmBeforeStartingCalls = confirmBeforeStartingCalls;
    if (hdrDisplayMode != null) result.hdrDisplayMode = hdrDisplayMode;
    if (preserveEditDraft != null) result.preserveEditDraft = preserveEditDraft;
    if (stayInteractiveWhenUnfocused != null)
      result.stayInteractiveWhenUnfocused = stayInteractiveWhenUnfocused;
    if (confirmBeforeJoiningVoiceChannels != null)
      result.confirmBeforeJoiningVoiceChannels =
          confirmBeforeJoiningVoiceChannels;
    if (screenReaderAnnounceNewMessages != null)
      result.screenReaderAnnounceNewMessages = screenReaderAnnounceNewMessages;
    if (firstClickPassThroughWhenUnfocused != null)
      result.firstClickPassThroughWhenUnfocused =
          firstClickPassThroughWhenUnfocused;
    if (compactMessageGroupSpacing != null)
      result.compactMessageGroupSpacing = compactMessageGroupSpacing;
    if (scrollToBottomOnMessageSend != null)
      result.scrollToBottomOnMessageSend = scrollToBottomOnMessageSend;
    if (dimStrikethroughText != null)
      result.dimStrikethroughText = dimStrikethroughText;
    if (sequentialFileSend != null)
      result.sequentialFileSend = sequentialFileSend;
    if (mobileSplashZoomAnimation != null)
      result.mobileSplashZoomAnimation = mobileSplashZoomAnimation;
    return result;
  }

  AccessibilitySettings._();

  factory AccessibilitySettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccessibilitySettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccessibilitySettings',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aD(1, _omitFieldNames ? '' : 'saturationFactor')
    ..aOB(2, _omitFieldNames ? '' : 'alwaysUnderlineLinks')
    ..aOB(3, _omitFieldNames ? '' : 'enableTextSelection')
    ..aOB(4, _omitFieldNames ? '' : 'showMessageSendButton')
    ..aOB(5, _omitFieldNames ? '' : 'showTextareaFocusRing')
    ..aOB(6, _omitFieldNames ? '' : 'hideKeyboardHints')
    ..aOB(7, _omitFieldNames ? '' : 'escapeExitsKeyboardMode')
    ..aOB(8, _omitFieldNames ? '' : 'syncReducedMotionWithSystem')
    ..aOB(9, _omitFieldNames ? '' : 'reducedMotionOverride')
    ..aD(10, _omitFieldNames ? '' : 'messageGroupSpacing')
    ..aD(11, _omitFieldNames ? '' : 'messageGutter')
    ..aD(12, _omitFieldNames ? '' : 'fontSize')
    ..aOB(13, _omitFieldNames ? '' : 'showUserAvatarsInCompactMode')
    ..aOB(14, _omitFieldNames ? '' : 'mobileStickerAnimationOverridden')
    ..aOB(15, _omitFieldNames ? '' : 'mobileGifAutoplayOverridden')
    ..aOB(16, _omitFieldNames ? '' : 'mobileAnimateEmojiOverridden')
    ..aI(17, _omitFieldNames ? '' : 'mobileStickerAnimationValue')
    ..aOB(18, _omitFieldNames ? '' : 'mobileGifAutoplayValue')
    ..aOB(19, _omitFieldNames ? '' : 'mobileAnimateEmojiValue')
    ..aOB(20, _omitFieldNames ? '' : 'autoSendKlipyGifs')
    ..aOB(21, _omitFieldNames ? '' : 'showGifButton')
    ..aOB(22, _omitFieldNames ? '' : 'showMemesButton')
    ..aOB(23, _omitFieldNames ? '' : 'showStickersButton')
    ..aOB(24, _omitFieldNames ? '' : 'showEmojiButton')
    ..aOB(25, _omitFieldNames ? '' : 'showMediaFavoriteButton')
    ..aOB(26, _omitFieldNames ? '' : 'showMediaDownloadButton')
    ..aOB(27, _omitFieldNames ? '' : 'showMediaDeleteButton')
    ..aOB(28, _omitFieldNames ? '' : 'showSuppressEmbedsButton')
    ..aOB(29, _omitFieldNames ? '' : 'showGifIndicator')
    ..aOB(30, _omitFieldNames ? '' : 'showAttachmentExpiryIndicator')
    ..aOB(31, _omitFieldNames ? '' : 'useBrowserLocaleForTimeFormat')
    ..aE<ChannelTypingIndicatorMode>(
        32, _omitFieldNames ? '' : 'channelTypingIndicatorMode',
        enumValues: ChannelTypingIndicatorMode.values)
    ..aOB(33, _omitFieldNames ? '' : 'showSelectedChannelTypingIndicator')
    ..aOB(34, _omitFieldNames ? '' : 'showMessageActionBar')
    ..aOB(35, _omitFieldNames ? '' : 'showMessageActionBarQuickReactions')
    ..aOB(36, _omitFieldNames ? '' : 'showMessageActionBarShiftExpand')
    ..aOB(37, _omitFieldNames ? '' : 'showMessageActionBarOnlyMoreButton')
    ..aOB(38, _omitFieldNames ? '' : 'showDefaultEmojisInAutocomplete')
    ..aOB(39, _omitFieldNames ? '' : 'showCustomEmojisInAutocomplete')
    ..aOB(40, _omitFieldNames ? '' : 'showStickersInAutocomplete')
    ..aOB(41, _omitFieldNames ? '' : 'showMemesInAutocomplete')
    ..aE<MediaDimensionSize>(
        42, _omitFieldNames ? '' : 'attachmentMediaDimensionSize',
        enumValues: MediaDimensionSize.values)
    ..aE<MediaDimensionSize>(
        43, _omitFieldNames ? '' : 'embedMediaDimensionSize',
        enumValues: MediaDimensionSize.values)
    ..aOB(44, _omitFieldNames ? '' : 'voiceChannelJoinRequiresDoubleClick')
    ..aOS(45, _omitFieldNames ? '' : 'customThemeCss')
    ..aOB(46, _omitFieldNames ? '' : 'showFavorites')
    ..aD(47, _omitFieldNames ? '' : 'zoomLevel')
    ..aE<DmMessagePreviewMode>(
        48, _omitFieldNames ? '' : 'dmMessagePreviewMode',
        enumValues: DmMessagePreviewMode.values)
    ..aOB(49, _omitFieldNames ? '' : 'enableTtsCommand')
    ..aD(50, _omitFieldNames ? '' : 'ttsRate')
    ..aOB(51, _omitFieldNames ? '' : 'showFadedUnreadOnMutedChannels')
    ..aOB(52, _omitFieldNames ? '' : 'showContextMenuShortcuts')
    ..aOB(53, _omitFieldNames ? '' : 'confirmBeforeStartingCalls')
    ..aE<HdrDisplayMode>(54, _omitFieldNames ? '' : 'hdrDisplayMode',
        enumValues: HdrDisplayMode.values)
    ..aOB(55, _omitFieldNames ? '' : 'preserveEditDraft')
    ..aOB(56, _omitFieldNames ? '' : 'stayInteractiveWhenUnfocused')
    ..aOB(57, _omitFieldNames ? '' : 'confirmBeforeJoiningVoiceChannels')
    ..aOB(58, _omitFieldNames ? '' : 'screenReaderAnnounceNewMessages')
    ..aOB(59, _omitFieldNames ? '' : 'firstClickPassThroughWhenUnfocused')
    ..aD(60, _omitFieldNames ? '' : 'compactMessageGroupSpacing')
    ..aOB(61, _omitFieldNames ? '' : 'scrollToBottomOnMessageSend')
    ..aOB(62, _omitFieldNames ? '' : 'dimStrikethroughText')
    ..aOB(63, _omitFieldNames ? '' : 'sequentialFileSend')
    ..aOB(64, _omitFieldNames ? '' : 'mobileSplashZoomAnimation')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessibilitySettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessibilitySettings copyWith(
          void Function(AccessibilitySettings) updates) =>
      super.copyWith((message) => updates(message as AccessibilitySettings))
          as AccessibilitySettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessibilitySettings create() => AccessibilitySettings._();
  @$core.override
  AccessibilitySettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccessibilitySettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccessibilitySettings>(create);
  static AccessibilitySettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get saturationFactor => $_getN(0);
  @$pb.TagNumber(1)
  set saturationFactor($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSaturationFactor() => $_has(0);
  @$pb.TagNumber(1)
  void clearSaturationFactor() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get alwaysUnderlineLinks => $_getBF(1);
  @$pb.TagNumber(2)
  set alwaysUnderlineLinks($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAlwaysUnderlineLinks() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlwaysUnderlineLinks() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get enableTextSelection => $_getBF(2);
  @$pb.TagNumber(3)
  set enableTextSelection($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEnableTextSelection() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnableTextSelection() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get showMessageSendButton => $_getBF(3);
  @$pb.TagNumber(4)
  set showMessageSendButton($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShowMessageSendButton() => $_has(3);
  @$pb.TagNumber(4)
  void clearShowMessageSendButton() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get showTextareaFocusRing => $_getBF(4);
  @$pb.TagNumber(5)
  set showTextareaFocusRing($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasShowTextareaFocusRing() => $_has(4);
  @$pb.TagNumber(5)
  void clearShowTextareaFocusRing() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get hideKeyboardHints => $_getBF(5);
  @$pb.TagNumber(6)
  set hideKeyboardHints($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasHideKeyboardHints() => $_has(5);
  @$pb.TagNumber(6)
  void clearHideKeyboardHints() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get escapeExitsKeyboardMode => $_getBF(6);
  @$pb.TagNumber(7)
  set escapeExitsKeyboardMode($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEscapeExitsKeyboardMode() => $_has(6);
  @$pb.TagNumber(7)
  void clearEscapeExitsKeyboardMode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get syncReducedMotionWithSystem => $_getBF(7);
  @$pb.TagNumber(8)
  set syncReducedMotionWithSystem($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSyncReducedMotionWithSystem() => $_has(7);
  @$pb.TagNumber(8)
  void clearSyncReducedMotionWithSystem() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get reducedMotionOverride => $_getBF(8);
  @$pb.TagNumber(9)
  set reducedMotionOverride($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasReducedMotionOverride() => $_has(8);
  @$pb.TagNumber(9)
  void clearReducedMotionOverride() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get messageGroupSpacing => $_getN(9);
  @$pb.TagNumber(10)
  set messageGroupSpacing($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasMessageGroupSpacing() => $_has(9);
  @$pb.TagNumber(10)
  void clearMessageGroupSpacing() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get messageGutter => $_getN(10);
  @$pb.TagNumber(11)
  set messageGutter($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasMessageGutter() => $_has(10);
  @$pb.TagNumber(11)
  void clearMessageGutter() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get fontSize => $_getN(11);
  @$pb.TagNumber(12)
  set fontSize($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFontSize() => $_has(11);
  @$pb.TagNumber(12)
  void clearFontSize() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get showUserAvatarsInCompactMode => $_getBF(12);
  @$pb.TagNumber(13)
  set showUserAvatarsInCompactMode($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasShowUserAvatarsInCompactMode() => $_has(12);
  @$pb.TagNumber(13)
  void clearShowUserAvatarsInCompactMode() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.bool get mobileStickerAnimationOverridden => $_getBF(13);
  @$pb.TagNumber(14)
  set mobileStickerAnimationOverridden($core.bool value) =>
      $_setBool(13, value);
  @$pb.TagNumber(14)
  $core.bool hasMobileStickerAnimationOverridden() => $_has(13);
  @$pb.TagNumber(14)
  void clearMobileStickerAnimationOverridden() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.bool get mobileGifAutoplayOverridden => $_getBF(14);
  @$pb.TagNumber(15)
  set mobileGifAutoplayOverridden($core.bool value) => $_setBool(14, value);
  @$pb.TagNumber(15)
  $core.bool hasMobileGifAutoplayOverridden() => $_has(14);
  @$pb.TagNumber(15)
  void clearMobileGifAutoplayOverridden() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get mobileAnimateEmojiOverridden => $_getBF(15);
  @$pb.TagNumber(16)
  set mobileAnimateEmojiOverridden($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasMobileAnimateEmojiOverridden() => $_has(15);
  @$pb.TagNumber(16)
  void clearMobileAnimateEmojiOverridden() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.int get mobileStickerAnimationValue => $_getIZ(16);
  @$pb.TagNumber(17)
  set mobileStickerAnimationValue($core.int value) =>
      $_setSignedInt32(16, value);
  @$pb.TagNumber(17)
  $core.bool hasMobileStickerAnimationValue() => $_has(16);
  @$pb.TagNumber(17)
  void clearMobileStickerAnimationValue() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.bool get mobileGifAutoplayValue => $_getBF(17);
  @$pb.TagNumber(18)
  set mobileGifAutoplayValue($core.bool value) => $_setBool(17, value);
  @$pb.TagNumber(18)
  $core.bool hasMobileGifAutoplayValue() => $_has(17);
  @$pb.TagNumber(18)
  void clearMobileGifAutoplayValue() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.bool get mobileAnimateEmojiValue => $_getBF(18);
  @$pb.TagNumber(19)
  set mobileAnimateEmojiValue($core.bool value) => $_setBool(18, value);
  @$pb.TagNumber(19)
  $core.bool hasMobileAnimateEmojiValue() => $_has(18);
  @$pb.TagNumber(19)
  void clearMobileAnimateEmojiValue() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.bool get autoSendKlipyGifs => $_getBF(19);
  @$pb.TagNumber(20)
  set autoSendKlipyGifs($core.bool value) => $_setBool(19, value);
  @$pb.TagNumber(20)
  $core.bool hasAutoSendKlipyGifs() => $_has(19);
  @$pb.TagNumber(20)
  void clearAutoSendKlipyGifs() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.bool get showGifButton => $_getBF(20);
  @$pb.TagNumber(21)
  set showGifButton($core.bool value) => $_setBool(20, value);
  @$pb.TagNumber(21)
  $core.bool hasShowGifButton() => $_has(20);
  @$pb.TagNumber(21)
  void clearShowGifButton() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.bool get showMemesButton => $_getBF(21);
  @$pb.TagNumber(22)
  set showMemesButton($core.bool value) => $_setBool(21, value);
  @$pb.TagNumber(22)
  $core.bool hasShowMemesButton() => $_has(21);
  @$pb.TagNumber(22)
  void clearShowMemesButton() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.bool get showStickersButton => $_getBF(22);
  @$pb.TagNumber(23)
  set showStickersButton($core.bool value) => $_setBool(22, value);
  @$pb.TagNumber(23)
  $core.bool hasShowStickersButton() => $_has(22);
  @$pb.TagNumber(23)
  void clearShowStickersButton() => $_clearField(23);

  @$pb.TagNumber(24)
  $core.bool get showEmojiButton => $_getBF(23);
  @$pb.TagNumber(24)
  set showEmojiButton($core.bool value) => $_setBool(23, value);
  @$pb.TagNumber(24)
  $core.bool hasShowEmojiButton() => $_has(23);
  @$pb.TagNumber(24)
  void clearShowEmojiButton() => $_clearField(24);

  @$pb.TagNumber(25)
  $core.bool get showMediaFavoriteButton => $_getBF(24);
  @$pb.TagNumber(25)
  set showMediaFavoriteButton($core.bool value) => $_setBool(24, value);
  @$pb.TagNumber(25)
  $core.bool hasShowMediaFavoriteButton() => $_has(24);
  @$pb.TagNumber(25)
  void clearShowMediaFavoriteButton() => $_clearField(25);

  @$pb.TagNumber(26)
  $core.bool get showMediaDownloadButton => $_getBF(25);
  @$pb.TagNumber(26)
  set showMediaDownloadButton($core.bool value) => $_setBool(25, value);
  @$pb.TagNumber(26)
  $core.bool hasShowMediaDownloadButton() => $_has(25);
  @$pb.TagNumber(26)
  void clearShowMediaDownloadButton() => $_clearField(26);

  @$pb.TagNumber(27)
  $core.bool get showMediaDeleteButton => $_getBF(26);
  @$pb.TagNumber(27)
  set showMediaDeleteButton($core.bool value) => $_setBool(26, value);
  @$pb.TagNumber(27)
  $core.bool hasShowMediaDeleteButton() => $_has(26);
  @$pb.TagNumber(27)
  void clearShowMediaDeleteButton() => $_clearField(27);

  @$pb.TagNumber(28)
  $core.bool get showSuppressEmbedsButton => $_getBF(27);
  @$pb.TagNumber(28)
  set showSuppressEmbedsButton($core.bool value) => $_setBool(27, value);
  @$pb.TagNumber(28)
  $core.bool hasShowSuppressEmbedsButton() => $_has(27);
  @$pb.TagNumber(28)
  void clearShowSuppressEmbedsButton() => $_clearField(28);

  @$pb.TagNumber(29)
  $core.bool get showGifIndicator => $_getBF(28);
  @$pb.TagNumber(29)
  set showGifIndicator($core.bool value) => $_setBool(28, value);
  @$pb.TagNumber(29)
  $core.bool hasShowGifIndicator() => $_has(28);
  @$pb.TagNumber(29)
  void clearShowGifIndicator() => $_clearField(29);

  @$pb.TagNumber(30)
  $core.bool get showAttachmentExpiryIndicator => $_getBF(29);
  @$pb.TagNumber(30)
  set showAttachmentExpiryIndicator($core.bool value) => $_setBool(29, value);
  @$pb.TagNumber(30)
  $core.bool hasShowAttachmentExpiryIndicator() => $_has(29);
  @$pb.TagNumber(30)
  void clearShowAttachmentExpiryIndicator() => $_clearField(30);

  @$pb.TagNumber(31)
  $core.bool get useBrowserLocaleForTimeFormat => $_getBF(30);
  @$pb.TagNumber(31)
  set useBrowserLocaleForTimeFormat($core.bool value) => $_setBool(30, value);
  @$pb.TagNumber(31)
  $core.bool hasUseBrowserLocaleForTimeFormat() => $_has(30);
  @$pb.TagNumber(31)
  void clearUseBrowserLocaleForTimeFormat() => $_clearField(31);

  @$pb.TagNumber(32)
  ChannelTypingIndicatorMode get channelTypingIndicatorMode => $_getN(31);
  @$pb.TagNumber(32)
  set channelTypingIndicatorMode(ChannelTypingIndicatorMode value) =>
      $_setField(32, value);
  @$pb.TagNumber(32)
  $core.bool hasChannelTypingIndicatorMode() => $_has(31);
  @$pb.TagNumber(32)
  void clearChannelTypingIndicatorMode() => $_clearField(32);

  @$pb.TagNumber(33)
  $core.bool get showSelectedChannelTypingIndicator => $_getBF(32);
  @$pb.TagNumber(33)
  set showSelectedChannelTypingIndicator($core.bool value) =>
      $_setBool(32, value);
  @$pb.TagNumber(33)
  $core.bool hasShowSelectedChannelTypingIndicator() => $_has(32);
  @$pb.TagNumber(33)
  void clearShowSelectedChannelTypingIndicator() => $_clearField(33);

  @$pb.TagNumber(34)
  $core.bool get showMessageActionBar => $_getBF(33);
  @$pb.TagNumber(34)
  set showMessageActionBar($core.bool value) => $_setBool(33, value);
  @$pb.TagNumber(34)
  $core.bool hasShowMessageActionBar() => $_has(33);
  @$pb.TagNumber(34)
  void clearShowMessageActionBar() => $_clearField(34);

  @$pb.TagNumber(35)
  $core.bool get showMessageActionBarQuickReactions => $_getBF(34);
  @$pb.TagNumber(35)
  set showMessageActionBarQuickReactions($core.bool value) =>
      $_setBool(34, value);
  @$pb.TagNumber(35)
  $core.bool hasShowMessageActionBarQuickReactions() => $_has(34);
  @$pb.TagNumber(35)
  void clearShowMessageActionBarQuickReactions() => $_clearField(35);

  @$pb.TagNumber(36)
  $core.bool get showMessageActionBarShiftExpand => $_getBF(35);
  @$pb.TagNumber(36)
  set showMessageActionBarShiftExpand($core.bool value) => $_setBool(35, value);
  @$pb.TagNumber(36)
  $core.bool hasShowMessageActionBarShiftExpand() => $_has(35);
  @$pb.TagNumber(36)
  void clearShowMessageActionBarShiftExpand() => $_clearField(36);

  @$pb.TagNumber(37)
  $core.bool get showMessageActionBarOnlyMoreButton => $_getBF(36);
  @$pb.TagNumber(37)
  set showMessageActionBarOnlyMoreButton($core.bool value) =>
      $_setBool(36, value);
  @$pb.TagNumber(37)
  $core.bool hasShowMessageActionBarOnlyMoreButton() => $_has(36);
  @$pb.TagNumber(37)
  void clearShowMessageActionBarOnlyMoreButton() => $_clearField(37);

  @$pb.TagNumber(38)
  $core.bool get showDefaultEmojisInAutocomplete => $_getBF(37);
  @$pb.TagNumber(38)
  set showDefaultEmojisInAutocomplete($core.bool value) => $_setBool(37, value);
  @$pb.TagNumber(38)
  $core.bool hasShowDefaultEmojisInAutocomplete() => $_has(37);
  @$pb.TagNumber(38)
  void clearShowDefaultEmojisInAutocomplete() => $_clearField(38);

  @$pb.TagNumber(39)
  $core.bool get showCustomEmojisInAutocomplete => $_getBF(38);
  @$pb.TagNumber(39)
  set showCustomEmojisInAutocomplete($core.bool value) => $_setBool(38, value);
  @$pb.TagNumber(39)
  $core.bool hasShowCustomEmojisInAutocomplete() => $_has(38);
  @$pb.TagNumber(39)
  void clearShowCustomEmojisInAutocomplete() => $_clearField(39);

  @$pb.TagNumber(40)
  $core.bool get showStickersInAutocomplete => $_getBF(39);
  @$pb.TagNumber(40)
  set showStickersInAutocomplete($core.bool value) => $_setBool(39, value);
  @$pb.TagNumber(40)
  $core.bool hasShowStickersInAutocomplete() => $_has(39);
  @$pb.TagNumber(40)
  void clearShowStickersInAutocomplete() => $_clearField(40);

  @$pb.TagNumber(41)
  $core.bool get showMemesInAutocomplete => $_getBF(40);
  @$pb.TagNumber(41)
  set showMemesInAutocomplete($core.bool value) => $_setBool(40, value);
  @$pb.TagNumber(41)
  $core.bool hasShowMemesInAutocomplete() => $_has(40);
  @$pb.TagNumber(41)
  void clearShowMemesInAutocomplete() => $_clearField(41);

  @$pb.TagNumber(42)
  MediaDimensionSize get attachmentMediaDimensionSize => $_getN(41);
  @$pb.TagNumber(42)
  set attachmentMediaDimensionSize(MediaDimensionSize value) =>
      $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasAttachmentMediaDimensionSize() => $_has(41);
  @$pb.TagNumber(42)
  void clearAttachmentMediaDimensionSize() => $_clearField(42);

  @$pb.TagNumber(43)
  MediaDimensionSize get embedMediaDimensionSize => $_getN(42);
  @$pb.TagNumber(43)
  set embedMediaDimensionSize(MediaDimensionSize value) =>
      $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasEmbedMediaDimensionSize() => $_has(42);
  @$pb.TagNumber(43)
  void clearEmbedMediaDimensionSize() => $_clearField(43);

  @$pb.TagNumber(44)
  $core.bool get voiceChannelJoinRequiresDoubleClick => $_getBF(43);
  @$pb.TagNumber(44)
  set voiceChannelJoinRequiresDoubleClick($core.bool value) =>
      $_setBool(43, value);
  @$pb.TagNumber(44)
  $core.bool hasVoiceChannelJoinRequiresDoubleClick() => $_has(43);
  @$pb.TagNumber(44)
  void clearVoiceChannelJoinRequiresDoubleClick() => $_clearField(44);

  @$pb.TagNumber(45)
  $core.String get customThemeCss => $_getSZ(44);
  @$pb.TagNumber(45)
  set customThemeCss($core.String value) => $_setString(44, value);
  @$pb.TagNumber(45)
  $core.bool hasCustomThemeCss() => $_has(44);
  @$pb.TagNumber(45)
  void clearCustomThemeCss() => $_clearField(45);

  @$pb.TagNumber(46)
  $core.bool get showFavorites => $_getBF(45);
  @$pb.TagNumber(46)
  set showFavorites($core.bool value) => $_setBool(45, value);
  @$pb.TagNumber(46)
  $core.bool hasShowFavorites() => $_has(45);
  @$pb.TagNumber(46)
  void clearShowFavorites() => $_clearField(46);

  @$pb.TagNumber(47)
  $core.double get zoomLevel => $_getN(46);
  @$pb.TagNumber(47)
  set zoomLevel($core.double value) => $_setDouble(46, value);
  @$pb.TagNumber(47)
  $core.bool hasZoomLevel() => $_has(46);
  @$pb.TagNumber(47)
  void clearZoomLevel() => $_clearField(47);

  @$pb.TagNumber(48)
  DmMessagePreviewMode get dmMessagePreviewMode => $_getN(47);
  @$pb.TagNumber(48)
  set dmMessagePreviewMode(DmMessagePreviewMode value) => $_setField(48, value);
  @$pb.TagNumber(48)
  $core.bool hasDmMessagePreviewMode() => $_has(47);
  @$pb.TagNumber(48)
  void clearDmMessagePreviewMode() => $_clearField(48);

  @$pb.TagNumber(49)
  $core.bool get enableTtsCommand => $_getBF(48);
  @$pb.TagNumber(49)
  set enableTtsCommand($core.bool value) => $_setBool(48, value);
  @$pb.TagNumber(49)
  $core.bool hasEnableTtsCommand() => $_has(48);
  @$pb.TagNumber(49)
  void clearEnableTtsCommand() => $_clearField(49);

  @$pb.TagNumber(50)
  $core.double get ttsRate => $_getN(49);
  @$pb.TagNumber(50)
  set ttsRate($core.double value) => $_setDouble(49, value);
  @$pb.TagNumber(50)
  $core.bool hasTtsRate() => $_has(49);
  @$pb.TagNumber(50)
  void clearTtsRate() => $_clearField(50);

  @$pb.TagNumber(51)
  $core.bool get showFadedUnreadOnMutedChannels => $_getBF(50);
  @$pb.TagNumber(51)
  set showFadedUnreadOnMutedChannels($core.bool value) => $_setBool(50, value);
  @$pb.TagNumber(51)
  $core.bool hasShowFadedUnreadOnMutedChannels() => $_has(50);
  @$pb.TagNumber(51)
  void clearShowFadedUnreadOnMutedChannels() => $_clearField(51);

  @$pb.TagNumber(52)
  $core.bool get showContextMenuShortcuts => $_getBF(51);
  @$pb.TagNumber(52)
  set showContextMenuShortcuts($core.bool value) => $_setBool(51, value);
  @$pb.TagNumber(52)
  $core.bool hasShowContextMenuShortcuts() => $_has(51);
  @$pb.TagNumber(52)
  void clearShowContextMenuShortcuts() => $_clearField(52);

  @$pb.TagNumber(53)
  $core.bool get confirmBeforeStartingCalls => $_getBF(52);
  @$pb.TagNumber(53)
  set confirmBeforeStartingCalls($core.bool value) => $_setBool(52, value);
  @$pb.TagNumber(53)
  $core.bool hasConfirmBeforeStartingCalls() => $_has(52);
  @$pb.TagNumber(53)
  void clearConfirmBeforeStartingCalls() => $_clearField(53);

  @$pb.TagNumber(54)
  HdrDisplayMode get hdrDisplayMode => $_getN(53);
  @$pb.TagNumber(54)
  set hdrDisplayMode(HdrDisplayMode value) => $_setField(54, value);
  @$pb.TagNumber(54)
  $core.bool hasHdrDisplayMode() => $_has(53);
  @$pb.TagNumber(54)
  void clearHdrDisplayMode() => $_clearField(54);

  @$pb.TagNumber(55)
  $core.bool get preserveEditDraft => $_getBF(54);
  @$pb.TagNumber(55)
  set preserveEditDraft($core.bool value) => $_setBool(54, value);
  @$pb.TagNumber(55)
  $core.bool hasPreserveEditDraft() => $_has(54);
  @$pb.TagNumber(55)
  void clearPreserveEditDraft() => $_clearField(55);

  @$pb.TagNumber(56)
  $core.bool get stayInteractiveWhenUnfocused => $_getBF(55);
  @$pb.TagNumber(56)
  set stayInteractiveWhenUnfocused($core.bool value) => $_setBool(55, value);
  @$pb.TagNumber(56)
  $core.bool hasStayInteractiveWhenUnfocused() => $_has(55);
  @$pb.TagNumber(56)
  void clearStayInteractiveWhenUnfocused() => $_clearField(56);

  @$pb.TagNumber(57)
  $core.bool get confirmBeforeJoiningVoiceChannels => $_getBF(56);
  @$pb.TagNumber(57)
  set confirmBeforeJoiningVoiceChannels($core.bool value) =>
      $_setBool(56, value);
  @$pb.TagNumber(57)
  $core.bool hasConfirmBeforeJoiningVoiceChannels() => $_has(56);
  @$pb.TagNumber(57)
  void clearConfirmBeforeJoiningVoiceChannels() => $_clearField(57);

  @$pb.TagNumber(58)
  $core.bool get screenReaderAnnounceNewMessages => $_getBF(57);
  @$pb.TagNumber(58)
  set screenReaderAnnounceNewMessages($core.bool value) => $_setBool(57, value);
  @$pb.TagNumber(58)
  $core.bool hasScreenReaderAnnounceNewMessages() => $_has(57);
  @$pb.TagNumber(58)
  void clearScreenReaderAnnounceNewMessages() => $_clearField(58);

  @$pb.TagNumber(59)
  $core.bool get firstClickPassThroughWhenUnfocused => $_getBF(58);
  @$pb.TagNumber(59)
  set firstClickPassThroughWhenUnfocused($core.bool value) =>
      $_setBool(58, value);
  @$pb.TagNumber(59)
  $core.bool hasFirstClickPassThroughWhenUnfocused() => $_has(58);
  @$pb.TagNumber(59)
  void clearFirstClickPassThroughWhenUnfocused() => $_clearField(59);

  @$pb.TagNumber(60)
  $core.double get compactMessageGroupSpacing => $_getN(59);
  @$pb.TagNumber(60)
  set compactMessageGroupSpacing($core.double value) => $_setDouble(59, value);
  @$pb.TagNumber(60)
  $core.bool hasCompactMessageGroupSpacing() => $_has(59);
  @$pb.TagNumber(60)
  void clearCompactMessageGroupSpacing() => $_clearField(60);

  @$pb.TagNumber(61)
  $core.bool get scrollToBottomOnMessageSend => $_getBF(60);
  @$pb.TagNumber(61)
  set scrollToBottomOnMessageSend($core.bool value) => $_setBool(60, value);
  @$pb.TagNumber(61)
  $core.bool hasScrollToBottomOnMessageSend() => $_has(60);
  @$pb.TagNumber(61)
  void clearScrollToBottomOnMessageSend() => $_clearField(61);

  @$pb.TagNumber(62)
  $core.bool get dimStrikethroughText => $_getBF(61);
  @$pb.TagNumber(62)
  set dimStrikethroughText($core.bool value) => $_setBool(61, value);
  @$pb.TagNumber(62)
  $core.bool hasDimStrikethroughText() => $_has(61);
  @$pb.TagNumber(62)
  void clearDimStrikethroughText() => $_clearField(62);

  @$pb.TagNumber(63)
  $core.bool get sequentialFileSend => $_getBF(62);
  @$pb.TagNumber(63)
  set sequentialFileSend($core.bool value) => $_setBool(62, value);
  @$pb.TagNumber(63)
  $core.bool hasSequentialFileSend() => $_has(62);
  @$pb.TagNumber(63)
  void clearSequentialFileSend() => $_clearField(63);

  @$pb.TagNumber(64)
  $core.bool get mobileSplashZoomAnimation => $_getBF(63);
  @$pb.TagNumber(64)
  set mobileSplashZoomAnimation($core.bool value) => $_setBool(63, value);
  @$pb.TagNumber(64)
  $core.bool hasMobileSplashZoomAnimation() => $_has(63);
  @$pb.TagNumber(64)
  void clearMobileSplashZoomAnimation() => $_clearField(64);
}

class AccessibilityOverrides extends $pb.GeneratedMessage {
  factory AccessibilityOverrides({
    $core.bool? gifAutoplayDirty,
    $core.bool? animateEmojiDirty,
    $core.bool? animateStickersDirty,
  }) {
    final result = create();
    if (gifAutoplayDirty != null) result.gifAutoplayDirty = gifAutoplayDirty;
    if (animateEmojiDirty != null) result.animateEmojiDirty = animateEmojiDirty;
    if (animateStickersDirty != null)
      result.animateStickersDirty = animateStickersDirty;
    return result;
  }

  AccessibilityOverrides._();

  factory AccessibilityOverrides.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AccessibilityOverrides.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AccessibilityOverrides',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'fluxer.user.preferences.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'gifAutoplayDirty')
    ..aOB(2, _omitFieldNames ? '' : 'animateEmojiDirty')
    ..aOB(3, _omitFieldNames ? '' : 'animateStickersDirty')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessibilityOverrides clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AccessibilityOverrides copyWith(
          void Function(AccessibilityOverrides) updates) =>
      super.copyWith((message) => updates(message as AccessibilityOverrides))
          as AccessibilityOverrides;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccessibilityOverrides create() => AccessibilityOverrides._();
  @$core.override
  AccessibilityOverrides createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AccessibilityOverrides getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AccessibilityOverrides>(create);
  static AccessibilityOverrides? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get gifAutoplayDirty => $_getBF(0);
  @$pb.TagNumber(1)
  set gifAutoplayDirty($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGifAutoplayDirty() => $_has(0);
  @$pb.TagNumber(1)
  void clearGifAutoplayDirty() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get animateEmojiDirty => $_getBF(1);
  @$pb.TagNumber(2)
  set animateEmojiDirty($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAnimateEmojiDirty() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnimateEmojiDirty() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get animateStickersDirty => $_getBF(2);
  @$pb.TagNumber(3)
  set animateStickersDirty($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAnimateStickersDirty() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnimateStickersDirty() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
