import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/bulk_upsert.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/guild_stickers.dart';

part 'guild_sticker_dao.g.dart';

@DriftAccessor(tables: [GuildStickers])
class GuildStickerDao extends DatabaseAccessor<FluxerDatabase>
    with _$GuildStickerDaoMixin {
  GuildStickerDao(super.attachedDatabase);

  Stream<List<GuildSticker>> watchAll() =>
      select(guildStickers).watch().suppressDriftCancellation;

  Future<List<GuildSticker>> getAll() => select(guildStickers).get();

  Future<void> replaceForGuild(
    String guildId,
    List<GuildStickersCompanion> stickers,
  ) => replaceForGuilds(<String, List<GuildStickersCompanion>>{
    guildId: stickers,
  });

  Future<void> replaceForGuilds(
    Map<String, List<GuildStickersCompanion>> stickersByGuildId,
  ) async {
    if (stickersByGuildId.isEmpty) {
      return;
    }
    await batch((Batch b) {
      b.deleteWhere(
        guildStickers,
        (row) => row.guildId.isIn(stickersByGuildId.keys),
      );
      batchUpsert(b, attachedDatabase, guildStickers, <GuildStickersCompanion>[
        for (final List<GuildStickersCompanion> rows
            in stickersByGuildId.values)
          ...rows,
      ]);
    });
  }

  Future<void> clearAll() => delete(guildStickers).go();
}
