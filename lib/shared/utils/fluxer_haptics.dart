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

  static bool get _supportsExpressive =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static void selection() => Gaimon.selection();

  static void light() => Gaimon.light();

  static void medium() => Gaimon.medium();

  static void heavy() => Gaimon.heavy();

  static void soft() {
    if (_supportsExpressive) {
      Gaimon.soft();
      return;
    }
    Gaimon.light();
  }

  static void rigid() {
    if (_supportsExpressive) {
      Gaimon.rigid();
      return;
    }
    Gaimon.heavy();
  }

  static void success() {
    if (_supportsExpressive) {
      Gaimon.success();
      return;
    }
    Gaimon.medium();
  }

  static void error() {
    if (_supportsExpressive) {
      Gaimon.error();
      return;
    }
    Gaimon.heavy();
  }

  static void warning() {
    if (_supportsExpressive) {
      Gaimon.warning();
      return;
    }
    Gaimon.medium();
  }

  /// Commit tap + short fading whoosh for sending a message.
  static void send() {
    if (!_supportsExpressive) {
      Gaimon.soft();
      return;
    }
    unawaited(_playSend());
  }

  static Future<void> _playSend() async {
    try {
      final String data = await _loadSendAhap();
      Gaimon.patternFromData(data);
    } on Object {
      Gaimon.soft();
    }
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
