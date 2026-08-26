// This is a generated file - do not edit.
//
// Generated from fluxer/user/preferences/v1/preferences.proto.

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

@$core.Deprecated('Use permissionLayoutModeDescriptor instead')
const PermissionLayoutMode$json = {
  '1': 'PermissionLayoutMode',
  '2': [
    {'1': 'PERMISSION_LAYOUT_MODE_UNSPECIFIED', '2': 0},
    {'1': 'PERMISSION_LAYOUT_MODE_COMFY', '2': 1},
    {'1': 'PERMISSION_LAYOUT_MODE_DENSE', '2': 2},
  ],
};

/// Descriptor for `PermissionLayoutMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionLayoutModeDescriptor = $convert.base64Decode(
    'ChRQZXJtaXNzaW9uTGF5b3V0TW9kZRImCiJQRVJNSVNTSU9OX0xBWU9VVF9NT0RFX1VOU1BFQ0'
    'lGSUVEEAASIAocUEVSTUlTU0lPTl9MQVlPVVRfTU9ERV9DT01GWRABEiAKHFBFUk1JU1NJT05f'
    'TEFZT1VUX01PREVfREVOU0UQAg==');

@$core.Deprecated('Use permissionGridModeDescriptor instead')
const PermissionGridMode$json = {
  '1': 'PermissionGridMode',
  '2': [
    {'1': 'PERMISSION_GRID_MODE_UNSPECIFIED', '2': 0},
    {'1': 'PERMISSION_GRID_MODE_SINGLE', '2': 1},
    {'1': 'PERMISSION_GRID_MODE_GRID', '2': 2},
  ],
};

/// Descriptor for `PermissionGridMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionGridModeDescriptor = $convert.base64Decode(
    'ChJQZXJtaXNzaW9uR3JpZE1vZGUSJAogUEVSTUlTU0lPTl9HUklEX01PREVfVU5TUEVDSUZJRU'
    'QQABIfChtQRVJNSVNTSU9OX0dSSURfTU9ERV9TSU5HTEUQARIdChlQRVJNSVNTSU9OX0dSSURf'
    'TU9ERV9HUklEEAI=');

@$core.Deprecated('Use guildMemberViewModeDescriptor instead')
const GuildMemberViewMode$json = {
  '1': 'GuildMemberViewMode',
  '2': [
    {'1': 'GUILD_MEMBER_VIEW_MODE_UNSPECIFIED', '2': 0},
    {'1': 'GUILD_MEMBER_VIEW_MODE_TABLE', '2': 1},
    {'1': 'GUILD_MEMBER_VIEW_MODE_GRID', '2': 2},
  ],
};

/// Descriptor for `GuildMemberViewMode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List guildMemberViewModeDescriptor = $convert.base64Decode(
    'ChNHdWlsZE1lbWJlclZpZXdNb2RlEiYKIkdVSUxEX01FTUJFUl9WSUVXX01PREVfVU5TUEVDSU'
    'ZJRUQQABIgChxHVUlMRF9NRU1CRVJfVklFV19NT0RFX1RBQkxFEAESHwobR1VJTERfTUVNQkVS'
    'X1ZJRVdfTU9ERV9HUklEEAI=');

@$core.Deprecated('Use mfaMethodDescriptor instead')
const MfaMethod$json = {
  '1': 'MfaMethod',
  '2': [
    {'1': 'MFA_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'MFA_METHOD_TOTP', '2': 1},
    {'1': 'MFA_METHOD_WEBAUTHN', '2': 3},
  ],
};

/// Descriptor for `MfaMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mfaMethodDescriptor = $convert.base64Decode(
    'CglNZmFNZXRob2QSGgoWTUZBX01FVEhPRF9VTlNQRUNJRklFRBAAEhMKD01GQV9NRVRIT0RfVE'
    '9UUBABEhcKE01GQV9NRVRIT0RfV0VCQVVUSE4QAw==');

@$core.Deprecated('Use syncedPreferencesDescriptor instead')
const SyncedPreferences$json = {
  '1': 'SyncedPreferences',
  '2': [
    {
      '1': 'accessibility',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.AccessibilitySettings',
      '10': 'accessibility'
    },
    {
      '1': 'accessibility_overrides',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.AccessibilityOverrides',
      '10': 'accessibilityOverrides'
    },
    {
      '1': 'textual_preview',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.TextualPreviewSettings',
      '10': 'textualPreview'
    },
    {
      '1': 'emoji_picker',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.EmojiPickerState',
      '10': 'emojiPicker'
    },
    {
      '1': 'sticker_picker',
      '3': 21,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.StickerPickerState',
      '10': 'stickerPicker'
    },
    {
      '1': 'memes_picker',
      '3': 22,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.MemesPickerState',
      '10': 'memesPicker'
    },
    {
      '1': 'emoji',
      '3': 23,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.EmojiState',
      '10': 'emoji'
    },
    {
      '1': 'emoji_sticker_layout',
      '3': 24,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.EmojiStickerLayoutSettings',
      '10': 'emojiStickerLayout'
    },
    {
      '1': 'favorite_gifs',
      '3': 25,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.FavoriteGifSettings',
      '10': 'favoriteGifs'
    },
    {
      '1': 'favorites',
      '3': 40,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.FavoritesState',
      '10': 'favorites'
    },
    {
      '1': 'recent_mentions',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.RecentMentionsSettings',
      '10': 'recentMentions'
    },
    {
      '1': 'sidebar',
      '3': 42,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.SidebarPreferences',
      '10': 'sidebar'
    },
    {
      '1': 'member_list',
      '3': 43,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.MemberListState',
      '10': 'memberList'
    },
    {
      '1': 'unread_channels',
      '3': 44,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.UnreadChannelsState',
      '10': 'unreadChannels'
    },
    {
      '1': 'mention_frecency',
      '3': 45,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.MentionFrecencyState',
      '10': 'mentionFrecency'
    },
    {
      '1': 'nagbars',
      '3': 60,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.NagbarDismissals',
      '10': 'nagbars'
    },
    {
      '1': 'dismissed_upsells',
      '3': 61,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.DismissedUpsells',
      '10': 'dismissedUpsells'
    },
    {
      '1': 'guild_nsfw_agreements',
      '3': 62,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.GuildNsfwAgreements',
      '10': 'guildNsfwAgreements'
    },
    {
      '1': 'whats_new',
      '3': 63,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.WhatsNewState',
      '10': 'whatsNew'
    },
    {
      '1': 'privacy',
      '3': 80,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.PrivacyPreferences',
      '10': 'privacy'
    },
    {
      '1': 'local_spam_overrides',
      '3': 81,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.LocalUserSpamOverrides',
      '10': 'localSpamOverrides'
    },
    {'1': 'sanitize_urls', '3': 82, '4': 1, '5': 8, '10': 'sanitizeUrls'},
    {
      '1': 'sound',
      '3': 100,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.SoundSettings',
      '10': 'sound'
    },
    {
      '1': 'spellcheck',
      '3': 101,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.SpellcheckSettings',
      '10': 'spellcheck'
    },
    {
      '1': 'search_engines',
      '3': 102,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.SearchEngineSettings',
      '10': 'searchEngines'
    },
    {
      '1': 'permission_layout',
      '3': 103,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.PermissionLayoutSettings',
      '10': 'permissionLayout'
    },
    {
      '1': 'guild_member_layout',
      '3': 104,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.GuildMemberLayoutSettings',
      '10': 'guildMemberLayout'
    },
    {
      '1': 'guild_folders',
      '3': 105,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.GuildFolderExpandedState',
      '10': 'guildFolders'
    },
    {
      '1': 'hidden_guild_buttons',
      '3': 106,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.HiddenGuildListButtons',
      '10': 'hiddenGuildButtons'
    },
    {
      '1': 'keyboard_mode_intro',
      '3': 107,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.KeyboardModeIntroState',
      '10': 'keyboardModeIntro'
    },
    {
      '1': 'input_monitoring',
      '3': 108,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.InputMonitoringPromptsState',
      '10': 'inputMonitoring'
    },
    {
      '1': 'voice_prompts',
      '3': 109,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.VoicePromptsState',
      '10': 'voicePrompts'
    },
    {
      '1': 'sudo_prompt',
      '3': 110,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.SudoPromptState',
      '10': 'sudoPrompt'
    },
    {
      '1': 'keybinds',
      '3': 111,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.KeybindSettings',
      '10': 'keybinds'
    },
    {
      '1': 'chat_input',
      '3': 112,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.ChatInputSettings',
      '10': 'chatInput'
    },
  ],
};

