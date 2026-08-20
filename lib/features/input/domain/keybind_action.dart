enum KeybindAction {
  messageEdit,
  messageDelete,
  messagePin,
  messageReact,
  messageReply,
  messageForward,
  messageSpeak,
  messageCopyText,
  messageMarkUnread,
  messageFocusTextarea,
  navGuildPrev,
  navGuildNext,
  navChannelPrev,
  navChannelNext,
  navHistoryBack,
  navHistoryForward,
  navUnreadPrev,
  navUnreadNext,
  navMentionPrev,
  navMentionNext,
  navCurrentCall,
  navToggleLastGuildDms,
  navGuildTabPrev,
  navGuildTabNext,
  navGuildSlot1,
  navGuildSlot2,
  navGuildSlot3,
  navGuildSlot4,
  navGuildSlot5,
  navGuildSlot6,
  navGuildSlot7,
  navGuildSlot8,
  navGuildSlot9,
  navQuickSwitcher,
  navAddGuild,
  dndStart,
  dndMoveUp,
  dndMoveDown,
  dndDrop,
  dndCancel,
  chatMarkGuildRead,
  chatMarkChannelRead,
  chatNewDm,
  chatTogglePins,
  chatToggleInbox,
  chatMarkInboxRead,
  chatMarkAllInboxRead,
  chatToggleMemberList,
  chatToggleEmoji,
  chatToggleGif,
  chatToggleSticker,
  chatScrollUp,
  chatScrollDown,
  chatJumpOldestUnread,
  chatFocusTextarea,
  chatUpload,
  chatCopyChannelLink,
  chatToggleSavedMedia,
  chatSendVoiceMessage,
  voiceToggleMute,
  voiceToggleDeafen,
  voiceAnswerCall,
  voiceDeclineCall,
  voiceStartDmCall,
  voiceToggleSoundboard,
  voiceToggleCompactCallView,
  voicePushToTalkPriority,
  voicePriorityVad,
  miscHelp,
  miscSearch,
  miscOpenContextMenu,
  systemToggleSettings,
  systemToggleShortcutsOverlay,
  systemOpenThemeStudioPopout,
  systemZoomIn,
  systemZoomOut,
  systemZoomReset,
}

