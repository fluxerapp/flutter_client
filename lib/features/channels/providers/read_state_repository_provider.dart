import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/push_tray_registry_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'read_state_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ReadStateRepository readStateRepository(Ref ref) {
  return ReadStateRepository(
    ref.watch(fluxerClientProvider),
    ref.watch(fluxerDatabaseProvider),
    batcher: ref.watch(ackBatcherProvider),
    trayRegistry: ref.watch(pushTrayRegistryProvider),
  );
}
