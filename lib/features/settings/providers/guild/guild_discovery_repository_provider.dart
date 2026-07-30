import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/data/guild_discovery_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_discovery_repository_provider.g.dart';

@Riverpod(keepAlive: true)
GuildDiscoveryRepository guildDiscoveryRepository(Ref ref) {
  return GuildDiscoveryRepository(ref.watch(fluxerDioProvider));
}
