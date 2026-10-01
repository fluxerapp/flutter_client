import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _ComposerFocusRegistration {
  const _ComposerFocusRegistration({
    required this.requestFocus,
    required this.readText,
    required this.hasFocus,
  });

  final VoidCallback requestFocus;
  final String Function() readText;
  final bool Function() hasFocus;
}

class ComposerFocusCoordinator {
  final List<_ComposerFocusRegistration> _stack =
      <_ComposerFocusRegistration>[];

  void register({
    required VoidCallback requestFocus,
    required String Function() readText,
    required bool Function() hasFocus,
  }) {
    unregister(requestFocus);
    _stack.add(
      _ComposerFocusRegistration(
        requestFocus: requestFocus,
        readText: readText,
        hasFocus: hasFocus,
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
}

final composerFocusCoordinatorProvider = Provider<ComposerFocusCoordinator>(
  (Ref ref) => ComposerFocusCoordinator(),
);
