import 'dart:async' show unawaited;
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'package:gaimon/gaimon.dart';

/// Shared haptic feedback
// ignore: avoid_classes_with_only_static_members
abstract final class FluxerHaptics {
  static const String _sendAhapAsset = 'assets/haptics/message_send.ahap';

  static String? _sendAhap;
  static Future<String>? _sendAhapLoad;

  static bool get supportsExpressive =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static void selection() => Gaimon.selection();

  static void light() => Gaimon.light();

  static void medium() => Gaimon.medium();

  static void heavy() => Gaimon.heavy();

  static void soft() {
    if (supportsExpressive) {
      Gaimon.soft();
      return;
    }
    Gaimon.light();
  }

  static void rigid() {
    if (supportsExpressive) {
      Gaimon.rigid();
      return;
    }
    Gaimon.heavy();
  }

  static void success() {
    if (supportsExpressive) {
      Gaimon.success();
      return;
    }
    Gaimon.medium();
  }

  static void error() {
    if (supportsExpressive) {
      Gaimon.error();
      return;
    }
    Gaimon.heavy();
  }

  static void warning() {
    if (supportsExpressive) {
      Gaimon.warning();
      return;
    }
    Gaimon.medium();
  }

  /// Soft flick for sending a message.
  static void send() {
    if (!supportsExpressive) {
      Gaimon.soft();
      return;
    }
    final String? cached = _sendAhap;
    if (cached != null) {
      try {
        Gaimon.patternFromData(cached);
      } on Object {
        Gaimon.soft();
      }
      return;
    }
    unawaited(_playSend());
  }

  /// Preload the send AHAP so the first send feels instant (instead of delayed)
  static Future<void> warmSend() {
    if (!supportsExpressive) {
      return Future<void>.value();
    }
    return _loadSendAhap();
  }

  static Future<void> _playSend() async {
    try {
      final String data = await _loadSendAhap();
      Gaimon.patternFromData(data);
    } on Object {
      Gaimon.soft();
    }
  }

  /// Play a custom AHAP JSON pattern
  static void pattern(String ahapJson) {
    if (!supportsExpressive) {
      return;
    }
    Gaimon.patternFromData(ahapJson);
  }

  static void stop() {
    if (!supportsExpressive) {
      return;
    }
    Gaimon.stop();
  }

  static Future<String> _loadSendAhap() {
    final String? cached = _sendAhap;
    if (cached != null) {
      return Future<String>.value(cached);
    }
    return _sendAhapLoad ??= rootBundle.loadString(_sendAhapAsset).then((
      String data,
    ) {
      _sendAhap = data;
      return data;
    });
  }
}
