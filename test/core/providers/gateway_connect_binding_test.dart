import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/gateway_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

class _RecordingGatewayConnection extends GatewayConnection {
  _RecordingGatewayConnection() : super(token: 'test', dio: Dio());

  final StreamController<GatewayState> _states =
      StreamController<GatewayState>.broadcast(sync: true);
  int connectCalls = 0;
  int suspendCalls = 0;

  @override
  Stream<GatewayState> get stateChanges => _states.stream;

  void emit(GatewayState value) => _states.add(value);

  @override
  Future<void> connect() async {
    connectCalls++;
  }

  @override
  Future<void> suspend() async {
    suspendCalls++;
  }
}

ProviderContainer _container(
  _RecordingGatewayConnection connection, {
  required bool foreground,
  bool callKitIncoming = false,
}) {
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      gatewayConnectionProvider.overrideWithValue(connection),
      appUiForegroundProvider.overrideWith(AppUiForeground.new),
    ],
  );
  container.read(appUiForegroundProvider.notifier).setResumed(foreground);
  container
      .read(callKitIncomingHoldProvider.notifier)
      .setActive(value: callKitIncoming);
  return container;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('gatewayConnectBinding', () {
    test('connects when the app starts in the foreground', () {
      final connection = _RecordingGatewayConnection();
      final container = _container(connection, foreground: true);
      addTearDown(container.dispose);

      container.read(gatewayConnectBindingProvider);

      expect(connection.connectCalls, 1);
      expect(connection.suspendCalls, 0);
    });

    test('stays suspended when a push launches the app in background', () {
      final connection = _RecordingGatewayConnection();
      final container = _container(connection, foreground: false);
      addTearDown(container.dispose);

      container.read(gatewayConnectBindingProvider);

      expect(connection.connectCalls, 0);
      expect(connection.suspendCalls, 1);
    });

    test('connects in background for an incoming call', () {
      final connection = _RecordingGatewayConnection();
      final container = _container(
        connection,
        foreground: false,
        callKitIncoming: true,
      );
      addTearDown(container.dispose);

      container.read(gatewayConnectBindingProvider);

      expect(connection.connectCalls, 1);
      expect(connection.suspendCalls, 0);
    });

    test('suspends instead of reconnecting a socket dropped in background', () {
      final connection = _RecordingGatewayConnection();
      final container = _container(connection, foreground: true);
      addTearDown(container.dispose);

      container.read(gatewayConnectBindingProvider);
      connection.emit(GatewayState.connected);
      container.read(appUiForegroundProvider.notifier).setResumed(false);
      connection.emit(GatewayState.reconnecting);

      expect(connection.suspendCalls, 1);
    });

    test('lets a foreground socket drop reconnect', () {
      final connection = _RecordingGatewayConnection();
      final container = _container(connection, foreground: true);
      addTearDown(container.dispose);

      container.read(gatewayConnectBindingProvider);
      connection
        ..emit(GatewayState.connected)
        ..emit(GatewayState.reconnecting);

      expect(connection.suspendCalls, 0);
    });
  });

  testWidgets('a launch still reporting inactive keeps the gateway suspended', (
    WidgetTester tester,
  ) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    final connection = _RecordingGatewayConnection();
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        gatewayConnectionProvider.overrideWithValue(connection),
      ],
    );
    addTearDown(container.dispose);

    container.read(gatewayConnectBindingProvider);
    expect(connection.connectCalls, 0);
    expect(connection.suspendCalls, 1);
  });
}
