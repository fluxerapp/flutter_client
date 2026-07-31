import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_attachment_update.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('buildMessageCreateBody sends favorite meme ids compactly', () {
    final body = buildMessageCreateBody(content: '', favoriteMemeId: 'meme-1');

    expect(body, {
      'favorite_meme_id': 'meme-1',
      'flags': kMessageFlagCompactAttachments,
    });
  });

  test('buildMessageCreateBody keeps normal text message body minimal', () {
    final body = buildMessageCreateBody(content: 'hello');

    expect(body, {'content': 'hello'});
  });

  test('buildMessageCreateBody includes nonce when provided', () {
    final body = buildMessageCreateBody(
      content: 'hello',
      clientNonce: '1501123056699965440',
    );

    expect(body['content'], 'hello');
    expect(body['nonce'], '1501123056699965440');
  });

  test('buildMessageCreateBody includes replied_user when replying', () {
    final bodyEnabled = buildMessageCreateBody(
      content: 'hello',
      replyToId: '123',
    );
    final bodyDisabled = buildMessageCreateBody(
      content: 'hello',
      replyToId: '123',
      replyMention: false,
    );

    expect(bodyEnabled['message_reference'], {'message_id': '123'});
    expect(bodyEnabled['allowed_mentions'], {'replied_user': true});
    expect(bodyDisabled['allowed_mentions'], {'replied_user': false});
  });

  test(
    'buildMessageCreateBody merges favorite meme flag with explicit flags',
    () {
      final body = buildMessageCreateBody(
        content: 'hi',
        favoriteMemeId: 'meme-1',
        messageFlags: messageFlagSuppressNotifications,
      );

      expect(body['favorite_meme_id'], 'meme-1');
      final flags = body['flags'] as int;
      expect(
        flags & kMessageFlagCompactAttachments,
        kMessageFlagCompactAttachments,
      );
      expect(
        flags & messageFlagSuppressNotifications,
        messageFlagSuppressNotifications,
      );
    },
  );

  test('buildMessageCreateBody passes explicit message flags through', () {
    final body = buildMessageCreateBody(
      content: 'hi',
      messageFlags: messageFlagSuppressNotifications,
    );

    expect(body['flags'], messageFlagSuppressNotifications);
    expect(body.containsKey('favorite_meme_id'), isFalse);
  });

  test('buildMessageCreateBody sets tts when requested', () {
    final body = buildMessageCreateBody(content: 'hi', tts: true);

    expect(body['tts'], true);
  });

  test('loadMessagePage coalesces concurrent identical requests and refetches '
      'distinct ones', () async {
    final db = openTestDatabase();
    final adapter = _CountingAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    // Two concurrent identical loads share one network round-trip.
    await Future.wait([
      repo.loadMessagePage(channelId: 'channel-1'),
      repo.loadMessagePage(channelId: 'channel-1'),
    ]);
    expect(adapter.getMessagesCount, 1);

    // A later (non-overlapping) identical load is not stale-deduped.
    await repo.loadMessagePage(channelId: 'channel-1');
    expect(adapter.getMessagesCount, 2);

    // Concurrent loads with different cursors are not coalesced.
    await Future.wait([
      repo.loadMessagePage(channelId: 'channel-1', before: '123'),
      repo.loadMessagePage(channelId: 'channel-1', after: '456'),
    ]);
    expect(adapter.getMessagesCount, 4);
  });

  test('a fresh load never joins an in-flight identical latest page', () async {
    final db = openTestDatabase();
    final adapter = _CountingAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    // A proof request must observe the server after its caller's pointer
    // read; an in-flight identical page may carry an older snapshot, and
    // joining it would launder a raced pointer into an orphan verdict
    // (see _liveTailAckTargetId).
    await Future.wait([
      repo.loadMessagePage(channelId: 'channel-1'),
      repo.loadMessagePage(channelId: 'channel-1', fresh: true),
    ]);
    expect(adapter.getMessagesCount, 2);

    // Nor may a fresh request become a join target for ordinary loads: that
    // would silently launder its freshness the other way.
    await Future.wait([
      repo.loadMessagePage(channelId: 'channel-1', fresh: true),
      repo.loadMessagePage(channelId: 'channel-1'),
    ]);
    expect(adapter.getMessagesCount, 4);
  });

  test('backfilled role-mention message persists a rich isMentioned', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'me',
        guildId: 'guild-1',
        roleIdsJson: const Value('["role-1"]'),
      ),
    );
    const messageId = '1501554121113600000';
    final messageJson = MessageResponseSchema(
      id: messageId,
      channelId: 'channel-1',
      author: const UserPartialResponse(
        id: 'other',
        username: 'other',
        discriminator: '0001',
        globalName: null,
        avatar: null,
        avatarColor: null,
        flags: 0,
      ),
      type: MessageResponseSchemaTypeType.valueDefault,
      flags: 0,
      content: 'hey team',
      timestamp: DateTime.utc(2026, 5, 6, 12),
      pinned: false,
      mentionEveryone: false,
      tts: false,
      mentions: const [],
      mentionRoles: const ['role-1'],
    ).toJson();
    final adapter = _StubMessagesAdapter(
      jsonEncode(<Map<String, dynamic>>[messageJson]),
    );
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    await repo.loadMessagePage(channelId: 'channel-1');

    // Role-only mention: the old heuristic stored false, the rich resolver
    // stores true.
    final row = await db.messageDao.getMessage(messageId);
    expect(row?.isMentioned, isTrue);
  });

  test('loadMessagePage prunes stale middle message from local db', () async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
      ),
    );
    const anchorId = '1501554121113600000';
    const deletedId = '1501554121113601000';
    const keptId = '1501554121113602000';
    for (final String messageId in <String>[anchorId, deletedId, keptId]) {
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'other',
          content: messageId,
          timestamp: DateTime.utc(2026, 5, 6, 12),
        ),
      );
    }
    final List<Map<String, dynamic>> responseJson = <Map<String, dynamic>>[
      MessageResponseSchema(
        id: keptId,
        channelId: 'channel-1',
        author: const UserPartialResponse(
          id: 'other',
          username: 'other',
          discriminator: '0001',
          globalName: null,
          avatar: null,
          avatarColor: null,
          flags: 0,
        ),
        type: MessageResponseSchemaTypeType.valueDefault,
        flags: 0,
        content: keptId,
        timestamp: DateTime.utc(2026, 5, 6, 12, 0, 1),
        pinned: false,
        mentionEveryone: false,
        tts: false,
        mentions: const [],
        mentionRoles: const [],
      ).toJson(),
      MessageResponseSchema(
        id: anchorId,
        channelId: 'channel-1',
        author: const UserPartialResponse(
          id: 'other',
          username: 'other',
          discriminator: '0001',
          globalName: null,
          avatar: null,
          avatarColor: null,
          flags: 0,
        ),
        type: MessageResponseSchemaTypeType.valueDefault,
        flags: 0,
        content: anchorId,
        timestamp: DateTime.utc(2026, 5, 6, 12),
        pinned: false,
        mentionEveryone: false,
        tts: false,
        mentions: const [],
        mentionRoles: const [],
      ).toJson(),
    ];
    final adapter = _StubMessagesAdapter(jsonEncode(responseJson));
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    await repo.loadMessagePage(channelId: 'channel-1');

    expect(await db.messageDao.getMessage(anchorId), isNotNull);
    expect(await db.messageDao.getMessage(deletedId), isNull);
    expect(await db.messageDao.getMessage(keptId), isNotNull);
  });

  test('deleteMessage removes local row when server succeeds', () async {
    final db = openTestDatabase();
    const messageId = '1501554121113600000';
    await db.messageDao.upsertMessage(
      MessagesCompanion.insert(
        id: messageId,
        channelId: 'channel-1',
        authorId: 'other',
        content: 'hello',
        timestamp: DateTime.utc(2026, 5, 6, 12),
      ),
    );
    final adapter = _DeleteMessageAdapter(statusCode: 204);
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    await repo.deleteMessage(channelId: 'channel-1', messageId: messageId);

    expect(await db.messageDao.getMessage(messageId), isNull);
  });

  test('deleteMessage removes local row when server returns 404', () async {
    final db = openTestDatabase();
    const messageId = '1501554121113600000';
    await db.messageDao.upsertMessage(
      MessagesCompanion.insert(
        id: messageId,
        channelId: 'channel-1',
        authorId: 'other',
        content: 'hello',
        timestamp: DateTime.utc(2026, 5, 6, 12),
      ),
    );
    final adapter = _DeleteMessageAdapter(statusCode: 404);
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    await repo.deleteMessage(channelId: 'channel-1', messageId: messageId);

    expect(await db.messageDao.getMessage(messageId), isNull);
  });

  test('deleteAttachment sends DELETE to attachment endpoint', () async {
    final db = openTestDatabase();
    const messageId = '1501554121113600000';
    const attachmentId = '1501554121113600001';
    await db.messageDao.upsertMessage(
      MessagesCompanion.insert(
        id: messageId,
        channelId: 'channel-1',
        authorId: 'other',
        content: 'hello',
        timestamp: DateTime.utc(2026, 5, 6, 12),
      ),
    );
    final adapter = _DeleteAttachmentAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
    final repo = MessageRepository(client, dio, db, 'me');

    await repo.deleteAttachment(
      channelId: 'channel-1',
      messageId: messageId,
      attachmentId: attachmentId,
    );

    expect(
      adapter.requestedPath,
      '/v1/channels/channel-1/messages/$messageId/attachments/$attachmentId',
    );
    expect(adapter.requestedMethod, 'DELETE');
  });

  test(
    'editMessageAttachments sends PATCH with attachment references',
    () async {
      final db = openTestDatabase();
      const messageId = '1501554121113600000';
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: messageId,
          channelId: 'channel-1',
          authorId: 'other',
          content: 'hello',
          timestamp: DateTime.utc(2026, 5, 6, 12),
        ),
      );
      final adapter = _EditMessageAttachmentsAdapter(
        messageId: messageId,
        channelId: 'channel-1',
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = adapter;
      final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
      final repo = MessageRepository(client, dio, db, 'me');

      final updatedMessage = await repo.editMessageAttachments(
        channelId: 'channel-1',
        messageId: messageId,
        attachmentUpdates: const [
          MessageAttachmentUpdate(id: 'att-1'),
          MessageAttachmentUpdate.withDescription(
            id: 'att-2',
            description: 'alt text',
          ),
        ],
      );

      expect(adapter.requestedMethod, 'PATCH');
      expect(
        adapter.requestedPath,
        '/v1/channels/channel-1/messages/$messageId',
      );
      expect(updatedMessage.id, messageId);
      expect(updatedMessage.content, 'hello');
      expect(updatedMessage.attachments.length, 2);
      expect(updatedMessage.attachments[1].description, 'alt text');
      expect(adapter.requestedFieldNames, <String>['attachments']);
      expect(adapter.requestedAttachmentsJson, isNotNull);
      final List<dynamic> sentAttachments =
          jsonDecode(adapter.requestedAttachmentsJson!) as List<dynamic>;
      expect(sentAttachments, hasLength(2));
      expect(sentAttachments[1]['description'], 'alt text');
    },
  );
}

