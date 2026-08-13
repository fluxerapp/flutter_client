import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComposerFocusCoordinator {
  VoidCallback? _requestFocus;
  String Function()? _readText;
  bool Function()? _hasFocus;

  void register({
    required VoidCallback requestFocus,
    required String Function() readText,
    required bool Function() hasFocus,
  }) {
    _requestFocus = requestFocus;
    _readText = readText;
    _hasFocus = hasFocus;
  }

  void unregister(VoidCallback requestFocus) {
    if (_requestFocus == requestFocus) {
      _requestFocus = null;
      _readText = null;
      _hasFocus = null;
    }
  }

  void requestComposerFocus() => _requestFocus?.call();

  String readComposerText() => _readText?.call() ?? '';

  bool composerHasFocus() => _hasFocus?.call() ?? false;
}

final composerFocusCoordinatorProvider = Provider<ComposerFocusCoordinator>(
  (Ref ref) => ComposerFocusCoordinator(),
);
