import 'package:flutter/services.dart';
import 'package:fluxer_macos/src/messages.g.dart';

class MacInputHook implements MacInputHookFlutterApi {
  MacInputHook({MacInputHookHostApi? api, this._messenger})
    : _api = api ?? MacInputHookHostApi(binaryMessenger: _messenger);

  final MacInputHookHostApi _api;
  final BinaryMessenger? _messenger;

  void Function(MacInputEvent event)? _onEvent;
  void Function()? _onReleaseAll;

  Future<MacInputHookStartResult> start({
    required void Function(MacInputEvent event) onEvent,
    required void Function() onReleaseAll,
  }) {
    _onEvent = onEvent;
    _onReleaseAll = onReleaseAll;
    MacInputHookFlutterApi.setUp(this, binaryMessenger: _messenger);
    return _api.start();
  }

  Future<void> stop() {
    MacInputHookFlutterApi.setUp(null, binaryMessenger: _messenger);
    _onEvent = null;
    _onReleaseAll = null;
    return _api.stop();
  }

  Future<void> setFilter({
    required List<int> keycodes,
    required List<int> buttons,
    required bool modifiers,
  }) => _api.setFilter(keycodes, buttons, modifiers);

  @override
  void onEvent(MacInputEvent event) => _onEvent?.call(event);

  @override
  void onReleaseAll() => _onReleaseAll?.call();
}
