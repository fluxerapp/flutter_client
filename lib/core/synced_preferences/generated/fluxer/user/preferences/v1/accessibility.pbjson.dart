// This is a generated file - do not edit.
//
// Generated from fluxer/user/preferences/v1/accessibility.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use channelTypingIndicatorModeDescriptor instead')
const ChannelTypingIndicatorMode$json = {
  '1': 'ChannelTypingIndicatorMode',
  '2': [
    {'1': 'CHANNEL_TYPING_INDICATOR_MODE_UNSPECIFIED', '2': 0},
    {'1': 'CHANNEL_TYPING_INDICATOR_MODE_AVATARS', '2': 1},
    {'1': 'CHANNEL_TYPING_INDICATOR_MODE_INDICATOR_ONLY', '2': 2},
    {'1': 'CHANNEL_TYPING_INDICATOR_MODE_HIDDEN', '2': 3},
  ],
};

/// Descriptor for `ChannelTypingIndicatorMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List channelTypingIndicatorModeDescriptor = $convert.base64Decode(
    'ChpDaGFubmVsVHlwaW5nSW5kaWNhdG9yTW9kZRItCilDSEFOTkVMX1RZUElOR19JTkRJQ0FUT1'
    'JfTU9ERV9VTlNQRUNJRklFRBAAEikKJUNIQU5ORUxfVFlQSU5HX0lORElDQVRPUl9NT0RFX0FW'
    'QVRBUlMQARIwCixDSEFOTkVMX1RZUElOR19JTkRJQ0FUT1JfTU9ERV9JTkRJQ0FUT1JfT05MWR'
    'ACEigKJENIQU5ORUxfVFlQSU5HX0lORElDQVRPUl9NT0RFX0hJRERFThAD');

@$core.Deprecated('Use mediaDimensionSizeDescriptor instead')
const MediaDimensionSize$json = {
  '1': 'MediaDimensionSize',
  '2': [
    {'1': 'MEDIA_DIMENSION_SIZE_UNSPECIFIED', '2': 0},
    {'1': 'MEDIA_DIMENSION_SIZE_SMALL', '2': 1},
    {'1': 'MEDIA_DIMENSION_SIZE_LARGE', '2': 2},
  ],
};

/// Descriptor for `MediaDimensionSize`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaDimensionSizeDescriptor = $convert.base64Decode(
    'ChJNZWRpYURpbWVuc2lvblNpemUSJAogTUVESUFfRElNRU5TSU9OX1NJWkVfVU5TUEVDSUZJRU'
    'QQABIeChpNRURJQV9ESU1FTlNJT05fU0laRV9TTUFMTBABEh4KGk1FRElBX0RJTUVOU0lPTl9T'
    'SVpFX0xBUkdFEAI=');

@$core.Deprecated('Use dmMessagePreviewModeDescriptor instead')
const DmMessagePreviewMode$json = {
  '1': 'DmMessagePreviewMode',
  '2': [
    {'1': 'DM_MESSAGE_PREVIEW_MODE_UNSPECIFIED', '2': 0},
    {'1': 'DM_MESSAGE_PREVIEW_MODE_ALL', '2': 1},
    {'1': 'DM_MESSAGE_PREVIEW_MODE_UNREAD_ONLY', '2': 2},
    {'1': 'DM_MESSAGE_PREVIEW_MODE_NONE', '2': 3},
  ],
};

/// Descriptor for `DmMessagePreviewMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dmMessagePreviewModeDescriptor = $convert.base64Decode(
    'ChREbU1lc3NhZ2VQcmV2aWV3TW9kZRInCiNETV9NRVNTQUdFX1BSRVZJRVdfTU9ERV9VTlNQRU'
    'NJRklFRBAAEh8KG0RNX01FU1NBR0VfUFJFVklFV19NT0RFX0FMTBABEicKI0RNX01FU1NBR0Vf'
    'UFJFVklFV19NT0RFX1VOUkVBRF9PTkxZEAISIAocRE1fTUVTU0FHRV9QUkVWSUVXX01PREVfTk'
    '9ORRAD');

@$core.Deprecated('Use hdrDisplayModeDescriptor instead')
const HdrDisplayMode$json = {
  '1': 'HdrDisplayMode',
  '2': [
    {'1': 'HDR_DISPLAY_MODE_UNSPECIFIED', '2': 0},
    {'1': 'HDR_DISPLAY_MODE_FULL', '2': 1},
    {'1': 'HDR_DISPLAY_MODE_STANDARD', '2': 2},
  ],
};

/// Descriptor for `HdrDisplayMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List hdrDisplayModeDescriptor = $convert.base64Decode(
    'Cg5IZHJEaXNwbGF5TW9kZRIgChxIRFJfRElTUExBWV9NT0RFX1VOU1BFQ0lGSUVEEAASGQoVSE'
    'RSX0RJU1BMQVlfTU9ERV9GVUxMEAESHQoZSERSX0RJU1BMQVlfTU9ERV9TVEFOREFSRBAC');

