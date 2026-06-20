import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/domain/api_attachment_metadata.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/client_nonce.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

const int kMessageFlagCompactAttachments = 1 << 17;

class MessageListLoadResult {
  const MessageListLoadResult({
    required this.messages,
    this.embeddedReplyParents = const [],
  });

  final List<Message> messages;
  final List<Message> embeddedReplyParents;
}

Map<String, dynamic> buildMessageCreateBody({
  required String content,
  String? replyToId,
  bool replyMention = true,
  String? clientNonce,
  List<String> stickerIds = const [],
  String? favoriteMemeId,
  List<ApiAttachmentMetadata>? attachments,
  int? messageFlags,
  bool tts = false,
}) {
  final body = <String, dynamic>{};
  if (content.isNotEmpty) {
    body['content'] = content;
  }
  if (replyToId != null) {
    body['message_reference'] = <String, dynamic>{'message_id': replyToId};
    body['allowed_mentions'] = <String, dynamic>{'replied_user': replyMention};
  }
  if (stickerIds.isNotEmpty) {
    body['sticker_ids'] = stickerIds;
  }
  var flags = messageFlags ?? 0;
  if (favoriteMemeId != null) {
    body['favorite_meme_id'] = favoriteMemeId;
    flags |= kMessageFlagCompactAttachments;
  }
  if (flags != 0) {
    body['flags'] = flags;
  }
  if (tts) {
    body['tts'] = true;
  }
  if (attachments != null && attachments.isNotEmpty) {
    body['attachments'] = attachments
        .map((ApiAttachmentMetadata e) => e.toJson())
        .toList();
  }
  if (clientNonce != null && clientNonce.isNotEmpty) {
    body['nonce'] = clientNonce;
  }
  return body;
}

/// Builds the request body for a message forward.
///
/// Forwards reference a source message and MUST NOT carry
/// content/embeds/attachments/stickers — the server builds the snapshot itself
/// (it rejects forward refs that include content). [attachmentIds]/
/// [embedIndices] narrow which media the server snapshots; omit them to
/// forward the whole message.
Map<String, dynamic> buildForwardMessageBody({
  required String sourceChannelId,
  required String sourceMessageId,
  String? sourceGuildId,
  List<String>? attachmentIds,
  List<int>? embedIndices,
  String? clientNonce,
}) {
  final reference = <String, dynamic>{
    'type': 1, // MessageReferenceType.forward
    'channel_id': sourceChannelId,
    'message_id': sourceMessageId,
  };
  if (sourceGuildId != null && sourceGuildId.isNotEmpty) {
    reference['guild_id'] = sourceGuildId;
  }
  if (attachmentIds != null && attachmentIds.isNotEmpty) {
    reference['attachment_ids'] = attachmentIds;
  }
  if (embedIndices != null && embedIndices.isNotEmpty) {
    reference['embed_indices'] = embedIndices;
  }
  final body = <String, dynamic>{'message_reference': reference};
  if (clientNonce != null && clientNonce.isNotEmpty) {
    body['nonce'] = clientNonce;
  }
  return body;
}

class MessageRepository {
  final FluxerClient _client;
  final Dio _dio;
  final db.FluxerDatabase _db;
  final String? _currentUserId;
  final Map<String, Future<MessageListLoadResult>> _inFlightPages =
      <String, Future<MessageListLoadResult>>{};

  MessageRepository(this._client, this._dio, this._db, this._currentUserId);

  Stream<List<Message>> watchMessages(String channelId) {
    return _db.messageDao
        .watchMessages(channelId)
        .map((rows) => rows.map(Message.fromRow).toList());
  }

  Future<List<Message>> getCachedMessages(
    String channelId, {
    int limit = 30,
  }) async {
    final rows = await _db.messageDao.getMessages(channelId, limit: limit);
    return rows.map(Message.fromRow).toList();
  }

  Future<List<Message>> getCachedMessagesBefore(
    String channelId,
    String beforeId, {
    int limit = 30,
  }) async {
    final rows = await _db.messageDao.getMessages(
      channelId,
      limit: limit,
      beforeId: beforeId,
    );
    return rows.map(Message.fromRow).toList();
  }