class _CountingAdapter implements HttpClientAdapter {
  int getMessagesCount = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final String path = options.uri.path;
    if (options.method == 'GET' && path.endsWith('/messages')) {
      getMessagesCount++;
      // Small delay so concurrent calls genuinely overlap in flight.
      await Future<void>.delayed(const Duration(milliseconds: 10));
      return ResponseBody.fromString(
        jsonEncode(const <Map<String, Object?>>[]),
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }
    return ResponseBody.fromString('nf', 404);
  }

  @override
  void close({bool force = false}) {}
}

class _DeleteMessageAdapter implements HttpClientAdapter {
  _DeleteMessageAdapter({required this.statusCode});

  final int statusCode;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.method == 'DELETE' && options.uri.path.contains('/messages/')) {
      return ResponseBody.fromString('missing', statusCode);
    }
    return ResponseBody.fromString('nf', 404);
  }

  @override
  void close({bool force = false}) {}
}

class _StubMessagesAdapter implements HttpClientAdapter {
  _StubMessagesAdapter(this.body);

  final String body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final String path = options.uri.path;
    if (options.method == 'GET' && path.endsWith('/messages')) {
      return ResponseBody.fromString(
        body,
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }
    return ResponseBody.fromString('nf', 404);
  }

  @override
  void close({bool force = false}) {}
}

