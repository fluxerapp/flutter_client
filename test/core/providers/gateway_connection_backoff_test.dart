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
      gatewayReconnectDelay(attempt: 6, jitterUnit: 0.5),
      kGatewayMaxReconnect,
    );
    expect(
      gatewayReconnectSpreadDelay(spreadUnit: 0.5),
      const Duration(seconds: 2),
    );
  });

  test('a second nudge does not open another socket', () {
    fakeAsync((FakeAsync async) {
      final List<int> opens = <int>[];
      final GatewayConnection connection = _connection(opens);
      unawaited(connection.connect());
      async.flushMicrotasks();
      expect(opens, <int>[1]);

      unawaited(connection.nudgeReconnect());
      async.flushMicrotasks();
      expect(opens, <int>[1]);

      async
        ..elapse(const Duration(milliseconds: 999))
        ..flushMicrotasks();
      expect(opens, <int>[1]);

      async
        ..elapse(const Duration(milliseconds: 1))
        ..flushMicrotasks();
      expect(opens, <int>[1, 2]);
      unawaited(connection.dispose());
    });
  });

  test('close 4008 uses the same backoff and ignores nudges', () {
    fakeAsync((FakeAsync async) {
      final List<int> opens = <int>[];
      final GatewayConnection connection = _connection(opens);
      connection.handleSocketClosedForTest(GatewayCloseCode.rateLimited.code);
      expect(connection.state, GatewayState.reconnecting);
      expect(opens, isEmpty);

      unawaited(connection.nudgeReconnect());
      async
        ..elapse(const Duration(milliseconds: 999))
        ..flushMicrotasks();
      expect(opens, isEmpty);

      async
        ..elapse(const Duration(milliseconds: 1))
        ..flushMicrotasks();
      expect(opens, <int>[1]);
      unawaited(connection.dispose());
    });
  });
}
