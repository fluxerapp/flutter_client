import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/chat_view_model_pagination_test_harness.dart';
import '../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../helpers/open_test_database.dart';

typedef _InstallSnapshot = ({
  String? authorName,
  String? mentionName,
  MessageReferenceState replyState,
});

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final String parentId = paginationSnowflakeForIndex(1);
  final String replyId = paginationSnowflakeForIndex(10);
  final String mentionId = paginationSnowflakeForIndex(11);

  Map<String, Object?> replyJson() => <String, Object?>{
    ...paginationMessageJson(
      id: replyId,
      channelId: 'channel-1',
      authorId: 'other',
    ),
    'type': 19,
    'message_reference': <String, Object?>{
      'channel_id': 'channel-1',
      'message_id': parentId,
      'guild_id': 'guild-1',
      'type': 0,
    },
  };

  Map<String, Object?> mentionJson() => <String, Object?>{
    ...paginationMessageJson(
      id: mentionId,
      channelId: 'channel-1',
      authorId: 'other',
    ),
    'content': '<@peer> ping',
    'mentions': <Object?>[
      <String, Object?>{
        'id': 'peer',
        'username': 'peer',
        'discriminator': '0001',
        'global_name': 'Sim Peer',
        'avatar': null,
        'avatar_color': null,
        'flags': 0,
      },
    ],
  };

  Future<(ProviderContainer, ChatViewModel)> setUp() async {
    final FluxerDatabase db = openTestDatabase();
    for (final String channelId in <String>['channel-1', 'channel-2']) {
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: channelId,
          guildId: 'guild-1',
          name: channelId,
        ),
      );
    }
    await db.userDao.upsertUsers(<UsersCompanion>[
      UsersCompanion.insert(id: 'other', username: 'user-other'),
      UsersCompanion.insert(
        id: 'peer',
        username: 'peer',
        globalName: const Value<String?>('Sim Peer'),
      ),
    ]);
    await db.memberDao.upsertMember(
      MembersCompanion.insert(
        userId: 'other',
        guildId: 'guild-1',
        nick: const Value<String?>('PT Nick'),
      ),
    );
    await db.messageDao.upsertMessages(<MessagesCompanion>[
      paginationCachedMessage(id: parentId, channelId: 'channel-1'),
    ]);
    final PaginatingAdapter adapter = PaginatingAdapter(
      messagesByChannel: <String, List<Map<String, Object?>>>{
        'channel-1': <Map<String, Object?>>[replyJson(), mentionJson()],
        'channel-2': paginationChannelMessages('channel-2', 3, baseIndex: 100),
      },
    );
    final ProviderContainer container = paginationContainer(db, adapter);
    addTearDown(container.dispose);
    return (container, container.read(chatViewModelProvider.notifier));
  }

  List<_InstallSnapshot> recordInstalls(ProviderContainer container) {
    final List<_InstallSnapshot> installs = <_InstallSnapshot>[];
    container.listen<ChatViewState>(chatViewModelProvider, (
      ChatViewState? previous,
      ChatViewState next,
    ) {
      final bool hadReply =
          previous != null &&
          previous.channelId == 'channel-1' &&
          previous.messages.any((m) => m.id == replyId);
      if (next.channelId != 'channel-1' ||
          hadReply ||
          !next.messages.any((m) => m.id == replyId)) {
        return;
      }
      final GuildUserDisplay? author = container
          .read(guildUserDisplayProvider(('other', 'guild-1')))
          .value;
      final GuildUserDisplay? mention = container
          .read(guildUserDisplayProvider(('peer', 'guild-1')))
          .value;
      final MessageReferenceState replyState = container
          .read(messageReferencesProvider.notifier)
          .resolveSync(
            channelId: 'channel-1',
            messageId: parentId,
            channelMessages: next.messages,
          )
          .state;
      installs.add((
        authorName: author?.displayName,
        mentionName: mention?.displayName,
        replyState: replyState,
      ));
    });
    return installs;
  }

  test(
    'a network window installs with nicknames, mentions and reply parents resolved',
    () async {
      final (ProviderContainer container, ChatViewModel notifier) =
          await setUp();
      final List<_InstallSnapshot> installs = recordInstalls(container);

      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      expect(installs, isNotEmpty);
      expect(installs.first, (
        authorName: 'PT Nick',
        mentionName: 'Sim Peer',
        replyState: MessageReferenceState.loaded,
      ));
    },
  );

  test(
    'a parked window restores with its reply parents and nicknames resolved',
    () async {
      final (ProviderContainer container, ChatViewModel notifier) =
          await setUp();
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();
      await notifier.switchChannel('channel-2');
      await paginationFlushAsync();
      final List<_InstallSnapshot> installs = recordInstalls(container);

      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      expect(installs, isNotEmpty);
      expect(installs.first, (
        authorName: 'PT Nick',
        mentionName: 'Sim Peer',
        replyState: MessageReferenceState.loaded,
      ));
    },
  );

  test(
    'emptying the open channel stale parked copy keeps its reply parents',
    () async {
      final (ProviderContainer container, ChatViewModel notifier) =
          await setUp();
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();
      await notifier.switchChannel('channel-2');
      await paginationFlushAsync();
      await notifier.switchChannel('channel-1');
      await paginationFlushAsync();

      final String liveReplyId = paginationSnowflakeForIndex(12);
      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(<String, Object?>{
                  ...replyJson(),
                  'id': liveReplyId,
                }),
              ),
            ),
          );
      await paginationFlushAsync();
      await container.read(fluxerDatabaseProvider).messageDao.deleteMessages(
        'channel-1',
        <String>[replyId, mentionId],
      );
      container
          .read(messageRealtimeBusProvider)
          .emit(
            MessagesDeletedBulk(
              MessageDeleteBulkEvent(
                channelId: 'channel-1',
                ids: <String>[replyId, mentionId],
              ),
            ),
          );
      await paginationFlushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.messages.map((m) => m.id), contains(liveReplyId));
      expect(
        container
            .read(messageReferencesProvider.notifier)
            .resolveSync(
              channelId: 'channel-1',
              messageId: parentId,
              channelMessages: state.messages,
            )
            .state,
        MessageReferenceState.loaded,
      );
    },
  );
}
