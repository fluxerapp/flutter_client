import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

const int kPinnedMessagesPageSize = 25;

class PinnedMessageEntry {
  const PinnedMessageEntry({required this.message, required this.pinnedAt});

  final Message message;
  final DateTime pinnedAt;
}

class PinnedMessagesPage {
  const PinnedMessagesPage({required this.items, required this.hasMore});

  final List<PinnedMessageEntry> items;
  final bool hasMore;
}

class ChannelPinsRepository {
  const ChannelPinsRepository(
    this._client,
    this._database,
    this._currentUserId,
  );

  final FluxerClient _client;
  final db.FluxerDatabase _database;
  final String? _currentUserId;

  Future<PinnedMessagesPage> listPinnedMessages({
    required String channelId,
    DateTime? before,
  }) async {
    final response = await _client.channels.listPinnedMessages(
      channelId: channelId,
      limit: kPinnedMessagesPageSize,
      before: before,
    );

    final mentionCtx = await buildMessageMentionContext(
      _database,
      currentUserId: _currentUserId,
      channelId: channelId,
    );
    final entries = <PinnedMessageEntry>[
      for (final pin in response.items)
        PinnedMessageEntry(
          message:
              Message.fromPinnedMessage(
                pin.message,
                currentUserId: _currentUserId,
              ).copyWith(
                isMentioned: messageMentionsUser(
                  mentionCtx,
                  authorId: pin.message.author.id,
                  mentionedUserIds: pin.message.mentions
                      .map((u) => u.id)
                      .toList(),
                  mentionEveryone: pin.message.mentionEveryone,
                  mentionRoleIds: pin.message.mentionRoles,
                ),
              ),
          pinnedAt: pin.pinnedAt,
        ),
    ];

    await _database.userDao.upsertUsers(
      response.items
          .map((pin) => userFromPartialSdk(pin.message.author))
          .toList(),
    );
    await _database.messageDao.upsertMessages(
      entries.map((entry) => entry.message.toCompanion()).toList(),
    );

    if (entries.any((e) => e.message.isMentioned)) {
      await ReadStateRepository(
        _client,
        _database,
      ).recomputeMentionsAfterBackfill(
        channelId: channelId,
        currentUserId: _currentUserId,
      );
    }

    return PinnedMessagesPage(items: entries, hasMore: response.hasMore);
  }

  Future<void> pinMessage({
    required String channelId,
    required String messageId,
  }) async {
    await _client.channels.pinMessage(
      channelId: channelId,
      messageId: messageId,
    );

    final row = await _database.messageDao.getMessage(messageId);
    if (row == null) {
      return;
    }
    await _database.messageDao.upsertMessage(
      Message.fromRow(row).copyWith(isPinned: true).toCompanion(),
    );
  }

  Future<void> unpinMessage({
    required String channelId,
    required String messageId,
  }) async {
    await _client.channels.unpinMessage(
      channelId: channelId,
      messageId: messageId,
    );

    final row = await _database.messageDao.getMessage(messageId);
    if (row == null) {
      return;
    }
    await _database.messageDao.upsertMessage(
      Message.fromRow(row).copyWith(isPinned: false).toCompanion(),
    );
  }
}
