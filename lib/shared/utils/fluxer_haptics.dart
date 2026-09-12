import 'dart:async' show unawaited;
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart' show rootBundle;
import 'package:gaimon/gaimon.dart';

/// Shared haptic feedback
// ignore: avoid_classes_with_only_static_members
abstract final class FluxerHaptics {
  static const String _sendAhapAsset = 'assets/haptics/message_send.ahap';
  static const String _purrAhapAsset = 'assets/haptics/neko_purr.ahap';

  static final Map<String, String> _ahapCache = <String, String>{};
  static final Map<String, Future<String>> _ahapLoads =
      <String, Future<String>>{};
  static bool _enabled = true;

  static bool get supportsExpressive =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get enabled => _enabled;

  static void setEnabled(bool value) {
    _enabled = value;
  }

  static void selection() => _run(Gaimon.selection);

  static void light() => _run(Gaimon.light);

  static void medium() => _run(Gaimon.medium);

  static void heavy() => _run(Gaimon.heavy);

  static void soft() {
    _run(() {
      if (supportsExpressive) {
        Gaimon.soft();
        return;
      }
      Gaimon.light();
    });
  }

  static void rigid() {
    _run(() {
      if (supportsExpressive) {
        Gaimon.rigid();
        return;
      }
      Gaimon.heavy();
    });
  }

  static void success() {
    _run(() {
      if (supportsExpressive) {
        Gaimon.success();
        return;
      }
      Gaimon.medium();
    });
  }

  static void error() {
    _run(() {
      if (supportsExpressive) {
        Gaimon.error();
        return;
      }
      Gaimon.heavy();
    });
  }

  static void warning() {
    _run(() {
      if (supportsExpressive) {
        Gaimon.warning();
        return;
      }
      Gaimon.medium();
    });
  }

  /// Soft flick for sending a message.
  static void send() {
    _playAhap(_sendAhapAsset, onUnavailable: Gaimon.soft);
  }

  /// Preload the send AHAP so the first send feels instant (instead of delayed)
  static Future<void> warmSend() => _warmAhap(_sendAhapAsset);

  /// Soft rumble for petting neko.
  static void purr() {
    _playAhap(_purrAhapAsset);
  }

  /// Preload the purr AHAP so the first pet feels instant.
  static Future<void> warmPurr() => _warmAhap(_purrAhapAsset);

  /// Play a custom AHAP JSON pattern
  static void pattern(String ahapJson) {
    if (!_enabled || !supportsExpressive) {
      return;
    }
    Gaimon.patternFromData(ahapJson);
  }

  static void stop() {
    if (!_enabled || !supportsExpressive) {
      return;
    }
    Gaimon.stop();
  }

  static void _run(void Function() action) {
    if (!_enabled) {
      return;
    }
    action();
  }

  static void _playAhap(String asset, {void Function()? onUnavailable}) {
    if (!_enabled) {
      return;
    }
    if (!supportsExpressive) {
      onUnavailable?.call();
      return;
    }
    final String? cached = _ahapCache[asset];
    if (cached != null) {
      try {
        Gaimon.patternFromData(cached);
      } on Object {
        onUnavailable?.call();
      }
      return;
    }
    unawaited(_playAhapAsync(asset, onUnavailable: onUnavailable));
  }

  static Future<void> _playAhapAsync(
    String asset, {
    void Function()? onUnavailable,
  }) async {
    try {
      final String data = await _loadAhap(asset);
      Gaimon.patternFromData(data);
    } on Object {
      onUnavailable?.call();
    }
  }

  static Future<void> _warmAhap(String asset) {
    if (!_enabled || !supportsExpressive) {
      return Future<void>.value();
    }
    return _loadAhap(asset);
  }

  static Future<String> _loadAhap(String asset) {
    final String? cached = _ahapCache[asset];
    if (cached != null) {
      return Future<String>.value(cached);
    }
    return _ahapLoads[asset] ??= rootBundle.loadString(asset).then((
      String data,
    ) {
      _ahapCache[asset] = data;
      return data;
    });
  }
}
