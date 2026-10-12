import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_dart/export.dart';

const int _kNotificationMessageBufferSize = 50;
const int kUnreadPreviewMessageLimit = 25;

class NotificationsRepository {
  NotificationsRepository({
    required this._database,
    required MessageRepository messageRepository,
    required this._client,
    required this._currentUserId,
  }) : _messages = messageRepository;

  final FluxerDatabase _database;
  final MessageRepository _messages;
  final FluxerClient _client;
  final String? _currentUserId;

  Future<List<Message>> loadUnreadPreview(UnreadInboxEntry entry) async {
    final String channelId = entry.channelId;
    final String? ackId = entry.ackMessageId;
    if (ackId != null && ackId.isNotEmpty) {
      try {
        final List<Message> afterAck = await _messages.getMessages(
          channelId: channelId,
          limit: kUnreadPreviewMessageLimit,
          after: ackId,
        );
        if (afterAck.isNotEmpty) {
          return afterAck;
        }
      } on Object catch (_) {}
    }

    String? aroundTarget = entry.lastMessageId ?? ackId;
    if (aroundTarget == null || aroundTarget.isEmpty) {
      final driftRows = await _database.messageDao.getMessages(
        channelId,
        limit: 1,
      );
      aroundTarget = driftRows.isNotEmpty ? driftRows.last.id : null;
    }
    if (aroundTarget == null || aroundTarget.isEmpty) {
      return <Message>[];
    }
    final List<Message> latest = await _messages.getMessages(
      channelId: channelId,
      limit: kUnreadPreviewMessageLimit * 2,
      around: aroundTarget,
    );
    return latest.length <= kUnreadPreviewMessageLimit
        ? latest
        : latest.sublist(latest.length - kUnreadPreviewMessageLimit);
  }

  Future<bool> replaceMentionsFromApi({
    required bool includeEveryone,
    required bool includeRoles,
    required bool includeGuilds,
  }) async {
    final list = await _client.users.listMentionsForCurrentUser(
      limit: '$_kNotificationMessageBufferSize',
      everyone: includeEveryone.toString(),
      roles: includeRoles.toString(),
      guilds: includeGuilds.toString(),
    );

    final mentionContexts = <String, MessageMentionContext>{};
    for (final channelId in list.map((sdk) => sdk.channelId).toSet()) {
      mentionContexts[channelId] = await buildMessageMentionContext(
        _database,
        currentUserId: _currentUserId,
        channelId: channelId,
      );
    }
    for (final sdk in list) {
      final msg = Message.fromSdk(sdk, currentUserId: _currentUserId).copyWith(
        isMentioned: messageMentionsUser(
          mentionContexts[sdk.channelId]!,
          authorId: sdk.author.id,
          mentionedUserIds: sdk.mentions.map((u) => u.id).toList(),
          mentionEveryone: sdk.mentionEveryone,
          mentionRoleIds: sdk.mentionRoles,
        ),
      );
      await _database.messageDao.upsertMessage(msg.toCompanion());
    }

    final companions = <NotificationMentionFeedCompanion>[];
    for (var i = 0; i < list.length; i++) {
      final sdk = list[i];
      companions.add(
        NotificationMentionFeedCompanion.insert(
          messageId: sdk.id,
          channelId: sdk.channelId,
          ordinal: i,
        ),
      );
    }

    await _database.notificationDao.replaceMentionFeed(companions);
    return list.length >= _kNotificationMessageBufferSize;
  }

  Future<bool> loadMoreMentions({
    required bool includeEveryone,
    required bool includeRoles,
    required bool includeGuilds,
    required String beforeMessageId,
  }) async {
    final list = await _client.users.listMentionsForCurrentUser(
      limit: '$_kNotificationMessageBufferSize',
      everyone: includeEveryone.toString(),
      roles: includeRoles.toString(),
      guilds: includeGuilds.toString(),
      before: beforeMessageId,
    );

    final mentionContexts = <String, MessageMentionContext>{};
    for (final channelId in list.map((sdk) => sdk.channelId).toSet()) {
      mentionContexts[channelId] = await buildMessageMentionContext(
        _database,
        currentUserId: _currentUserId,
        channelId: channelId,
      );
    }
    for (final sdk in list) {
      final msg = Message.fromSdk(sdk, currentUserId: _currentUserId).copyWith(
        isMentioned: messageMentionsUser(
          mentionContexts[sdk.channelId]!,
          authorId: sdk.author.id,
          mentionedUserIds: sdk.mentions.map((u) => u.id).toList(),
          mentionEveryone: sdk.mentionEveryone,
          mentionRoleIds: sdk.mentionRoles,
        ),
      );
      await _database.messageDao.upsertMessage(msg.toCompanion());
    }

    final baseOrdinal = await _database.notificationDao.maxMentionOrdinal();
    var next = (baseOrdinal ?? -1) + 1;
    final companions = <NotificationMentionFeedCompanion>[];
    for (final sdk in list) {
      companions.add(
        NotificationMentionFeedCompanion.insert(
          messageId: sdk.id,
          channelId: sdk.channelId,
          ordinal: next,
        ),
      );
      next++;
    }

    await _database.notificationDao.appendMentionRows(companions);
    return list.length >= _kNotificationMessageBufferSize;
  }

  Future<void> removeMentionLocalAndRemote(String messageId) async {
    await _database.notificationDao.deleteMentionRow(messageId);
    await _client.users.deleteMention(messageId: messageId);
  }

  Future<void> markChannelRead({
    required String channelId,
    required String messageId,
  }) async {
    await _client.channels.acknowledgeMessage(
      channelId: channelId,
      messageId: messageId,
      body: const MessageAckRequest(),
    );
    await _database.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(messageId),
        mentionCount: const Value(0),
        manual: const Value(false),
      ),
    );
    if ((await _database.dmChannelDao.getDmChannelById(channelId)) != null) {
      await _database.dmChannelDao.markAsRead(channelId);
    }
  }

  Future<void> markAllInboxChannelsAsRead(
    List<UnreadInboxEntry> entries,
  ) async {
    for (final UnreadInboxEntry entry in entries) {
      final String? messageId = await resolveMarkReadMessageId(entry.channelId);
      if (messageId == null || messageId.isEmpty) {
        continue;
      }
      await markChannelRead(channelId: entry.channelId, messageId: messageId);
    }
  }

  Future<String?> resolveMarkReadMessageId(String channelId) async {
    final channel = await _database.channelDao.getChannelById(channelId);
    final dm = channel == null
        ? await _database.dmChannelDao.getDmChannelById(channelId)
        : null;
    String? messageId = channel?.lastMessageId ?? dm?.lastMessageId;
    final msgs = await _database.messageDao.getMessages(channelId, limit: 1);
    if (msgs.isNotEmpty && compareSnowflakeIds(msgs.first.id, messageId) > 0) {
      messageId = msgs.first.id;
    }
    return messageId;
  }
}
