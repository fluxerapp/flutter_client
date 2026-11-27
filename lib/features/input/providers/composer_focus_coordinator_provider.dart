import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _ComposerFocusRegistration {
  const _ComposerFocusRegistration({
    required this.requestFocus,
    required this.readText,
    required this.hasFocus,
    required this.insertTypedText,
  });

  final VoidCallback requestFocus;
  final String Function() readText;
  final bool Function() hasFocus;
  final bool Function(String text) insertTypedText;
}

class ComposerFocusCoordinator {
  final List<_ComposerFocusRegistration> _stack =
      <_ComposerFocusRegistration>[];

  void register({
    required VoidCallback requestFocus,
    required String Function() readText,
    required bool Function() hasFocus,
    required bool Function(String text) insertTypedText,
  }) {
    unregister(requestFocus);
    _stack.add(
      _ComposerFocusRegistration(
        requestFocus: requestFocus,
        readText: readText,
        hasFocus: hasFocus,
        insertTypedText: insertTypedText,
      ),
    );
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

  void requestComposerFocus() => _active?.requestFocus();

  String readComposerText() => _active?.readText() ?? '';

  bool composerHasFocus() => _active?.hasFocus() ?? false;

  bool typeIntoComposer(String text) => _active?.insertTypedText(text) ?? false;
}

final composerFocusCoordinatorProvider = Provider<ComposerFocusCoordinator>(
  (Ref ref) => ComposerFocusCoordinator(),
);
