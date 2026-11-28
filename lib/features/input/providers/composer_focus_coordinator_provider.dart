import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';

class _ComposerFocusRegistration {
  const _ComposerFocusRegistration({
    required this.requestFocus,
    required this.readText,
    required this.hasFocus,
    required this.insertTypedText,
    this.claimsKeyEvent,
    this.handleArrowUpEmpty,
    this.insertUserMention,
    this.toggleExpressionPicker,
  });

  final VoidCallback requestFocus;
  final String Function() readText;
  final bool Function() hasFocus;
  final bool Function(String text) insertTypedText;
  final bool Function(KeyEvent event)? claimsKeyEvent;
  final bool Function()? handleArrowUpEmpty;
  final bool Function(String userId)? insertUserMention;
  final bool Function(ExpressionPickerTab tab)? toggleExpressionPicker;
}

class ComposerFocusCoordinator {
  final List<_ComposerFocusRegistration> _stack =
      <_ComposerFocusRegistration>[];

  void register({
    required VoidCallback requestFocus,
    required String Function() readText,
    required bool Function() hasFocus,
    required bool Function(String text) insertTypedText,
    bool Function(KeyEvent event)? claimsKeyEvent,
    bool Function()? handleArrowUpEmpty,
    bool Function(String userId)? insertUserMention,
    bool Function(ExpressionPickerTab tab)? toggleExpressionPicker,
  }) {
    unregister(requestFocus);
    _stack.add(
      _ComposerFocusRegistration(
        requestFocus: requestFocus,
        readText: readText,
        hasFocus: hasFocus,
        insertTypedText: insertTypedText,
        claimsKeyEvent: claimsKeyEvent,
        handleArrowUpEmpty: handleArrowUpEmpty,
        insertUserMention: insertUserMention,
        toggleExpressionPicker: toggleExpressionPicker,
      ),
    );
  }

  final List<bool Function()> _editEmojiPickerToggles = <bool Function()>[];

  void registerEditEmojiPicker(bool Function() toggle) {
    _editEmojiPickerToggles
      ..remove(toggle)
      ..add(toggle);
  }

  void unregisterEditEmojiPicker(bool Function() toggle) {
    _editEmojiPickerToggles.remove(toggle);
  }

  bool toggleExpressionPicker(ExpressionPickerTab tab) {
    if (tab == ExpressionPickerTab.emojis &&
        _editEmojiPickerToggles.isNotEmpty &&
        _editEmojiPickerToggles.last()) {
      return true;
    }
    return _active?.toggleExpressionPicker?.call(tab) ?? false;
  }

  void unregister(VoidCallback requestFocus) {
    _stack.removeWhere(
      (_ComposerFocusRegistration entry) =>
          identical(entry.requestFocus, requestFocus),
    );
  }

  _ComposerFocusRegistration? get _active {
    if (_stack.isEmpty) {
      return null;
    }
    return _stack.last;
  }

  bool get hasComposer => _active != null;

  void requestComposerFocus() => _active?.requestFocus();

  String readComposerText() => _active?.readText() ?? '';

  bool composerHasFocus() => _active?.hasFocus() ?? false;

  bool composerClaimsKeyEvent(KeyEvent event) =>
      _active?.claimsKeyEvent?.call(event) ?? false;

  bool composerHandleArrowUpEmpty() =>
      _active?.handleArrowUpEmpty?.call() ?? false;

  bool typeIntoComposer(String text) => _active?.insertTypedText(text) ?? false;

  bool get canInsertUserMention => _active?.insertUserMention != null;

  bool insertUserMention(String userId) =>
      _active?.insertUserMention?.call(userId) ?? false;
}

final composerFocusCoordinatorProvider = Provider<ComposerFocusCoordinator>(
  (Ref ref) => ComposerFocusCoordinator(),
);