@$core.Deprecated('Use accessibilitySettingsDescriptor instead')
const AccessibilitySettings$json = {
  '1': 'AccessibilitySettings',
  '2': [
    {
      '1': 'saturation_factor',
      '3': 1,
      '4': 1,
      '5': 1,
      '9': 0,
      '10': 'saturationFactor',
      '17': true
    },
    {
      '1': 'always_underline_links',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'alwaysUnderlineLinks'
    },
    {
      '1': 'enable_text_selection',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'enableTextSelection',
      '17': true
    },
    {
      '1': 'show_message_send_button',
      '3': 4,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'showMessageSendButton',
      '17': true
    },
    {
      '1': 'show_textarea_focus_ring',
      '3': 5,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'showTextareaFocusRing',
      '17': true
    },
    {
      '1': 'hide_keyboard_hints',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'hideKeyboardHints'
    },
    {
      '1': 'escape_exits_keyboard_mode',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'escapeExitsKeyboardMode',
      '17': true
    },
    {
      '1': 'sync_reduced_motion_with_system',
      '3': 8,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'syncReducedMotionWithSystem',
      '17': true
    },
    {
      '1': 'reduced_motion_override',
      '3': 9,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'reducedMotionOverride',
      '17': true
    },
    {
      '1': 'message_group_spacing',
      '3': 10,
      '4': 1,
      '5': 1,
      '9': 7,
      '10': 'messageGroupSpacing',
      '17': true
    },
    {
      '1': 'message_gutter',
      '3': 11,
      '4': 1,
      '5': 1,
      '9': 8,
      '10': 'messageGutter',
      '17': true
    },
    {
      '1': 'font_size',
      '3': 12,
      '4': 1,
      '5': 1,
      '9': 9,
      '10': 'fontSize',
      '17': true
    },
    {
      '1': 'show_user_avatars_in_compact_mode',
      '3': 13,
      '4': 1,
      '5': 8,
      '9': 10,
      '10': 'showUserAvatarsInCompactMode',
      '17': true
    },
    {
      '1': 'mobile_sticker_animation_overridden',
      '3': 14,
      '4': 1,
      '5': 8,
      '10': 'mobileStickerAnimationOverridden'
    },
    {
      '1': 'mobile_gif_autoplay_overridden',
      '3': 15,
      '4': 1,
      '5': 8,
      '10': 'mobileGifAutoplayOverridden'
    },
    {
      '1': 'mobile_animate_emoji_overridden',
      '3': 16,
      '4': 1,
      '5': 8,
      '10': 'mobileAnimateEmojiOverridden'
    },
    {
      '1': 'mobile_sticker_animation_value',
      '3': 17,
      '4': 1,
      '5': 5,
      '9': 11,
      '10': 'mobileStickerAnimationValue',
      '17': true
    },
    {
      '1': 'mobile_gif_autoplay_value',
      '3': 18,
      '4': 1,
      '5': 8,
      '9': 12,
      '10': 'mobileGifAutoplayValue',
      '17': true
    },
    {
      '1': 'mobile_animate_emoji_value',
      '3': 19,
      '4': 1,
      '5': 8,
      '9': 13,
      '10': 'mobileAnimateEmojiValue',
      '17': true
    },
    {
      '1': 'auto_send_klipy_gifs',
      '3': 20,
      '4': 1,
      '5': 8,
      '10': 'autoSendKlipyGifs'
    },
    {
      '1': 'show_gif_button',
      '3': 21,
      '4': 1,
      '5': 8,
      '9': 14,
      '10': 'showGifButton',
      '17': true
    },
    {
      '1': 'show_memes_button',
      '3': 22,
      '4': 1,
      '5': 8,
      '9': 15,
      '10': 'showMemesButton',
      '17': true
    },
    {
      '1': 'show_stickers_button',
      '3': 23,
      '4': 1,
      '5': 8,
      '9': 16,
      '10': 'showStickersButton',
      '17': true
    },
    {
      '1': 'show_emoji_button',
      '3': 24,
      '4': 1,
      '5': 8,
      '9': 17,
      '10': 'showEmojiButton',
      '17': true
    },
    {
      '1': 'show_media_favorite_button',
      '3': 25,
      '4': 1,
      '5': 8,
      '9': 18,
      '10': 'showMediaFavoriteButton',
      '17': true
    },
    {
      '1': 'show_media_download_button',
      '3': 26,
      '4': 1,
      '5': 8,
      '9': 19,
      '10': 'showMediaDownloadButton',
      '17': true
    },
    {
      '1': 'show_media_delete_button',
      '3': 27,
      '4': 1,
      '5': 8,
      '9': 20,
      '10': 'showMediaDeleteButton',
      '17': true
    },
    {
      '1': 'show_suppress_embeds_button',
      '3': 28,
      '4': 1,
      '5': 8,
      '9': 21,
      '10': 'showSuppressEmbedsButton',
      '17': true
    },
    {
      '1': 'show_gif_indicator',
      '3': 29,
      '4': 1,
      '5': 8,
      '9': 22,
      '10': 'showGifIndicator',
      '17': true
    },
    {
      '1': 'show_attachment_expiry_indicator',
      '3': 30,
      '4': 1,
      '5': 8,
      '9': 23,
      '10': 'showAttachmentExpiryIndicator',
      '17': true
    },
    {
      '1': 'use_browser_locale_for_time_format',
      '3': 31,
      '4': 1,
      '5': 8,
      '9': 24,
      '10': 'useBrowserLocaleForTimeFormat',
      '17': true
    },
    {
      '1': 'channel_typing_indicator_mode',
      '3': 32,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.ChannelTypingIndicatorMode',
      '10': 'channelTypingIndicatorMode'
    },
    {
      '1': 'show_selected_channel_typing_indicator',
      '3': 33,
      '4': 1,
      '5': 8,
      '9': 25,
      '10': 'showSelectedChannelTypingIndicator',
      '17': true
    },
    {
      '1': 'show_message_action_bar',
      '3': 34,
      '4': 1,
      '5': 8,
      '9': 26,
      '10': 'showMessageActionBar',
      '17': true
    },
    {
      '1': 'show_message_action_bar_quick_reactions',
      '3': 35,
      '4': 1,
      '5': 8,
      '9': 27,
      '10': 'showMessageActionBarQuickReactions',
      '17': true
    },
    {
      '1': 'show_message_action_bar_shift_expand',
      '3': 36,
      '4': 1,
      '5': 8,
      '9': 28,
      '10': 'showMessageActionBarShiftExpand',
      '17': true
    },
    {
      '1': 'show_message_action_bar_only_more_button',
      '3': 37,
      '4': 1,
      '5': 8,
      '9': 29,
      '10': 'showMessageActionBarOnlyMoreButton',
      '17': true
    },
    {
      '1': 'show_default_emojis_in_autocomplete',
      '3': 38,
      '4': 1,
      '5': 8,
      '9': 30,
      '10': 'showDefaultEmojisInAutocomplete',
      '17': true
    },
    {
      '1': 'show_custom_emojis_in_autocomplete',
      '3': 39,
      '4': 1,
      '5': 8,
      '9': 31,
      '10': 'showCustomEmojisInAutocomplete',
      '17': true
    },
    {
      '1': 'show_stickers_in_autocomplete',
      '3': 40,
      '4': 1,
      '5': 8,
      '9': 32,
      '10': 'showStickersInAutocomplete',
      '17': true
    },
    {
      '1': 'show_memes_in_autocomplete',
      '3': 41,
      '4': 1,
      '5': 8,
      '9': 33,
      '10': 'showMemesInAutocomplete',
      '17': true
    },
    {
      '1': 'attachment_media_dimension_size',
      '3': 42,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.MediaDimensionSize',
      '10': 'attachmentMediaDimensionSize'
    },
    {
      '1': 'embed_media_dimension_size',
      '3': 43,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.MediaDimensionSize',
      '10': 'embedMediaDimensionSize'
    },
    {
      '1': 'voice_channel_join_requires_double_click',
      '3': 44,
      '4': 1,
      '5': 8,
      '9': 34,
      '10': 'voiceChannelJoinRequiresDoubleClick',
      '17': true
    },
    {
      '1': 'custom_theme_css',
      '3': 45,
      '4': 1,
      '5': 9,
      '9': 35,
      '10': 'customThemeCss',
      '17': true
    },
    {
      '1': 'show_favorites',
      '3': 46,
      '4': 1,
      '5': 8,
      '9': 36,
      '10': 'showFavorites',
      '17': true
    },
    {
      '1': 'zoom_level',
      '3': 47,
      '4': 1,
      '5': 1,
      '9': 37,
      '10': 'zoomLevel',
      '17': true
    },
    {
      '1': 'dm_message_preview_mode',
      '3': 48,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.DmMessagePreviewMode',
      '10': 'dmMessagePreviewMode'
    },
    {
      '1': 'enable_tts_command',
      '3': 49,
      '4': 1,
      '5': 8,
      '9': 38,
      '10': 'enableTtsCommand',
      '17': true
    },
    {
      '1': 'tts_rate',
      '3': 50,
      '4': 1,
      '5': 1,
      '9': 39,
      '10': 'ttsRate',
      '17': true
    },
    {
      '1': 'show_faded_unread_on_muted_channels',
      '3': 51,
      '4': 1,
      '5': 8,
      '9': 40,
      '10': 'showFadedUnreadOnMutedChannels',
      '17': true
    },
    {
      '1': 'show_context_menu_shortcuts',
      '3': 52,
      '4': 1,
      '5': 8,
      '9': 41,
      '10': 'showContextMenuShortcuts',
      '17': true
    },
    {
      '1': 'confirm_before_starting_calls',
      '3': 53,
      '4': 1,
      '5': 8,
      '9': 42,
      '10': 'confirmBeforeStartingCalls',
      '17': true
    },
    {
      '1': 'hdr_display_mode',
      '3': 54,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.HdrDisplayMode',
      '10': 'hdrDisplayMode'
    },
    {
      '1': 'preserve_edit_draft',
      '3': 55,
      '4': 1,
      '5': 8,
      '9': 43,
      '10': 'preserveEditDraft',
      '17': true
    },
    {
      '1': 'stay_interactive_when_unfocused',
      '3': 56,
      '4': 1,
      '5': 8,
      '9': 44,
      '10': 'stayInteractiveWhenUnfocused',
      '17': true
    },
    {
      '1': 'confirm_before_joining_voice_channels',
      '3': 57,
      '4': 1,
      '5': 8,
      '9': 45,
      '10': 'confirmBeforeJoiningVoiceChannels',
      '17': true
    },
    {
      '1': 'screen_reader_announce_new_messages',
      '3': 58,
      '4': 1,
      '5': 8,
      '9': 46,
      '10': 'screenReaderAnnounceNewMessages',
      '17': true
    },
    {
      '1': 'first_click_pass_through_when_unfocused',
      '3': 59,
      '4': 1,
      '5': 8,
      '9': 47,
      '10': 'firstClickPassThroughWhenUnfocused',
      '17': true
    },
    {
      '1': 'compact_message_group_spacing',
      '3': 60,
      '4': 1,
      '5': 1,
      '9': 48,
      '10': 'compactMessageGroupSpacing',
      '17': true
    },
    {
      '1': 'scroll_to_bottom_on_message_send',
      '3': 61,
      '4': 1,
      '5': 8,
      '9': 49,
      '10': 'scrollToBottomOnMessageSend',
      '17': true
    },
    {
      '1': 'dim_strikethrough_text',
      '3': 62,
      '4': 1,
      '5': 8,
      '9': 50,
      '10': 'dimStrikethroughText',
      '17': true
    },
    {
      '1': 'sequential_file_send',
      '3': 63,
      '4': 1,
      '5': 8,
      '9': 51,
      '10': 'sequentialFileSend',
      '17': true
    },
    {
      '1': 'mobile_splash_zoom_animation',
      '3': 64,
      '4': 1,
      '5': 8,
      '9': 52,
      '10': 'mobileSplashZoomAnimation',
      '17': true
    },
  ],
  '8': [
    {'1': '_saturation_factor'},
    {'1': '_enable_text_selection'},
    {'1': '_show_message_send_button'},
    {'1': '_show_textarea_focus_ring'},
    {'1': '_escape_exits_keyboard_mode'},
    {'1': '_sync_reduced_motion_with_system'},
    {'1': '_reduced_motion_override'},
    {'1': '_message_group_spacing'},
    {'1': '_message_gutter'},
    {'1': '_font_size'},
    {'1': '_show_user_avatars_in_compact_mode'},
    {'1': '_mobile_sticker_animation_value'},
    {'1': '_mobile_gif_autoplay_value'},
    {'1': '_mobile_animate_emoji_value'},
    {'1': '_show_gif_button'},
    {'1': '_show_memes_button'},
    {'1': '_show_stickers_button'},
    {'1': '_show_emoji_button'},
    {'1': '_show_media_favorite_button'},
    {'1': '_show_media_download_button'},
    {'1': '_show_media_delete_button'},
    {'1': '_show_suppress_embeds_button'},
    {'1': '_show_gif_indicator'},
    {'1': '_show_attachment_expiry_indicator'},
    {'1': '_use_browser_locale_for_time_format'},
    {'1': '_show_selected_channel_typing_indicator'},
    {'1': '_show_message_action_bar'},
    {'1': '_show_message_action_bar_quick_reactions'},
    {'1': '_show_message_action_bar_shift_expand'},
    {'1': '_show_message_action_bar_only_more_button'},
    {'1': '_show_default_emojis_in_autocomplete'},
    {'1': '_show_custom_emojis_in_autocomplete'},
    {'1': '_show_stickers_in_autocomplete'},
    {'1': '_show_memes_in_autocomplete'},
    {'1': '_voice_channel_join_requires_double_click'},
    {'1': '_custom_theme_css'},
    {'1': '_show_favorites'},
    {'1': '_zoom_level'},
    {'1': '_enable_tts_command'},
    {'1': '_tts_rate'},
    {'1': '_show_faded_unread_on_muted_channels'},
    {'1': '_show_context_menu_shortcuts'},
    {'1': '_confirm_before_starting_calls'},
    {'1': '_preserve_edit_draft'},
    {'1': '_stay_interactive_when_unfocused'},
    {'1': '_confirm_before_joining_voice_channels'},
    {'1': '_screen_reader_announce_new_messages'},
    {'1': '_first_click_pass_through_when_unfocused'},
    {'1': '_compact_message_group_spacing'},
    {'1': '_scroll_to_bottom_on_message_send'},
    {'1': '_dim_strikethrough_text'},
    {'1': '_sequential_file_send'},
    {'1': '_mobile_splash_zoom_animation'},
  ],
};