  Future<List<Message>> getCachedMessagesAfter(
    String channelId,
    String afterId, {
    int limit = 30,
  }) async {
    final rows = await _db.messageDao.getMessagesAfter(
      channelId,
      afterId,
      limit: limit,
    );
    return rows.map(Message.fromRow).toList();
  }

  Future<List<Message>> getMessages({
    required String channelId,
    int limit = 30,
    String? before,
    String? after,
    String? around,
  }) async {
    final page = await loadMessagePage(
      channelId: channelId,
      limit: limit,
      before: before,
      after: after,
      around: around,
    );
    return page.messages;
  }

  Future<MessageListLoadResult> loadMessagePage({
    required String channelId,
    int limit = 30,
    String? before,
    String? after,
    String? around,
  }) {
    final String key =
        '$channelId|${before ?? ''}|${after ?? ''}|${around ?? ''}|$limit';
    final Future<MessageListLoadResult>? existing = _inFlightPages[key];
    if (existing != null) {
      return existing;
    }
    final Future<MessageListLoadResult> future =
        _fetchMessagePage(
          channelId: channelId,
          limit: limit,
          before: before,
          after: after,
          around: around,
        ).whenComplete(() {
          _inFlightPages.removeWhere((k, _) => k == key);
        });
    _inFlightPages[key] = future;
    return future;
  }

  Future<MessageListLoadResult> _fetchMessagePage({
    required String channelId,
    int limit = 30,
    String? before,
    String? after,
    String? around,
  }) async {
    try {
      final data = await _client.channels.listMessages(
        channelId: channelId,
        limit: limit.toString(),
        before: before,
        after: after,
        around: around,
      );

      final embeddedReplyParents = <Message>[];
      for (final sdk in data) {
        final referenced = sdk.referencedMessage;
        if (referenced != null) {
          embeddedReplyParents.add(
            Message.fromReferencedSdk(
              referenced,
              currentUserId: _currentUserId,
            ),
          );
        }
      }

      final messages = data
          .map((sdk) => Message.fromSdk(sdk, currentUserId: _currentUserId))
          .toList()
          .reversed
          .toList();

      for (final sdk in data) {
        if (sdk.webhookId == null) {
          await _db.userDao.upsertUser(userFromPartialSdk(sdk.author));
        }
        await upsertMentionUsersFromSdk(_db, sdk.mentions);
      }
      await _db.messageDao.upsertMessages(
        messages.map((m) => m.toCompanion()).toList(),
      );
      await _pruneStaleMessagesForNetworkPage(channelId, messages);

      if (messages.isNotEmpty) {
        final last = messages.last;
        await _db.dmChannelDao.updateLastMessage(
          channelId,
          last.id,
          last.content,
          last.authorId,
          last.timestamp,
        );
      }

      if (messages.any((m) => m.isMentioned)) {
        await ReadStateRepository(_client, _db).recomputeMentionsAfterBackfill(
          channelId: channelId,
          currentUserId: _currentUserId,
        );
      }

      return MessageListLoadResult(
        messages: messages,
        embeddedReplyParents: embeddedReplyParents,
      );
    } on DioException catch (e) {
      // SDK deserialization can fail on a 200 response
      // (e.g. missing fields). Fall back to manual parsing.
      if (e.response?.statusCode == 200) {
        talker.warning(
          '[MessageRepo] SDK parse failed, '
          'using fallback: ${e.error}',
        );
        final messages = await _getMessagesFallback(
          channelId: channelId,
          limit: limit,
          before: before,
          after: after,
          around: around,
        );
        return MessageListLoadResult(messages: messages);
      }
      throw Exception(
        e.error?.toString() ?? e.message ?? 'Failed to fetch messages',
      );
    }
  }

