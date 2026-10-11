import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_dart/gateway.dart';

GatewayConnection _connection(List<int> opens) {
  return GatewayConnection(
    token: 'test',
    dio: Dio(),
    gatewayUrl: 'wss://gateway.test',
    compress: 'none',
    nextJitter: () => 0.5,
    openSocket: (Uri uri, {Map<String, String>? headers}) {
      opens.add(opens.length + 1);
      throw StateError('socket down');
    },
  );
}

void main() {
  test('backoff matches the desktop socket', () {
    expect(
      gatewayReconnectDelay(attempt: 0, jitterUnit: 0.5),
      const Duration(seconds: 1),
    );
    expect(
      gatewayReconnectDelay(attempt: 1, jitterUnit: 0.5),
      const Duration(seconds: 2),
    );
    expect(
      gatewayReconnectDelay(attempt: 1, jitterUnit: 0),
      const Duration(milliseconds: 1500),
    );
    expect(
      gatewayReconnectDelay(attempt: 1, jitterUnit: 1),
      const Duration(milliseconds: 2500),
    );
    expect(
      gatewayReconnectDelay(attempt: 0, jitterUnit: 0),
      kGatewayMinReconnect,
    );
    expect(
      gatewayReconnectDelay(attempt: 3, jitterUnit: 0.5),
      const Duration(seconds: 8),
    );
    expect(
      gatewayReconnectDelay(attempt: 4, jitterUnit: 0.5),
      const Duration(seconds: 10),
    );
    expect(
      gatewayReconnectDelay(attempt: 4, jitterUnit: 0),
      const Duration(milliseconds: 7500),
    );
    expect(
      gatewayReconnectDelay(attempt: 30, jitterUnit: 1),
      kGatewayMaxReconnect,
    );
    expect(kGatewayMaxReconnect, const Duration(seconds: 10));
    expect(
      gatewayReconnectSpreadDelay(spreadUnit: 0.5),
      const Duration(seconds: 2),
    );
  });

  test('reconnectNow skips the pending backoff', () {
    fakeAsync((FakeAsync async) {
      final List<int> opens = <int>[];
      final GatewayConnection connection = _connection(opens);
      unawaited(connection.connect());
      async
        ..flushMicrotasks()
        ..elapse(const Duration(milliseconds: 500))
        ..flushMicrotasks();
      expect(opens, <int>[1]);
      expect(connection.state, GatewayState.reconnecting);

      unawaited(connection.reconnectNow());
      async.flushMicrotasks();
      expect(opens, <int>[1, 2]);
      unawaited(connection.dispose());
    });
  });

  test('a second reconnectNow reuses the attempt in flight', () {
    fakeAsync((FakeAsync async) {
      final List<int> opens = <int>[];
      final GatewayConnection connection = _connection(opens);
      unawaited(connection.reconnectNow());
      unawaited(connection.reconnectNow());
      async.flushMicrotasks();
      expect(opens, <int>[1]);
      unawaited(connection.dispose());
    });
  });

  test('close 4008 keeps its backoff through reconnectNow', () {
    fakeAsync((FakeAsync async) {
      final List<int> opens = <int>[];
      final GatewayConnection connection = _connection(opens)
        ..handleSocketClosedForTest(GatewayCloseCode.rateLimited.code);
      expect(connection.state, GatewayState.reconnecting);
      expect(opens, isEmpty);

      unawaited(connection.reconnectNow());
      async
        ..elapse(const Duration(milliseconds: 999))
        ..flushMicrotasks();
      expect(opens, isEmpty);

      async
        ..elapse(const Duration(milliseconds: 1))
        ..flushMicrotasks();
      expect(opens, <int>[1]);

      unawaited(connection.reconnectNow());
      async.flushMicrotasks();
      expect(opens, <int>[1, 2]);
      unawaited(connection.dispose());
    });
  });
}
