import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef MessageKeyboardNavigationHandler = void Function();

class MessageKeyboardNavigationCoordinator {
  MessageKeyboardNavigationHandler? _focusNext;
  MessageKeyboardNavigationHandler? _focusPrevious;

  bool get hasHandlers => _focusNext != null || _focusPrevious != null;

  void register({
    required MessageKeyboardNavigationHandler focusNext,
    required MessageKeyboardNavigationHandler focusPrevious,
  }) {
    _focusNext = focusNext;
    _focusPrevious = focusPrevious;
  }

  void unregister({
    required MessageKeyboardNavigationHandler focusNext,
    required MessageKeyboardNavigationHandler focusPrevious,
  }) {
    if (_focusNext == focusNext) {
      _focusNext = null;
    }
    if (_focusPrevious == focusPrevious) {
      _focusPrevious = null;
    }
  }

  void focusNext() => _focusNext?.call();

  void focusPrevious() => _focusPrevious?.call();
}

final messageKeyboardNavigationProvider =
    Provider<MessageKeyboardNavigationCoordinator>(
      (Ref ref) => MessageKeyboardNavigationCoordinator(),
    );
