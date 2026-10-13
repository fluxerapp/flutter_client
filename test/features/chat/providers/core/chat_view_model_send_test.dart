import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui show Locale;

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/daos/composer_draft_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/data/attachment_upload_client.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/providers/upload/attachment_upload_client_provider.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/providers/upload/user_upload_limits_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_send_failure_messages.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../../helpers/open_test_database.dart';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Map<String, Object?> _messageJson({
  required String id,
  required String channelId,
  required String authorId,
  String content = 'message',
  String? nonce,
}) => <String, Object?>{
  'id': id,
  'channel_id': channelId,
  'author': <String, Object?>{
    'id': authorId,
    'username': 'user-$authorId',
    'discriminator': '0001',
    'global_name': null,
    'avatar': null,
    'avatar_color': null,
    'flags': 0,
  },
  'type': 0,
  'flags': 0,
  'tts': false,
  'content': content,
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'nonce': ?nonce,
};

Message _msg({
  required String id,
  required String authorId,
  String content = '',
}) => Message(
  id: id,
  channelId: 'channel-1',
  authorId: authorId,
  authorName: 'author',
  content: content,
  timestamp: DateTime.utc(2026, 6, 16, 12),
);

FavoriteMeme _favoriteMeme(String id) => FavoriteMeme(
  id: id,
  userId: 'me',
  name: 'Meme',
  altText: null,
  tags: const <String>[],
  attachmentId: 'attachment-$id',
  filename: 'meme.png',
  contentType: 'image/png',
  contentHash: null,
  size: 1,
  width: 100,
  height: 100,
  duration: null,
  isGifv: false,
  url: 'https://cdn.example/meme.png',
  klipySlug: null,
  tenorSlugId: null,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Future<(ProviderContainer, _SendAdapter, String)> setUpChannel({
    _SendAdapter? adapter,
    List<Override> overrides = const <Override>[],
  }) async {
    final db = openTestDatabase();
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(id: 'channel-1', guildId: '', name: 'dm'),
    );
    final serverMessageId = _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12));
    final _SendAdapter sendAdapter =
        adapter ?? _SendAdapter(serverMessageId: serverMessageId);
    final container = _container(db, sendAdapter, overrides: overrides);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1');
    await _flushAsync();
    return (container, sendAdapter, serverMessageId);
  }

  Future<(ProviderContainer, _SendAdapter, ChatViewModel)>
  setUpDetachedChannel({
    bool holdSend = false,
    bool holdLatestFetch = false,
  }) async {
    final db = openTestDatabase();
    final String historicalId = _snowflakeForUtc(DateTime.utc(2026, 6, 14, 12));
    final String latestId = _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12));
    final String deliveredId = _snowflakeForUtc(DateTime.utc(2026, 6, 17, 12));
    await db.guildDao.upsertServer(
      ServersCompanion.insert(id: 'guild-1', name: 'Guild'),
    );
    await db.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: 'channel-1',
        guildId: 'guild-1',
        name: 'general',
        lastMessageId: Value(latestId),
      ),
    );
    await db.memberDao.upsertMember(
      MembersCompanion.insert(userId: 'me', guildId: 'guild-1'),
    );
    final adapter =
        _SendAdapter(
            serverMessageId: deliveredId,
            aroundMessages: <Map<String, Object?>>[
              _messageJson(
                id: historicalId,
                channelId: 'channel-1',
                authorId: 'other',
              ),
            ],
            latestMessages: <Map<String, Object?>>[
              _messageJson(
                id: latestId,
                channelId: 'channel-1',
                authorId: 'other',
              ),
            ],
          )
          ..holdSend = holdSend
          ..holdLatestFetch = holdLatestFetch;
    final container = _container(db, adapter);
    addTearDown(() {
      adapter
        ..releaseSend()
        ..releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel('channel-1', targetMessageId: historicalId);
    await _flushAsync();
    return (container, adapter, notifier);
  }

  group('reaction shorthand', () {
    Future<(ProviderContainer, _SendAdapter, String, String)>
    setUpWithHistory() async {
      final String olderId = _snowflakeForUtc(DateTime.utc(2026, 6, 15, 12));
      final String latestId = _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12));
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 17, 12)),
        latestMessages: <Map<String, Object?>>[
          _messageJson(id: latestId, channelId: 'channel-1', authorId: 'other'),
          _messageJson(id: olderId, channelId: 'channel-1', authorId: 'other'),
        ],
      );
      final (container, _, _) = await setUpChannel(adapter: adapter);
      return (container, adapter, olderId, latestId);
    }

    test('reacts to the latest message without sending one', () async {
      final (container, adapter, _, latestId) = await setUpWithHistory();
      final bool reacted = await container
          .read(chatViewModelProvider.notifier)
          .reactWithShorthand(const ReactionShorthandEmoji(emoji: '👍'));
      await _flushAsync();

      expect(reacted, isTrue);
      expect(adapter.messagePostCount, 0);
      expect(adapter.reactionPuts, <String>[
        '/v1/channels/channel-1/messages/$latestId/reactions/👍/@me',
      ]);
    });

    test('reacts to the message being replied to and ends the reply', () async {
      final (container, adapter, olderId, _) = await setUpWithHistory();
      final ChatViewModel notifier = container.read(
        chatViewModelProvider.notifier,
      );
      final Message older = container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.id == olderId);
      notifier.startReply(older);
      await _flushAsync();

      await notifier.reactWithShorthand(
        const ReactionShorthandEmoji(emoji: 'blobcat', emojiId: '123'),
      );
      await _flushAsync();

      expect(adapter.reactionPuts, <String>[
        '/v1/channels/channel-1/messages/$olderId/reactions/blobcat:123/@me',
      ]);
      expect(container.read(chatViewModelProvider).replyingTo, isNull);
    });

    test('repeating the shorthand keeps the reaction', () async {
      final (container, adapter, _, _) = await setUpWithHistory();
      final ChatViewModel notifier = container.read(
        chatViewModelProvider.notifier,
      );
      await notifier.reactWithShorthand(
        const ReactionShorthandEmoji(emoji: '👍'),
      );
      await _flushAsync();
      await notifier.reactWithShorthand(
        const ReactionShorthandEmoji(emoji: '👍'),
      );
      await _flushAsync();

      expect(adapter.reactionPuts, hasLength(1));
      final Message latest = container
          .read(chatViewModelProvider)
          .messages
          .last;
      expect(latest.reactions.single.hasReacted, isTrue);
    });
  });

  test(
    'own send scrolls once on optimistic insert, not again on delivery',
    () async {
      final (container, _, serverMessageId) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier);

      final int before = container
          .read(chatViewModelProvider)
          .scrollToBottomSignal;

      await notifier.sendMessage(text: 'hi');

      final ChatViewState afterSend = container.read(chatViewModelProvider);
      expect(
        afterSend.messages.last.deliveryState,
        MessageDeliveryState.sending,
      );

      await _flushAsync();

      final ChatViewState delivered = container.read(chatViewModelProvider);
      expect(delivered.messages.last.id, serverMessageId);
      expect(delivered.messages.last.content, 'hi');
      expect(delivered.messages.last.deliveryState, MessageDeliveryState.sent);
      expect(delivered.scrollToBottomSignal, before + 1);
    },
  );

  test(
    'own send covers the optimistic row with pending auto-ack in the same state',
    () async {
      final String serverMessageId = _snowflakeForUtc(
        DateTime.utc(2026, 12, 1, 12),
      );
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: serverMessageId,
      )..holdSend = true;
      final (container, _, _) = await setUpChannel(adapter: adapter);
      addTearDown(adapter.releaseSend);

      final List<ChatViewState> sendingStates = <ChatViewState>[];
      final ProviderSubscription<ChatViewState> subscription = container.listen(
        chatViewModelProvider,
        (_, ChatViewState next) {
          if (next.messages.any(
            (Message message) =>
                message.deliveryState == MessageDeliveryState.sending,
          )) {
            sendingStates.add(next);
          }
        },
      );
      addTearDown(subscription.close);

      await container
          .read(chatViewModelProvider.notifier)
          .sendMessage(text: 'hi');

      expect(sendingStates, isNotEmpty);
      for (final ChatViewState sendingState in sendingStates) {
        final Message optimistic = sendingState.messages.lastWhere(
          (Message message) =>
              message.deliveryState == MessageDeliveryState.sending,
        );
        expect(sendingState.pendingAutoAckMessageId, optimistic.id);
        expect(sendingState.stickyUnreadMessageId, isNull);
      }

      adapter.releaseSend();
      await _flushAsync();

      final ChatViewState delivered = container.read(chatViewModelProvider);
      expect(delivered.messages.last.id, serverMessageId);
      expect(delivered.pendingAutoAckMessageId, serverMessageId);
    },
  );

  test('gateway echo for an already-delivered message is batched', () async {
    final (container, _, serverMessageId) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'hi');
    await _flushAsync();

    final ChatViewState delivered = container.read(chatViewModelProvider);
    final Message deliveredMessage = delivered.messages.last;
    expect(deliveredMessage.deliveryState, MessageDeliveryState.sent);
    expect(deliveredMessage.clientNonce, isNotNull);
    final List<Message> before = delivered.messages;

    container
        .read(messageRealtimeBusProvider)
        .emit(
          testMessageCreated(
            MessageCreateEvent(
              message: MessageResponseSchema.fromJson(
                _messageJson(
                  id: serverMessageId,
                  channelId: 'channel-1',
                  authorId: 'me',
                  content: 'hi',
                  nonce: deliveredMessage.clientNonce,
                ),
              ),
            ),
          ),
        );
    await _flushAsync();

    final List<Message> after = container.read(chatViewModelProvider).messages;
    expect(identical(before, after), isTrue);
  });

  test(
    'rapid duplicate sends during async prep produce a single message',
    () async {
      final (container, adapter, _) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier);

      final Future<void> first = notifier.sendMessage(text: 'hi');
      final Future<void> second = notifier.sendMessage(text: 'hi');
      await Future.wait(<Future<void>>[first, second]);
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      final List<Message> sent = state.messages
          .where((Message m) => m.content == 'hi')
          .toList();
      expect(sent, hasLength(1));
      expect(adapter.messagePostCount, 1);
    },
  );

  test(
    '@silent prefix strips the flag word and suppresses notifications',
    () async {
      final (container, adapter, _) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: '@silent hi');
      await _flushAsync();

      expect(adapter.lastBody?['content'], 'hi');
      final int flags = (adapter.lastBody?['flags'] as int?) ?? 0;
      expect(flags & 4096, 4096);
    },
  );

  test('tts send forwards tts:true in the request body', () async {
    final (container, adapter, _) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'hello', tts: true);
    await _flushAsync();

    expect(adapter.lastBody?['tts'], true);
  });

  test('replace command edits the last own message in place', () async {
    final (container, adapter, _) = await setUpChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'teh');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messages.last.content, 'teh');

    await notifier.applyComposerReplace(
      source: 'teh',
      replacement: 'the',
      global: false,
    );
    await _flushAsync();

    expect(adapter.lastEditContent, 'the');
    expect(container.read(chatViewModelProvider).messages.last.content, 'the');
  });

  test(
    'starting a reply while editing drops the edited message text',
    () async {
      final (container, _, _) = await setUpChannel();

      container
          .read(chatViewModelProvider.notifier)
          .startEdit(
            _msg(id: 'm-edit', authorId: 'me', content: 'edited body'),
          );
      expect(
        container.read(chatViewModelProvider).editingMessage?.id,
        'm-edit',
      );
      expect(container.read(chatViewModelProvider).messageText, 'edited body');

      container
          .read(chatViewModelProvider.notifier)
          .startReply(_msg(id: 'm-reply', authorId: 'other', content: 'hi'));
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.editingMessage, isNull);
      expect(state.replyingTo?.id, 'm-reply');
      expect(state.messageText, isEmpty);
    },
  );

  test(
    'cancelling an edit restores the draft in the same state change',
    () async {
      final (container, _, _) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier)
        ..updateMessageText('typed draft')
        ..startEdit(_msg(id: 'm-edit', authorId: 'me', content: 'Test'));
      await _flushAsync();

      final List<ChatViewState> transitions = <ChatViewState>[];
      final subscription = container.listen<ChatViewState>(
        chatViewModelProvider,
        (_, ChatViewState next) => transitions.add(next),
      );
      addTearDown(subscription.close);

      notifier.cancelEdit();
      await _flushAsync();

      final List<String> textsAfterEdit = <String>[
        for (final ChatViewState state in transitions)
          if (state.editingMessage == null) state.messageText,
      ];
      expect(textsAfterEdit, <String>['typed draft']);
    },
  );

  test(
    'the gateway echo of a saved edit does not blank the restored draft',
    () async {
      final (container, adapter, _) = await setUpChannel();
      final String editedId = _snowflakeForUtc(DateTime.utc(2026, 6, 16, 11));
      final notifier = container.read(chatViewModelProvider.notifier)
        ..updateMessageText('typed draft')
        ..startEdit(_msg(id: editedId, authorId: 'me', content: 'Test'));
      await _flushAsync();

      final List<ChatViewState> transitions = <ChatViewState>[];
      final subscription = container.listen<ChatViewState>(
        chatViewModelProvider,
        (_, ChatViewState next) => transitions.add(next),
      );
      addTearDown(subscription.close);

      final Future<void> save = notifier.saveEditedMessage(text: 'Test 2');
      container
          .read(messageRealtimeBusProvider)
          .emit(
            MessageUpdated(
              MessageUpdateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: editedId,
                    channelId: 'channel-1',
                    authorId: 'me',
                    content: 'Test 2',
                  ),
                ),
              ),
              mentionsCurrentUser: false,
            ),
          );
      await save;
      await _flushAsync();

      expect(adapter.lastEditContent, 'Test 2');
      final List<String> textsAfterEdit = <String>[
        for (final ChatViewState state in transitions)
          if (state.editingMessage == null) state.messageText,
      ];
      expect(textsAfterEdit, everyElement('typed draft'));
      expect(container.read(chatViewModelProvider).editingMessage, isNull);
      expect(container.read(chatViewModelProvider).messageText, 'typed draft');
    },
  );

  Future<(ProviderContainer, _SendAdapter, ChatViewModel, String)>
  setUpPendingEdit({
    int? editFailureStatus,
    String draft = 'typed draft',
  }) async {
    final String editedId = _snowflakeForUtc(DateTime.utc(2026, 6, 16, 11));
    final _SendAdapter adapter =
        _SendAdapter(
            serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 17, 12)),
            latestMessages: <Map<String, Object?>>[
              _messageJson(
                id: editedId,
                channelId: 'channel-1',
                authorId: 'me',
                content: 'Test',
              ),
            ],
          )
          ..holdEdit = true
          ..editFailureStatus = editFailureStatus;
    final (container, _, _) = await setUpChannel(adapter: adapter);
    addTearDown(adapter.releaseEdit);
    final ChatViewModel notifier = container.read(
      chatViewModelProvider.notifier,
    )..updateMessageText(draft);
    final Message original = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    notifier.startEdit(original);
    await _flushAsync();
    return (container, adapter, notifier, editedId);
  }

  test(
    'saving an edit leaves edit mode and shows the new text before the server answers',
    () async {
      final (container, adapter, notifier, editedId) = await setUpPendingEdit();

      final Future<void> save = notifier.saveEditedMessage(text: 'Test 2');
      await _flushAsync();

      final ChatViewState pending = container.read(chatViewModelProvider);
      expect(pending.editingMessage, isNull);
      expect(pending.messageText, 'typed draft');
      final Message optimistic = pending.messages.firstWhere(
        (Message m) => m.id == editedId,
      );
      expect(optimistic.content, 'Test 2');
      expect(optimistic.editedTimestamp, isNotNull);

      adapter.releaseEdit();
      await save;
      await _flushAsync();

      final ChatViewState settled = container.read(chatViewModelProvider);
      expect(adapter.lastEditContent, 'Test 2');
      expect(
        settled.messages.firstWhere((Message m) => m.id == editedId).content,
        'Test 2',
      );
      expect(settled.messageText, 'typed draft');
    },
  );

  test('a message sent while an edit is in flight still goes out', () async {
    final (container, adapter, notifier, _) = await setUpPendingEdit();

    final Future<void> save = notifier.sendMessage(text: 'Test 2');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).editingMessage, isNull);

    await notifier.sendMessage(text: 'next message');
    await _flushAsync();

    expect(adapter.messagePostCount, 1);
    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .where((Message m) => m.content == 'next message'),
      hasLength(1),
    );

    adapter.releaseEdit();
    await save;
    await _flushAsync();
    expect(adapter.lastEditContent, 'Test 2');
  });

  test('a failed edit restores the original message text and offers to '
      'edit again', () async {
    final (container, adapter, notifier, editedId) = await setUpPendingEdit(
      editFailureStatus: 500,
    );

    final Future<void> save = notifier.saveEditedMessage(text: 'Test 2');
    await _flushAsync();
    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.id == editedId)
          .content,
      'Test 2',
    );

    adapter.releaseEdit();
    await save;
    await _flushAsync();

    final FluxerLocalizations l10n = container.read(appLocalizationsProvider);
    final ChatViewState settled = container.read(chatViewModelProvider);
    final Message restored = settled.messages.firstWhere(
      (Message m) => m.id == editedId,
    );
    expect(restored.content, 'Test');
    expect(restored.editedTimestamp, isNull);
    expect(settled.editingMessage, isNull);
    expect(settled.messageText, 'typed draft');
    final FluxerToast toast = container.read(toastProvider).single.toast;
    expect(toast.message, l10n.chatEditFailed);
    expect(toast.variant, FluxerToastVariant.danger);
    expect(toast.action?.label, l10n.chatEditFailedEditAgain);

    toast.action!.onPressed();
    await _flushAsync();
    final ChatViewState reopened = container.read(chatViewModelProvider);
    expect(reopened.editingMessage?.id, editedId);
    expect(reopened.messageText, 'Test 2');

    notifier.cancelEdit();
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messageText, 'typed draft');
  });

  test('a failed edit reopens the editor with the edited text when the '
      'composer is empty', () async {
    final (container, adapter, notifier, editedId) = await setUpPendingEdit(
      editFailureStatus: 500,
      draft: '',
    );

    final Future<void> save = notifier.saveEditedMessage(text: 'Test 2');
    await _flushAsync();
    expect(container.read(chatViewModelProvider).editingMessage, isNull);

    adapter.releaseEdit();
    await save;
    await _flushAsync();

    final ChatViewState settled = container.read(chatViewModelProvider);
    expect(
      settled.messages.firstWhere((Message m) => m.id == editedId).content,
      'Test',
    );
    expect(settled.editingMessage?.id, editedId);
    expect(settled.messageText, 'Test 2');
    final FluxerToast toast = container.read(toastProvider).single.toast;
    expect(
      toast.message,
      container.read(appLocalizationsProvider).chatEditFailed,
    );
    expect(toast.action, isNull);
  });

  test(
    'a failed edit after leaving the channel offers to copy the text',
    () async {
      final (container, adapter, notifier, _) = await setUpPendingEdit(
        editFailureStatus: 500,
        draft: '',
      );
      await container
          .read(fluxerDatabaseProvider)
          .channelDao
          .upsertChannel(
            ChannelsCompanion.insert(id: 'channel-2', guildId: '', name: 'dm2'),
          );

      final Future<void> save = notifier.saveEditedMessage(text: 'Test 2');
      await _flushAsync();
      await notifier.switchChannel('channel-2');
      await _flushAsync();

      adapter.releaseEdit();
      await save;
      await _flushAsync();

      final FluxerLocalizations l10n = container.read(appLocalizationsProvider);
      expect(container.read(chatViewModelProvider).editingMessage, isNull);
      final FluxerToast toast = container.read(toastProvider).single.toast;
      expect(toast.message, l10n.chatEditFailed);
      expect(toast.action?.label, l10n.chatMessageCopyText);
    },
  );

  test('saving again while the draft reloads sends one edit', () async {
    final (container, adapter, notifier, _) = await setUpPendingEdit();

    final Future<void> first = notifier.saveEditedMessage(text: 'Test 2');
    final Future<void> second = notifier.saveEditedMessage(text: 'Test 2');
    await _flushAsync();

    adapter.releaseEdit();
    await Future.wait(<Future<void>>[first, second]);
    await _flushAsync();

    expect(adapter.editRequestCount, 1);
    expect(container.read(chatViewModelProvider).editingMessage, isNull);
  });

  test(
    'starting another edit while a cancel restores the draft keeps it',
    () async {
      final (container, _, _) = await setUpChannel();
      final notifier = container.read(chatViewModelProvider.notifier)
        ..updateMessageText('typed draft')
        ..startEdit(_msg(id: 'm-first', authorId: 'me', content: 'first'));
      await _flushAsync();

      notifier
        ..cancelEdit()
        ..startEdit(_msg(id: 'm-second', authorId: 'me', content: 'second'));
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.editingMessage?.id, 'm-second');
      expect(state.messageText, 'second');
    },
  );

  test(
    'switching channels mid-edit abandons the edit and keeps the draft',
    () async {
      final (container, _, _) = await setUpChannel();
      final db = container.read(fluxerDatabaseProvider);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(id: 'channel-2', guildId: '', name: 'dm2'),
      );
      final notifier = container.read(chatViewModelProvider.notifier)
        ..updateMessageText('typed draft')
        ..startEdit(_msg(id: 'm-edit', authorId: 'me', content: 'old content'));
      await _flushAsync();

      await notifier.switchChannel('channel-2');
      await _flushAsync();
      expect(container.read(chatViewModelProvider).messageText, isEmpty);

      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.editingMessage, isNull);
      expect(state.messageText, 'typed draft');
    },
  );

  test(
    'returning before the outgoing draft write lands keeps the draft',
    () async {
      final _WriteBehindDraftDatabase db = _WriteBehindDraftDatabase();
      addTearDown(db.close);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(id: 'channel-1', guildId: '', name: 'dm'),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      final container = _container(
        db,
        _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
        ),
      );
      addTearDown(container.dispose);
      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      notifier.updateMessageText('a long pasted draft');

      db.drafts.holdWrites = true;
      await notifier.switchChannel('channel-2');
      await _flushAsync();
      final Future<void> returned = notifier.switchChannel('channel-1');
      await _flushAsync();
      db.drafts.releaseWrites();
      await returned;
      await _flushAsync();

      expect(
        container.read(chatViewModelProvider).messageText,
        'a long pasted draft',
      );
    },
  );

  test(
    'reply mention toggle survives leaving and revisiting the channel',
    () async {
      final db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
        ),
      );
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-2',
          guildId: 'guild-1',
          name: 'offtopic',
        ),
      );
      final Message replyTo = _msg(
        id: 'm-reply',
        authorId: 'other',
        content: 'hi',
      );
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: replyTo.id,
          channelId: replyTo.channelId,
          authorId: replyTo.authorId,
          content: replyTo.content,
          timestamp: replyTo.timestamp,
        ),
      );
      final container = _container(
        db,
        _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
        ),
      );
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      notifier.startReply(replyTo);
      await _flushAsync();
      expect(container.read(chatViewModelProvider).replyMentioning, isTrue);

      notifier.setReplyMentioning(mentioning: false);
      await _flushAsync();
      expect(container.read(chatViewModelProvider).replyMentioning, isFalse);

      await notifier.switchChannel('channel-2');
      await _flushAsync();

      await notifier.switchChannel('channel-1');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.replyingTo?.id, 'm-reply');
      expect(state.replyMentioning, isFalse);
    },
  );

  test(
    'retrying a failed send resends flags, reply ping choice and tts',
    () async {
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
        failureCode: 'UNKNOWN_CHANNEL',
      );
      final (container, _, _) = await setUpChannel(adapter: adapter);
      final notifier = container.read(chatViewModelProvider.notifier)
        ..startReply(_msg(id: 'm-reply', authorId: 'other', content: 'hi'))
        ..setReplyMentioning(mentioning: false);
      await _flushAsync();

      await notifier.sendMessage(text: '@silent hello', tts: true);
      await _flushAsync();

      final Message failed = container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.hasFailed);
      final Map<String, dynamic> original = adapter.lastBody!;
      adapter
        ..failureCode = null
        ..lastBody = null;

      await notifier.retryMessageSend(failed.id);
      await _flushAsync();

      final Map<String, dynamic> retried = adapter.lastBody!;
      expect(retried['content'], 'hello');
      expect(retried['flags'], 4096);
      expect(retried['tts'], isTrue);
      expect(retried['message_reference'], <String, dynamic>{
        'message_id': 'm-reply',
      });
      expect(retried['allowed_mentions'], <String, dynamic>{
        'replied_user': false,
      });
      expect(retried, original);
    },
  );

  test('retrying a failed favorite meme send resends the meme id', () async {
    final _SendAdapter adapter = _SendAdapter(
      serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
      failureCode: 'UNKNOWN_CHANNEL',
    );
    final (container, _, _) = await setUpChannel(adapter: adapter);
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendFavoriteMemeMessage(_favoriteMeme('meme-1'));
    await _flushAsync();

    final Message failed = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.hasFailed);
    expect(adapter.lastBody?['favorite_meme_id'], 'meme-1');
    adapter
      ..failureCode = null
      ..lastBody = null;

    await notifier.retryMessageSend(failed.id);
    await _flushAsync();

    expect(adapter.lastBody?['favorite_meme_id'], 'meme-1');
  });

  test(
    'a retried send moves below messages that arrived after the failure',
    () async {
      final DateTime now = DateTime.now().toUtc();
      final String laterId = _snowflakeForUtc(
        now.add(const Duration(minutes: 1)),
      );
      final String retriedId = _snowflakeForUtc(
        now.add(const Duration(minutes: 2)),
      );
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: retriedId,
        failureCode: 'UNKNOWN_CHANNEL',
      );
      final (container, _, _) = await setUpChannel(adapter: adapter);
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline send');
      await _flushAsync();

      final Message failed = container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.hasFailed);
      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: laterId,
                    channelId: 'channel-1',
                    authorId: 'other',
                    content: 'later',
                  ),
                ),
              ),
            ),
          );
      await _flushAsync();
      adapter.failureCode = null;

      await notifier.retryMessageSend(failed.id);
      await _flushAsync();

      final List<Message> messages = container
          .read(chatViewModelProvider)
          .messages;
      expect(
        messages
            .where((Message m) => !m.isClientSystemMessage)
            .map((Message m) => m.id)
            .toList(),
        <String>[laterId, retriedId],
      );
      expect(messages.last.deliveryState, MessageDeliveryState.sent);
    },
  );

  test(
    'send failure with DM restriction adds Fluxerbot system message',
    () async {
      final FluxerLocalizations l10n = lookupFluxerLocalizations(
        const ui.Locale('fr'),
      );
      final (container, _, _) = await setUpChannel(
        adapter: _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
          failureCode: apiErrorCodeCannotSendMessagesToUser,
        ),
        overrides: <Override>[appLocalizationsProvider.overrideWithValue(l10n)],
      );
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'test');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.errorMessage, isNull);
      expect(state.messages, hasLength(2));
      expect(state.messages.first.hasFailed, isTrue);
      expect(state.messages.first.content, 'test');
      expect(state.messages.first.sendError, l10n.chatMessageFailedToSend);
      expect(state.messages.last.isClientSystemMessage, isTrue);
      expect(state.messages.last.authorId, fluxerBotUserId);
      expect(
        state.messages.last.content,
        clientSystemMessageForSendError(
          apiErrorCode: apiErrorCodeCannotSendMessagesToUser,
          l10n: l10n,
          selfHosted: false,
        ),
      );
    },
  );

  test(
    'send failure under the new conversation limit shows the server message',
    () async {
      const String serverMessage =
          "You can't start new conversations right now. Please try again later.";
      final (container, _, _) = await setUpChannel(
        adapter: _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
          failureCode: 'NEW_CONVERSATIONS_LIMITED',
          failureStatus: 403,
          failureMessage: serverMessage,
        ),
      );
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'hi there');
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.errorMessage, isNull);
      expect(state.messages, hasLength(2));
      expect(state.messages.first.hasFailed, isTrue);
      expect(state.messages.last.isClientSystemMessage, isTrue);
      expect(state.messages.last.content, serverMessage);
    },
  );

  group('send while the connection is down', () {
    Future<(ProviderContainer, _SendAdapter, String, _StateGatewayConnection)>
    setUpOffline() async {
      final _StateGatewayConnection connection = _StateGatewayConnection();
      addTearDown(connection.dispose);
      final (container, adapter, serverMessageId) = await setUpChannel(
        overrides: <Override>[
          gatewayHasAuthTokenProvider.overrideWithValue(true),
          gatewayConnectionProvider.overrideWithValue(connection),
        ],
      );
      return (container, adapter, serverMessageId, connection);
    }

    test('stays pending and is resent once the gateway is back', () async {
      final (container, adapter, serverMessageId, connection) =
          await setUpOffline();
      connection.current = GatewayState.reconnecting;
      adapter.connectionErrorSends = 1;
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline');
      await _flushAsync();

      ChatViewState state = container.read(chatViewModelProvider);
      expect(adapter.messagePostCount, 1);
      expect(state.errorMessage, isNull);
      expect(state.messages.single.isSending, isTrue);

      connection.current = GatewayState.connected;
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();

      state = container.read(chatViewModelProvider);
      expect(adapter.messagePostCount, 2);
      expect(adapter.lastBody?['content'], 'offline');
      expect(state.errorMessage, isNull);
      expect(state.messages.single.id, serverMessageId);
      expect(state.messages.single.hasFailed, isFalse);
    });

    test('a resend that loses the connection again keeps waiting', () async {
      final (container, adapter, serverMessageId, connection) =
          await setUpOffline();
      connection.current = GatewayState.reconnecting;
      adapter.connectionErrorSends = 2;
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline');
      await _flushAsync();
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();

      expect(adapter.messagePostCount, 2);
      expect(
        container.read(chatViewModelProvider).messages.single.isSending,
        isTrue,
      );

      connection.current = GatewayState.connected;
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();

      expect(adapter.messagePostCount, 3);
      expect(
        container.read(chatViewModelProvider).messages.single.id,
        serverMessageId,
      );
    });

    test('fails when the gateway is still connected', () async {
      final (container, adapter, _, connection) = await setUpOffline();
      connection.current = GatewayState.connected;
      adapter.connectionErrorSends = 1;
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline');
      await _flushAsync();
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();

      expect(adapter.messagePostCount, 1);
      expect(
        container.read(chatViewModelProvider).messages.single.hasFailed,
        isTrue,
      );
    });

    test('a send parked in another channel is resent on return', () async {
      final (container, adapter, serverMessageId, connection) =
          await setUpOffline();
      final db = container.read(fluxerDatabaseProvider);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(id: 'channel-2', guildId: '', name: 'dm2'),
      );
      connection.current = GatewayState.reconnecting;
      adapter.connectionErrorSends = 1;
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline');
      await _flushAsync();
      await notifier.switchChannel('channel-2');
      await _flushAsync();
      connection.current = GatewayState.connected;
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();

      expect(adapter.messagePostCount, 1);
      expect(container.read(chatViewModelProvider).messages, isEmpty);

      await notifier.switchChannel('channel-1');
      await _flushAsync();

      expect(adapter.messagePostCount, 2);
      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.messages.single.id, serverMessageId);
      expect(state.messages.single.isSending, isFalse);
    });

    test('a resend delivered after leaving stays in its channel', () async {
      final (container, adapter, _, connection) = await setUpOffline();
      final db = container.read(fluxerDatabaseProvider);
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(id: 'channel-2', guildId: '', name: 'dm2'),
      );
      connection.current = GatewayState.reconnecting;
      adapter.connectionErrorSends = 1;
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline');
      await _flushAsync();
      adapter.holdSend = true;
      connection.current = GatewayState.connected;
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();
      await notifier.switchChannel('channel-2');
      await _flushAsync();
      adapter.releaseSend();
      await _flushAsync();

      expect(adapter.messagePostCount, 2);
      final ChatViewState state = container.read(chatViewModelProvider);
      expect(state.channelId, 'channel-2');
      expect(state.messages, isEmpty);
    });

    test('a cancelled send is not resent after reconnecting', () async {
      final (container, adapter, _, connection) = await setUpOffline();
      connection.current = GatewayState.reconnecting;
      adapter.connectionErrorSends = 1;
      final notifier = container.read(chatViewModelProvider.notifier);

      await notifier.sendMessage(text: 'offline');
      await _flushAsync();
      notifier.cancelSendingMessage(
        container.read(chatViewModelProvider).messages.single.id,
      );
      connection.current = GatewayState.connected;
      container.read(gatewaySessionRecoveryProvider.notifier).bump();
      await _flushAsync();

      expect(adapter.messagePostCount, 1);
      expect(container.read(chatViewModelProvider).messages, isEmpty);
    });
  });

  test('a short send rate limit is retried automatically', () async {
    final (container, adapter, serverMessageId) = await setUpChannel();
    adapter.rateLimitedSends = 1;
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'burst');
    await _flushAsync();
    await Future<void>.delayed(const Duration(milliseconds: 150));
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(adapter.messagePostCount, 2);
    expect(state.errorMessage, isNull);
    expect(state.messages.single.id, serverMessageId);
    expect(state.messages.single.hasFailed, isFalse);
  });

  test('a send rate limit fails after two automatic retries', () async {
    final (container, adapter, _) = await setUpChannel();
    adapter.rateLimitedSends = 3;
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'burst');
    await _flushAsync();
    await Future<void>.delayed(const Duration(milliseconds: 300));
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(adapter.messagePostCount, 3);
    expect(state.messages.single.hasFailed, isTrue);
  });

  test('a long send rate limit is not retried automatically', () async {
    final (container, adapter, _) = await setUpChannel();
    adapter
      ..rateLimitedSends = 1
      ..rateLimitRetryAfterSeconds = 60;
    final notifier = container.read(chatViewModelProvider.notifier);

    await notifier.sendMessage(text: 'burst');
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(adapter.messagePostCount, 1);
    expect(state.messages.single.hasFailed, isTrue);
  });

  test(
    'an attachment send cancelled during a rate limit wait is not resent',
    () async {
      final _SendAdapter adapter =
          _SendAdapter(
              serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
            )
            ..rateLimitedSends = 1
            ..rateLimitRetryAfterSeconds = 0.2;
      final (container, _, _) = await setUpChannel(
        adapter: adapter,
        overrides: <Override>[
          maxAttachmentFileBytesProvider.overrideWithValue(25 * 1024 * 1024),
          attachmentUploadClientProvider.overrideWithValue(
            _ImmediateUploadClient(apiDio: Dio(), uploadDio: Dio()),
          ),
        ],
      );
      final notifier = container.read(chatViewModelProvider.notifier);
      final validation = await container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(
              XFile.fromData(Uint8List.fromList(<int>[1, 2, 3]), name: 'a.png'),
            ),
          ]);
      expect(validation.isValid, isTrue);

      unawaited(notifier.sendMessage(text: 'pic'));
      await _flushAsync();
      expect(adapter.messagePostCount, 1);
      final Message optimistic = container
          .read(chatViewModelProvider)
          .messages
          .lastWhere(
            (Message m) => m.deliveryState == MessageDeliveryState.sending,
          );

      notifier.cancelSendingMessage(optimistic.id);
      await Future<void>.delayed(const Duration(milliseconds: 400));
      await _flushAsync();

      expect(adapter.messagePostCount, 1);
      expect(
        container
            .read(chatViewModelProvider)
            .messages
            .any((Message m) => m.id == optimistic.id),
        isFalse,
      );
    },
  );

  test('no-op edit warning uses app locale', () async {
    final FluxerLocalizations l10n = lookupFluxerLocalizations(
      const ui.Locale('fr'),
    );
    final (container, _, _) = await setUpChannel(
      overrides: <Override>[appLocalizationsProvider.overrideWithValue(l10n)],
    );
    final ChatViewModel notifier = container.read(
      chatViewModelProvider.notifier,
    );
    await (notifier
          ..startEdit(_msg(id: 'message-1', authorId: 'me', content: 'same')))
        .saveEditedMessage(text: 'same');

    expect(
      container.read(toastProvider).single.toast.message,
      l10n.chatEditNoChanges,
    );
  });

  test('jump to latest preserves an optimistic sending message', () async {
    final (container, adapter, notifier) = await setUpDetachedChannel(
      holdSend: true,
    );

    await notifier.sendMessage(text: 'pending');
    final Message optimistic = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere(
          (Message message) =>
              message.deliveryState == MessageDeliveryState.sending,
        );

    final bool started = await notifier.jumpToLatestMessages();

    final ChatViewState jumped = container.read(chatViewModelProvider);
    expect(started, isTrue);
    expect(jumped.hasMoreNewerMessages, isFalse);
    expect(
      jumped.messages.any(
        (Message message) =>
            message.id == optimistic.id &&
            message.deliveryState == MessageDeliveryState.sending,
      ),
      isTrue,
    );

    final String latestServerId =
        adapter.latestMessages.single['id']! as String;
    container
        .read(chatReadViewportProvider.notifier)
        .setViewportActive(channelId: 'channel-1', isActive: true);
    await _flushAsync();
    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: 'channel-1',
          nearLoadedTail: true,
          distanceFromBottom: 0,
          sampledTailId: newestServerBackedMessageId(
            container.read(chatViewModelProvider).messages,
          ),
        );
    await _flushAsync();
    expect(adapter.ackedMessageIds, [latestServerId]);
    expect(adapter.ackedMessageIds, isNot(contains(optimistic.id)));

    adapter.releaseSend();
    await _flushAsync();
  });

  test(
    'jump to latest collapses an optimistic send matched by nonce',
    () async {
      final (container, adapter, notifier) = await setUpDetachedChannel(
        holdSend: true,
      );
      await notifier.sendMessage(text: 'pending');
      await _flushAsync();
      final Message optimistic = container
          .read(chatViewModelProvider)
          .messages
          .firstWhere(
            (Message message) =>
                message.deliveryState == MessageDeliveryState.sending,
          );
      adapter.latestMessages.add(
        _messageJson(
          id: adapter.serverMessageId,
          channelId: 'channel-1',
          authorId: 'me',
          content: 'pending',
          nonce: optimistic.clientNonce,
        ),
      );

      await notifier.jumpToLatestMessages();
      await _flushAsync();

      final List<Message> pending = container
          .read(chatViewModelProvider)
          .messages
          .where((Message message) => message.content == 'pending')
          .toList();
      expect(pending, hasLength(1));
      expect(pending.single.id, adapter.serverMessageId);
      expect(pending.single.deliveryState, MessageDeliveryState.sent);

      adapter.releaseSend();
      await _flushAsync();
      expect(
        container
            .read(chatViewModelProvider)
            .messages
            .where((Message message) => message.content == 'pending'),
        hasLength(1),
      );
    },
  );

  test(
    'gateway create after a page insert keeps a single delivered row',
    () async {
      final (container, adapter, notifier) = await setUpDetachedChannel(
        holdSend: true,
      );
      await notifier.sendMessage(text: 'pending');
      await _flushAsync();
      final Message optimistic = container
          .read(chatViewModelProvider)
          .messages
          .firstWhere(
            (Message message) =>
                message.deliveryState == MessageDeliveryState.sending,
          );
      adapter.latestMessages.add(
        _messageJson(
          id: adapter.serverMessageId,
          channelId: 'channel-1',
          authorId: 'me',
          content: 'pending',
        ),
      );

      await notifier.jumpToLatestMessages();
      await _flushAsync();

      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: adapter.serverMessageId,
                    channelId: 'channel-1',
                    authorId: 'me',
                    content: 'pending',
                    nonce: optimistic.clientNonce,
                  ),
                ),
              ),
            ),
          );
      await _flushAsync();
      await _flushAsync();

      final List<Message> pending = container
          .read(chatViewModelProvider)
          .messages
          .where((Message message) => message.content == 'pending')
          .toList();
      expect(pending.map((Message message) => message.id).toSet(), {
        adapter.serverMessageId,
      });
      expect(pending, hasLength(1));

      adapter.releaseSend();
      await _flushAsync();
    },
  );

  test(
    'http failure after gateway replace does not mark the send failed',
    () async {
      final String serverMessageId = _snowflakeForUtc(
        DateTime.utc(2026, 6, 16, 12),
      );
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: serverMessageId,
      )..holdSend = true;
      final (container, _, _) = await setUpChannel(adapter: adapter);
      final notifier = container.read(chatViewModelProvider.notifier);
      unawaited(notifier.sendMessage(text: 'hi'));
      await _flushAsync();
      final Message optimistic = container
          .read(chatViewModelProvider)
          .messages
          .lastWhere(
            (Message message) =>
                message.deliveryState == MessageDeliveryState.sending,
          );

      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: serverMessageId,
                    channelId: 'channel-1',
                    authorId: 'me',
                    content: 'hi',
                    nonce: optimistic.clientNonce,
                  ),
                ),
              ),
            ),
          );
      await _flushAsync();
      await _flushAsync();
      expect(
        container.read(chatViewModelProvider).messages.last.id,
        serverMessageId,
      );

      adapter
        ..failureCode = '0'
        ..releaseSend();
      await _flushAsync();

      final ChatViewState state = container.read(chatViewModelProvider);
      expect(
        state.messages.where((Message m) => m.content == 'hi'),
        hasLength(1),
      );
      expect(state.messages.last.id, serverMessageId);
      expect(state.messages.last.deliveryState, MessageDeliveryState.sent);
      expect(state.messages.last.hasFailed, isFalse);
    },
  );

  test(
    'recovery ignores an optimistic tail when checking detached overlap',
    () async {
      final (container, adapter, notifier) = await setUpDetachedChannel(
        holdSend: true,
      );
      await notifier.sendMessage(text: 'pending');
      final List<String> beforeIds = container
          .read(chatViewModelProvider)
          .messages
          .map((Message message) => message.id)
          .toList();
      final String latestServerId =
          adapter.latestMessages.single['id']! as String;

      await notifier.refreshAfterSessionRecovery();
      await _flushAsync();

      final ChatViewState after = container.read(chatViewModelProvider);
      expect(after.messages.map((Message message) => message.id), beforeIds);
      expect(after.messages.any(isLocalOnlyMessage), isTrue);
      expect(
        after.messages.map((Message message) => message.id),
        isNot(contains(latestServerId)),
      );
      expect(after.hasMoreNewerMessages, isTrue);

      adapter.releaseSend();
      await _flushAsync();
    },
  );

  test('jump to latest returns false while a jump is in flight', () async {
    final (container, adapter, notifier) = await setUpDetachedChannel(
      holdLatestFetch: true,
    );

    final Future<bool> firstJump = notifier.jumpToLatestMessages();
    expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

    expect(await notifier.jumpToLatestMessages(), isFalse);

    adapter.releaseLatestFetch();
    expect(await firstJump, isTrue);
    expect(container.read(chatViewModelProvider).isSyncingMessages, isFalse);
    await _flushAsync();
  });

  test(
    'slowmode cooldown is not shortened by a device clock ahead of the server',
    () async {
      final DateTime acceptedAt = DateTime.now().toUtc().subtract(
        const Duration(seconds: 30),
      );
      final (container, _, _) = await setUpChannel(
        adapter: _SendAdapter(serverMessageId: _snowflakeForUtc(acceptedAt)),
        overrides: <Override>[
          isSlowmodeImmuneProvider(
            'channel-1',
          ).overrideWith((ref) => Future<bool>.value(false)),
        ],
      );

      await container
          .read(chatViewModelProvider.notifier)
          .sendMessage(text: 'hello');
      await _flushAsync();

      final Duration remaining = container
          .read(slowmodeTrackerProvider.notifier)
          .remainingFor('channel-1', 10);
      expect(remaining, greaterThan(const Duration(seconds: 9)));
      expect(remaining, lessThanOrEqualTo(const Duration(seconds: 10)));
    },
  );

  test(
    'slowmode arms when the gateway reconciles an attachment send first',
    () async {
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: _snowflakeForUtc(DateTime.now().toUtc()),
      )..holdSend = true;
      final (container, _, serverMessageId) = await setUpChannel(
        adapter: adapter,
        overrides: <Override>[
          maxAttachmentFileBytesProvider.overrideWithValue(25 * 1024 * 1024),
          attachmentUploadClientProvider.overrideWithValue(
            _ImmediateUploadClient(apiDio: Dio(), uploadDio: Dio()),
          ),
          isSlowmodeImmuneProvider(
            'channel-1',
          ).overrideWith((ref) => Future<bool>.value(false)),
        ],
      );
      final notifier = container.read(chatViewModelProvider.notifier);
      final validation = await container
          .read(cloudUploadControllerProvider('channel-1').notifier)
          .addFiles(<ComposerUploadFile>[
            composerUploadFile(
              XFile.fromData(Uint8List.fromList(<int>[1, 2, 3]), name: 'a.png'),
            ),
          ]);
      expect(validation.isValid, isTrue);

      unawaited(notifier.sendMessage(text: 'pic'));
      await pumpEventQueue();
      final Message optimistic = container
          .read(chatViewModelProvider)
          .messages
          .lastWhere(
            (Message m) => m.deliveryState == MessageDeliveryState.sending,
          );

      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: serverMessageId,
                    channelId: 'channel-1',
                    authorId: 'me',
                    content: 'pic',
                    nonce: optimistic.clientNonce,
                  ),
                ),
              ),
            ),
          );
      await _flushAsync();
      await _flushAsync();
      expect(
        container
            .read(chatViewModelProvider)
            .messages
            .any((Message m) => m.id == optimistic.id),
        isFalse,
      );

      adapter.releaseSend();
      await _flushAsync();

      expect(
        container
            .read(slowmodeTrackerProvider.notifier)
            .remainingFor('channel-1', 30),
        greaterThan(Duration.zero),
      );
    },
  );

  group('forward', () {
    Future<(ProviderContainer, _SendAdapter, ChatViewModel)> setUpForward({
      _SendAdapter? adapter,
    }) async {
      final db = openTestDatabase();
      for (final String id in <String>['channel-1', 'channel-2']) {
        await db.channelDao.upsertChannel(
          ChannelsCompanion.insert(id: id, guildId: '', name: id),
        );
      }
      await db.messageDao.upsertMessage(
        MessagesCompanion.insert(
          id: 'src-1',
          channelId: 'channel-1',
          authorId: 'other',
          content: 'original',
          timestamp: DateTime.utc(2026, 6, 15, 12),
        ),
      );
      final _SendAdapter sendAdapter =
          adapter ??
          _SendAdapter(
            serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
          );
      final container = _container(db, sendAdapter);
      addTearDown(() {
        sendAdapter.releaseSend();
        container.dispose();
      });
      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel('channel-1');
      await _flushAsync();
      return (container, sendAdapter, notifier);
    }

    List<Message> localSends(ProviderContainer container) => container
        .read(chatViewModelProvider)
        .messages
        .where(isLocalSendPlaceholder)
        .toList();

    test(
      'shows the forward and its comment while they are still sending',
      () async {
        final (container, _, notifier) = await setUpForward(
          adapter: _SendAdapter(
            serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
          )..holdSend = true,
        );

        await notifier
            .forwardMessage(
              sourceChannelId: 'channel-1',
              sourceMessageId: 'src-1',
              destinationChannelIds: <String>['channel-1'],
              comment: 'look at this',
            )
            .timeout(const Duration(seconds: 1));
        await _flushAsync();

        final List<Message> sending = localSends(container);
        expect(sending, hasLength(2));
        expect(sending.first.isSending, isTrue);
        expect(sending.first.messageReference?.isForward, isTrue);
        expect(sending.first.messageReference?.messageId, 'src-1');
        expect(sending.first.messageSnapshots.single.content, 'original');
        expect(sending.last.isSending, isTrue);
        expect(sending.last.content, 'look at this');
      },
    );

    test('shows a forward still sending when its destination opens', () async {
      final (container, _, notifier) = await setUpForward(
        adapter: _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
        )..holdSend = true,
      );

      await notifier.forwardMessage(
        sourceChannelId: 'channel-1',
        sourceMessageId: 'src-1',
        destinationChannelIds: <String>['channel-2'],
      );
      await notifier.switchChannel('channel-2');
      await _flushAsync();

      final Message forward = localSends(container).single;
      expect(forward.channelId, 'channel-2');
      expect(forward.isSending, isTrue);
      expect(forward.messageReference?.isForward, isTrue);
    });

    test(
      'keeps a forward that failed elsewhere failed when its destination opens',
      () async {
        final (container, _, notifier) = await setUpForward(
          adapter: _SendAdapter(
            serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
            failureCode: 'UNKNOWN_CHANNEL',
          ),
        );

        await notifier.forwardMessage(
          sourceChannelId: 'channel-1',
          sourceMessageId: 'src-1',
          destinationChannelIds: <String>['channel-2'],
        );
        await _flushAsync();

        expect(
          container.read(toastProvider).single.toast.message,
          container.read(appLocalizationsProvider).chatMessageFailedToSend,
        );

        await notifier.switchChannel('channel-2');
        await _flushAsync();

        final Message forward = localSends(container).single;
        expect(forward.channelId, 'channel-2');
        expect(forward.hasFailed, isTrue);
        expect(forward.messageReference?.isForward, isTrue);
      },
    );

    test('a cancelled forward stays gone when its send later fails', () async {
      final (container, adapter, notifier) = await setUpForward(
        adapter: _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
          failureCode: 'UNKNOWN_CHANNEL',
        )..holdSend = true,
      );

      await notifier.forwardMessage(
        sourceChannelId: 'channel-1',
        sourceMessageId: 'src-1',
        destinationChannelIds: <String>['channel-1'],
      );
      await _flushAsync();
      notifier.cancelSendingMessage(localSends(container).single.id);
      adapter.releaseSend();
      await _flushAsync();
      await notifier.switchChannel('channel-2');
      await _flushAsync();
      await notifier.switchChannel('channel-1');
      await _flushAsync();

      expect(localSends(container), isEmpty);
    });

    test('a cancelled comment is not sent after its forward lands', () async {
      final (container, adapter, notifier) = await setUpForward(
        adapter: _SendAdapter(
          serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
        )..holdSend = true,
      );

      await notifier.forwardMessage(
        sourceChannelId: 'channel-1',
        sourceMessageId: 'src-1',
        destinationChannelIds: <String>['channel-1'],
        comment: 'look at this',
      );
      await _flushAsync();
      notifier.cancelSendingMessage(localSends(container).last.id);
      adapter.releaseSend();
      await _flushAsync();

      expect(adapter.messagePostCount, 1);
    });

    test(
      'a failed forward fails its comment and retries with the forward reference',
      () async {
        final (container, adapter, notifier) = await setUpForward(
          adapter: _SendAdapter(
            serverMessageId: _snowflakeForUtc(DateTime.utc(2026, 6, 16, 12)),
            failureCode: 'UNKNOWN_CHANNEL',
          ),
        );

        await notifier.forwardMessage(
          sourceChannelId: 'channel-1',
          sourceMessageId: 'src-1',
          sourceGuildId: 'guild-1',
          destinationChannelIds: <String>['channel-1'],
          attachmentIds: <String>['att-1'],
          comment: 'look at this',
        );
        await _flushAsync();

        final List<Message> failed = localSends(container);
        expect(failed, hasLength(2));
        expect(failed.every((Message m) => m.hasFailed), isTrue);
        expect(adapter.messagePostCount, 1);

        adapter
          ..failureCode = null
          ..lastBody = null;
        await notifier.retryMessageSend(failed.first.id);
        await _flushAsync();

        expect(adapter.lastBody?['nonce'], failed.first.clientNonce);
        expect(adapter.lastBody?['message_reference'], <String, dynamic>{
          'type': 1,
          'channel_id': 'channel-1',
          'message_id': 'src-1',
          'guild_id': 'guild-1',
          'attachment_ids': <String>['att-1'],
        });
      },
    );
  });
}

