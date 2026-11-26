import 'dart:async';
import 'dart:collection';

import 'package:fluxer_dart/gateway.dart';

typedef GatewayEventHandlerFn = Future<void> Function(GatewayEvent event);

typedef GatewayWriteBatcherFlushFn = Future<void> Function();

typedef GatewayEventFailureFn =
    void Function(GatewayEvent event, Object error, StackTrace stackTrace);

class GatewayEventDispatcher {
  GatewayEventDispatcher({
    required this._onEvent,
    this.onFlushWriteBatchers,
    this.onEventFailed,
  });

  final GatewayEventHandlerFn _onEvent;
  final GatewayWriteBatcherFlushFn? onFlushWriteBatchers;
  final GatewayEventFailureFn? onEventFailed;

  final Queue<GatewayEvent> _queue = Queue<GatewayEvent>();
  bool _draining = false;
  bool _disposed = false;

  void dispatch(GatewayEvent event) {
    if (_disposed) {
      return;
    }
    if (event is TypingStartEvent) {
      unawaited(_run(event));
      return;
    }
    _queue.add(event);
    unawaited(_drain());
  }

  Future<void> dispose() async {
    _disposed = true;
    await onFlushWriteBatchers?.call();
    _queue.clear();
  }

  Future<void> _run(GatewayEvent event) async {
    try {
      await _onEvent(event);
    } on Object catch (error, stackTrace) {
      if (!_disposed) {
        onEventFailed?.call(event, error, stackTrace);
      }
    }
  }

  Future<void> _drain() async {
    if (_draining || _disposed) {
      return;
    }
    _draining = true;
    try {
      while (_queue.isNotEmpty && !_disposed) {
        await _run(_queue.removeFirst());
      }
    } finally {
      _draining = false;
      if (_queue.isNotEmpty && !_disposed) {
        unawaited(_drain());
      }
    }
  }
}