/// Descriptor for `AccessibilitySettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessibilitySettingsDescriptor = $convert.base64Decode(
    'ChVBY2Nlc3NpYmlsaXR5U2V0dGluZ3MSMAoRc2F0dXJhdGlvbl9mYWN0b3IYASABKAFIAFIQc2'
    'F0dXJhdGlvbkZhY3RvcogBARI0ChZhbHdheXNfdW5kZXJsaW5lX2xpbmtzGAIgASgIUhRhbHdh'
    'eXNVbmRlcmxpbmVMaW5rcxI3ChVlbmFibGVfdGV4dF9zZWxlY3Rpb24YAyABKAhIAVITZW5hYm'
    'xlVGV4dFNlbGVjdGlvbogBARI8ChhzaG93X21lc3NhZ2Vfc2VuZF9idXR0b24YBCABKAhIAlIV'
    'c2hvd01lc3NhZ2VTZW5kQnV0dG9uiAEBEjwKGHNob3dfdGV4dGFyZWFfZm9jdXNfcmluZxgFIA'
    'EoCEgDUhVzaG93VGV4dGFyZWFGb2N1c1JpbmeIAQESLgoTaGlkZV9rZXlib2FyZF9oaW50cxgG'
    'IAEoCFIRaGlkZUtleWJvYXJkSGludHMSQAoaZXNjYXBlX2V4aXRzX2tleWJvYXJkX21vZGUYBy'
    'ABKAhIBFIXZXNjYXBlRXhpdHNLZXlib2FyZE1vZGWIAQESSQofc3luY19yZWR1Y2VkX21vdGlv'
    'bl93aXRoX3N5c3RlbRgIIAEoCEgFUhtzeW5jUmVkdWNlZE1vdGlvbldpdGhTeXN0ZW2IAQESOw'
    'oXcmVkdWNlZF9tb3Rpb25fb3ZlcnJpZGUYCSABKAhIBlIVcmVkdWNlZE1vdGlvbk92ZXJyaWRl'
    'iAEBEjcKFW1lc3NhZ2VfZ3JvdXBfc3BhY2luZxgKIAEoAUgHUhNtZXNzYWdlR3JvdXBTcGFjaW'
    '5niAEBEioKDm1lc3NhZ2VfZ3V0dGVyGAsgASgBSAhSDW1lc3NhZ2VHdXR0ZXKIAQESIAoJZm9u'
    'dF9zaXplGAwgASgBSAlSCGZvbnRTaXpliAEBEkwKIXNob3dfdXNlcl9hdmF0YXJzX2luX2NvbX'
    'BhY3RfbW9kZRgNIAEoCEgKUhxzaG93VXNlckF2YXRhcnNJbkNvbXBhY3RNb2RliAEBEk0KI21v'
    'YmlsZV9zdGlja2VyX2FuaW1hdGlvbl9vdmVycmlkZGVuGA4gASgIUiBtb2JpbGVTdGlja2VyQW'
    '5pbWF0aW9uT3ZlcnJpZGRlbhJDCh5tb2JpbGVfZ2lmX2F1dG9wbGF5X292ZXJyaWRkZW4YDyAB'
    'KAhSG21vYmlsZUdpZkF1dG9wbGF5T3ZlcnJpZGRlbhJFCh9tb2JpbGVfYW5pbWF0ZV9lbW9qaV'
    '9vdmVycmlkZGVuGBAgASgIUhxtb2JpbGVBbmltYXRlRW1vamlPdmVycmlkZGVuEkgKHm1vYmls'
    'ZV9zdGlja2VyX2FuaW1hdGlvbl92YWx1ZRgRIAEoBUgLUhttb2JpbGVTdGlja2VyQW5pbWF0aW'
    '9uVmFsdWWIAQESPgoZbW9iaWxlX2dpZl9hdXRvcGxheV92YWx1ZRgSIAEoCEgMUhZtb2JpbGVH'
    'aWZBdXRvcGxheVZhbHVliAEBEkAKGm1vYmlsZV9hbmltYXRlX2Vtb2ppX3ZhbHVlGBMgASgISA'
    '1SF21vYmlsZUFuaW1hdGVFbW9qaVZhbHVliAEBEi8KFGF1dG9fc2VuZF9rbGlweV9naWZzGBQg'
    'ASgIUhFhdXRvU2VuZEtsaXB5R2lmcxIrCg9zaG93X2dpZl9idXR0b24YFSABKAhIDlINc2hvd0'
    'dpZkJ1dHRvbogBARIvChFzaG93X21lbWVzX2J1dHRvbhgWIAEoCEgPUg9zaG93TWVtZXNCdXR0'
    'b26IAQESNQoUc2hvd19zdGlja2Vyc19idXR0b24YFyABKAhIEFISc2hvd1N0aWNrZXJzQnV0dG'
    '9uiAEBEi8KEXNob3dfZW1vamlfYnV0dG9uGBggASgISBFSD3Nob3dFbW9qaUJ1dHRvbogBARJA'
    'ChpzaG93X21lZGlhX2Zhdm9yaXRlX2J1dHRvbhgZIAEoCEgSUhdzaG93TWVkaWFGYXZvcml0ZU'
    'J1dHRvbogBARJAChpzaG93X21lZGlhX2Rvd25sb2FkX2J1dHRvbhgaIAEoCEgTUhdzaG93TWVk'
    'aWFEb3dubG9hZEJ1dHRvbogBARI8ChhzaG93X21lZGlhX2RlbGV0ZV9idXR0b24YGyABKAhIFF'
    'IVc2hvd01lZGlhRGVsZXRlQnV0dG9uiAEBEkIKG3Nob3dfc3VwcHJlc3NfZW1iZWRzX2J1dHRv'
    'bhgcIAEoCEgVUhhzaG93U3VwcHJlc3NFbWJlZHNCdXR0b26IAQESMQoSc2hvd19naWZfaW5kaW'
    'NhdG9yGB0gASgISBZSEHNob3dHaWZJbmRpY2F0b3KIAQESTAogc2hvd19hdHRhY2htZW50X2V4'
    'cGlyeV9pbmRpY2F0b3IYHiABKAhIF1Idc2hvd0F0dGFjaG1lbnRFeHBpcnlJbmRpY2F0b3KIAQ'
    'ESTgoidXNlX2Jyb3dzZXJfbG9jYWxlX2Zvcl90aW1lX2Zvcm1hdBgfIAEoCEgYUh11c2VCcm93'
    'c2VyTG9jYWxlRm9yVGltZUZvcm1hdIgBARJ5Ch1jaGFubmVsX3R5cGluZ19pbmRpY2F0b3JfbW'
    '9kZRggIAEoDjI2LmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLkNoYW5uZWxUeXBpbmdJbmRp'
    'Y2F0b3JNb2RlUhpjaGFubmVsVHlwaW5nSW5kaWNhdG9yTW9kZRJXCiZzaG93X3NlbGVjdGVkX2'
    'NoYW5uZWxfdHlwaW5nX2luZGljYXRvchghIAEoCEgZUiJzaG93U2VsZWN0ZWRDaGFubmVsVHlw'
    'aW5nSW5kaWNhdG9yiAEBEjoKF3Nob3dfbWVzc2FnZV9hY3Rpb25fYmFyGCIgASgISBpSFHNob3'
    'dNZXNzYWdlQWN0aW9uQmFyiAEBElgKJ3Nob3dfbWVzc2FnZV9hY3Rpb25fYmFyX3F1aWNrX3Jl'
    'YWN0aW9ucxgjIAEoCEgbUiJzaG93TWVzc2FnZUFjdGlvbkJhclF1aWNrUmVhY3Rpb25ziAEBEl'
    'IKJHNob3dfbWVzc2FnZV9hY3Rpb25fYmFyX3NoaWZ0X2V4cGFuZBgkIAEoCEgcUh9zaG93TWVz'
    'c2FnZUFjdGlvbkJhclNoaWZ0RXhwYW5kiAEBElkKKHNob3dfbWVzc2FnZV9hY3Rpb25fYmFyX2'
    '9ubHlfbW9yZV9idXR0b24YJSABKAhIHVIic2hvd01lc3NhZ2VBY3Rpb25CYXJPbmx5TW9yZUJ1'
    'dHRvbogBARJRCiNzaG93X2RlZmF1bHRfZW1vamlzX2luX2F1dG9jb21wbGV0ZRgmIAEoCEgeUh'
    '9zaG93RGVmYXVsdEVtb2ppc0luQXV0b2NvbXBsZXRliAEBEk8KInNob3dfY3VzdG9tX2Vtb2pp'
    'c19pbl9hdXRvY29tcGxldGUYJyABKAhIH1Iec2hvd0N1c3RvbUVtb2ppc0luQXV0b2NvbXBsZX'
    'RliAEBEkYKHXNob3dfc3RpY2tlcnNfaW5fYXV0b2NvbXBsZXRlGCggASgISCBSGnNob3dTdGlj'
    'a2Vyc0luQXV0b2NvbXBsZXRliAEBEkAKGnNob3dfbWVtZXNfaW5fYXV0b2NvbXBsZXRlGCkgAS'
    'gISCFSF3Nob3dNZW1lc0luQXV0b2NvbXBsZXRliAEBEnUKH2F0dGFjaG1lbnRfbWVkaWFfZGlt'
    'ZW5zaW9uX3NpemUYKiABKA4yLi5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5NZWRpYURpbW'
    'Vuc2lvblNpemVSHGF0dGFjaG1lbnRNZWRpYURpbWVuc2lvblNpemUSawoaZW1iZWRfbWVkaWFf'
    'ZGltZW5zaW9uX3NpemUYKyABKA4yLi5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5NZWRpYU'
    'RpbWVuc2lvblNpemVSF2VtYmVkTWVkaWFEaW1lbnNpb25TaXplEloKKHZvaWNlX2NoYW5uZWxf'
    'am9pbl9yZXF1aXJlc19kb3VibGVfY2xpY2sYLCABKAhIIlIjdm9pY2VDaGFubmVsSm9pblJlcX'
    'VpcmVzRG91YmxlQ2xpY2uIAQESLQoQY3VzdG9tX3RoZW1lX2NzcxgtIAEoCUgjUg5jdXN0b21U'
    'aGVtZUNzc4gBARIqCg5zaG93X2Zhdm9yaXRlcxguIAEoCEgkUg1zaG93RmF2b3JpdGVziAEBEi'
    'IKCnpvb21fbGV2ZWwYLyABKAFIJVIJem9vbUxldmVsiAEBEmcKF2RtX21lc3NhZ2VfcHJldmll'
    'd19tb2RlGDAgASgOMjAuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuRG1NZXNzYWdlUHJldm'
    'lld01vZGVSFGRtTWVzc2FnZVByZXZpZXdNb2RlEjEKEmVuYWJsZV90dHNfY29tbWFuZBgxIAEo'
    'CEgmUhBlbmFibGVUdHNDb21tYW5kiAEBEh4KCHR0c19yYXRlGDIgASgBSCdSB3R0c1JhdGWIAQ'
    'ESUAojc2hvd19mYWRlZF91bnJlYWRfb25fbXV0ZWRfY2hhbm5lbHMYMyABKAhIKFIec2hvd0Zh'
    'ZGVkVW5yZWFkT25NdXRlZENoYW5uZWxziAEBEkIKG3Nob3dfY29udGV4dF9tZW51X3Nob3J0Y3'
    'V0cxg0IAEoCEgpUhhzaG93Q29udGV4dE1lbnVTaG9ydGN1dHOIAQESRgodY29uZmlybV9iZWZv'
    'cmVfc3RhcnRpbmdfY2FsbHMYNSABKAhIKlIaY29uZmlybUJlZm9yZVN0YXJ0aW5nQ2FsbHOIAQ'
    'ESVAoQaGRyX2Rpc3BsYXlfbW9kZRg2IAEoDjIqLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYx'
    'LkhkckRpc3BsYXlNb2RlUg5oZHJEaXNwbGF5TW9kZRIzChNwcmVzZXJ2ZV9lZGl0X2RyYWZ0GD'
    'cgASgISCtSEXByZXNlcnZlRWRpdERyYWZ0iAEBEkoKH3N0YXlfaW50ZXJhY3RpdmVfd2hlbl91'
    'bmZvY3VzZWQYOCABKAhILFIcc3RheUludGVyYWN0aXZlV2hlblVuZm9jdXNlZIgBARJVCiVjb2'
    '5maXJtX2JlZm9yZV9qb2luaW5nX3ZvaWNlX2NoYW5uZWxzGDkgASgISC1SIWNvbmZpcm1CZWZv'
    'cmVKb2luaW5nVm9pY2VDaGFubmVsc4gBARJRCiNzY3JlZW5fcmVhZGVyX2Fubm91bmNlX25ld1'
    '9tZXNzYWdlcxg6IAEoCEguUh9zY3JlZW5SZWFkZXJBbm5vdW5jZU5ld01lc3NhZ2VziAEBElgK'
    'J2ZpcnN0X2NsaWNrX3Bhc3NfdGhyb3VnaF93aGVuX3VuZm9jdXNlZBg7IAEoCEgvUiJmaXJzdE'
    'NsaWNrUGFzc1Rocm91Z2hXaGVuVW5mb2N1c2VkiAEBEkYKHWNvbXBhY3RfbWVzc2FnZV9ncm91'
    'cF9zcGFjaW5nGDwgASgBSDBSGmNvbXBhY3RNZXNzYWdlR3JvdXBTcGFjaW5niAEBEkoKIHNjcm'
    '9sbF90b19ib3R0b21fb25fbWVzc2FnZV9zZW5kGD0gASgISDFSG3Njcm9sbFRvQm90dG9tT25N'
    'ZXNzYWdlU2VuZIgBARI5ChZkaW1fc3RyaWtldGhyb3VnaF90ZXh0GD4gASgISDJSFGRpbVN0cm'
    'lrZXRocm91Z2hUZXh0iAEBEjUKFHNlcXVlbnRpYWxfZmlsZV9zZW5kGD8gASgISDNSEnNlcXVl'
    'bnRpYWxGaWxlU2VuZIgBARJEChxtb2JpbGVfc3BsYXNoX3pvb21fYW5pbWF0aW9uGEAgASgISD'
    'RSGW1vYmlsZVNwbGFzaFpvb21BbmltYXRpb26IAQFCFAoSX3NhdHVyYXRpb25fZmFjdG9yQhgK'
    'Fl9lbmFibGVfdGV4dF9zZWxlY3Rpb25CGwoZX3Nob3dfbWVzc2FnZV9zZW5kX2J1dHRvbkIbCh'
    'lfc2hvd190ZXh0YXJlYV9mb2N1c19yaW5nQh0KG19lc2NhcGVfZXhpdHNfa2V5Ym9hcmRfbW9k'
    'ZUIiCiBfc3luY19yZWR1Y2VkX21vdGlvbl93aXRoX3N5c3RlbUIaChhfcmVkdWNlZF9tb3Rpb2'
    '5fb3ZlcnJpZGVCGAoWX21lc3NhZ2VfZ3JvdXBfc3BhY2luZ0IRCg9fbWVzc2FnZV9ndXR0ZXJC'
    'DAoKX2ZvbnRfc2l6ZUIkCiJfc2hvd191c2VyX2F2YXRhcnNfaW5fY29tcGFjdF9tb2RlQiEKH1'
    '9tb2JpbGVfc3RpY2tlcl9hbmltYXRpb25fdmFsdWVCHAoaX21vYmlsZV9naWZfYXV0b3BsYXlf'
    'dmFsdWVCHQobX21vYmlsZV9hbmltYXRlX2Vtb2ppX3ZhbHVlQhIKEF9zaG93X2dpZl9idXR0b2'
    '5CFAoSX3Nob3dfbWVtZXNfYnV0dG9uQhcKFV9zaG93X3N0aWNrZXJzX2J1dHRvbkIUChJfc2hv'
    'd19lbW9qaV9idXR0b25CHQobX3Nob3dfbWVkaWFfZmF2b3JpdGVfYnV0dG9uQh0KG19zaG93X2'
    '1lZGlhX2Rvd25sb2FkX2J1dHRvbkIbChlfc2hvd19tZWRpYV9kZWxldGVfYnV0dG9uQh4KHF9z'
    'aG93X3N1cHByZXNzX2VtYmVkc19idXR0b25CFQoTX3Nob3dfZ2lmX2luZGljYXRvckIjCiFfc2'
    'hvd19hdHRhY2htZW50X2V4cGlyeV9pbmRpY2F0b3JCJQojX3VzZV9icm93c2VyX2xvY2FsZV9m'
    'b3JfdGltZV9mb3JtYXRCKQonX3Nob3dfc2VsZWN0ZWRfY2hhbm5lbF90eXBpbmdfaW5kaWNhdG'
    '9yQhoKGF9zaG93X21lc3NhZ2VfYWN0aW9uX2JhckIqCihfc2hvd19tZXNzYWdlX2FjdGlvbl9i'
    'YXJfcXVpY2tfcmVhY3Rpb25zQicKJV9zaG93X21lc3NhZ2VfYWN0aW9uX2Jhcl9zaGlmdF9leH'
    'BhbmRCKwopX3Nob3dfbWVzc2FnZV9hY3Rpb25fYmFyX29ubHlfbW9yZV9idXR0b25CJgokX3No'
    'b3dfZGVmYXVsdF9lbW9qaXNfaW5fYXV0b2NvbXBsZXRlQiUKI19zaG93X2N1c3RvbV9lbW9qaX'
    'NfaW5fYXV0b2NvbXBsZXRlQiAKHl9zaG93X3N0aWNrZXJzX2luX2F1dG9jb21wbGV0ZUIdChtf'
    'c2hvd19tZW1lc19pbl9hdXRvY29tcGxldGVCKwopX3ZvaWNlX2NoYW5uZWxfam9pbl9yZXF1aX'
    'Jlc19kb3VibGVfY2xpY2tCEwoRX2N1c3RvbV90aGVtZV9jc3NCEQoPX3Nob3dfZmF2b3JpdGVz'
    'Qg0KC196b29tX2xldmVsQhUKE19lbmFibGVfdHRzX2NvbW1hbmRCCwoJX3R0c19yYXRlQiYKJF'
    '9zaG93X2ZhZGVkX3VucmVhZF9vbl9tdXRlZF9jaGFubmVsc0IeChxfc2hvd19jb250ZXh0X21l'
    'bnVfc2hvcnRjdXRzQiAKHl9jb25maXJtX2JlZm9yZV9zdGFydGluZ19jYWxsc0IWChRfcHJlc2'
    'VydmVfZWRpdF9kcmFmdEIiCiBfc3RheV9pbnRlcmFjdGl2ZV93aGVuX3VuZm9jdXNlZEIoCiZf'
    'Y29uZmlybV9iZWZvcmVfam9pbmluZ192b2ljZV9jaGFubmVsc0ImCiRfc2NyZWVuX3JlYWRlcl'
    '9hbm5vdW5jZV9uZXdfbWVzc2FnZXNCKgooX2ZpcnN0X2NsaWNrX3Bhc3NfdGhyb3VnaF93aGVu'
    'X3VuZm9jdXNlZEIgCh5fY29tcGFjdF9tZXNzYWdlX2dyb3VwX3NwYWNpbmdCIwohX3Njcm9sbF'
    '90b19ib3R0b21fb25fbWVzc2FnZV9zZW5kQhkKF19kaW1fc3RyaWtldGhyb3VnaF90ZXh0QhcK'
    'FV9zZXF1ZW50aWFsX2ZpbGVfc2VuZEIfCh1fbW9iaWxlX3NwbGFzaF96b29tX2FuaW1hdGlvbg'
    '==');

@$core.Deprecated('Use accessibilityOverridesDescriptor instead')
const AccessibilityOverrides$json = {
  '1': 'AccessibilityOverrides',
  '2': [
    {
      '1': 'gif_autoplay_dirty',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'gifAutoplayDirty'
    },
    {
      '1': 'animate_emoji_dirty',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'animateEmojiDirty'
    },
    {
      '1': 'animate_stickers_dirty',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'animateStickersDirty'
    },
  ],
};

/// Descriptor for `AccessibilityOverrides`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accessibilityOverridesDescriptor = $convert.base64Decode(
    'ChZBY2Nlc3NpYmlsaXR5T3ZlcnJpZGVzEiwKEmdpZl9hdXRvcGxheV9kaXJ0eRgBIAEoCFIQZ2'
    'lmQXV0b3BsYXlEaXJ0eRIuChNhbmltYXRlX2Vtb2ppX2RpcnR5GAIgASgIUhFhbmltYXRlRW1v'
    'amlEaXJ0eRI0ChZhbmltYXRlX3N0aWNrZXJzX2RpcnR5GAMgASgIUhRhbmltYXRlU3RpY2tlcn'
    'NEaXJ0eQ==');
