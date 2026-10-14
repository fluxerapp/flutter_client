@Tags(['slow'])
library;

import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    hide Channel, Message;
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';

import '../../helpers/chat_view_model_pagination_test_harness.dart';
import '../../helpers/open_test_database.dart';

const String _guildId = 'guild-1';
const String _parentId = 'parent-1';

class _HeldAdapter extends PaginatingAdapter {
  _HeldAdapter({required super.messagesByChannel});

  final Completer<void> release = Completer<void>();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    await release.future;
    return super.fetch(options, requestStream, cancelFuture);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a new thread opens on its local starter before the network', () async {
    final FluxerDatabase db = openTestDatabase();
    final String threadId = paginationSnowflakeForIndex(0);
    final String replyId = paginationSnowflakeForIndex(1);
    final Message source = Message(
      id: threadId,
      channelId: _parentId,
      authorId: 'other',
      authorName: 'Fullest',
      content: 'source text',
      timestamp: DateTime.parse(
        paginationMessageJson(
              id: threadId,
              channelId: _parentId,
              authorId: 'other',
            )['timestamp']!
            as String,
      ),
    );
    await db.channelDao.upsertChannels(<ChannelsCompanion>[
      ChannelsCompanion.insert(id: _parentId, guildId: _guildId, name: 'fwd'),
      ChannelsCompanion.insert(
        id: threadId,
        guildId: _guildId,
        name: 'test',
        type: const Value(11),
        parentId: const Value(_parentId),
        lastMessageId: Value(threadId),
      ),
    ]);
    await db.readStateDao.upsertReadState(
      ReadStatesCompanion(
        channelId: Value(threadId),
        lastMessageId: Value(threadId),
      ),
    );
    await db.messageDao.upsertMessages(<MessagesCompanion>[
      source.toCompanion(),
      localThreadStarter(
        threadId: threadId,
        parent: const Channel(id: _parentId, guildId: _guildId, name: 'fwd'),
        source: source,
      ).toCompanion(),
    ]);
    final _HeldAdapter adapter = _HeldAdapter(
      messagesByChannel: <String, List<Map<String, Object?>>>{
        threadId: <Map<String, Object?>>[
          <String, Object?>{
            ...paginationMessageJson(
              id: threadId,
              channelId: threadId,
              authorId: 'other',
            ),
            'type': messageTypeThreadStarterMessage,
            'content': '',
            'message_reference': <String, Object?>{
              'channel_id': _parentId,
              'message_id': threadId,
              'guild_id': _guildId,
              'type': 0,
            },
          },
          <String, Object?>{
            ...paginationMessageJson(
              id: replyId,
              channelId: threadId,
              authorId: 'other',
            ),
            'content': '123',
          },
        ],
      },
    );
    final ProviderContainer container = paginationContainer(db, adapter);
    addTearDown(container.dispose);

    unawaited(
      container.read(chatViewModelProvider.notifier).switchChannel(threadId),
    );
    await paginationFlushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(opened.isLoading, isFalse);
    expect(opened.hasMoreMessages, isFalse);
    expect(opened.messages.map((Message m) => m.type), <int>[
      messageTypeThreadStarterMessage,
    ]);
    expect(opened.messages.single.messageReference?.channelId, _parentId);

    adapter.release.complete();
    await paginationFlushAsync();
    await paginationFlushAsync();

    final ChatViewState synced = container.read(chatViewModelProvider);
    expect(synced.messages.map((Message m) => m.content), <String>['', '123']);
    expect(synced.hasMoreMessages, isFalse);
    expect(
      (await db.messageDao.getMessage(_parentId, threadId))?.content,
      'source text',
    );
  });
}