/// Descriptor for `SyncedPreferences`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncedPreferencesDescriptor = $convert.base64Decode(
    'ChFTeW5jZWRQcmVmZXJlbmNlcxJXCg1hY2Nlc3NpYmlsaXR5GAEgASgLMjEuZmx1eGVyLnVzZX'
    'IucHJlZmVyZW5jZXMudjEuQWNjZXNzaWJpbGl0eVNldHRpbmdzUg1hY2Nlc3NpYmlsaXR5EmsK'
    'F2FjY2Vzc2liaWxpdHlfb3ZlcnJpZGVzGAIgASgLMjIuZmx1eGVyLnVzZXIucHJlZmVyZW5jZX'
    'MudjEuQWNjZXNzaWJpbGl0eU92ZXJyaWRlc1IWYWNjZXNzaWJpbGl0eU92ZXJyaWRlcxJbCg90'
    'ZXh0dWFsX3ByZXZpZXcYAyABKAsyMi5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5UZXh0dW'
    'FsUHJldmlld1NldHRpbmdzUg50ZXh0dWFsUHJldmlldxJPCgxlbW9qaV9waWNrZXIYFCABKAsy'
    'LC5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5FbW9qaVBpY2tlclN0YXRlUgtlbW9qaVBpY2'
    'tlchJVCg5zdGlja2VyX3BpY2tlchgVIAEoCzIuLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYx'
    'LlN0aWNrZXJQaWNrZXJTdGF0ZVINc3RpY2tlclBpY2tlchJPCgxtZW1lc19waWNrZXIYFiABKA'
    'syLC5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5NZW1lc1BpY2tlclN0YXRlUgttZW1lc1Bp'
    'Y2tlchI8CgVlbW9qaRgXIAEoCzImLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLkVtb2ppU3'
    'RhdGVSBWVtb2ppEmgKFGVtb2ppX3N0aWNrZXJfbGF5b3V0GBggASgLMjYuZmx1eGVyLnVzZXIu'
    'cHJlZmVyZW5jZXMudjEuRW1vamlTdGlja2VyTGF5b3V0U2V0dGluZ3NSEmVtb2ppU3RpY2tlck'
    'xheW91dBJUCg1mYXZvcml0ZV9naWZzGBkgASgLMi8uZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMu'
    'djEuRmF2b3JpdGVHaWZTZXR0aW5nc1IMZmF2b3JpdGVHaWZzEkgKCWZhdm9yaXRlcxgoIAEoCz'
    'IqLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLkZhdm9yaXRlc1N0YXRlUglmYXZvcml0ZXMS'
    'WwoPcmVjZW50X21lbnRpb25zGCkgASgLMjIuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuUm'
    'VjZW50TWVudGlvbnNTZXR0aW5nc1IOcmVjZW50TWVudGlvbnMSSAoHc2lkZWJhchgqIAEoCzIu'
    'LmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLlNpZGViYXJQcmVmZXJlbmNlc1IHc2lkZWJhch'
    'JMCgttZW1iZXJfbGlzdBgrIAEoCzIrLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLk1lbWJl'
    'ckxpc3RTdGF0ZVIKbWVtYmVyTGlzdBJYCg91bnJlYWRfY2hhbm5lbHMYLCABKAsyLy5mbHV4ZX'
    'IudXNlci5wcmVmZXJlbmNlcy52MS5VbnJlYWRDaGFubmVsc1N0YXRlUg51bnJlYWRDaGFubmVs'
    'cxJbChBtZW50aW9uX2ZyZWNlbmN5GC0gASgLMjAuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudj'
    'EuTWVudGlvbkZyZWNlbmN5U3RhdGVSD21lbnRpb25GcmVjZW5jeRJGCgduYWdiYXJzGDwgASgL'
    'MiwuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuTmFnYmFyRGlzbWlzc2Fsc1IHbmFnYmFycx'
    'JZChFkaXNtaXNzZWRfdXBzZWxscxg9IAEoCzIsLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYx'
    'LkRpc21pc3NlZFVwc2VsbHNSEGRpc21pc3NlZFVwc2VsbHMSYwoVZ3VpbGRfbnNmd19hZ3JlZW'
    '1lbnRzGD4gASgLMi8uZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuR3VpbGROc2Z3QWdyZWVt'
    'ZW50c1ITZ3VpbGROc2Z3QWdyZWVtZW50cxJGCgl3aGF0c19uZXcYPyABKAsyKS5mbHV4ZXIudX'
    'Nlci5wcmVmZXJlbmNlcy52MS5XaGF0c05ld1N0YXRlUgh3aGF0c05ldxJICgdwcml2YWN5GFAg'
    'ASgLMi4uZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuUHJpdmFjeVByZWZlcmVuY2VzUgdwcm'
    'l2YWN5EmQKFGxvY2FsX3NwYW1fb3ZlcnJpZGVzGFEgASgLMjIuZmx1eGVyLnVzZXIucHJlZmVy'
    'ZW5jZXMudjEuTG9jYWxVc2VyU3BhbU92ZXJyaWRlc1ISbG9jYWxTcGFtT3ZlcnJpZGVzEiMKDX'
    'Nhbml0aXplX3VybHMYUiABKAhSDHNhbml0aXplVXJscxI/CgVzb3VuZBhkIAEoCzIpLmZsdXhl'
    'ci51c2VyLnByZWZlcmVuY2VzLnYxLlNvdW5kU2V0dGluZ3NSBXNvdW5kEk4KCnNwZWxsY2hlY2'
    'sYZSABKAsyLi5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5TcGVsbGNoZWNrU2V0dGluZ3NS'
    'CnNwZWxsY2hlY2sSVwoOc2VhcmNoX2VuZ2luZXMYZiABKAsyMC5mbHV4ZXIudXNlci5wcmVmZX'
    'JlbmNlcy52MS5TZWFyY2hFbmdpbmVTZXR0aW5nc1INc2VhcmNoRW5naW5lcxJhChFwZXJtaXNz'
    'aW9uX2xheW91dBhnIAEoCzI0LmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLlBlcm1pc3Npb2'
    '5MYXlvdXRTZXR0aW5nc1IQcGVybWlzc2lvbkxheW91dBJlChNndWlsZF9tZW1iZXJfbGF5b3V0'
    'GGggASgLMjUuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuR3VpbGRNZW1iZXJMYXlvdXRTZX'
    'R0aW5nc1IRZ3VpbGRNZW1iZXJMYXlvdXQSWQoNZ3VpbGRfZm9sZGVycxhpIAEoCzI0LmZsdXhl'
    'ci51c2VyLnByZWZlcmVuY2VzLnYxLkd1aWxkRm9sZGVyRXhwYW5kZWRTdGF0ZVIMZ3VpbGRGb2'
    'xkZXJzEmQKFGhpZGRlbl9ndWlsZF9idXR0b25zGGogASgLMjIuZmx1eGVyLnVzZXIucHJlZmVy'
    'ZW5jZXMudjEuSGlkZGVuR3VpbGRMaXN0QnV0dG9uc1ISaGlkZGVuR3VpbGRCdXR0b25zEmIKE2'
    'tleWJvYXJkX21vZGVfaW50cm8YayABKAsyMi5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5L'
    'ZXlib2FyZE1vZGVJbnRyb1N0YXRlUhFrZXlib2FyZE1vZGVJbnRybxJiChBpbnB1dF9tb25pdG'
    '9yaW5nGGwgASgLMjcuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuSW5wdXRNb25pdG9yaW5n'
    'UHJvbXB0c1N0YXRlUg9pbnB1dE1vbml0b3JpbmcSUgoNdm9pY2VfcHJvbXB0cxhtIAEoCzItLm'
    'ZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLlZvaWNlUHJvbXB0c1N0YXRlUgx2b2ljZVByb21w'
    'dHMSTAoLc3Vkb19wcm9tcHQYbiABKAsyKy5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5TdW'
    'RvUHJvbXB0U3RhdGVSCnN1ZG9Qcm9tcHQSRwoIa2V5YmluZHMYbyABKAsyKy5mbHV4ZXIudXNl'
    'ci5wcmVmZXJlbmNlcy52MS5LZXliaW5kU2V0dGluZ3NSCGtleWJpbmRzEkwKCmNoYXRfaW5wdX'
    'QYcCABKAsyLS5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5DaGF0SW5wdXRTZXR0aW5nc1IJ'
    'Y2hhdElucHV0');

