import 'dart:async';

import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ack_batcher_gateway_listener_provider.g.dart';

/// Flushes pending read acks when the gateway disconnects or session recovers
@Riverpod(keepAlive: true)
Raw<void> ackBatcherGatewayListener(Ref ref) {
  final AckBatcher batcher = ref.watch(ackBatcherProvider);
  final GatewayConnection connection = ref.watch(gatewayConnectionProvider);

  final subscription = connection.stateChanges.listen((GatewayState state) {
    if (state == GatewayState.connecting ||
        state == GatewayState.reconnecting) {
      unawaited(batcher.flushPending(force: true));
    }
  });

  ref
    ..listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
      if (next > 0 && previous != next) {
        unawaited(batcher.flushPending(force: true));
      }
    })
    ..onDispose(subscription.cancel);
}
