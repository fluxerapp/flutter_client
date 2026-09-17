import 'package:flutter/services.dart';
import 'package:fluxer_app/core/assistant/assistant_command.dart';
import 'package:fluxer_app/core/assistant/assistant_command_codec.dart';
import 'package:fluxer_app/core/assistant/assistant_command_dispatcher.dart';
import 'package:fluxer_app/core/assistant/assistant_command_result.dart';
import 'package:fluxer_app/core/assistant/assistant_entities.dart';
import 'package:fluxer_app/core/assistant/assistant_platform.dart';
import 'package:fluxer_app/core/talker.dart';

const String assistantMethodChannelName = 'fluxer_app/assistant';

class AssistantBridge {
  AssistantBridge({required this._dispatcher, MethodChannel? channel})
    : _channel = channel ?? const MethodChannel(assistantMethodChannelName);

  final AssistantCommandDispatcher _dispatcher;
  final MethodChannel _channel;
  bool _attached = false;

  void attach() {
    if (_attached || !isAssistantChannelSupported()) {
      return;
    }
    _attached = true;
    _channel.setMethodCallHandler(_onMethodCall);
  }

  Future<void> flushPending({String? accountUserId}) async {
    if (!_attached || !isAssistantChannelSupported()) {
      return;
    }
    try {
      final Object? pending = await _channel.invokeMethod<Object>(
        'takePending',
        accountUserId,
      );
      if (pending == null) {
        return;
      }
      await _onMethodCall(MethodCall('runCommand', pending));
    } on MissingPluginException {
      return;
    } on PlatformException catch (error) {
      talker.warning('[Assistant] Failed to flush pending command: $error');
    }
  }

  void detach() {
    if (!_attached) {
      return;
    }
    _attached = false;
    _channel.setMethodCallHandler(null);
  }

  Future<void> donateEntities(AssistantEntityDonation donation) async {
    if (!isAssistantChannelSupported()) {
      return;
    }
    try {
      await _channel.invokeMethod<void>('updateEntities', donation.toMap());
    } on MissingPluginException {
      return;
    } on PlatformException catch (error) {
      talker.warning('[Assistant] Failed to donate entities: $error');
    }
  }

  Future<Object?> _onMethodCall(MethodCall call) async {
    if (call.method != 'runCommand') {
      throw PlatformException(code: 'unimplemented', message: call.method);
    }
    final AssistantCommand? command = decodeAssistantCommand(call.arguments);
    if (command == null) {
      return const AssistantCommandResult(
        status: AssistantCommandStatus.failed,
        spoken: '',
      ).toMap();
    }
    final AssistantCommandResult result = await _dispatcher.dispatch(command);
    return result.toMap();
  }
}