@$core.Deprecated('Use spellcheckSettingsDescriptor instead')
const SpellcheckSettings$json = {
  '1': 'SpellcheckSettings',
  '2': [
    {
      '1': 'enabled',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'enabled',
      '17': true
    },
    {'1': 'languages', '3': 2, '4': 3, '5': 9, '10': 'languages'},
    {
      '1': 'personal_dictionary',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'personalDictionary'
    },
    {
      '1': 'auto_detect',
      '3': 4,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'autoDetect',
      '17': true
    },
    {'1': 'engine', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'engine', '17': true},
  ],
  '8': [
    {'1': '_enabled'},
    {'1': '_auto_detect'},
    {'1': '_engine'},
  ],
};

/// Descriptor for `SpellcheckSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spellcheckSettingsDescriptor = $convert.base64Decode(
    'ChJTcGVsbGNoZWNrU2V0dGluZ3MSHQoHZW5hYmxlZBgBIAEoCEgAUgdlbmFibGVkiAEBEhwKCW'
    'xhbmd1YWdlcxgCIAMoCVIJbGFuZ3VhZ2VzEi8KE3BlcnNvbmFsX2RpY3Rpb25hcnkYAyADKAlS'
    'EnBlcnNvbmFsRGljdGlvbmFyeRIkCgthdXRvX2RldGVjdBgEIAEoCEgBUgphdXRvRGV0ZWN0iA'
    'EBEhsKBmVuZ2luZRgFIAEoCUgCUgZlbmdpbmWIAQFCCgoIX2VuYWJsZWRCDgoMX2F1dG9fZGV0'
    'ZWN0QgkKB19lbmdpbmU=');

@$core.Deprecated('Use searchEngineSettingsDescriptor instead')
const SearchEngineSettings$json = {
  '1': 'SearchEngineSettings',
  '2': [
    {
      '1': 'text_search_engine_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'textSearchEngineId',
      '17': true
    },
    {
      '1': 'reverse_image_search_engine_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'reverseImageSearchEngineId',
      '17': true
    },
    {
      '1': 'translation_provider_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'translationProviderId',
      '17': true
    },
  ],
  '8': [
    {'1': '_text_search_engine_id'},
    {'1': '_reverse_image_search_engine_id'},
    {'1': '_translation_provider_id'},
  ],
};

/// Descriptor for `SearchEngineSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchEngineSettingsDescriptor = $convert.base64Decode(
    'ChRTZWFyY2hFbmdpbmVTZXR0aW5ncxI2ChV0ZXh0X3NlYXJjaF9lbmdpbmVfaWQYASABKAlIAF'
    'ISdGV4dFNlYXJjaEVuZ2luZUlkiAEBEkcKHnJldmVyc2VfaW1hZ2Vfc2VhcmNoX2VuZ2luZV9p'
    'ZBgCIAEoCUgBUhpyZXZlcnNlSW1hZ2VTZWFyY2hFbmdpbmVJZIgBARI7Chd0cmFuc2xhdGlvbl'
    '9wcm92aWRlcl9pZBgDIAEoCUgCUhV0cmFuc2xhdGlvblByb3ZpZGVySWSIAQFCGAoWX3RleHRf'
    'c2VhcmNoX2VuZ2luZV9pZEIhCh9fcmV2ZXJzZV9pbWFnZV9zZWFyY2hfZW5naW5lX2lkQhoKGF'
    '90cmFuc2xhdGlvbl9wcm92aWRlcl9pZA==');

@$core.Deprecated('Use privacyPreferencesDescriptor instead')
const PrivacyPreferences$json = {
  '1': 'PrivacyPreferences',
  '2': [
    {
      '1': 'disable_stream_previews',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'disableStreamPreviews'
    },
    {
      '1': 'show_active_now',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'showActiveNow',
      '17': true
    },
    {
      '1': 'preupload_message_attachments',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'preuploadMessageAttachments',
      '17': true
    },
  ],
  '8': [
    {'1': '_show_active_now'},
    {'1': '_preupload_message_attachments'},
  ],
};

