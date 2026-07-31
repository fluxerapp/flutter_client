import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_dart/export.dart';

const int _kNotificationMessageBufferSize = 50;

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

  Future<List<Message>> loadGuildUnreadPreview({
    required String channelId,
    ReadState? readStateRow,
    String? channelLastMessageId,
  }) async {
    final String? ackId = readStateRow?.lastMessageId;
    try {
      if (ackId != null && ackId.isNotEmpty) {
        final afterAwait = await _messages.getMessages(
          channelId: channelId,
          limit: _kNotificationMessageBufferSize,
          after: ackId,
        );
        if (afterAwait.isNotEmpty) {
          return afterAwait;
        }
      }
    } on Object catch (_) {}

    var aroundTarget = channelLastMessageId ?? ackId;
    if (aroundTarget == null || aroundTarget.isEmpty) {
      final driftRows = await _database.messageDao.getMessages(
        channelId,
        limit: 1,
      );
      final String? lastId = driftRows.isNotEmpty ? driftRows.last.id : null;
      if (lastId == null || lastId.isEmpty) {
        return [];
      }
      aroundTarget = lastId;
    }

    try {
      return await _messages.getMessages(
        channelId: channelId,
        limit: _kNotificationMessageBufferSize * 2,
        around: aroundTarget,
      );
    } on Object catch (_) {
      return [];
    }
  }

  Future<List<Message>> loadDmUnreadPreview({required String channelId}) async {
    final readStateRow = await _database.readStateDao.getReadState(channelId);
    final ackId = readStateRow?.lastMessageId;
    try {
      if (ackId != null && ackId.isNotEmpty) {
        final afterAwait = await _messages.getMessages(
          channelId: channelId,
          limit: _kNotificationMessageBufferSize,
          after: ackId,
        );
        if (afterAwait.isNotEmpty) {
          return afterAwait;
        }
      }
    } on Object catch (_) {}

    final driftRows = await _database.messageDao.getMessages(
      channelId,
      limit: 1,
    );
    final lastId = driftRows.isNotEmpty ? driftRows.last.id : null;
    if (lastId == null || lastId.isEmpty) {
      return [];
    }

    try {
      return await _messages.getMessages(
        channelId: channelId,
        limit: _kNotificationMessageBufferSize * 2,
        around: lastId,
      );
    } on Object catch (_) {
      return [];
    }
  }

  Future<List<Message>> loadPreviewForEntry({
    required UnreadInboxEntry entry,
    required Channel? guildChannelRow,
  }) async {
    if (entry.isDm) {
      return loadDmUnreadPreview(channelId: entry.channelId);
    }
    final ReadState? rs = await _database.readStateDao.getReadState(
      entry.channelId,
    );
    return loadGuildUnreadPreview(
      channelId: entry.channelId,
      readStateRow: rs,
      channelLastMessageId: guildChannelRow?.lastMessageId,
    );
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
      final String? messageId = await _resolveMarkReadMessageId(
        entry.channelId,
      );
      if (messageId == null || messageId.isEmpty) {
        continue;
      }
      await markChannelRead(channelId: entry.channelId, messageId: messageId);
    }
  }

  Future<String?> _resolveMarkReadMessageId(String channelId) async {
    final channel = await _database.channelDao.getChannelById(channelId);
    String? messageId = channel?.lastMessageId;
    final msgs = await _database.messageDao.getMessages(channelId, limit: 1);
    if (msgs.isNotEmpty) {
      messageId = msgs.last.id;
    }
    return messageId;
  }
}