class _DeleteAttachmentAdapter implements HttpClientAdapter {
  String? requestedPath;
  String? requestedMethod;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestedPath = options.uri.path;
    requestedMethod = options.method;
    if (options.method == 'DELETE' &&
        options.uri.path.contains('/attachments/')) {
      return ResponseBody.fromString('', 204);
    }
    return ResponseBody.fromString('nf', 404);
  }

  @override
  void close({bool force = false}) {}
}

class _EditMessageAttachmentsAdapter implements HttpClientAdapter {
  _EditMessageAttachmentsAdapter({
    required this.messageId,
    required this.channelId,
  });

  final String messageId;
  final String channelId;
  String? requestedPath;
  String? requestedMethod;
  List<String> requestedFieldNames = <String>[];
  String? requestedAttachmentsJson;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requestedPath = options.uri.path;
    requestedMethod = options.method;
    if (options.method == 'PATCH' && options.uri.path.contains('/messages/')) {
      if (options.data is FormData) {
        final FormData formData = options.data! as FormData;
        requestedFieldNames = formData.fields
            .map((MapEntry<String, String> e) => e.key)
            .toList();
        for (final MapEntry<String, String> field in formData.fields) {
          if (field.key == 'attachments') {
            requestedAttachmentsJson = field.value;
          }
        }
      }
      final response = MessageResponseSchema(
        id: messageId,
        channelId: channelId,
        author: const UserPartialResponse(
          id: 'other',
          username: 'other',
          discriminator: '0001',
          globalName: null,
          avatar: null,
          avatarColor: null,
          flags: 0,
        ),
        type: MessageResponseSchemaTypeType.valueDefault,
        flags: 0,
        content: 'hello',
        timestamp: DateTime.utc(2026, 5, 6, 12),
        pinned: false,
        mentionEveryone: false,
        tts: false,
        mentions: const [],
        mentionRoles: const [],
        attachments: const [
          MessageAttachmentResponse(
            id: 'att-1',
            filename: 'a.png',
            size: 100,
            flags: 0,
            url: 'https://x/a',
          ),
          MessageAttachmentResponse(
            id: 'att-2',
            filename: 'b.png',
            size: 100,
            flags: 0,
            url: 'https://x/b',
            description: 'alt text',
          ),
        ],
      );
      return ResponseBody.fromString(
        jsonEncode(response.toJson()),
        200,
        headers: {
          Headers.contentTypeHeader: ['application/json'],
        },
      );
    }
    return ResponseBody.fromString('nf', 404);
  }

  @override
  void close({bool force = false}) {}
}
