import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';

typedef KeybindActionHandler = Future<bool> Function();

class KeybindHandlerRegistry {
  final Map<KeybindAction, KeybindActionHandler> _handlers =
      <KeybindAction, KeybindActionHandler>{};
  final Map<KeybindAction, void Function()> _releaseHandlers =
      <KeybindAction, void Function()>{};

  void register(KeybindAction action, KeybindActionHandler handler) {
    _handlers[action] = handler;
  }

  void registerRelease(KeybindAction action, void Function() handler) {
    _releaseHandlers[action] = handler;
  }

  void invokeRelease(KeybindAction action) {
    _releaseHandlers[action]?.call();
  }

  Future<bool> invoke(KeybindAction action) async {
    final KeybindActionHandler? handler = _handlers[action];
    if (handler == null) {
      return false;
    }
    return await handler();
  }
}

final keybindHandlerRegistryProvider = Provider<KeybindHandlerRegistry>(
  (Ref ref) => KeybindHandlerRegistry(),
);
