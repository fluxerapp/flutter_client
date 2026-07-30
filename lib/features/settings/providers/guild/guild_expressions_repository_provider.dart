import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/data/guild_expressions_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_expressions_repository_provider.g.dart';

@Riverpod(keepAlive: true)
GuildExpressionsRepository guildExpressionsRepository(Ref ref) {
  return GuildExpressionsRepository(ref.watch(fluxerClientProvider));
}
