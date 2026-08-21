import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_attribution.dart';
import 'package:fluxer_app/features/emoji/domain/emoji_info_data.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:riverpod/misc.dart' show FutureProviderFamily;

class EmojiInfoResolved {
  const EmojiInfoResolved({
    required this.attribution,
    this.favoriteKey,
  });

  final EmojiAttribution attribution;
  final String? favoriteKey;
}

final FutureProviderFamily<EmojiInfoResolved, EmojiInfoData>
    emojiInfoResolvedProvider =
    FutureProvider.autoDispose.family<EmojiInfoResolved, EmojiInfoData>((
      ref,
      data,
    ) async {
      if (!data.isCustom) {
        return EmojiInfoResolved(
          attribution: const EmojiAttribution(
            type: EmojiAttributionType.defaultEmoji,
          ),
          favoriteKey: data.favoriteKeyForGuild(null),
        );
      }

      String? guildId = data.guildId;
      if (guildId == null || guildId.isEmpty) {
        final row = await ref
            .read(fluxerDatabaseProvider)
            .guildEmojiDao
            .getById(data.id!);
        guildId = row?.guildId;
      }

      Guild? guild;
      if (guildId != null && guildId.isNotEmpty) {
        guild = await ref.read(guildByIdProvider(guildId).future);
      }

      final memberGuildIds = ref
          .read(guildListViewModelProvider)
          .guilds
          .map((g) => g.id)
          .toSet();

      return EmojiInfoResolved(
        attribution: resolveEmojiAttribution(
          memberGuildIds: memberGuildIds,
          emojiId: data.id,
          guildId: guildId,
          guild: guild,
        ),
        favoriteKey: data.favoriteKeyForGuild(guildId),
      );
    });
