import 'package:fluxer_app/features/input/domain/keybind_action.dart';

const Duration kGlobalShortcutDuplicateWindow = Duration(milliseconds: 300);

enum GlobalShortcutPressSource { hook, window }

class GlobalShortcutPressDeduper {
  GlobalShortcutPressDeduper({DateTime Function()? now})
    : _now = now ?? DateTime.now;

  final DateTime Function() _now;
  final Map<KeybindAction, (GlobalShortcutPressSource, DateTime)> _handled =
      <KeybindAction, (GlobalShortcutPressSource, DateTime)>{};

  bool isDuplicate(KeybindAction action, GlobalShortcutPressSource source) {
    final DateTime now = _now();
    final (GlobalShortcutPressSource, DateTime)? last = _handled[action];
    if (last != null &&
        last.$1 != source &&
        now.difference(last.$2) < kGlobalShortcutDuplicateWindow) {
      return true;
    }
    _handled[action] = (source, now);
    return false;
  }
}
