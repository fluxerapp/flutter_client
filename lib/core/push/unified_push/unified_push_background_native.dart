import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

const MethodChannel _kUnifiedPushBackgroundChannel = MethodChannel(
  'com.fluxer/unified_push_background',
);

const Duration kUnifiedPushBackgroundQuietPeriod = Duration(seconds: 2);

typedef UnifiedPushBackgroundMessageHandler =
    Future<void> Function(
      Uint8List content,
      String instance, {
      required bool decrypted,
    });

void listenForUnifiedPushBackgroundMessages(
  UnifiedPushBackgroundMessageHandler onMessage,
) {
  _kUnifiedPushBackgroundChannel.setMethodCallHandler((MethodCall call) async {
    if (call.method != 'message') {
      return;
    }
    final Map<Object?, Object?> args = call.arguments as Map<Object?, Object?>;
    await onMessage(
      args['content']! as Uint8List,
      args['instance']! as String,
      decrypted: args['decrypted']! as bool,
    );
  });
}

Future<void> prepareUnifiedPushBackgroundNative() async {
  if (!Platform.isAndroid) {
    return;
  }
  try {
    await _kUnifiedPushBackgroundChannel.invokeMethod<void>('prepare');
  } on Object {
    return;
  }
}

Future<bool> finishUnifiedPushBackgroundNative(int handled) async {
  if (!Platform.isAndroid) {
    return true;
  }
  try {
    final bool? closing = await _kUnifiedPushBackgroundChannel
        .invokeMethod<bool>('finish', <String, int>{'handled': handled});
    return closing ?? true;
  } on Object {
    return true;
  }
}

final class UnifiedPushBackgroundWork {
  UnifiedPushBackgroundWork({
    this.quietPeriod = kUnifiedPushBackgroundQuietPeriod,
  });

  final Duration quietPeriod;
  int _started = 0;
  int _handled = 0;
  Timer? _quietTimer;
  Completer<void>? _idle;

  int get handled => _handled;

  void messageStarted() {
    _started += 1;
    _quietTimer?.cancel();
  }

  void messageFinished() {
    _handled += 1;
    _armIfIdle();
  }

  Future<void> waitForIdle() {
    final Completer<void> idle = _idle ??= Completer<void>();
    _armIfIdle();
    return idle.future;
  }

  void _armIfIdle() {
    if (_idle == null || _started != _handled) {
      return;
    }
    _quietTimer?.cancel();
    _quietTimer = Timer(quietPeriod, () {
      final Completer<void>? idle = _idle;
      _idle = null;
      idle?.complete();
    });
  }
}

Future<void> runUnifiedPushBackgroundUntilIdle(
  UnifiedPushBackgroundWork work, {
  required Future<bool> Function(int handled) finish,
}) async {
  do {
    await work.waitForIdle();
  } while (!await finish(work.handled));
}
