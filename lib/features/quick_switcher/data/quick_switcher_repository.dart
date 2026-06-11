import 'package:fluxer_app/core/database/fluxer_database.dart' hide Channel;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_unread_loader.dart';
import 'package:fluxer_app/features/quick_switcher/domain/quick_switcher_unread_channel.dart';

class QuickSwitcherRepository {
  const QuickSwitcherRepository(this._database);

  final FluxerDatabase _database;

  Future<List<Channel>> getGuildChannels() async {
    final rows = await _database.channelDao.getAllChannels();
    return rows.map(Channel.fromRow).toList();
  }

  Future<String?> getChannelParentId(String channelId) async {
    final row = await _database.channelDao.getChannelById(channelId);
    return row?.parentId;
  }

  Future<List<QuickSwitcherUnreadChannel>> getUnreadChannels({
    required String? currentUserId,
    required List<DmConversation> conversations,
  }) {
    return loadQuickSwitcherUnreadChannels(
      db: _database,
      currentUserId: currentUserId,
      conversations: conversations,
    );
  }
}
