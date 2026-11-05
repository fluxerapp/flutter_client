import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class ResolvedFavoriteEntry {
  const ResolvedFavoriteEntry({
    required this.favorite,
    required this.channel,
    required this.dm,
    required this.guildId,
    required this.guild,
  });

  final db.FavoriteChannel favorite;
  final Channel? channel;
  final DmConversation? dm;
  final String? guildId;
  final Guild? guild;

  String get channelId => favorite.channelId;

  String displayName(FluxerLocalizations l10n) =>
      favorite.nickname ??
      channel?.name ??
      (dm == null ? null : dmConversationDisplayName(l10n, dm!)) ??
      favorite.channelId;
}

class FavoriteChannelGroup {
  const FavoriteChannelGroup({
    required this.categoryId,
    required this.title,
    required this.entries,
  });

  final String? categoryId;
  final String title;
  final List<ResolvedFavoriteEntry> entries;
}
