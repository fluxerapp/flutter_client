class KeybindDispatchContext {
  const KeybindDispatchContext({
    required this.keyboardModeEnabled,
    required this.hasMessageFocus,
    required this.editableHasFocus,
    required this.editableText,
    required this.modalOpen,
    required this.fullscreenMediaOpen,
    required this.hasIncomingCall,
    required this.channelHasUnread,
    required this.quickSwitcherOpen,
  });

  final bool keyboardModeEnabled;
  final bool hasMessageFocus;
  final bool editableHasFocus;
  final String editableText;
  final bool modalOpen;
  final bool fullscreenMediaOpen;
  final bool hasIncomingCall;
  final bool channelHasUnread;
  final bool quickSwitcherOpen;
}