/// Descriptor for `PrivacyPreferences`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List privacyPreferencesDescriptor = $convert.base64Decode(
    'ChJQcml2YWN5UHJlZmVyZW5jZXMSNgoXZGlzYWJsZV9zdHJlYW1fcHJldmlld3MYASABKAhSFW'
    'Rpc2FibGVTdHJlYW1QcmV2aWV3cxIrCg9zaG93X2FjdGl2ZV9ub3cYAiABKAhIAFINc2hvd0Fj'
    'dGl2ZU5vd4gBARJHCh1wcmV1cGxvYWRfbWVzc2FnZV9hdHRhY2htZW50cxgDIAEoCEgBUhtwcm'
    'V1cGxvYWRNZXNzYWdlQXR0YWNobWVudHOIAQFCEgoQX3Nob3dfYWN0aXZlX25vd0IgCh5fcHJl'
    'dXBsb2FkX21lc3NhZ2VfYXR0YWNobWVudHM=');

@$core.Deprecated('Use localUserSpamOverridesDescriptor instead')
const LocalUserSpamOverrides$json = {
  '1': 'LocalUserSpamOverrides',
  '2': [
    {'1': 'spammer_user_ids', '3': 1, '4': 3, '5': 9, '10': 'spammerUserIds'},
    {
      '1': 'not_spammer_user_ids',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'notSpammerUserIds'
    },
  ],
};

/// Descriptor for `LocalUserSpamOverrides`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localUserSpamOverridesDescriptor = $convert.base64Decode(
    'ChZMb2NhbFVzZXJTcGFtT3ZlcnJpZGVzEigKEHNwYW1tZXJfdXNlcl9pZHMYASADKAlSDnNwYW'
    '1tZXJVc2VySWRzEi8KFG5vdF9zcGFtbWVyX3VzZXJfaWRzGAIgAygJUhFub3RTcGFtbWVyVXNl'
    'cklkcw==');

@$core.Deprecated('Use textualPreviewSettingsDescriptor instead')
const TextualPreviewSettings$json = {
  '1': 'TextualPreviewSettings',
  '2': [
    {'1': 'wrap_text', '3': 1, '4': 1, '5': 8, '10': 'wrapText'},
  ],
};

/// Descriptor for `TextualPreviewSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textualPreviewSettingsDescriptor =
    $convert.base64Decode(
        'ChZUZXh0dWFsUHJldmlld1NldHRpbmdzEhsKCXdyYXBfdGV4dBgBIAEoCFIId3JhcFRleHQ=');

@$core.Deprecated('Use sidebarPreferencesDescriptor instead')
const SidebarPreferences$json = {
  '1': 'SidebarPreferences',
  '2': [
    {
      '1': 'inline_dms_collapsed',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'inlineDmsCollapsed'
    },
    {
      '1': 'show_collapsed_unread_dms_badge',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'showCollapsedUnreadDmsBadge',
      '17': true
    },
    {
      '1': 'show_incoming_friend_request_badge',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'showIncomingFriendRequestBadge',
      '17': true
    },
  ],
  '8': [
    {'1': '_show_collapsed_unread_dms_badge'},
    {'1': '_show_incoming_friend_request_badge'},
  ],
};

/// Descriptor for `SidebarPreferences`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sidebarPreferencesDescriptor = $convert.base64Decode(
    'ChJTaWRlYmFyUHJlZmVyZW5jZXMSMAoUaW5saW5lX2Rtc19jb2xsYXBzZWQYASABKAhSEmlubG'
    'luZURtc0NvbGxhcHNlZBJJCh9zaG93X2NvbGxhcHNlZF91bnJlYWRfZG1zX2JhZGdlGAIgASgI'
    'SABSG3Nob3dDb2xsYXBzZWRVbnJlYWREbXNCYWRnZYgBARJPCiJzaG93X2luY29taW5nX2ZyaW'
    'VuZF9yZXF1ZXN0X2JhZGdlGAMgASgISAFSHnNob3dJbmNvbWluZ0ZyaWVuZFJlcXVlc3RCYWRn'
    'ZYgBAUIiCiBfc2hvd19jb2xsYXBzZWRfdW5yZWFkX2Rtc19iYWRnZUIlCiNfc2hvd19pbmNvbW'
    'luZ19mcmllbmRfcmVxdWVzdF9iYWRnZQ==');

@$core.Deprecated('Use memberListStateDescriptor instead')
const MemberListState$json = {
  '1': 'MemberListState',
  '2': [
    {
      '1': 'members_open',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'membersOpen',
      '17': true
    },
  ],
  '8': [
    {'1': '_members_open'},
  ],
};

/// Descriptor for `MemberListState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberListStateDescriptor = $convert.base64Decode(
    'Cg9NZW1iZXJMaXN0U3RhdGUSJgoMbWVtYmVyc19vcGVuGAEgASgISABSC21lbWJlcnNPcGVuiA'
    'EBQg8KDV9tZW1iZXJzX29wZW4=');

@$core.Deprecated('Use unreadChannelsStateDescriptor instead')
const UnreadChannelsState$json = {
  '1': 'UnreadChannelsState',
  '2': [
    {
      '1': 'collapsed_channel_ids',
      '3': 1,
      '4': 3,
      '5': 9,
      '10': 'collapsedChannelIds'
    },
  ],
};

/// Descriptor for `UnreadChannelsState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unreadChannelsStateDescriptor = $convert.base64Decode(
    'ChNVbnJlYWRDaGFubmVsc1N0YXRlEjIKFWNvbGxhcHNlZF9jaGFubmVsX2lkcxgBIAMoCVITY2'
    '9sbGFwc2VkQ2hhbm5lbElkcw==');

@$core.Deprecated('Use recentMentionsSettingsDescriptor instead')
const RecentMentionsSettings$json = {
  '1': 'RecentMentionsSettings',
  '2': [
    {
      '1': 'include_everyone',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'includeEveryone',
      '17': true
    },
    {
      '1': 'include_roles',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'includeRoles',
      '17': true
    },
    {
      '1': 'include_guilds',
      '3': 3,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'includeGuilds',
      '17': true
    },
  ],
  '8': [
    {'1': '_include_everyone'},
    {'1': '_include_roles'},
    {'1': '_include_guilds'},
  ],
};

/// Descriptor for `RecentMentionsSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recentMentionsSettingsDescriptor = $convert.base64Decode(
    'ChZSZWNlbnRNZW50aW9uc1NldHRpbmdzEi4KEGluY2x1ZGVfZXZlcnlvbmUYASABKAhIAFIPaW'
    '5jbHVkZUV2ZXJ5b25liAEBEigKDWluY2x1ZGVfcm9sZXMYAiABKAhIAVIMaW5jbHVkZVJvbGVz'
    'iAEBEioKDmluY2x1ZGVfZ3VpbGRzGAMgASgISAJSDWluY2x1ZGVHdWlsZHOIAQFCEwoRX2luY2'
    'x1ZGVfZXZlcnlvbmVCEAoOX2luY2x1ZGVfcm9sZXNCEQoPX2luY2x1ZGVfZ3VpbGRz');

@$core.Deprecated('Use mentionFrecencyStateDescriptor instead')
const MentionFrecencyState$json = {
  '1': 'MentionFrecencyState',
  '2': [
    {
      '1': 'scopes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.MentionFrecencyState.Scope',
      '10': 'scopes'
    },
  ],
  '3': [MentionFrecencyState_Entry$json, MentionFrecencyState_Scope$json],
};

