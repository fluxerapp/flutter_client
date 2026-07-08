import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/data/guild_role_settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_role_settings_repository_provider.g.dart';

@riverpod
GuildRoleSettingsRepository guildRoleSettingsRepository(Ref ref) {
  return GuildRoleSettingsRepository(ref.watch(fluxerClientProvider));
}
