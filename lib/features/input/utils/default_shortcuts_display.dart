import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_section.dart';

const List<(KeybindAction, KeybindAction)> kShortcutMergePairs =
    <(KeybindAction, KeybindAction)>[
      (KeybindAction.navGuildPrev, KeybindAction.navGuildNext),
      (KeybindAction.navChannelPrev, KeybindAction.navChannelNext),
      (KeybindAction.navHistoryBack, KeybindAction.navHistoryForward),
      (KeybindAction.navUnreadPrev, KeybindAction.navUnreadNext),
      (KeybindAction.navMentionPrev, KeybindAction.navMentionNext),
      (KeybindAction.chatScrollUp, KeybindAction.chatScrollDown),
      (KeybindAction.dndMoveUp, KeybindAction.dndMoveDown),
    ];

const Map<KeybindSection, List<KeybindAction>> kShortcutSectionDisplayOrder =
    <KeybindSection, List<KeybindAction>>{
      KeybindSection.messages: <KeybindAction>[
        KeybindAction.messageReply,
        KeybindAction.messageEdit,
        KeybindAction.messageDelete,
        KeybindAction.messageReact,
        KeybindAction.messageForward,
        KeybindAction.messagePin,
        KeybindAction.messageMarkUnread,
        KeybindAction.messageCopyText,
        KeybindAction.messageSpeak,
        KeybindAction.messageFocusTextarea,
      ],
      KeybindSection.navigation: <KeybindAction>[
        KeybindAction.navQuickSwitcher,
        KeybindAction.navGuildPrev,
        KeybindAction.navGuildNext,
        KeybindAction.navChannelPrev,
        KeybindAction.navChannelNext,
        KeybindAction.navToggleLastGuildDms,
        KeybindAction.navHistoryBack,
        KeybindAction.navHistoryForward,
        KeybindAction.navUnreadPrev,
        KeybindAction.navUnreadNext,
        KeybindAction.navMentionPrev,
        KeybindAction.navMentionNext,
        KeybindAction.navCurrentCall,
        KeybindAction.navAddGuild,
      ],
      KeybindSection.dragAndDrop: <KeybindAction>[
        KeybindAction.dndStart,
        KeybindAction.dndMoveUp,
        KeybindAction.dndMoveDown,
        KeybindAction.dndDrop,
        KeybindAction.dndCancel,
      ],
      KeybindSection.chat: <KeybindAction>[
        KeybindAction.chatFocusTextarea,
        KeybindAction.chatUpload,
        KeybindAction.chatToggleEmoji,
        KeybindAction.chatToggleGif,
        KeybindAction.chatToggleSticker,
        KeybindAction.chatToggleSavedMedia,
        KeybindAction.chatSendVoiceMessage,
        KeybindAction.chatTogglePins,
        KeybindAction.chatToggleInbox,
        KeybindAction.chatToggleMemberList,
        KeybindAction.chatScrollUp,
        KeybindAction.chatScrollDown,
        KeybindAction.chatJumpOldestUnread,
        KeybindAction.chatMarkChannelRead,
        KeybindAction.chatMarkGuildRead,
        KeybindAction.chatMarkInboxRead,
        KeybindAction.chatMarkAllInboxRead,
        KeybindAction.chatNewDm,
        KeybindAction.chatCopyChannelLink,
      ],
      KeybindSection.voiceAndVideo: <KeybindAction>[
        KeybindAction.voiceToggleMute,
        KeybindAction.voiceToggleDeafen,
        KeybindAction.voiceToggleSoundboard,
        KeybindAction.voiceStartDmCall,
        KeybindAction.voiceAnswerCall,
        KeybindAction.voiceDeclineCall,
      ],
      KeybindSection.misc: <KeybindAction>[
        KeybindAction.miscSearch,
        KeybindAction.miscOpenContextMenu,
        KeybindAction.miscHelp,
      ],
    };

List<DefaultKeybind> sortDefaultKeybindsForSection(
  KeybindSection section,
  List<DefaultKeybind> entries,
) {
  final List<KeybindAction>? order = kShortcutSectionDisplayOrder[section];
  if (order == null) {
    return List<DefaultKeybind>.from(entries);
  }
  int indexFor(KeybindAction action) {
    final int index = order.indexOf(action);
    return index == -1 ? order.length : index;
  }

  return List<DefaultKeybind>.from(entries)..sort(
    (DefaultKeybind a, DefaultKeybind b) =>
        indexFor(a.action).compareTo(indexFor(b.action)),
  );
}

List<List<DefaultKeybind>> partitionMergedShortcutRows(
  List<DefaultKeybind> entries,
) {
  final List<List<DefaultKeybind>> rows = <List<DefaultKeybind>>[];
  var index = 0;
  while (index < entries.length) {
    final DefaultKeybind current = entries[index];
    final (KeybindAction, KeybindAction)? pair = _mergePairFor(current.action);
    if (pair != null &&
        index + 1 < entries.length &&
        entries[index + 1].action == pair.$2) {
      rows.add(<DefaultKeybind>[current, entries[index + 1]]);
      index += 2;
      continue;
    }
    rows.add(<DefaultKeybind>[current]);
    index += 1;
  }
  return rows;
}

(KeybindAction, KeybindAction)? _mergePairFor(KeybindAction action) {
  for (final (KeybindAction, KeybindAction) pair in kShortcutMergePairs) {
    if (pair.$1 == action) {
      return pair;
    }
  }
  return null;
}