@$core.Deprecated('Use mentionFrecencyStateDescriptor instead')
const MentionFrecencyState_Entry$json = {
  '1': 'Entry',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'count', '3': 2, '4': 1, '5': 13, '10': 'count'},
    {'1': 'last_at_ms', '3': 3, '4': 1, '5': 3, '10': 'lastAtMs'},
  ],
};

@$core.Deprecated('Use mentionFrecencyStateDescriptor instead')
const MentionFrecencyState_Scope$json = {
  '1': 'Scope',
  '2': [
    {'1': 'guild_id', '3': 1, '4': 1, '5': 9, '10': 'guildId'},
    {
      '1': 'entries',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.MentionFrecencyState.Entry',
      '10': 'entries'
    },
  ],
};

/// Descriptor for `MentionFrecencyState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mentionFrecencyStateDescriptor = $convert.base64Decode(
    'ChRNZW50aW9uRnJlY2VuY3lTdGF0ZRJOCgZzY29wZXMYASADKAsyNi5mbHV4ZXIudXNlci5wcm'
    'VmZXJlbmNlcy52MS5NZW50aW9uRnJlY2VuY3lTdGF0ZS5TY29wZVIGc2NvcGVzGlQKBUVudHJ5'
    'EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVjb3VudBgCIAEoDVIFY291bnQSHAoKbGFzdF'
    '9hdF9tcxgDIAEoA1IIbGFzdEF0TXMadAoFU2NvcGUSGQoIZ3VpbGRfaWQYASABKAlSB2d1aWxk'
    'SWQSUAoHZW50cmllcxgCIAMoCzI2LmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLk1lbnRpb2'
    '5GcmVjZW5jeVN0YXRlLkVudHJ5UgdlbnRyaWVz');

@$core.Deprecated('Use favoritesStateDescriptor instead')
const FavoritesState$json = {
  '1': 'FavoritesState',
  '2': [
    {
      '1': 'channels',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.FavoriteChannel',
      '10': 'channels'
    },
    {
      '1': 'categories',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.FavoriteCategory',
      '10': 'categories'
    },
    {
      '1': 'collapsed_category_ids',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'collapsedCategoryIds'
    },
    {
      '1': 'hide_muted_channels',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'hideMutedChannels'
    },
    {'1': 'muted', '3': 5, '4': 1, '5': 8, '10': 'muted'},
  ],
};

/// Descriptor for `FavoritesState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoritesStateDescriptor = $convert.base64Decode(
    'Cg5GYXZvcml0ZXNTdGF0ZRJHCghjaGFubmVscxgBIAMoCzIrLmZsdXhlci51c2VyLnByZWZlcm'
    'VuY2VzLnYxLkZhdm9yaXRlQ2hhbm5lbFIIY2hhbm5lbHMSTAoKY2F0ZWdvcmllcxgCIAMoCzIs'
    'LmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLkZhdm9yaXRlQ2F0ZWdvcnlSCmNhdGVnb3JpZX'
    'MSNAoWY29sbGFwc2VkX2NhdGVnb3J5X2lkcxgDIAMoCVIUY29sbGFwc2VkQ2F0ZWdvcnlJZHMS'
    'LgoTaGlkZV9tdXRlZF9jaGFubmVscxgEIAEoCFIRaGlkZU11dGVkQ2hhbm5lbHMSFAoFbXV0ZW'
    'QYBSABKAhSBW11dGVk');

@$core.Deprecated('Use favoriteChannelDescriptor instead')
const FavoriteChannel$json = {
  '1': 'FavoriteChannel',
  '2': [
    {'1': 'channel_id', '3': 1, '4': 1, '5': 9, '10': 'channelId'},
    {'1': 'guild_id', '3': 2, '4': 1, '5': 9, '10': 'guildId'},
    {
      '1': 'parent_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'parentId',
      '17': true
    },
    {'1': 'position', '3': 4, '4': 1, '5': 5, '10': 'position'},
    {
      '1': 'nickname',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'nickname',
      '17': true
    },
  ],
  '8': [
    {'1': '_parent_id'},
    {'1': '_nickname'},
  ],
};

/// Descriptor for `FavoriteChannel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteChannelDescriptor = $convert.base64Decode(
    'Cg9GYXZvcml0ZUNoYW5uZWwSHQoKY2hhbm5lbF9pZBgBIAEoCVIJY2hhbm5lbElkEhkKCGd1aW'
    'xkX2lkGAIgASgJUgdndWlsZElkEiAKCXBhcmVudF9pZBgDIAEoCUgAUghwYXJlbnRJZIgBARIa'
    'Cghwb3NpdGlvbhgEIAEoBVIIcG9zaXRpb24SHwoIbmlja25hbWUYBSABKAlIAVIIbmlja25hbW'
    'WIAQFCDAoKX3BhcmVudF9pZEILCglfbmlja25hbWU=');

@$core.Deprecated('Use favoriteCategoryDescriptor instead')
const FavoriteCategory$json = {
  '1': 'FavoriteCategory',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'position', '3': 3, '4': 1, '5': 5, '10': 'position'},
  ],
};

/// Descriptor for `FavoriteCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteCategoryDescriptor = $convert.base64Decode(
    'ChBGYXZvcml0ZUNhdGVnb3J5Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEh'
    'oKCHBvc2l0aW9uGAMgASgFUghwb3NpdGlvbg==');

@$core.Deprecated('Use nagbarDismissalsDescriptor instead')
const NagbarDismissals$json = {
  '1': 'NagbarDismissals',
  '2': [
    {'1': 'ios_install', '3': 1, '4': 1, '5': 8, '10': 'iosInstall'},
    {'1': 'pwa_install', '3': 2, '4': 1, '5': 8, '10': 'pwaInstall'},
    {
      '1': 'push_notification',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'pushNotification'
    },
    {
      '1': 'desktop_notification',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'desktopNotification'
    },
    {
      '1': 'premium_grace_period',
      '3': 5,
      '4': 1,
      '5': 8,
      '10': 'premiumGracePeriod'
    },
    {'1': 'premium_expired', '3': 6, '4': 1, '5': 8, '10': 'premiumExpired'},
    {
      '1': 'premium_onboarding',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'premiumOnboarding'
    },
    {
      '1': 'premium_trial_expiring',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'premiumTrialExpiring'
    },
    {'1': 'gift_inventory', '3': 9, '4': 1, '5': 8, '10': 'giftInventory'},
    {'1': 'desktop_download', '3': 10, '4': 1, '5': 8, '10': 'desktopDownload'},
    {
      '1': 'guild_membership_cta',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'guildMembershipCta'
    },
    {'1': 'visionary_mfa', '3': 12, '4': 1, '5': 8, '10': 'visionaryMfa'},
    {
      '1': 'legacy_phone_unlink',
      '3': 14,
      '4': 1,
      '5': 8,
      '10': 'legacyPhoneUnlink'
    },
    {
      '1': 'pending_bulk_deletion',
      '3': 15,
      '4': 3,
      '5': 11,
      '6':
          '.fluxer.user.preferences.v1.NagbarDismissals.PendingBulkDeletionEntry',
      '10': 'pendingBulkDeletion'
    },
    {
      '1': 'invites_disabled',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.NagbarDismissals.InvitesDisabledEntry',
      '10': 'invitesDisabled'
    },
    {
      '1': 'guild_mfa_requirement',
      '3': 17,
      '4': 3,
      '5': 11,
      '6':
          '.fluxer.user.preferences.v1.NagbarDismissals.GuildMfaRequirementEntry',
      '10': 'guildMfaRequirement'
    },
  ],
  '3': [
    NagbarDismissals_PendingBulkDeletionEntry$json,
    NagbarDismissals_InvitesDisabledEntry$json,
    NagbarDismissals_GuildMfaRequirementEntry$json
  ],
};

