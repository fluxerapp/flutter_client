import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/guild_emojis.dart';

part 'guild_emoji_dao.g.dart';

@DriftAccessor(tables: [GuildEmojis])
class GuildEmojiDao extends DatabaseAccessor<FluxerDatabase>
    with _$GuildEmojiDaoMixin {
  GuildEmojiDao(super.attachedDatabase);

  Stream<List<GuildEmoji>> watchByGuild(String guildId) =>
      (select(guildEmojis)
            ..where((e) => e.guildId.equals(guildId))
            ..orderBy([
              (_) => OrderingTerm(
                expression: const CustomExpression<int>('rowid'),
                mode: OrderingMode.desc,
              ),
            ]))
          .watch();

  Future<List<GuildEmoji>> getByGuild(String guildId) =>
      (select(guildEmojis)..where((e) => e.guildId.equals(guildId))).get();

  Future<void> replaceForGuild(
    String guildId,
    List<GuildEmojisCompanion> emojis,
  ) async {
    await (delete(guildEmojis)..where((e) => e.guildId.equals(guildId))).go();
    await batch((b) {
      for (final emoji in emojis) {
        b.insert(guildEmojis, emoji);
      }
    });
  }

  Future<void> clearAll() => delete(guildEmojis).go();
}
