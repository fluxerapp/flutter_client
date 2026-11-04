import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/data/friend_repository.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';

void main() {
  test(
    'hasReceivedInitialConversations is false until first DM watch emit',
    () async {
      final StreamController<List<DmConversation>> controller =
          StreamController<List<DmConversation>>.broadcast();
      addTearDown(controller.close);

      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          dmRepositoryProvider.overrideWithValue(
            _FakeDmRepository(controller.stream),
          ),
          friendRepositoryProvider.overrideWithValue(_FakeFriendRepository()),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(dmViewModelProvider).hasReceivedInitialConversations,
        isFalse,
      );

      controller.add(const <DmConversation>[]);
      await Future<void>.delayed(Duration.zero);

      expect(
        container.read(dmViewModelProvider).hasReceivedInitialConversations,
        isTrue,
      );
    },
  );

  test('a refreshed DM list keeps your own message acked', () async {
    final db = openTestDatabase();
    final StreamController<List<DmConversation>> controller =
        StreamController<List<DmConversation>>.broadcast();
    addTearDown(controller.close);
    late final ProviderContainer container;
    final ReadStateWriteBatcher batcher = ReadStateWriteBatcher(
      database: db,
      onOverlayChanged: () {
        container.read(readStateOverlayVersionProvider.notifier).bump();
      },
    );
    container = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(db),
        readStateWriteBatcherProvider.overrideWithValue(batcher),
        dmRepositoryProvider.overrideWithValue(
          _FakeDmRepository(controller.stream),
        ),
        friendRepositoryProvider.overrideWithValue(_FakeFriendRepository()),
      ],
    );
    addTearDown(container.dispose);
    container.listen(dmViewModelProvider, (_, _) {}, fireImmediately: true);

    final DmConversation sent = DmConversation(
      id: 'dm-1',
      type: 1,
      recipientId: 'other',
      recipientName: 'Other',
      lastMessage: 'hello',
      lastMessageId: '200',
      lastMessageTime: DateTime.utc(2026, 5, 6),
      unreadCount: 1,
    );
    controller.add(<DmConversation>[sent]);
    await Future<void>.delayed(Duration.zero);
    expect(
      container.read(dmViewModelProvider).conversations.single.unreadCount,
      1,
    );

    batcher.enqueueAck(channelId: 'dm-1', messageId: '200', clearSticky: false);
    await Future<void>.delayed(Duration.zero);
    expect(
      container.read(dmViewModelProvider).conversations.single.unreadCount,
      0,
    );

    controller.add(<DmConversation>[sent]);
    await Future<void>.delayed(Duration.zero);
    expect(
      container.read(dmViewModelProvider).conversations.single.unreadCount,
      0,
    );
  });
}

class _FakeDmRepository implements DmRepository {
  _FakeDmRepository(this.stream);

  final Stream<List<DmConversation>> stream;

  @override
  Stream<List<DmConversation>> watchDmChannels() => stream;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeFriendRepository implements FriendRepository {
  @override
  Stream<List<Friend>> watchRelationships() => const Stream.empty();

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