@$core.Deprecated('Use nagbarDismissalsDescriptor instead')
const NagbarDismissals_PendingBulkDeletionEntry$json = {
  '1': 'PendingBulkDeletionEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use nagbarDismissalsDescriptor instead')
const NagbarDismissals_InvitesDisabledEntry$json = {
  '1': 'InvitesDisabledEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use nagbarDismissalsDescriptor instead')
const NagbarDismissals_GuildMfaRequirementEntry$json = {
  '1': 'GuildMfaRequirementEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 8, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `NagbarDismissals`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nagbarDismissalsDescriptor = $convert.base64Decode(
    'ChBOYWdiYXJEaXNtaXNzYWxzEh8KC2lvc19pbnN0YWxsGAEgASgIUgppb3NJbnN0YWxsEh8KC3'
    'B3YV9pbnN0YWxsGAIgASgIUgpwd2FJbnN0YWxsEisKEXB1c2hfbm90aWZpY2F0aW9uGAMgASgI'
    'UhBwdXNoTm90aWZpY2F0aW9uEjEKFGRlc2t0b3Bfbm90aWZpY2F0aW9uGAQgASgIUhNkZXNrdG'
    '9wTm90aWZpY2F0aW9uEjAKFHByZW1pdW1fZ3JhY2VfcGVyaW9kGAUgASgIUhJwcmVtaXVtR3Jh'
    'Y2VQZXJpb2QSJwoPcHJlbWl1bV9leHBpcmVkGAYgASgIUg5wcmVtaXVtRXhwaXJlZBItChJwcm'
    'VtaXVtX29uYm9hcmRpbmcYByABKAhSEXByZW1pdW1PbmJvYXJkaW5nEjQKFnByZW1pdW1fdHJp'
    'YWxfZXhwaXJpbmcYCCABKAhSFHByZW1pdW1UcmlhbEV4cGlyaW5nEiUKDmdpZnRfaW52ZW50b3'
    'J5GAkgASgIUg1naWZ0SW52ZW50b3J5EikKEGRlc2t0b3BfZG93bmxvYWQYCiABKAhSD2Rlc2t0'
    'b3BEb3dubG9hZBIwChRndWlsZF9tZW1iZXJzaGlwX2N0YRgLIAEoCFISZ3VpbGRNZW1iZXJzaG'
    'lwQ3RhEiMKDXZpc2lvbmFyeV9tZmEYDCABKAhSDHZpc2lvbmFyeU1mYRIuChNsZWdhY3lfcGhv'
    'bmVfdW5saW5rGA4gASgIUhFsZWdhY3lQaG9uZVVubGluaxJ5ChVwZW5kaW5nX2J1bGtfZGVsZX'
    'Rpb24YDyADKAsyRS5mbHV4ZXIudXNlci5wcmVmZXJlbmNlcy52MS5OYWdiYXJEaXNtaXNzYWxz'
    'LlBlbmRpbmdCdWxrRGVsZXRpb25FbnRyeVITcGVuZGluZ0J1bGtEZWxldGlvbhJsChBpbnZpdG'
    'VzX2Rpc2FibGVkGBAgAygLMkEuZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuTmFnYmFyRGlz'
    'bWlzc2Fscy5JbnZpdGVzRGlzYWJsZWRFbnRyeVIPaW52aXRlc0Rpc2FibGVkEnkKFWd1aWxkX2'
    '1mYV9yZXF1aXJlbWVudBgRIAMoCzJFLmZsdXhlci51c2VyLnByZWZlcmVuY2VzLnYxLk5hZ2Jh'
    'ckRpc21pc3NhbHMuR3VpbGRNZmFSZXF1aXJlbWVudEVudHJ5UhNndWlsZE1mYVJlcXVpcmVtZW'
    '50GkYKGFBlbmRpbmdCdWxrRGVsZXRpb25FbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1'
    'ZRgCIAEoCFIFdmFsdWU6AjgBGkIKFEludml0ZXNEaXNhYmxlZEVudHJ5EhAKA2tleRgBIAEoCV'
    'IDa2V5EhQKBXZhbHVlGAIgASgIUgV2YWx1ZToCOAEaRgoYR3VpbGRNZmFSZXF1aXJlbWVudEVu'
    'dHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgIUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use dismissedUpsellsDescriptor instead')
const DismissedUpsells$json = {
  '1': 'DismissedUpsells',
  '2': [
    {'1': 'picker_premium', '3': 1, '4': 1, '5': 8, '10': 'pickerPremium'},
  ],
};

/// Descriptor for `DismissedUpsells`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dismissedUpsellsDescriptor = $convert.base64Decode(
    'ChBEaXNtaXNzZWRVcHNlbGxzEiUKDnBpY2tlcl9wcmVtaXVtGAEgASgIUg1waWNrZXJQcmVtaX'
    'Vt');

@$core.Deprecated('Use guildNsfwAgreementsDescriptor instead')
const GuildNsfwAgreements$json = {
  '1': 'GuildNsfwAgreements',
  '2': [
    {
      '1': 'agreed_channel_ids',
      '3': 1,
      '4': 3,
      '5': 9,
      '10': 'agreedChannelIds'
    },
    {'1': 'agreed_guild_ids', '3': 2, '4': 3, '5': 9, '10': 'agreedGuildIds'},
    {
      '1': 'agreed_category_ids',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'agreedCategoryIds'
    },
  ],
};

/// Descriptor for `GuildNsfwAgreements`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guildNsfwAgreementsDescriptor = $convert.base64Decode(
    'ChNHdWlsZE5zZndBZ3JlZW1lbnRzEiwKEmFncmVlZF9jaGFubmVsX2lkcxgBIAMoCVIQYWdyZW'
    'VkQ2hhbm5lbElkcxIoChBhZ3JlZWRfZ3VpbGRfaWRzGAIgAygJUg5hZ3JlZWRHdWlsZElkcxIu'
    'ChNhZ3JlZWRfY2F0ZWdvcnlfaWRzGAMgAygJUhFhZ3JlZWRDYXRlZ29yeUlkcw==');

@$core.Deprecated('Use whatsNewStateDescriptor instead')
const WhatsNewState$json = {
  '1': 'WhatsNewState',
  '2': [
    {
      '1': 'last_dismissed_entry_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'lastDismissedEntryId',
      '17': true
    },
  ],
  '8': [
    {'1': '_last_dismissed_entry_id'},
  ],
};

