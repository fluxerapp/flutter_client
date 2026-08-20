import 'dart:io' show Platform;

import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/defaults_shortcut_display_kind.dart';
import 'package:fluxer_app/features/input/domain/editable_focus_behavior.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_section.dart';

const KeybindCombo kDefaultShortcutsOverlayCombo = KeybindCombo(
  key: '/',
  ctrlOrMeta: true,
);

const KeybindCombo kShiftedSlashShortcutsOverlayFallbackCombo = KeybindCombo(
  key: '.',
  ctrlOrMeta: true,
  shift: true,
);

KeybindCombo shortcutsOverlayComboForPlatform() {
  return kDefaultShortcutsOverlayCombo;
}

List<KeybindCombo> shortcutsOverlayCombosForPlatform() {
  return <KeybindCombo>[
    kDefaultShortcutsOverlayCombo,
    kShiftedSlashShortcutsOverlayFallbackCombo,
  ];
}

const int kVoiceDeclineCallPriority = 100;
const int kMessageFocusTextareaPriority = 50;
const int kChatMarkChannelReadPriority = 10;

List<DefaultKeybind> buildDefaultKeybinds() {
  return <DefaultKeybind>[
    DefaultKeybind(
      action: KeybindAction.systemToggleShortcutsOverlay,
      combo: shortcutsOverlayComboForPlatform(),
      section: KeybindSection.defaults,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageEdit,
      combo: KeybindCombo(key: 'e'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageDelete,
      combo: KeybindCombo(key: 'Backspace'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messagePin,
      combo: KeybindCombo(key: 'p'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageReact,
      combo: KeybindCombo(key: '+'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageReply,
      combo: KeybindCombo(key: 'r'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageForward,
      combo: KeybindCombo(key: 'f'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageSpeak,
      combo: KeybindCombo(key: 's'),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageCopyText,
      combo: KeybindCombo(key: 'c', ctrlOrMeta: true),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageMarkUnread,
      combo: KeybindCombo(key: 'Enter', alt: true),
      requiresKeyboardMode: true,
      requiresMessageFocus: true,
      section: KeybindSection.messages,
    ),
    const DefaultKeybind(
      action: KeybindAction.messageFocusTextarea,
      combo: KeybindCombo(key: 'Escape'),
      requiresKeyboardMode: true,
      section: KeybindSection.messages,
      conflictPriority: kMessageFocusTextareaPriority,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildPrev,
      combo: KeybindCombo(key: 'ArrowUp', ctrlOrMeta: true, alt: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildNext,
      combo: KeybindCombo(key: 'ArrowDown', ctrlOrMeta: true, alt: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navChannelPrev,
      combo: KeybindCombo(key: 'ArrowUp', alt: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navChannelNext,
      combo: KeybindCombo(key: 'ArrowDown', alt: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navHistoryBack,
      combo: KeybindCombo(key: '[', ctrlOrMeta: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navHistoryForward,
      combo: KeybindCombo(key: ']', ctrlOrMeta: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navUnreadPrev,
      combo: KeybindCombo(key: 'ArrowUp', alt: true, shift: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navUnreadNext,
      combo: KeybindCombo(key: 'ArrowDown', alt: true, shift: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navMentionPrev,
      combo: KeybindCombo(
        key: 'ArrowUp',
        alt: true,
        shift: true,
        ctrlOrMeta: true,
      ),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navMentionNext,
      combo: KeybindCombo(
        key: 'ArrowDown',
        alt: true,
        shift: true,
        ctrlOrMeta: true,
      ),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navCurrentCall,
      combo: KeybindCombo(key: 'v', alt: true, shift: true, ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navToggleLastGuildDms,
      combo: KeybindCombo(key: 'ArrowRight', alt: true, ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildTabPrev,
      combo: KeybindCombo(key: 'Tab', ctrlOrMeta: true, shift: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildTabNext,
      combo: KeybindCombo(key: 'Tab', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot1,
      combo: KeybindCombo(key: '1', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot2,
      combo: KeybindCombo(key: '2', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot3,
      combo: KeybindCombo(key: '3', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot4,
      combo: KeybindCombo(key: '4', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot5,
      combo: KeybindCombo(key: '5', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot6,
      combo: KeybindCombo(key: '6', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot7,
      combo: KeybindCombo(key: '7', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot8,
      combo: KeybindCombo(key: '8', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navGuildSlot9,
      combo: KeybindCombo(key: '9', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navQuickSwitcher,
      combo: KeybindCombo(key: 'k', ctrlOrMeta: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.navAddGuild,
      combo: KeybindCombo(key: 'n', ctrlOrMeta: true, shift: true),
      section: KeybindSection.navigation,
    ),
    const DefaultKeybind(
      action: KeybindAction.dndStart,
      combo: KeybindCombo(key: 'd', ctrlOrMeta: true),
      informationalOnly: true,
      section: KeybindSection.dragAndDrop,
    ),
    const DefaultKeybind(
      action: KeybindAction.dndMoveUp,
      combo: KeybindCombo(key: 'ArrowUp'),
      informationalOnly: true,
      section: KeybindSection.dragAndDrop,
    ),
    const DefaultKeybind(
      action: KeybindAction.dndMoveDown,
      combo: KeybindCombo(key: 'ArrowDown'),
      informationalOnly: true,
      section: KeybindSection.dragAndDrop,
    ),
    const DefaultKeybind(
      action: KeybindAction.dndDrop,
      combo: KeybindCombo(key: ' '),
      informationalOnly: true,
      defaultsShortcutDisplayKind: DefaultsShortcutDisplayKind.spaceOrEnter,
      section: KeybindSection.dragAndDrop,
    ),
    const DefaultKeybind(
      action: KeybindAction.dndCancel,
      combo: KeybindCombo(key: 'Escape'),
      informationalOnly: true,
      section: KeybindSection.dragAndDrop,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatMarkGuildRead,
      combo: KeybindCombo(key: 'Escape', shift: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatMarkChannelRead,
      combo: KeybindCombo(key: 'Escape'),
      section: KeybindSection.chat,
      conflictPriority: kChatMarkChannelReadPriority,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatNewDm,
      combo: KeybindCombo(key: 't', ctrlOrMeta: true, shift: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatTogglePins,
      combo: KeybindCombo(key: 'p', ctrlOrMeta: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatToggleInbox,
      combo: KeybindCombo(key: 'i', ctrlOrMeta: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatMarkInboxRead,
      combo: KeybindCombo(key: 'e', ctrlOrMeta: true, shift: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatToggleMemberList,
      combo: KeybindCombo(key: 'u', ctrlOrMeta: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatToggleEmoji,
      combo: KeybindCombo(key: 'e', ctrlOrMeta: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatToggleGif,
      combo: KeybindCombo(key: 'g', ctrlOrMeta: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatToggleSticker,
      combo: KeybindCombo(key: 's', ctrlOrMeta: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatScrollUp,
      combo: KeybindCombo(key: 'PageUp'),
      editableFocusBehavior: EditableFocusBehavior.allowWhenEmpty,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatScrollDown,
      combo: KeybindCombo(key: 'PageDown'),
      editableFocusBehavior: EditableFocusBehavior.allowWhenEmpty,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatJumpOldestUnread,
      combo: KeybindCombo(key: 'PageUp', shift: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatFocusTextarea,
      combo: KeybindCombo(key: 'Tab'),
      defaultsShortcutDisplayKind: DefaultsShortcutDisplayKind.anyKey,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatUpload,
      combo: KeybindCombo(key: 'u', ctrlOrMeta: true, shift: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatCopyChannelLink,
      combo: KeybindCombo(key: 'l', ctrlOrMeta: true, shift: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatToggleSavedMedia,
      combo: KeybindCombo(key: 'm', ctrlOrMeta: true),
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.chatSendVoiceMessage,
      combo: KeybindCombo(key: 'v', code: 'KeyV', ctrlOrMeta: true, alt: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.chat,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceToggleMute,
      combo: KeybindCombo(key: 'm', ctrlOrMeta: true, shift: true),
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceToggleDeafen,
      combo: KeybindCombo(key: 'd', ctrlOrMeta: true, shift: true),
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceAnswerCall,
      combo: KeybindCombo(key: 'Enter', ctrlOrMeta: true),
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceDeclineCall,
      combo: KeybindCombo(key: 'Escape'),
      section: KeybindSection.voiceAndVideo,
      conflictPriority: kVoiceDeclineCallPriority,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceStartDmCall,
      combo: KeybindCombo(key: '`', code: 'Backquote', ctrl: true),
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceToggleSoundboard,
      combo: KeybindCombo(key: 'b', ctrlOrMeta: true, shift: true),
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voiceToggleCompactCallView,
      combo: KeybindCombo(
        key: 'v',
        code: 'KeyV',
        ctrlOrMeta: true,
        shift: true,
      ),
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voicePushToTalkPriority,
      combo: KeybindCombo(key: ''),
      hideFromDefaults: true,
      informationalOnly: true,
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.voicePriorityVad,
      combo: KeybindCombo(key: ''),
      hideFromDefaults: true,
      informationalOnly: true,
      section: KeybindSection.voiceAndVideo,
    ),
    const DefaultKeybind(
      action: KeybindAction.miscHelp,
      combo: KeybindCombo(key: 'h', ctrlOrMeta: true, shift: true),
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.miscSearch,
      combo: KeybindCombo(key: 'f', ctrlOrMeta: true),
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.miscOpenContextMenu,
      combo: KeybindCombo(key: 'F10', shift: true),
      informationalOnly: true,
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.systemToggleSettings,
      combo: KeybindCombo(key: ',', ctrlOrMeta: true),
      hideFromDefaults: true,
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.systemOpenThemeStudioPopout,
      combo: KeybindCombo(key: 't', ctrlOrMeta: true, alt: true, shift: true),
      editableFocusBehavior: EditableFocusBehavior.allow,
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.systemZoomIn,
      combo: KeybindCombo(key: '=', ctrlOrMeta: true),
      hideFromDefaults: true,
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.systemZoomOut,
      combo: KeybindCombo(key: '-', ctrlOrMeta: true),
      hideFromDefaults: true,
      section: KeybindSection.misc,
    ),
    const DefaultKeybind(
      action: KeybindAction.systemZoomReset,
      combo: KeybindCombo(key: '0', ctrlOrMeta: true),
      hideFromDefaults: true,
      section: KeybindSection.misc,
    ),
  ];
}

List<DefaultKeybind> visibleDefaultKeybinds() {
  return buildDefaultKeybinds()
      .where((DefaultKeybind entry) => !entry.hideFromDefaults)
      .toList();
}

bool get isMacOsKeybindPlatform => Platform.isMacOS || Platform.isIOS;

DefaultKeybind? defaultKeybindForAction(KeybindAction action) {
  for (final DefaultKeybind entry in buildDefaultKeybinds()) {
    if (entry.action == action) {
      return entry;
    }
  }
  return null;
}
