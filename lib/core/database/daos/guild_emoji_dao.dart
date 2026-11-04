import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

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
          .watch()
          .suppressDriftCancellation;

  Stream<List<GuildEmoji>> watchAll() =>
      (select(guildEmojis)..orderBy([
            (_) => OrderingTerm(
              expression: const CustomExpression<int>('rowid'),
              mode: OrderingMode.desc,
            ),
          ]))
          .watch()
          .suppressDriftCancellation;

  Future<GuildEmoji?> getById(String id) =>
      (select(guildEmojis)..where((e) => e.id.equals(id))).getSingleOrNull();

  Future<void> replaceForGuild(
    String guildId,
    List<GuildEmojisCompanion> emojis,
  ) => replaceForGuilds(<String, List<GuildEmojisCompanion>>{guildId: emojis});

  Future<void> replaceForGuilds(
    Map<String, List<GuildEmojisCompanion>> emojisByGuildId,
  ) async {
    if (emojisByGuildId.isEmpty) {
      return;
    }
    await batch((Batch b) {
      b.deleteWhere(
        guildEmojis,
        (row) => row.guildId.isIn(emojisByGuildId.keys),
      );
      batchUpsert(b, attachedDatabase, guildEmojis, <GuildEmojisCompanion>[
        for (final List<GuildEmojisCompanion> rows in emojisByGuildId.values)
          ...rows,
      ]);
    });
  }

  Future<void> clearAll() => delete(guildEmojis).go();
}