/// Descriptor for `WhatsNewState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List whatsNewStateDescriptor = $convert.base64Decode(
    'Cg1XaGF0c05ld1N0YXRlEjoKF2xhc3RfZGlzbWlzc2VkX2VudHJ5X2lkGAEgASgJSABSFGxhc3'
    'REaXNtaXNzZWRFbnRyeUlkiAEBQhoKGF9sYXN0X2Rpc21pc3NlZF9lbnRyeV9pZA==');

@$core.Deprecated('Use permissionLayoutSettingsDescriptor instead')
const PermissionLayoutSettings$json = {
  '1': 'PermissionLayoutSettings',
  '2': [
    {
      '1': 'layout',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.PermissionLayoutMode',
      '10': 'layout'
    },
    {
      '1': 'grid',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.PermissionGridMode',
      '10': 'grid'
    },
  ],
};

/// Descriptor for `PermissionLayoutSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionLayoutSettingsDescriptor = $convert.base64Decode(
    'ChhQZXJtaXNzaW9uTGF5b3V0U2V0dGluZ3MSSAoGbGF5b3V0GAEgASgOMjAuZmx1eGVyLnVzZX'
    'IucHJlZmVyZW5jZXMudjEuUGVybWlzc2lvbkxheW91dE1vZGVSBmxheW91dBJCCgRncmlkGAIg'
    'ASgOMi4uZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuUGVybWlzc2lvbkdyaWRNb2RlUgRncm'
    'lk');

@$core.Deprecated('Use guildMemberLayoutSettingsDescriptor instead')
const GuildMemberLayoutSettings$json = {
  '1': 'GuildMemberLayoutSettings',
  '2': [
    {
      '1': 'mode',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.GuildMemberViewMode',
      '10': 'mode'
    },
  ],
};

/// Descriptor for `GuildMemberLayoutSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guildMemberLayoutSettingsDescriptor =
    $convert.base64Decode(
        'ChlHdWlsZE1lbWJlckxheW91dFNldHRpbmdzEkMKBG1vZGUYASABKA4yLy5mbHV4ZXIudXNlci'
        '5wcmVmZXJlbmNlcy52MS5HdWlsZE1lbWJlclZpZXdNb2RlUgRtb2Rl');

@$core.Deprecated('Use guildFolderExpandedStateDescriptor instead')
const GuildFolderExpandedState$json = {
  '1': 'GuildFolderExpandedState',
  '2': [
    {
      '1': 'expanded_folder_ids',
      '3': 1,
      '4': 3,
      '5': 6,
      '10': 'expandedFolderIds'
    },
  ],
};

/// Descriptor for `GuildFolderExpandedState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List guildFolderExpandedStateDescriptor =
    $convert.base64Decode(
        'ChhHdWlsZEZvbGRlckV4cGFuZGVkU3RhdGUSLgoTZXhwYW5kZWRfZm9sZGVyX2lkcxgBIAMoBl'
        'IRZXhwYW5kZWRGb2xkZXJJZHM=');

@$core.Deprecated('Use hiddenGuildListButtonsDescriptor instead')
const HiddenGuildListButtons$json = {
  '1': 'HiddenGuildListButtons',
  '2': [
    {'1': 'download_button', '3': 1, '4': 1, '5': 8, '10': 'downloadButton'},
    {'1': 'help_button', '3': 2, '4': 1, '5': 8, '10': 'helpButton'},
  ],
};

/// Descriptor for `HiddenGuildListButtons`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hiddenGuildListButtonsDescriptor =
    $convert.base64Decode(
        'ChZIaWRkZW5HdWlsZExpc3RCdXR0b25zEicKD2Rvd25sb2FkX2J1dHRvbhgBIAEoCFIOZG93bm'
        'xvYWRCdXR0b24SHwoLaGVscF9idXR0b24YAiABKAhSCmhlbHBCdXR0b24=');

@$core.Deprecated('Use keyboardModeIntroStateDescriptor instead')
const KeyboardModeIntroState$json = {
  '1': 'KeyboardModeIntroState',
  '2': [
    {'1': 'seen', '3': 1, '4': 1, '5': 8, '10': 'seen'},
  ],
};

/// Descriptor for `KeyboardModeIntroState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyboardModeIntroStateDescriptor =
    $convert.base64Decode(
        'ChZLZXlib2FyZE1vZGVJbnRyb1N0YXRlEhIKBHNlZW4YASABKAhSBHNlZW4=');

@$core.Deprecated('Use inputMonitoringPromptsStateDescriptor instead')
const InputMonitoringPromptsState$json = {
  '1': 'InputMonitoringPromptsState',
  '2': [
    {'1': 'seen_cta', '3': 1, '4': 1, '5': 8, '10': 'seenCta'},
  ],
};

/// Descriptor for `InputMonitoringPromptsState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputMonitoringPromptsStateDescriptor =
    $convert.base64Decode(
        'ChtJbnB1dE1vbml0b3JpbmdQcm9tcHRzU3RhdGUSGQoIc2Vlbl9jdGEYASABKAhSB3NlZW5DdG'
        'E=');

@$core.Deprecated('Use voicePromptsStateDescriptor instead')
const VoicePromptsState$json = {
  '1': 'VoicePromptsState',
  '2': [
    {
      '1': 'skip_hide_own_camera_confirm',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'skipHideOwnCameraConfirm'
    },
    {
      '1': 'skip_hide_own_screenshare_confirm',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'skipHideOwnScreenshareConfirm'
    },
  ],
};

/// Descriptor for `VoicePromptsState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voicePromptsStateDescriptor = $convert.base64Decode(
    'ChFWb2ljZVByb21wdHNTdGF0ZRI+Chxza2lwX2hpZGVfb3duX2NhbWVyYV9jb25maXJtGAEgAS'
    'gIUhhza2lwSGlkZU93bkNhbWVyYUNvbmZpcm0SSAohc2tpcF9oaWRlX293bl9zY3JlZW5zaGFy'
    'ZV9jb25maXJtGAIgASgIUh1za2lwSGlkZU93blNjcmVlbnNoYXJlQ29uZmlybQ==');

@$core.Deprecated('Use sudoPromptStateDescriptor instead')
const SudoPromptState$json = {
  '1': 'SudoPromptState',
  '2': [
    {
      '1': 'last_used_mfa_method',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.fluxer.user.preferences.v1.MfaMethod',
      '9': 0,
      '10': 'lastUsedMfaMethod',
      '17': true
    },
  ],
  '8': [
    {'1': '_last_used_mfa_method'},
  ],
};

/// Descriptor for `SudoPromptState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sudoPromptStateDescriptor = $convert.base64Decode(
    'Cg9TdWRvUHJvbXB0U3RhdGUSWwoUbGFzdF91c2VkX21mYV9tZXRob2QYASABKA4yJS5mbHV4ZX'
    'IudXNlci5wcmVmZXJlbmNlcy52MS5NZmFNZXRob2RIAFIRbGFzdFVzZWRNZmFNZXRob2SIAQFC'
    'FwoVX2xhc3RfdXNlZF9tZmFfbWV0aG9k');

