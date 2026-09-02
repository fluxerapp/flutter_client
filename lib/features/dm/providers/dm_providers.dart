import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_providers.g.dart';

@Riverpod(keepAlive: true)
DmRepository dmRepository(Ref ref) {
  final client = ref.watch(fluxerClientProvider);
  final db = ref.watch(fluxerDatabaseProvider);
  final readStateRepository = ref.watch(readStateRepositoryProvider);
  return DmRepository(
    client,
    db,
    ref.watch(guildUserSettingsRepositoryProvider),
    readStateRepository: readStateRepository,
    productName: ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    ),
  );
}
