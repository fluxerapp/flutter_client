import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';

typedef KeybindActionHandler = Future<bool> Function();

class KeybindHandlerRegistry {
  final Map<KeybindAction, KeybindActionHandler> _handlers =
      <KeybindAction, KeybindActionHandler>{};

  void register(KeybindAction action, KeybindActionHandler handler) {
    _handlers[action] = handler;
  }

  Future<bool> invoke(KeybindAction action) async {
    final KeybindActionHandler? handler = _handlers[action];
    if (handler == null) {
      return false;
    }
    return handler();
  }

  bool hasHandler(KeybindAction action) => _handlers.containsKey(action);
}

final keybindHandlerRegistryProvider = Provider<KeybindHandlerRegistry>(
  (Ref ref) => KeybindHandlerRegistry(),
);
