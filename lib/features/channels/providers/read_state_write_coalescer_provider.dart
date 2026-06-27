import 'dart:async';

import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_coalescer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_state_write_coalescer_provider.g.dart';

@Riverpod(keepAlive: true)
ReadStateWriteCoalescer readStateWriteCoalescer(Ref ref) {
  final coalescer = ReadStateWriteCoalescer(
    database: ref.watch(fluxerDatabaseProvider),
  );

  // Persist pending unreads before the app is backgrounded (and can be killed).
  ref
    ..listen<bool>(appUiForegroundProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        unawaited(coalescer.flushAll());
      }
    })
    // Persist pending unreads when the gateway drops, before the next READY
    // snapshot (which clears pending) arrives.
    ..listen<bool>(gatewayReadyProvider, (prev, next) {
      if ((prev ?? false) && !next) {
        unawaited(coalescer.flushAll());
      }
    })
    ..onDispose(() {
      unawaited(coalescer.dispose());
    });
  return coalescer;
}
