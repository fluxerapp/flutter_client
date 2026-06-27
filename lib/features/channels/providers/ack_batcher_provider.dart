import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ack_batcher_provider.g.dart';

@Riverpod(keepAlive: true)
AckBatcher ackBatcher(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  final batcher = AckBatcher(
    client: client,
    onResponse: (response) =>
        ReadStateRepository(client, db).applyAckResponse(response),
  );

  ref
    ..listen<bool>(appUiForegroundProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        unawaited(batcher.flushPending(force: true));
      }
    })
    ..listen<bool>(gatewayReadyProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        unawaited(batcher.flushPending(force: true));
      }
    })
    ..onDispose(() {
      unawaited(batcher.dispose());
    });
  return batcher;
}