@$core.Deprecated('Use keybindSettingsDescriptor instead')
const KeybindSettings$json = {
  '1': 'KeybindSettings',
  '2': [
    {
      '1': 'custom_keybinds',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.CustomKeybind',
      '10': 'customKeybinds'
    },
    {'1': 'transmit_mode', '3': 2, '4': 1, '5': 9, '10': 'transmitMode'},
    {
      '1': 'push_to_talk_release_delay_ms',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'pushToTalkReleaseDelayMs',
      '17': true
    },
  ],
  '8': [
    {'1': '_push_to_talk_release_delay_ms'},
  ],
};

/// Descriptor for `KeybindSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keybindSettingsDescriptor = $convert.base64Decode(
    'Cg9LZXliaW5kU2V0dGluZ3MSUgoPY3VzdG9tX2tleWJpbmRzGAEgAygLMikuZmx1eGVyLnVzZX'
    'IucHJlZmVyZW5jZXMudjEuQ3VzdG9tS2V5YmluZFIOY3VzdG9tS2V5YmluZHMSIwoNdHJhbnNt'
    'aXRfbW9kZRgCIAEoCVIMdHJhbnNtaXRNb2RlEkQKHXB1c2hfdG9fdGFsa19yZWxlYXNlX2RlbG'
    'F5X21zGAMgASgNSABSGHB1c2hUb1RhbGtSZWxlYXNlRGVsYXlNc4gBAUIgCh5fcHVzaF90b190'
    'YWxrX3JlbGVhc2VfZGVsYXlfbXM=');

@$core.Deprecated('Use customKeybindDescriptor instead')
const CustomKeybind$json = {
  '1': 'CustomKeybind',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'action', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'action', '17': true},
    {
      '1': 'combo',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.fluxer.user.preferences.v1.KeybindCombo',
      '10': 'combo'
    },
    {'1': 'enabled', '3': 4, '4': 1, '5': 8, '10': 'enabled'},
  ],
  '8': [
    {'1': '_action'},
  ],
};

/// Descriptor for `CustomKeybind`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customKeybindDescriptor = $convert.base64Decode(
    'Cg1DdXN0b21LZXliaW5kEg4KAmlkGAEgASgJUgJpZBIbCgZhY3Rpb24YAiABKAlIAFIGYWN0aW'
    '9uiAEBEj4KBWNvbWJvGAMgASgLMiguZmx1eGVyLnVzZXIucHJlZmVyZW5jZXMudjEuS2V5Ymlu'
    'ZENvbWJvUgVjb21ibxIYCgdlbmFibGVkGAQgASgIUgdlbmFibGVkQgkKB19hY3Rpb24=');

@$core.Deprecated('Use keybindComboDescriptor instead')
const KeybindCombo$json = {
  '1': 'KeybindCombo',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'code', '17': true},
    {'1': 'ctrl_or_meta', '3': 3, '4': 1, '5': 8, '10': 'ctrlOrMeta'},
    {'1': 'ctrl', '3': 4, '4': 1, '5': 8, '10': 'ctrl'},
    {'1': 'alt', '3': 5, '4': 1, '5': 8, '10': 'alt'},
    {'1': 'shift', '3': 6, '4': 1, '5': 8, '10': 'shift'},
    {'1': 'meta', '3': 7, '4': 1, '5': 8, '10': 'meta'},
    {'1': 'global', '3': 8, '4': 1, '5': 8, '9': 1, '10': 'global', '17': true},
    {
      '1': 'enabled',
      '3': 9,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'enabled',
      '17': true
    },
    {'1': 'modifier_only', '3': 10, '4': 1, '5': 8, '10': 'modifierOnly'},
    {'1': 'both_sides', '3': 11, '4': 1, '5': 8, '10': 'bothSides'},
    {
      '1': 'mouse_button',
      '3': 12,
      '4': 1,
      '5': 13,
      '9': 3,
      '10': 'mouseButton',
      '17': true
    },
    {
      '1': 'gamepad_button',
      '3': 13,
      '4': 1,
      '5': 13,
      '9': 4,
      '10': 'gamepadButton',
      '17': true
    },
  ],
  '8': [
    {'1': '_code'},
    {'1': '_global'},
    {'1': '_enabled'},
    {'1': '_mouse_button'},
    {'1': '_gamepad_button'},
  ],
};

/// Descriptor for `KeybindCombo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keybindComboDescriptor = $convert.base64Decode(
    'CgxLZXliaW5kQ29tYm8SEAoDa2V5GAEgASgJUgNrZXkSFwoEY29kZRgCIAEoCUgAUgRjb2RliA'
    'EBEiAKDGN0cmxfb3JfbWV0YRgDIAEoCFIKY3RybE9yTWV0YRISCgRjdHJsGAQgASgIUgRjdHJs'
    'EhAKA2FsdBgFIAEoCFIDYWx0EhQKBXNoaWZ0GAYgASgIUgVzaGlmdBISCgRtZXRhGAcgASgIUg'
    'RtZXRhEhsKBmdsb2JhbBgIIAEoCEgBUgZnbG9iYWyIAQESHQoHZW5hYmxlZBgJIAEoCEgCUgdl'
    'bmFibGVkiAEBEiMKDW1vZGlmaWVyX29ubHkYCiABKAhSDG1vZGlmaWVyT25seRIdCgpib3RoX3'
    'NpZGVzGAsgASgIUglib3RoU2lkZXMSJgoMbW91c2VfYnV0dG9uGAwgASgNSANSC21vdXNlQnV0'
    'dG9uiAEBEioKDmdhbWVwYWRfYnV0dG9uGA0gASgNSARSDWdhbWVwYWRCdXR0b26IAQFCBwoFX2'
    'NvZGVCCQoHX2dsb2JhbEIKCghfZW5hYmxlZEIPCg1fbW91c2VfYnV0dG9uQhEKD19nYW1lcGFk'
    'X2J1dHRvbg==');

@$core.Deprecated('Use chatInputSettingsDescriptor instead')
const ChatInputSettings$json = {
  '1': 'ChatInputSettings',
  '2': [
    {
      '1': 'convert_emoticons',
      '3': 1,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'convertEmoticons',
      '17': true
    },
    {
      '1': 'save_camera_captures_to_device',
      '3': 2,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'saveCameraCapturesToDevice',
      '17': true
    },
  ],
  '8': [
    {'1': '_convert_emoticons'},
    {'1': '_save_camera_captures_to_device'},
  ],
};

/// Descriptor for `ChatInputSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatInputSettingsDescriptor = $convert.base64Decode(
    'ChFDaGF0SW5wdXRTZXR0aW5ncxIwChFjb252ZXJ0X2Vtb3RpY29ucxgBIAEoCEgAUhBjb252ZX'
    'J0RW1vdGljb25ziAEBEkcKHnNhdmVfY2FtZXJhX2NhcHR1cmVzX3RvX2RldmljZRgCIAEoCEgB'
    'UhpzYXZlQ2FtZXJhQ2FwdHVyZXNUb0RldmljZYgBAUIUChJfY29udmVydF9lbW90aWNvbnNCIQ'
    'ofX3NhdmVfY2FtZXJhX2NhcHR1cmVzX3RvX2RldmljZQ==');
