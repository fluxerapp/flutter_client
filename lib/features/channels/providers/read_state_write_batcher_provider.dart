import 'dart:async';

import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_state_write_batcher_provider.g.dart';

@Riverpod(keepAlive: true)
ReadStateWriteBatcher readStateWriteBatcher(Ref ref) {
  final batcher = ReadStateWriteBatcher(
    database: ref.watch(fluxerDatabaseProvider),
  );

  ref
    ..listen<bool>(appUiForegroundProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        unawaited(batcher.flushAll());
      }
    })
    ..listen<bool>(gatewayReadyProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        unawaited(batcher.flushAll());
      }
    })
    ..onDispose(() {
      unawaited(batcher.dispose());
    });
  return batcher;
}
