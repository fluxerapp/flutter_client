import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_unread_loader.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';

class QuickSwitcherRepository {
  const QuickSwitcherRepository(this._database);

  final FluxerDatabase _database;

  Future<List<Channel>> getGuildChannels({
    Set<String> threadGuildIds = const <String>{},
  }) async {
    final rows = await _database.channelDao.getAllChannels();
    final List<Channel> channels = <Channel>[
      for (final row in rows)
        if (!isThreadOnlyChannelType(row.type) ||
            threadGuildIds.contains(row.guildId))
          Channel.fromRow(row),
    ];
    if (threadGuildIds.isEmpty) {
      return channels;
    }
    final Set<String> joined = await _database.threadDao.getJoinedThreadIds();
    for (final String guildId in threadGuildIds) {
      for (final row in await _database.threadDao.getThreadsForGuild(guildId)) {
        final bool visible =
            joined.contains(row.id) ||
            row.type != ChannelType.privateThread.wireValue;
        if (visible && row.threadArchived != true) {
          channels.add(Channel.fromRow(row));
        }
      }
    }
    return channels;
  }

  Future<String?> getChannelParentId(String channelId) async {
    final row = await _database.channelDao.getChannelById(channelId);
    return row?.parentId;
  }

  Future<List<QuickSwitcherUnreadChannel>> getUnreadChannels({
    required String? currentUserId,
    required List<DmConversation> conversations,
    bool unreadBadgeCustomizationEnabled = false,
  }) {
    return loadQuickSwitcherUnreadChannels(
      db: _database,
      currentUserId: currentUserId,
      conversations: conversations,
      unreadBadgeCustomizationEnabled: unreadBadgeCustomizationEnabled,
    );
  }
}
