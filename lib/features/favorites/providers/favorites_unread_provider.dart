import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channel_groups_provider.dart';

class FavoritesUnreadSummary {
  const FavoritesUnreadSummary({this.mentionCount = 0, this.hasUnread = false});

  final int mentionCount;
  final bool hasUnread;
}

final Provider<FavoritesUnreadSummary> favoritesUnreadSummaryProvider =
    Provider.autoDispose<FavoritesUnreadSummary>((ref) {
      final entries = ref.watch(favoriteResolvedEntriesProvider);
      var mentionCount = 0;
      var hasUnread = false;
      for (final entry in entries) {
        final unread = ref.watch(channelUnreadProvider(entry.channelId)).value;
        if (unread == null) {
          continue;
        }
        if (unread.hasUnread) {
          hasUnread = true;
        }
        mentionCount += unread.mentionCount;
      }
      return FavoritesUnreadSummary(
        mentionCount: mentionCount,
        hasUnread: hasUnread,
      );
    });
