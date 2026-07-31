import 'dart:async';

import 'package:fluxer_dart/gateway.dart';

typedef GatewayEventHandlerFn = Future<void> Function(GatewayEvent event);

typedef GatewayWriteBatcherFlushFn = Future<void> Function();

class GatewayEventDispatcher {
  GatewayEventDispatcher({required this._onEvent, this.onFlushWriteBatchers});

  final GatewayEventHandlerFn _onEvent;
  final GatewayWriteBatcherFlushFn? onFlushWriteBatchers;

  final List<GatewayEvent> _queue = <GatewayEvent>[];
  bool _draining = false;
  bool _disposed = false;

  void dispatch(GatewayEvent event) {
    if (_disposed) {
      return;
    }
    if (event is TypingStartEvent) {
      unawaited(_onEvent(event));
      return;
    }
    _queue.add(event);
    unawaited(_drain());
  }

  Future<void> flushWriteBatchersAndDrain() async {
    await onFlushWriteBatchers?.call();
    await _drainUntilEmpty();
  }

  Future<void> dispose() async {
    _disposed = true;
    await onFlushWriteBatchers?.call();
    _queue.clear();
  }

  Future<void> _drain() async {
    if (_draining || _disposed) {
      return;
    }
    _draining = true;
    try {
      while (_queue.isNotEmpty && !_disposed) {
        final GatewayEvent event = _queue.removeAt(0);
        await _onEvent(event);
      }
    } finally {
      _draining = false;
      if (_queue.isNotEmpty && !_disposed) {
        unawaited(_drain());
      }
    }
  }

  Future<void> _drainUntilEmpty() async {
    while (_queue.isNotEmpty && !_disposed) {
      await _drain();
    }
  }
}
