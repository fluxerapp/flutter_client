import 'dart:async';

import 'package:flutter/foundation.dart';

class AnsiBlinkScheduler {
  AnsiBlinkScheduler._();

  static final AnsiBlinkScheduler instance = AnsiBlinkScheduler._();

  final ValueNotifier<bool> visible = ValueNotifier<bool>(true);

  int _subscribers = 0;
  Timer? _timer;

  void subscribe() {
    if (_subscribers == 0) {
      visible.value = true;
      _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
        visible.value = !visible.value;
      });
    }
    _subscribers++;
  }

  void unsubscribe() {
    if (_subscribers <= 0) {
      return;
    }
    _subscribers--;
    if (_subscribers == 0) {
      _timer?.cancel();
      _timer = null;
      visible.value = true;
    }
  }
}
