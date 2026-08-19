import 'dart:convert';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/message_mention_context_cache.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/domain/api_attachment_metadata.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_attachment_update.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
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
/// content/embeds/attachments/stickers. The server builds the snapshot itself
/// (it rejects forward refs that include content). [attachmentIds]/
/// [embedIndices] narrow which media the server snapshots. Omit them to
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
  final MessageMentionContextCache? _mentionContextCache;
  final Map<String, Future<MessageListLoadResult>> _inFlightPages =
      <String, Future<MessageListLoadResult>>{};

  MessageRepository(
    this._client,
    this._dio,
    this._db,
    this._currentUserId, {
    this._mentionContextCache,
  });

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
    bool fresh = false,
  }) {
    if (fresh) {
      // A proof request: its soundness argument is "this fetch left after I
      // observed X", so it must neither join an in-flight response (whose
      // snapshot may predate X) nor become a join target for ordinary loads.
      return _fetchMessagePage(
        channelId: channelId,
        limit: limit,
        before: before,
        after: after,
        around: around,
      );
    }
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
    final Stopwatch pageStopwatch = Stopwatch()..start();
    // Cumulative ms marks after each awaited phase, for device-log attribution.
    final List<String> pageMarks = <String>[];
    void mark(String name) {
      pageMarks.add('$name@${pageStopwatch.elapsedMilliseconds}');
    }

    try {
      final List<MessageResponseSchema> data = await _client.channels
          .listMessages(
            channelId: channelId,
            limit: limit.toString(),
            before: before,
            after: after,
            around: around,
          );
      mark('http');

      final List<Message> embeddedReplyParents = <Message>[];
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

      final mentionCtx =
          await _mentionContextCache?.contextFor(
            currentUserId: _currentUserId,
            channelId: channelId,
          ) ??
          await buildMessageMentionContext(
            _db,
            currentUserId: _currentUserId,
            channelId: channelId,
          );
      mark('ctx');
      final List<Message> messages = data
          .map(
            (sdk) =>
                Message.fromSdk(sdk, currentUserId: _currentUserId).copyWith(
                  isMentioned: messageMentionsUser(
                    mentionCtx,
                    authorId: sdk.author.id,
                    mentionedUserIds: sdk.mentions.map((u) => u.id).toList(),
                    mentionEveryone: sdk.mentionEveryone,
                    mentionRoleIds: sdk.mentionRoles,
                  ),
                ),
          )
          .toList()
          .reversed
          .toList();

      final Map<String, db.UsersCompanion> pageUsersById =
          <String, db.UsersCompanion>{};
      for (final sdk in data) {
        if (sdk.webhookId == null) {
          pageUsersById[sdk.author.id] = userFromPartialSdk(sdk.author);
        }
        for (final mention in sdk.mentions) {
          pageUsersById[mention.id] = userFromPartialSdk(mention);
        }
        for (final UserPartialResponse user
            in sdk.users ?? const <UserPartialResponse>[]) {
          pageUsersById[user.id] = userFromPartialSdk(user);
        }
      }
      if (pageUsersById.isNotEmpty) {
        await upsertUsersCompanions(_db, pageUsersById.values);
      }
      mark('users');
      final List<Message> persisted = await _upsertKeepingTranslations(
        messages,
      );
      await _pruneStaleMessagesForNetworkPage(channelId, persisted);
      mark('persist');

      if (persisted.isNotEmpty) {
        final last = persisted.last;
        await _db.dmChannelDao.updateLastMessage(
          channelId,
          last.id,
          last.content,
          last.authorId,
          last.timestamp,
        );
      }
      mark('tail');

      if (persisted.any((m) => m.isMentioned)) {
        await ReadStateRepository(_client, _db).recomputeMentionsAfterBackfill(
          channelId: channelId,
          currentUserId: _currentUserId,
          allowDecrease: true,
        );
        mark('mentions');
      }
      debugPrint(
        '[MessageRepo] page ch=$channelId n=${persisted.length} '
        '[${pageMarks.join(' ')}]',
      );

      return MessageListLoadResult(
        messages: persisted,
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
      await upsertSupplementalUsersFromSdk(_db, sdk.users);
      final message = Message.fromSdk(sdk, currentUserId: _currentUserId)
          .copyWith(
            isMentioned: await resolveMessageMentionsUser(
              _db,
              currentUserId: _currentUserId,
              channelId: channelId,
              authorId: sdk.author.id,
              mentionedUserIds: sdk.mentions.map((u) => u.id).toList(),
              mentionEveryone: sdk.mentionEveryone,
              mentionRoleIds: sdk.mentionRoles,
            ),
          );
      return await _upsertKeepingTranslation(message);
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
    final mentionCtx = await buildMessageMentionContext(
      _db,
      currentUserId: _currentUserId,
      channelId: channelId,
    );
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
            isMentioned: messageMentionsUser(
              mentionCtx,
              authorId: author['id'] as String,
              mentionedUserIds: _mentionedUserIdsFromJson(map),
              mentionEveryone: (map['mention_everyone'] as bool?) ?? false,
              mentionRoleIds:
                  (map['mention_roles'] as List<dynamic>?)
                      ?.map((e) => e.toString())
                      .toList() ??
                  const [],
            ),
            mentionedUserIds: _mentionedUserIdsFromJson(map),
            supplementalUserIds: _supplementalUserIdsFromJson(map),
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
          await upsertMentionUsersFromJson(_db, map['users'] as List<dynamic>?);
        }
      } on Object catch (e) {
        talker.warning('[MessageRepo] Skipping message: $e');
      }
    }

    if (messages.isNotEmpty) {
      final List<Message> persisted = await _upsertKeepingTranslations(
        messages,
      );
      await _pruneStaleMessagesForNetworkPage(channelId, persisted);

      final last = persisted.last;
      await _db.dmChannelDao.updateLastMessage(
        channelId,
        last.id,
        last.content,
        last.authorId,
        last.timestamp,
      );
      if (persisted.any((m) => m.isMentioned)) {
        await ReadStateRepository(_client, _db).recomputeMentionsAfterBackfill(
          channelId: channelId,
          currentUserId: _currentUserId,
          allowDecrease: true,
        );
      }
      return persisted;
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
    final String oldestId = networkPage.first.id;
    final String newestId = networkPage.last.id;
    final List<db.Message> localRows = await _db.messageDao
        .getMessagesInSnowflakeRange(channelId, oldestId, newestId);
    final List<String> staleIds = networkPageStaleLocalIds(
      localMessageIds: localRows.map((db.Message row) => row.id),
      networkPage: networkPage,
    );
    await _db.messageDao.deleteMessages(staleIds);
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

  List<String> _supplementalUserIdsFromJson(Map<String, dynamic> map) {
    final users = map['users'] as List<dynamic>?;
    if (users == null) {
      return const [];
    }
    return [
      for (final user in users)
        if (user is Map<String, dynamic> && user['id'] != null)
          user['id'].toString(),
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
        return await _persistSdkMessage(channelId: channelId, schema: schema);
      }

      final Message sent = await _postMessage(channelId, body);
      return sent;
    } on DioException {
      rethrow;
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
    return _persistSdkMessage(channelId: channelId, schema: schema);
  }

  Future<Message> _persistSdkMessage({
    required String channelId,
    required MessageResponseSchema schema,
  }) async {
    final Message base = Message.fromSdk(schema, currentUserId: _currentUserId);
    final mentionCtx = await buildMessageMentionContext(
      _db,
      currentUserId: _currentUserId,
      channelId: channelId,
    );
    final Message message = base.copyWith(
      isMentioned: messageMentionsUser(
        mentionCtx,
        authorId: base.authorId,
        mentionedUserIds: base.mentionedUserIds,
        mentionEveryone: schema.mentionEveryone,
        mentionRoleIds: schema.mentionRoles,
      ),
    );
    return _upsertKeepingTranslation(message);
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
      throw Exception(userFacingErrorMessage(e, 'Failed to forward message'));
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
      return await _persistSdkMessage(channelId: channelId, schema: schema);
    } on DioException catch (e) {
      throw Exception(userFacingErrorMessage(e, 'Failed to edit message'));
    }
  }

  Future<void> deleteAttachment({
    required String channelId,
    required String messageId,
    required String attachmentId,
  }) async {
    try {
      await _client.channels.deleteMessageAttachment(
        channelId: channelId,
        messageId: messageId,
        attachmentId: attachmentId,
      );
    } on DioException catch (e) {
      throw Exception(userFacingErrorMessage(e, 'Failed to delete attachment'));
    }
  }

  /// Rewrites a message's attachment array and nothing else.
  ///
  /// `content` is deliberately NOT sent. The endpoint accepts it, but this
  /// operation does not own the text: another client can edit it while our
  /// request is in flight, and transmitting a value we merely read would
  /// overwrite that edit.
  ///
  /// Uses Dio directly instead of the generated SDK edit call, which always
  /// includes `embeds` and `message_snapshots` as null and can make attachment-
  /// only messages fail with CANNOT_SEND_EMPTY_MESSAGE. Sent as plain JSON:
  /// the API's multipart parser only reads `payload_json` and file fields, so
  /// a bare multipart `attachments` field is silently dropped (issue #625).
  Future<Message> editMessageAttachments({
    required String channelId,
    required String messageId,
    required List<MessageAttachmentUpdate> attachmentUpdates,
  }) async {
    try {
      final List<Map<String, dynamic>> attachments = attachmentUpdates
          .map((MessageAttachmentUpdate update) => update.toJson())
          .toList();
      final Response<Map<String, dynamic>> response = await _dio
          .patch<Map<String, dynamic>>(
            '/channels/$channelId/messages/$messageId',
            data: <String, dynamic>{'attachments': attachments},
          );
      final Map<String, dynamic>? data = response.data;
      if (data == null) {
        throw Exception('Empty response from editMessageAttachments');
      }
      final MessageResponseSchema schema = MessageResponseSchema.fromJson(data);
      return await _persistSdkMessage(channelId: channelId, schema: schema);
    } on DioException catch (e) {
      throw Exception(userFacingErrorMessage(e, 'Failed to edit attachments'));
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
      return await _persistSdkMessage(channelId: channelId, schema: schema);
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
      await _db.messageDao.deleteMessages([messageId]);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        await _db.messageDao.deleteMessages([messageId]);
        return;
      }
      throw Exception(e.response?.statusMessage ?? 'Failed to delete message');
    }
  }

  Future<List<Message>> _upsertKeepingTranslations(
    List<Message> messages,
  ) async {
    if (messages.isEmpty) {
      return messages;
    }
    final Map<String, MessageTranslationSnapshot> snapshots = await _db
        .messageDao
        .getTranslationSnapshots(
          messages.map((Message message) => message.id).toList(),
        );
    await _db.messageDao.upsertMessages(
      messages.map((Message message) => message.toCompanion()).toList(),
      snapshots: snapshots,
    );
    return <Message>[
      for (final Message message in messages)
        message.withStoredTranslation(snapshots[message.id]),
    ];
  }

  Future<Message> _upsertKeepingTranslation(Message message) async {
    final List<Message> persisted = await _upsertKeepingTranslations(<Message>[
      message,
    ]);
    return persisted.first;
  }
}