extension KeybindActionId on KeybindAction {
  String get id {
    switch (this) {
      case KeybindAction.messageEdit:
        return 'message_edit';
      case KeybindAction.messageDelete:
        return 'message_delete';
      case KeybindAction.messagePin:
        return 'message_pin';
      case KeybindAction.messageReact:
        return 'message_react';
      case KeybindAction.messageReply:
        return 'message_reply';
      case KeybindAction.messageForward:
        return 'message_forward';
      case KeybindAction.messageSpeak:
        return 'message_speak';
      case KeybindAction.messageCopyText:
        return 'message_copy_text';
      case KeybindAction.messageMarkUnread:
        return 'message_mark_unread';
      case KeybindAction.messageFocusTextarea:
        return 'message_focus_textarea';
      case KeybindAction.navGuildPrev:
        return 'nav_guild_prev';
      case KeybindAction.navGuildNext:
        return 'nav_guild_next';
      case KeybindAction.navChannelPrev:
        return 'nav_channel_prev';
      case KeybindAction.navChannelNext:
        return 'nav_channel_next';
      case KeybindAction.navHistoryBack:
        return 'nav_history_back';
      case KeybindAction.navHistoryForward:
        return 'nav_history_forward';
      case KeybindAction.navUnreadPrev:
        return 'nav_unread_prev';
      case KeybindAction.navUnreadNext:
        return 'nav_unread_next';
      case KeybindAction.navMentionPrev:
        return 'nav_mention_prev';
      case KeybindAction.navMentionNext:
        return 'nav_mention_next';
      case KeybindAction.navCurrentCall:
        return 'nav_current_call';
      case KeybindAction.navToggleLastGuildDms:
        return 'nav_toggle_last_guild_dms';
      case KeybindAction.navGuildTabPrev:
        return 'nav_guild_tab_prev';
      case KeybindAction.navGuildTabNext:
        return 'nav_guild_tab_next';
      case KeybindAction.navGuildSlot1:
        return 'nav_guild_slot_1';
      case KeybindAction.navGuildSlot2:
        return 'nav_guild_slot_2';
      case KeybindAction.navGuildSlot3:
        return 'nav_guild_slot_3';
      case KeybindAction.navGuildSlot4:
        return 'nav_guild_slot_4';
      case KeybindAction.navGuildSlot5:
        return 'nav_guild_slot_5';
      case KeybindAction.navGuildSlot6:
        return 'nav_guild_slot_6';
      case KeybindAction.navGuildSlot7:
        return 'nav_guild_slot_7';
      case KeybindAction.navGuildSlot8:
        return 'nav_guild_slot_8';
      case KeybindAction.navGuildSlot9:
        return 'nav_guild_slot_9';
      case KeybindAction.navQuickSwitcher:
        return 'nav_quick_switcher';
      case KeybindAction.navAddGuild:
        return 'nav_add_guild';
      case KeybindAction.dndStart:
        return 'dnd_start';
      case KeybindAction.dndMoveUp:
        return 'dnd_move_up';
      case KeybindAction.dndMoveDown:
        return 'dnd_move_down';
      case KeybindAction.dndDrop:
        return 'dnd_drop';
      case KeybindAction.dndCancel:
        return 'dnd_cancel';
      case KeybindAction.chatMarkGuildRead:
        return 'chat_mark_guild_read';
      case KeybindAction.chatMarkChannelRead:
        return 'chat_mark_channel_read';
      case KeybindAction.chatNewDm:
        return 'chat_new_dm';
      case KeybindAction.chatTogglePins:
        return 'chat_toggle_pins';
      case KeybindAction.chatToggleInbox:
        return 'chat_toggle_inbox';
      case KeybindAction.chatMarkInboxRead:
        return 'chat_mark_inbox_read';
      case KeybindAction.chatMarkAllInboxRead:
        return 'chat_mark_all_inbox_read';
      case KeybindAction.chatToggleMemberList:
        return 'chat_toggle_member_list';
      case KeybindAction.chatToggleEmoji:
        return 'chat_toggle_emoji';
      case KeybindAction.chatToggleGif:
        return 'chat_toggle_gif';
      case KeybindAction.chatToggleSticker:
        return 'chat_toggle_sticker';
      case KeybindAction.chatScrollUp:
        return 'chat_scroll_up';
      case KeybindAction.chatScrollDown:
        return 'chat_scroll_down';
      case KeybindAction.chatJumpOldestUnread:
        return 'chat_jump_oldest_unread';
      case KeybindAction.chatFocusTextarea:
        return 'chat_focus_textarea';
      case KeybindAction.chatUpload:
        return 'chat_upload';
      case KeybindAction.chatCopyChannelLink:
        return 'chat_copy_channel_link';
      case KeybindAction.chatToggleSavedMedia:
        return 'chat_toggle_saved_media';
      case KeybindAction.chatSendVoiceMessage:
        return 'chat_send_voice_message';
      case KeybindAction.voiceToggleMute:
        return 'voice_toggle_mute';
      case KeybindAction.voiceToggleDeafen:
        return 'voice_toggle_deafen';
      case KeybindAction.voiceAnswerCall:
        return 'voice_answer_call';
      case KeybindAction.voiceDeclineCall:
        return 'voice_decline_call';
      case KeybindAction.voiceStartDmCall:
        return 'voice_start_dm_call';
      case KeybindAction.voiceToggleSoundboard:
        return 'voice_toggle_soundboard';
      case KeybindAction.voiceToggleCompactCallView:
        return 'voice_toggle_compact_call_view';
      case KeybindAction.voicePushToTalkPriority:
        return 'voice_push_to_talk_priority';
      case KeybindAction.voicePriorityVad:
        return 'voice_priority_vad';
      case KeybindAction.miscHelp:
        return 'misc_help';
      case KeybindAction.miscSearch:
        return 'misc_search';
      case KeybindAction.miscOpenContextMenu:
        return 'misc_open_context_menu';
      case KeybindAction.systemToggleSettings:
        return 'system_toggle_settings';
      case KeybindAction.systemToggleShortcutsOverlay:
        return 'system_toggle_shortcuts_overlay';
      case KeybindAction.systemOpenThemeStudioPopout:
        return 'system_open_theme_studio_popout';
      case KeybindAction.systemZoomIn:
        return 'system_zoom_in';
      case KeybindAction.systemZoomOut:
        return 'system_zoom_out';
      case KeybindAction.systemZoomReset:
        return 'system_zoom_reset';
    }
  }
}
