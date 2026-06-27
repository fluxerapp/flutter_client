import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild_collapsed_categories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_collapsed_categories_provider.g.dart';

@riverpod
Stream<Set<String>> guildCollapsedCategories(Ref ref, String guildId) {
  final db = ref.watch(fluxerDatabaseProvider);
  return db.userGuildSettingsDao
      .watchByGuildId(guildId)
      .map(parseCollapsedCategoryIdsFromGuildSettingsRow);
}