ProviderContainer _container(
  FluxerDatabase db,
  _SendAdapter adapter, {
  List<Override> overrides = const <Override>[],
}) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      appUiForegroundProvider.overrideWithValue(true),
      fluxerDioProvider.overrideWithValue(dio),
      fluxerClientProvider.overrideWithValue(client),
      currentUserIdProvider.overrideWithValue('me'),
      ackBatcherProvider.overrideWith((ref) {
        final batcher = AckBatcher(client: client, batchDelay: Duration.zero);
        ref.onDispose(() {
          unawaited(batcher.dispose());
        });
        return batcher;
      }),
      guildMemberHydrationServiceProvider.overrideWithValue(
        NoopGuildMemberHydrationService(database: db),
      ),
      ...overrides,
    ],
  );
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
  SchedulerBinding.instance.handleBeginFrame(Duration.zero);
  SchedulerBinding.instance.handleDrawFrame();
}

class _SendAdapter implements HttpClientAdapter {
  _SendAdapter({
    required this.serverMessageId,
    this.failureCode,
    this.failureStatus = 400,
    this.failureMessage = 'Cannot send message',
    this.aroundMessages = const <Map<String, Object?>>[],
    List<Map<String, Object?>>? latestMessages,
  }) : latestMessages = latestMessages ?? <Map<String, Object?>>[];

