import 'package:flutter/services.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/editable_focus_behavior.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_matcher.dart';
import 'package:fluxer_app/features/input/domain/keybind_dispatch_context.dart';

const Set<KeybindAction> kVoiceFullscreenAllowedKeybindActions =
    <KeybindAction>{
      KeybindAction.voiceDeclineCall,
      KeybindAction.voicePushToTalkPriority,
      KeybindAction.voicePriorityVad,
    };

class KeybindDispatcher {
  KeybindDispatcher({List<DefaultKeybind>? entries})
    : _entries = entries ?? buildDefaultKeybinds();

  final List<DefaultKeybind> _entries;

  List<KeybindAction> matchActions({
    required KeyEvent event,
    required KeybindDispatchContext context,
  }) {
    final List<DefaultKeybind> matches = <DefaultKeybind>[];
    for (final DefaultKeybind entry in _entries) {
      if (!entry.combo.hasTrigger) {
        continue;
      }
      if (!_canDispatch(entry, event: event, context: context)) {
        continue;
      }
      if (entry.action == KeybindAction.chatFocusTextarea &&
          !context.keyboardModeEnabled &&
          isAnyKeyFocusTextareaTrigger(event)) {
        matches.add(entry);
        continue;
      }
      if (entry.action == KeybindAction.systemToggleShortcutsOverlay) {
        if (_matchesShortcutsOverlay(event)) {
          matches.add(entry);
        }
        continue;
      }
      if (keyboardEventStartsComboPress(entry.combo, event)) {
        matches.add(entry);
      }
    }
    if (matches.isEmpty) {
      return const <KeybindAction>[];
    }
    matches.sort(
      (DefaultKeybind a, DefaultKeybind b) =>
          b.conflictPriority.compareTo(a.conflictPriority),
    );
    return matches.map((DefaultKeybind e) => e.action).toList();
  }

  bool _matchesShortcutsOverlay(KeyEvent event) {
    for (final combo in shortcutsOverlayCombosForPlatform()) {
      if (keyboardEventStartsComboPress(combo, event)) {
        return true;
      }
    }
    return false;
  }

  bool _canDispatch(
    DefaultKeybind entry, {
    required KeyEvent event,
    required KeybindDispatchContext context,
  }) {
    if (entry.informationalOnly) {
      return false;
    }
    if (entry.requiresKeyboardMode && !context.keyboardModeEnabled) {
      return false;
    }
    if (entry.requiresMessageFocus && !context.hasMessageFocus) {
      return false;
    }
    if (context.fullscreenMediaOpen &&
        entry.combo.key != 'Escape' &&
        !kVoiceFullscreenAllowedKeybindActions.contains(entry.action)) {
      return false;
    }
    if (context.modalOpen && !_isAllowedInModal(entry.action)) {
      return false;
    }
    if (context.editableHasFocus) {
      if (!_allowsEditableFocus(entry, context.editableText)) {
        return false;
      }
    }
    if (entry.action == KeybindAction.chatMarkChannelRead &&
        !context.channelHasUnread) {
      return false;
    }
    if (entry.action == KeybindAction.voiceAnswerCall &&
        !context.hasIncomingCall) {
      return false;
    }
    if (entry.action == KeybindAction.voiceDeclineCall &&
        !context.hasIncomingCall) {
      return false;
    }
    if (entry.action == KeybindAction.chatFocusTextarea &&
        context.keyboardModeEnabled) {
      return false;
    }
    return true;
  }

  bool _allowsEditableFocus(DefaultKeybind entry, String editableText) {
    switch (entry.editableFocusBehavior) {
      case EditableFocusBehavior.allow:
        return true;
      case EditableFocusBehavior.allowWhenEmpty:
        return editableText.trim().isEmpty;
      case null:
        return false;
    }
  }

  bool _isAllowedInModal(KeybindAction action) {
    return action == KeybindAction.systemToggleSettings ||
        action == KeybindAction.navQuickSwitcher ||
        action == KeybindAction.voiceAnswerCall ||
        action == KeybindAction.voiceDeclineCall;
  }
}