  Future<Message> fetchMessage({
    required String channelId,
    required String messageId,
  }) async {
    try {
      final sdk = await _client.channels.getMessage(
        channelId: channelId,
        messageId: messageId,
      );
      if (sdk.webhookId == null) {
        await _db.userDao.upsertUser(userFromPartialSdk(sdk.author));
      }
      await upsertMentionUsersFromSdk(_db, sdk.mentions);
      final message = Message.fromSdk(sdk, currentUserId: _currentUserId);
      await _db.messageDao.upsertMessage(message.toCompanion());
      return message;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        rethrow;
      }
      throw Exception(
        e.error?.toString() ?? e.message ?? 'Failed to fetch message',
      );
    }
  }

  /// Fallback: fetch raw JSON and parse manually,
  /// skipping individual messages that fail.
  Future<List<Message>> _getMessagesFallback({
    required String channelId,
    int limit = 30,
    String? before,
    String? after,
    String? around,
  }) async {
    final queryParams = <String, dynamic>{
      'limit': limit,
      'before': ?before,
      'after': ?after,
      'around': ?around,
    };
    final response = await _dio.get<List<dynamic>>(
      '/channels/$channelId/messages',
      queryParameters: queryParams,
    );
    final data = response.data;
    if (data == null) {
      return [];
    }

    final messages = <Message>[];
    for (final json in data.reversed) {
      try {
        final map = json as Map<String, dynamic>;
        final author = map['author'] as Map<String, dynamic>;
        messages.add(
          Message(
            id: map['id'] as String,
            channelId: map['channel_id'] as String,
            authorId: author['id'] as String,
            authorName: resolveMessageAuthorNameFromJson(author),
            authorAvatar: author['avatar'] as String?,
            authorAvatarColor: author['avatar_color'] as int?,
            authorIsBot: (author['bot'] as bool?) ?? false,
            authorIsSystem: (author['system'] as bool?) ?? false,
            webhookId: map['webhook_id'] as String?,
            content: (map['content'] as String?) ?? '',
            timestamp: DateTime.parse(map['timestamp'] as String),
            editedTimestamp: map['edited_timestamp'] != null
                ? DateTime.tryParse(map['edited_timestamp'] as String)
                : null,
            embeds:
                (map['embeds'] as List<dynamic>?)
                    ?.map((e) => Embed.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
            attachments:
                (map['attachments'] as List<dynamic>?)
                    ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
            stickers:
                (map['stickers'] as List<dynamic>?)
                    ?.map(
                      (e) => MessageSticker.fromJson(e as Map<String, dynamic>),
                    )
                    .toList() ??
                const [],
            replyToId:
                (map['message_reference']
                        as Map<String, dynamic>?)?['message_id']
                    as String?,
            messageReference: map['message_reference'] != null
                ? MessageReference.fromJson(
                    map['message_reference'] as Map<String, dynamic>,
                  )
                : null,
            messageSnapshots:
                (map['message_snapshots'] as List<dynamic>?)
                    ?.map(
                      (e) =>
                          MessageSnapshot.fromJson(e as Map<String, dynamic>),
                    )
                    .toList() ??
                const [],
            isPinned: (map['pinned'] as bool?) ?? false,
            isMentioned: _isMentionedFromJson(map),
            mentionedUserIds: _mentionedUserIdsFromJson(map),
            type: (map['type'] as int?) ?? 0,
            flags: (map['flags'] as int?) ?? 0,
          ),
        );

        final String? webhookId = map['webhook_id'] as String?;
        if (webhookId == null) {
          final authorId = author['id'] as String;
          await _db.userDao.upsertUser(
            db.UsersCompanion.insert(
              id: authorId,
              username: (author['username'] as String?) ?? '',
              memberSince: Value(dateTimeFromUserSnowflakeOrNull(authorId)),
            ),
          );
          await upsertMentionUsersFromJson(
            _db,
            map['mentions'] as List<dynamic>?,
          );
        }
      } on Object catch (e) {
        talker.warning('[MessageRepo] Skipping message: $e');
      }
    }

    if (messages.isNotEmpty) {
      await _db.messageDao.upsertMessages(
        messages.map((m) => m.toCompanion()).toList(),
      );
      await _pruneStaleMessagesForNetworkPage(channelId, messages);

      final last = messages.last;
      await _db.dmChannelDao.updateLastMessage(
        channelId,
        last.id,
        last.content,
        last.authorId,
        last.timestamp,
      );
    }

    if (messages.any((m) => m.isMentioned)) {
      await ReadStateRepository(_client, _db).recomputeMentionsAfterBackfill(
        channelId: channelId,
        currentUserId: _currentUserId,
      );
    }

    return messages;
  }

  Future<void> _pruneStaleMessagesForNetworkPage(
    String channelId,
    List<Message> networkPage,
  ) async {
    if (networkPage.isEmpty) {
      return;
    }
    final DateTime oldest = networkPage.first.timestamp;
    final DateTime newest = networkPage.last.timestamp;
    final List<db.Message> localRows = await _db.messageDao
        .getMessagesInTimestampRange(channelId, oldest, newest);
    final List<String> staleIds = networkPageStaleLocalIds(
      localMessageIds: localRows.map((db.Message row) => row.id),
      networkPage: networkPage,
    );
    await _db.messageDao.deleteMessages(staleIds);
  }

  bool _isMentionedFromJson(Map<String, dynamic> map) {
    if ((map['mention_everyone'] as bool?) ?? false) {
      return true;
    }
    if (_currentUserId == null) {
      return false;
    }
    final mentions = map['mentions'] as List<dynamic>?;
    if (mentions != null) {
      for (final m in mentions) {
        if (m is Map<String, dynamic> && m['id'] == _currentUserId) {
          return true;
        }
      }
    }
    return false;
  }

  List<String> _mentionedUserIdsFromJson(Map<String, dynamic> map) {
    final mentions = map['mentions'] as List<dynamic>?;
    if (mentions == null) {
      return const [];
    }
    return [
      for (final mention in mentions)
        if (mention is Map<String, dynamic> && mention['id'] != null)
          mention['id'].toString(),
    ];
  }

  Future<void> addReaction({
    required String channelId,
    required String messageId,
    required String emoji,
  }) async {
    await _client.channels.addReaction(
      channelId: channelId,
      messageId: messageId,
      emoji: emoji,
    );
  }

  Future<void> removeReaction({
    required String channelId,
    required String messageId,
    required String emoji,
  }) async {
    await _client.channels.removeOwnReaction(
      channelId: channelId,
      messageId: messageId,
      emoji: emoji,
    );
  }

  Future<void> removeAllReactions({
    required String channelId,
    required String messageId,
  }) async {
    await _client.channels.removeAllReactions(
      channelId: channelId,
      messageId: messageId,
    );
  }

  Future<Message> sendMessage({
    required String channelId,
    required String content,
    String? replyToId,
    bool replyMention = true,
    String? clientNonce,
    List<String> stickerIds = const [],
    String? favoriteMemeId,
    List<ApiAttachmentMetadata>? attachmentMetadata,
    List<XFile>? attachmentFiles,
    int? messageFlags,
    bool tts = false,
  }) async {
    try {
      final Map<String, dynamic> body = buildMessageCreateBody(
        content: content,
        replyToId: replyToId,
        replyMention: replyMention,
        clientNonce: clientNonce,
        stickerIds: stickerIds,
        favoriteMemeId: favoriteMemeId,
        attachments: attachmentMetadata,
        messageFlags: messageFlags,
        tts: tts,
      );

      if (attachmentFiles != null && attachmentFiles.isNotEmpty) {
        final FormData formData = FormData();
        formData.fields.add(MapEntry('payload_json', jsonEncode(body)));
        for (var i = 0; i < attachmentFiles.length; i++) {
          final XFile x = attachmentFiles[i];
          formData.files.add(
            MapEntry(
              'files[$i]',
              await MultipartFile.fromFile(x.path, filename: x.name),
            ),
          );
        }
        final Response<Map<String, dynamic>> response = await _dio
            .post<Map<String, dynamic>>(
              '/channels/$channelId/messages',
              data: formData,
              options: Options(
                contentType: 'multipart/form-data',
                sendTimeout: const Duration(minutes: 30),
                receiveTimeout: const Duration(minutes: 5),
              ),
            );
        final Map<String, dynamic>? data = response.data;
        if (data == null) {
          throw Exception('Empty response from sendMessage');
        }
        final MessageResponseSchema schema = MessageResponseSchema.fromJson(
          data,
        );
        final Message message = Message.fromSdk(
          schema,
          currentUserId: _currentUserId,
        );
        await _db.messageDao.upsertMessage(message.toCompanion());
        return message;
      }

      final Message sent = await _postMessage(channelId, body);
      return sent;
    } on DioException catch (e) {
      throw Exception(dioExceptionMessage(e, 'Failed to send message'));
    }
  }

  Future<Message> _postMessage(
    String channelId,
    Map<String, dynamic> body,
  ) async {
    final Response<Map<String, dynamic>> response = await _dio
        .post<Map<String, dynamic>>(
          '/channels/$channelId/messages',
          data: body,
          options: Options(
            sendTimeout: const Duration(minutes: 5),
            receiveTimeout: const Duration(minutes: 2),
          ),
        );
    final Map<String, dynamic>? data = response.data;
    if (data == null) {
      throw Exception('Empty response from sendMessage');
    }
    final MessageResponseSchema schema = MessageResponseSchema.fromJson(data);
    final Message message = Message.fromSdk(
      schema,
      currentUserId: _currentUserId,
    );
    await _db.messageDao.upsertMessage(message.toCompanion());
    return message;
  }

  /// Forwards [sourceMessageId] from [sourceChannelId] to each channel in
  /// [destinationChannelIds]. When [comment] is non-empty a separate message is
  /// sent after each forward so it renders below the forwarded snapshot. Sends
  /// are sequential per destination (matching the web client) and throw on the
  /// first failed request.
  Future<void> forwardMessage({
    required String sourceChannelId,
    required String sourceMessageId,
    required List<String> destinationChannelIds,
    String? sourceGuildId,
    List<String>? attachmentIds,
    List<int>? embedIndices,
    String? comment,
  }) async {
    final String? trimmedComment = comment?.trim();
    final bool hasComment = trimmedComment != null && trimmedComment.isNotEmpty;
    try {
      for (final String destinationId in destinationChannelIds) {
        await _postMessage(
          destinationId,
          buildForwardMessageBody(
            sourceChannelId: sourceChannelId,
            sourceMessageId: sourceMessageId,
            sourceGuildId: sourceGuildId,
            attachmentIds: attachmentIds,
            embedIndices: embedIndices,
            clientNonce: clientNonceGenerator.next(),
          ),
        );
        if (hasComment) {
          await _postMessage(
            destinationId,
            buildMessageCreateBody(
              content: comment!,
              clientNonce: clientNonceGenerator.next(),
            ),
          );
        }
      }
    } on DioException catch (e) {
      throw Exception(dioExceptionMessage(e, 'Failed to forward message'));
    }
  }

  Future<Message> editMessage({
    required String channelId,
    required String messageId,
    required String content,
  }) async {
    try {
      final MessageResponseSchema schema = await _client.channels.editMessage(
        channelId: channelId,
        messageId: messageId,
        content: content,
      );
      final Message message = Message.fromSdk(
        schema,
        currentUserId: _currentUserId,
      );
      await _db.messageDao.upsertMessage(message.toCompanion());
      return message;
    } on DioException catch (e) {
      throw Exception(dioExceptionMessage(e, 'Failed to edit message'));
    }
  }

  Future<Message> setMessageFlags({
    required String channelId,
    required String messageId,
    required int flags,
  }) async {
    try {
      final MessageResponseSchema schema = await _client.channels.editMessage(
        channelId: channelId,
        messageId: messageId,
        flags: flags,
      );
      final Message message = Message.fromSdk(
        schema,
        currentUserId: _currentUserId,
      );
      await _db.messageDao.upsertMessage(message.toCompanion());
      return message;
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to update message flags',
      );
    }
  }

  Future<int> purgePersonalNotesMessages(String channelId) async {
    try {
      final response = await _client.channels.purgePersonalNotesMessages(
        channelId: channelId,
      );
      await _db.messageDao.deleteMessagesForChannel(channelId);
      return response.deletedCount;
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to purge personal notes',
      );
    }
  }

  Future<void> deleteMessage({
    required String channelId,
    required String messageId,
  }) async {
    try {
      await _client.channels.deleteMessage(
        channelId: channelId,
        messageId: messageId,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return;
      }
      throw Exception(e.response?.statusMessage ?? 'Failed to delete message');
    }
  }
}
