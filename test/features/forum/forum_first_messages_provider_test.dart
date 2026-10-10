import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/providers/forum_first_messages_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';

import '../../helpers/open_test_database.dart';

class _FakeRepository implements ForumRepository {
  final List<List<String>> requested = <List<String>>[];

  @override
  Future<Map<String, Message?>> fetchPostData({
    required String guildId,
    required String forumId,
    required List<String> postIds,
  }) async {
    requested.add(postIds);
    return <String, Message?>{for (final String id in postIds) id: null};
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late db.FluxerDatabase database;
  late ProviderContainer container;

  setUp(() async {
    database = openTestDatabase();
    addTearDown(database.close);
    container = ProviderContainer(
      overrides: <Override>[fluxerDatabaseProvider.overrideWithValue(database)],
    );
    addTearDown(container.dispose);
    await database.messageDao.upsertMessage(
      db.MessagesCompanion.insert(
        id: 'p1',
        channelId: 'p1',
        authorId: 'u1',
        content: 'starter',
        timestamp: DateTime.utc(2026),
      ),
    );
    await database.messageDao.updateReactions(
      'p1',
      jsonEncode(<Map<String, dynamic>>[
        const Reaction(emoji: '👍', count: 1).toJson(),
      ]),
    );
    final db.Message row = (await database.messageDao.getMessage('p1'))!;
    container.listen(forumFirstMessagesProvider, (_, _) {});
    container
        .read(forumFirstMessagesProvider.notifier)
        .put(Message.fromRow(row));
  });

  Future<Reaction> reloadAfterAnotherReactionEvent() async {
    container
        .read(messageRealtimeBusProvider)
        .emit(const MessageReactionsChanged(channelId: 'p1', messageId: 'p1'));
    await pumpEventQueue();
    return container.read(forumFirstMessagesProvider)['p1']!.reactions.single;
  }

  test('post data is not requested without read message history', () async {
    final _FakeRepository repository = _FakeRepository();
    final ProviderContainer gated = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(database),
        forumRepositoryProvider.overrideWithValue(repository),
        parentThreadActorProvider('g1', 'f1').overrideWithValue(
          ThreadActor(permissions: Permission.viewChannel.value),
        ),
      ],
    );
    addTearDown(gated.dispose);
    gated.listen(forumFirstMessagesProvider, (_, _) {});

    gated
        .read(forumFirstMessagesProvider.notifier)
        .request(guildId: 'g1', forumId: 'f1', postIds: <String>['p2']);
    await Future<void>.delayed(
      forumPostDataDebounce + const Duration(milliseconds: 50),
    );

    expect(repository.requested, isEmpty);
  });

  test(
    'own reaction on a post card survives a reload of the stored row',
    () async {
      container
          .read(forumFirstMessagesProvider.notifier)
          .applyOwnReaction(
            postId: 'p1',
            emojiId: null,
            emojiName: '👍',
            add: true,
          );

      final Reaction reaction = await reloadAfterAnotherReactionEvent();

      expect(reaction.hasReacted, isTrue);
      expect(reaction.count, 2);
    },
  );

  test('rolled back own reaction is rolled back in the stored row', () async {
    container.read(forumFirstMessagesProvider.notifier)
      ..applyOwnReaction(
        postId: 'p1',
        emojiId: null,
        emojiName: '👍',
        add: true,
      )
      ..applyOwnReaction(
        postId: 'p1',
        emojiId: null,
        emojiName: '👍',
        add: false,
      );

    final Reaction reaction = await reloadAfterAnotherReactionEvent();

    expect(reaction.hasReacted, isFalse);
    expect(reaction.count, 1);
  });
}
