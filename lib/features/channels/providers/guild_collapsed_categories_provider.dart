import 'package:fluxer_app/features/guilds/domain/guild_collapsed_categories.dart';
import 'package:fluxer_app/features/guilds/providers/user_guild_settings_data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_collapsed_categories_provider.g.dart';

@riverpod
AsyncValue<Set<String>> guildCollapsedCategories(Ref ref, String guildId) {
  return watchUserGuildSettingsData(
    ref,
    guildId,
  ).whenData(parseCollapsedCategoryIdsFromGuildSettingsData);
}