  final String serverMessageId;
  String? failureCode;
  int failureStatus;
  String failureMessage;
  int rateLimitedSends = 0;
  int connectionErrorSends = 0;
  double rateLimitRetryAfterSeconds = 0.05;
  final List<Map<String, Object?>> aroundMessages;
  final List<Map<String, Object?>> latestMessages;
  final List<String> ackedMessageIds = <String>[];
  String? lastSentNonce;
  Map<String, dynamic>? lastBody;
  int messagePostCount = 0;
  final List<String> reactionPuts = <String>[];
  String? lastEditContent;
  int editRequestCount = 0;
  bool holdSend = false;
  bool holdLatestFetch = false;
  bool holdEdit = false;
  int? editFailureStatus;
  Completer<void>? _sendCompleter;
  Completer<void>? _latestFetchCompleter;
  Completer<void>? _editCompleter;

  void releaseEdit() {
    holdEdit = false;
    final Completer<void>? completer = _editCompleter;
    _editCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseSend() {
    holdSend = false;
    final Completer<void>? completer = _sendCompleter;
    _sendCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseLatestFetch() {
    holdLatestFetch = false;
    final Completer<void>? completer = _latestFetchCompleter;
    _latestFetchCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final String path = options.uri.path;
    final bool isMessages = RegExp(
      r'/channels/([^/]+)/messages$',
    ).hasMatch(path);
    if (options.method == 'GET' && isMessages) {
      final bool isAround = options.uri.queryParameters.containsKey('around');
      if (!isAround && holdLatestFetch) {
        _latestFetchCompleter ??= Completer<void>();
        await _latestFetchCompleter!.future;
      }
      return _json(isAround ? aroundMessages : latestMessages);
    }
    if (options.method == 'POST' && isMessages) {
      messagePostCount++;
      if (holdSend) {
        _sendCompleter ??= Completer<void>();
        await _sendCompleter!.future;
      }
      final String? raw = await _readRequestBody(requestStream, options.data);
      final Map<String, dynamic> body = raw == null || raw.isEmpty
          ? <String, dynamic>{}
          : jsonDecode(raw) as Map<String, dynamic>;
      lastSentNonce = body['nonce'] as String?;
      lastBody = body;
      if (connectionErrorSends > 0) {
        connectionErrorSends--;
        throw DioException.connectionError(
          requestOptions: options,
          reason: 'Connection refused',
        );
      }
      if (rateLimitedSends > 0) {
        rateLimitedSends--;
        return ResponseBody.fromString(
          jsonEncode(<String, Object?>{
            'code': 'RATE_LIMITED',
            'message': 'You are being rate limited.',
            'global': false,
            'retry_after': rateLimitRetryAfterSeconds,
          }),
          429,
          headers: {
            Headers.contentTypeHeader: ['application/json'],
            'retry-after': ['${rateLimitRetryAfterSeconds.ceil()}'],
            'x-ratelimit-reset-after': ['$rateLimitRetryAfterSeconds'],
          },
        );
      }
      if (failureCode != null) {
        return ResponseBody.fromString(
          jsonEncode(<String, Object?>{
            'code': failureCode,
            'message': failureMessage,
          }),
          failureStatus,
          headers: {
            Headers.contentTypeHeader: ['application/json'],
          },
        );
      }
      return _json(
        _messageJson(
          id: serverMessageId,
          channelId: 'channel-1',
          authorId: 'me',
          content: body['content'] as String? ?? '',
          nonce: lastSentNonce,
        ),
      );
    }
    if (options.method == 'PUT' && path.contains('/reactions/')) {
      reactionPuts.add(Uri.decodeComponent(path));
      return ResponseBody.fromString('', 204);
    }
    if (options.method == 'POST' && path.endsWith('/read-states/ack')) {
      final String? raw = await _readRequestBody(requestStream, options.data);
      if (raw != null && raw.isNotEmpty) {
        final Map<String, dynamic> body =
            jsonDecode(raw) as Map<String, dynamic>;
        final List<dynamic> entries =
            body['read_states'] as List<dynamic>? ?? const <dynamic>[];
        for (final dynamic entry in entries) {
          ackedMessageIds.add(
            (entry as Map<String, dynamic>)['message_id']! as String,
          );
        }
      }
      return ResponseBody.fromString(
        '{"read_states":[],"read_state_proto":""}',
        200,
        statusMessage: 'OK',
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }
    if (options.method == 'POST' &&
        (path.endsWith('/ack') || path.endsWith('/read-states/ack-bulk'))) {
      final RegExpMatch? channelAck = RegExp(
        r'/channels/[^/]+/messages/([^/]+)/ack$',
      ).firstMatch(path);
      if (channelAck != null) {
        ackedMessageIds.add(channelAck.group(1)!);
      }
      return ResponseBody.fromString('', 204, statusMessage: 'No Content');
    }
    if (options.method == 'PATCH') {
      final RegExpMatch? editMatch = RegExp(
        r'/channels/[^/]+/messages/([^/]+)$',
      ).firstMatch(path);
      if (editMatch != null) {
        final String? raw = await _readRequestBody(requestStream, options.data);
        final RegExpMatch? contentMatch = raw == null
            ? null
            : RegExp(
                r'name="content"\r?\n\r?\n([\s\S]*?)\r?\n--',
              ).firstMatch(raw);
        lastEditContent = contentMatch?.group(1);
        editRequestCount++;
        if (holdEdit) {
          _editCompleter ??= Completer<void>();
          await _editCompleter!.future;
        }
        final int? failureStatus = editFailureStatus;
        if (failureStatus != null) {
          return ResponseBody.fromString(
            jsonEncode(<String, Object?>{
              'code': 'INTERNAL_SERVER_ERROR',
              'message': 'Internal server error',
            }),
            failureStatus,
            headers: {
              Headers.contentTypeHeader: ['application/json'],
            },
          );
        }
        return _json(
          _messageJson(
            id: editMatch.group(1)!,
            channelId: 'channel-1',
            authorId: 'me',
            content: lastEditContent ?? '',
          ),
        );
      }
    }
    return ResponseBody.fromString('Not found', 404);
  }

  ResponseBody _json(Object data) => ResponseBody.fromString(
    jsonEncode(data),
    200,
    headers: {
      Headers.contentTypeHeader: ['application/json'],
    },
  );

  @override
  void close({bool force = false}) {}
}

Future<String?> _readRequestBody(
  Stream<Uint8List>? requestStream,
  dynamic data,
) async {
  if (requestStream != null) {
    final chunks = await requestStream.toList();
    if (chunks.isEmpty) {
      return null;
    }
    final totalLength = chunks.fold<int>(0, (sum, c) => sum + c.length);
    final bytes = Uint8List(totalLength);
    var offset = 0;
    for (final chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return utf8.decode(bytes);
  }
  if (data is String) {
    return data;
  }
  if (data is Map<String, dynamic>) {
    return jsonEncode(data);
  }
  return null;
}

class _StateGatewayConnection extends GatewayConnection {
  _StateGatewayConnection() : super(token: 'test', dio: Dio());

  GatewayState current = GatewayState.disconnected;

  @override
  GatewayState get state => current;

  @override
  bool get isLikelyStale => false;
}

class _ImmediateUploadClient extends AttachmentUploadClient {
  _ImmediateUploadClient({required super.apiDio, required super.uploadDio});

  @override
  Future<AttachmentUploadPlan> requestAttachmentUploadPlan({
    required String channelId,
    required int attachmentId,
    required String filename,
    required int fileSize,
    required String contentType,
    CancelToken? cancelToken,
  }) async {
    return SingleAttachmentUploadPlan(
      uploadFilename: 'stored-$filename',
      fileSize: fileSize,
      contentType: contentType,
      uploadUrl: 'https://upload.test/file',
    );
  }

  @override
  Future<void> uploadAttachmentPlan(UploadAttachmentPlanParams params) async {
    params.onPlanReady?.call(
      uploadFilename: params.plan.uploadFilename,
      fileSize: params.plan.fileSize,
      contentType: params.plan.contentType,
    );
  }
}

class _WriteBehindDraftDatabase extends FluxerDatabase {
  _WriteBehindDraftDatabase() : super.forTesting(NativeDatabase.memory());

  late final _WriteBehindComposerDraftDao drafts = _WriteBehindComposerDraftDao(
    this,
  );

  @override
  ComposerDraftDao get composerDraftDao => drafts;
}

class _WriteBehindComposerDraftDao extends ComposerDraftDao {
  _WriteBehindComposerDraftDao(super.attachedDatabase);

  bool holdWrites = false;
  final List<Completer<void>> _heldWrites = <Completer<void>>[];

  void releaseWrites() {
    holdWrites = false;
    for (final Completer<void> held in _heldWrites) {
      held.complete();
    }
    _heldWrites.clear();
  }

  Future<void> _writeSlot() {
    if (!holdWrites) {
      return Future<void>.value();
    }
    final Completer<void> held = Completer<void>();
    _heldWrites.add(held);
    return held.future;
  }

  @override
  Future<void> upsertDraft({
    required String channelId,
    required String content,
    String? replyToMessageId,
    bool? replyMentioning,
  }) async {
    await _writeSlot();
    await super.upsertDraft(
      channelId: channelId,
      content: content,
      replyToMessageId: replyToMessageId,
      replyMentioning: replyMentioning,
    );
  }

  @override
  Future<void> deleteDraft(String channelId) async {
    await _writeSlot();
    await super.deleteDraft(channelId);
  }
}
