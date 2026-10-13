@Tags(['slow'])
library;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/daos/message_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_window.dart';
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_page_sync.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../helpers/noop_guild_member_hydration_service.dart';

const int _kMinuteMs = 60 * 1000;
const String _channelId = 'channel-1';
const String _otherChannelId = 'channel-2';

String _snowflakeForIndex(int index) {
  final int millis =
      DateTime.utc(2026).millisecondsSinceEpoch + index * _kMinuteMs;
  final int internal = (millis - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

const String _kAttachmentId = 'attachment-1';
const String _kAttachmentId2 = 'attachment-2';

Map<String, Object?> _messageJson({
  required String id,
  required String channelId,
  required String authorId,
  String? content,
  String? nonce,
  bool withAttachment = false,
  bool secondAttachment = false,
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
  'content': content ?? 'message $id',
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'nonce': nonce,
  if (withAttachment)
    'attachments': <Map<String, Object?>>[
      if (secondAttachment)
        <String, Object?>{
          'id': _kAttachmentId2,
          'filename': 'doc.pdf',
          'size': 2048,
          'flags': 0,
          'url': 'https://cdn.fluxer.app/doc.pdf',
          'proxy_url': 'https://cdn.fluxer.app/doc.pdf',
          'content_type': 'application/pdf',
          'description': null,
        },
      <String, Object?>{
        'id': _kAttachmentId,
        'filename': 'pic.png',
        'size': 1024,
        'flags': 0,
        'url': 'https://cdn.fluxer.app/pic.png',
        'proxy_url': 'https://cdn.fluxer.app/pic.png',
        'content_type': 'image/png',
        'description': null,
      },
    ],
};

List<Map<String, Object?>> _channelMessages(
  int count, {
  int? attachmentAt,
  bool twoAttachments = false,
}) => [
  for (var i = 0; i < count; i++)
    _messageJson(
      id: _snowflakeForIndex(i),
      channelId: _channelId,
      authorId: 'other',
      withAttachment: i == attachmentAt,
      secondAttachment: twoAttachments,
    ),
];

void _emitCreated(ProviderContainer container, {required String id}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(
        testMessageCreated(
          MessageCreateEvent(
            message: MessageResponseSchema.fromJson(
              _messageJson(id: id, channelId: _channelId, authorId: 'other'),
            ),
          ),
          snapshot: const MessagePersistSnapshot(
            mentionsCurrentUser: false,
            isDm: false,
            acknowledgedByGateway: true,
          ),
        ),
      );
}

void _emitReactions(ProviderContainer container, {required String id}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(MessageReactionsChanged(channelId: _channelId, messageId: id));
}

void _emitDeleted(ProviderContainer container, {required String id}) {
  container
      .read(messageRealtimeBusProvider)
      .emit(
        MessageDeleted(
          MessageDeleteEvent(channelId: _channelId, messageId: id),
        ),
      );
}

void _emitUpdated(
  ProviderContainer container, {
  required String id,
  required String content,
}) {
  final Map<String, Object?> json = _messageJson(
    id: id,
    channelId: _channelId,
    authorId: 'other',
  )..['content'] = content;
  container
      .read(messageRealtimeBusProvider)
      .emit(
        MessageUpdated(
          MessageUpdateEvent(message: MessageResponseSchema.fromJson(json)),
          mentionsCurrentUser: false,
        ),
      );
}

String _contentOf(ProviderContainer container, String id) => container
    .read(chatViewModelProvider)
    .messages
    .firstWhere((Message m) => m.id == id)
    .content;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MessageDaoGate gate;

  Future<_GatedDatabase> seedChannel({
    String guildId = 'guild-1',
    String? lastMessageId,
  }) async {
    gate = _MessageDaoGate();
    final _GatedDatabase database = _GatedDatabase(
      NativeDatabase.memory(),
      gate,
    );
    addTearDown(database.close);
    await database.channelDao.upsertChannel(
      db.ChannelsCompanion(
        id: const Value(_channelId),
        guildId: Value(guildId),
        name: const Value('general'),
        lastMessageId: Value(lastMessageId),
      ),
    );
    await database.channelDao.upsertChannel(
      db.ChannelsCompanion(
        id: const Value(_otherChannelId),
        guildId: Value(guildId),
        name: const Value('other'),
      ),
    );
    return database;
  }

  Future<void> detachWindow(ChatViewModel notifier, ProviderContainer c) async {
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    for (var i = 0; i < 8; i++) {
      if (c.read(chatViewModelProvider).messages.length > kMaxLoadedMessages) {
        break;
      }
      await notifier.loadMore();
      await _flushAsync();
    }
    final List<Message> loaded = c.read(chatViewModelProvider).messages;
    if (loaded.length <= kMaxLoadedMessages) {
      fail('window never exceeded the trim cap');
    }
    notifier.trimToSpan(
      firstId: loaded.first.id,
      lastId: loaded[kTrimmedMessageWindowSize - 1].id,
    );
    await _flushAsync();
    if (!c.read(chatViewModelProvider).hasMoreNewerMessages) {
      fail('window never detached from the live tail');
    }
  }

  test('m1: a swap cannot commit while a reducer is parked in the '
      'database', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String tailId = _snowflakeForIndex(399);
    gate.hold(tailId, content: 'reacted');

    final List<String> detached = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(detached, isNot(contains(tailId)));

    _emitReactions(container, id: tailId);
    await _flushAsync();
    expect(
      gate.outstanding,
      1,
      reason: 'the reducer must be parked inside the database read',
    );

    var jumpSettled = false;
    final Future<bool> jump = notifier.jumpToLatestMessages().whenComplete(() {
      jumpSettled = true;
    });
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      detached,
      reason:
          'the wholesale write must wait for the parked reducer, not race it',
    );
    expect(jumpSettled, isFalse, reason: 'the swap has not committed yet');

    gate.releaseAll();
    expect(await jump, isTrue);
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(state.messages.last.id, tailId, reason: 'the new window survives');
    expect(state.hasMoreNewerMessages, isFalse);
    expect(
      _contentOf(container, tailId),
      'reacted',
      reason: 'the parked event replays onto the window the swap installed',
    );
  });

  test('m3: an event parked before the arm survives into the post swap '
      'window', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String tailId = _snowflakeForIndex(399);
    gate.hold(tailId, content: 'reacted');

    _emitReactions(container, id: tailId);
    await _flushAsync();
    expect(gate.outstanding, 1);

    adapter.holdLatestFetch = true;
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    gate.releaseAll();
    await _flushAsync();

    adapter.releaseLatestFetch();
    expect(await jump, isTrue);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.last.id,
      tailId,
      reason: 'the swap still installs its window',
    );
    expect(
      _contentOf(container, tailId),
      'reacted',
      reason: 'an event that straddled the arm must not be dropped',
    );
  });

  test('m-order: a straddling event replays before events that arrived '
      'after the arm', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String tailId = _snowflakeForIndex(399);
    gate.hold(tailId, content: 'reacted');

    _emitReactions(container, id: tailId);
    await _flushAsync();
    expect(gate.outstanding, 1);

    adapter.holdLatestFetch = true;
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    _emitUpdated(container, id: tailId, content: 'edited');
    await _flushAsync();

    gate.releaseAll();
    await _flushAsync();
    adapter.releaseLatestFetch();
    expect(await jump, isTrue);
    await _flushAsync();

    expect(
      _contentOf(container, tailId),
      'edited',
      reason: 'the later event must be applied last, not first',
    );
  });

  test('m4: a coalesced create batch held by a swap lands in order on the '
      'new window', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String tailId = _snowflakeForIndex(399);
    gate.hold(tailId, content: 'reacted');

    _emitReactions(container, id: tailId);
    await _flushAsync();
    expect(gate.outstanding, 1);

    final List<String> created = <String>[
      _snowflakeForIndex(500),
      _snowflakeForIndex(501),
      _snowflakeForIndex(502),
    ];
    for (final String id in created) {
      _emitCreated(container, id: id);
    }

    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    gate.releaseAll();
    expect(await jump, isTrue);
    await _flushAsync();

    final List<String> ids = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      ids.contains(_snowflakeForIndex(350)),
      isTrue,
      reason: 'the window the swap fetched survives',
    );
    expect(
      ids.sublist(ids.length - 3),
      created,
      reason: 'every batched create lands, in arrival order, on the new window',
    );
    expect(_contentOf(container, tailId), 'reacted');
  });

  test('m5: overlapping live applications all survive in ingress '
      'order', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(20));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String target = _snowflakeForIndex(18);
    gate.hold(target, content: 'reacted');

    final List<String> created = <String>[
      _snowflakeForIndex(100),
      _snowflakeForIndex(101),
      _snowflakeForIndex(102),
      _snowflakeForIndex(103),
    ];
    _emitCreated(container, id: created[0]);
    _emitCreated(container, id: created[1]);
    _emitReactions(container, id: target);
    _emitCreated(container, id: created[2]);
    _emitCreated(container, id: created[3]);
    _emitUpdated(container, id: target, content: 'edited');

    await _flushAsync();

    expect(
      gate.outstanding,
      1,
      reason: 'the first application must still be parked here',
    );
    final List<String> midFlight = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      midFlight,
      containsAll(<String>[created[0], created[1]]),
      reason: 'the batch ahead of the parked reducer already applied',
    );
    expect(
      midFlight,
      isNot(contains(created[2])),
      reason: 'the batch behind the parked reducer must not write yet',
    );
    expect(
      _contentOf(container, target),
      isNot('edited'),
      reason: 'the edit behind the parked reducer must not write yet',
    );

    gate.releaseAll();
    await _flushAsync();

    final List<String> ids = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      ids.sublist(ids.length - 4),
      created,
      reason: "no application may lose another one's creates",
    );
    expect(
      _contentOf(container, target),
      'edited',
      reason: 'the last event to arrive must be the last one applied',
    );
  });

  test('m6: a write from outside the queue is not erased by a parked '
      'reducer', () async {
    final String sentId = _snowflakeForIndex(200);
    final _GatedDatabase database = await seedChannel(guildId: '');
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(20),
      sentMessageId: sentId,
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String target = _snowflakeForIndex(19);
    gate.hold(target, content: 'reacted');

    _emitReactions(container, id: target);
    await _flushAsync();
    expect(
      gate.outstanding,
      1,
      reason: 'the reducer must be parked inside the database read',
    );

    await notifier.sendMessage(text: 'hello from me');
    await _flushAsync();

    expect(
      gate.outstanding,
      1,
      reason: 'the send must have landed while the reducer was still parked',
    );
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      contains(sentId),
      reason: 'the send is applied immediately, it does not wait on the queue',
    );
    expect(_contentOf(container, target), isNot('reacted'));

    gate.releaseAll();
    await _flushAsync();

    final state = container.read(chatViewModelProvider);
    expect(
      state.messages.map((Message m) => m.id),
      contains(sentId),
      reason: 'the reducer must not commit a base that predates the send',
    );
    expect(
      state.messages.last.id,
      sentId,
      reason: 'the sent message keeps its place at the tail',
    );
    expect(
      _contentOf(container, target),
      'reacted',
      reason: 'the reduced event still lands',
    );
  });

  test('m6-batch: a coalesced create batch commits against the window as it '
      'is when it writes', () async {
    final String sentId = _snowflakeForIndex(300);
    final _GatedDatabase database = await seedChannel(guildId: '');
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(20),
      sentMessageId: sentId,
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final List<String> created = <String>[
      for (var i = 0; i < 4; i++) _snowflakeForIndex(100 + i),
    ];
    for (final String id in created) {
      gate.hold(id, content: 'unused');
    }

    for (final String id in created) {
      _emitCreated(container, id: id);
    }
    await _flushAsync();

    await notifier.sendMessage(text: 'hello from me');
    await _flushAsync();

    gate.releaseAll();
    await _flushAsync();

    final List<String> ids = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      ids,
      contains(sentId),
      reason: 'the batch must not commit a base that predates the send',
    );
    expect(
      ids.where(created.contains).toList(),
      created,
      reason: 'every batched create lands, in arrival order',
    );
  });

  test('m7: clearing a swap barrier wakes the queue on its own', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    adapter
      ..holdLatestFetch = true
      ..failLatestFetch = true;
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    final String target = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    _emitUpdated(container, id: target, content: 'woken');
    await _flushAsync();

    expect(
      _contentOf(container, target),
      isNot('woken'),
      reason: 'the barrier holds the event while the swap owns the channel',
    );

    adapter.releaseLatestFetch();
    expect(await jump, isFalse);

    expect(
      _contentOf(container, target),
      'woken',
      reason: 'clearing the barrier must wake the queue with no new traffic',
    );
  });

  test('m8: a swap superseded while its commit waits in the lane never '
      'writes', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String targetA = _snowflakeForIndex(50);
    final String targetB = _snowflakeForIndex(300);

    var sawWindowA = false;
    container.listen<List<Message>>(
      chatViewModelProvider.select((ChatViewState s) => s.messages),
      (List<Message>? previous, List<Message> next) {
        if (next.any((Message m) => m.id == targetA)) {
          sawWindowA = true;
        }
      },
    );
    final List<String> scrolled = <String>[];
    container.listen<(String, int)?>(
      chatViewModelProvider.select(
        (ChatViewState s) => s.scrollToMessageSignal,
      ),
      (_, (String, int)? next) {
        if (next != null) {
          scrolled.add(next.$1);
        }
      },
    );

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();
    expect(gate.outstanding, 1, reason: 'the worker must be parked');

    final Future<void> jumpA = notifier.goToRepliedMessage(
      messageId: targetA,
      channelId: _channelId,
    );
    await _flushAsync();
    expect(
      gate.outstanding,
      1,
      reason: 'the reducer is still parked, so A cannot have committed',
    );
    expect(sawWindowA, isFalse, reason: "A's commit is queued, not applied");

    final Future<void> jumpB = notifier.goToRepliedMessage(
      messageId: targetB,
      channelId: _channelId,
    );
    await _flushAsync();
    expect(
      gate.outstanding,
      1,
      reason: 'supersession happened before anything was released',
    );

    gate.releaseAll();
    await jumpA;
    await jumpB;
    await _flushAsync();

    expect(
      sawWindowA,
      isFalse,
      reason: "the superseded swap's page must never become the window",
    );
    expect(
      scrolled,
      isNot(contains(targetA)),
      reason: 'the user must not be scrolled to the target they left',
    );
    final ChatViewState state = container.read(chatViewModelProvider);
    expect(
      state.messages.map((Message m) => m.id),
      contains(targetB),
      reason: 'the winning jump still lands normally',
    );
    expect(scrolled.last, targetB);
  });

  test('m8b: a no-load channel switch supersedes a queued commit without '
      'ever arming', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String targetA = _snowflakeForIndex(50);
    var sawWindowA = false;
    container.listen<List<Message>>(
      chatViewModelProvider.select((ChatViewState s) => s.messages),
      (List<Message>? previous, List<Message> next) {
        if (next.any((Message m) => m.id == targetA)) {
          sawWindowA = true;
        }
      },
    );
    final List<String> scrolled = <String>[];
    container.listen<(String, int)?>(
      chatViewModelProvider.select(
        (ChatViewState s) => s.scrollToMessageSignal,
      ),
      (_, (String, int)? next) {
        if (next != null) {
          scrolled.add(next.$1);
        }
      },
    );

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();
    expect(gate.outstanding, 1, reason: 'the worker must be parked');

    final Future<void> jumpA = notifier.goToRepliedMessage(
      messageId: targetA,
      channelId: _channelId,
    );
    await _flushAsync();
    expect(gate.outstanding, 1, reason: "A's commit is queued, not applied");
    expect(sawWindowA, isFalse);

    await notifier.switchChannel(_otherChannelId, loadMessages: false);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).channelId, _otherChannelId);
    expect(gate.outstanding, 1, reason: 'nothing was released yet');

    gate.releaseAll();
    await jumpA;
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(
      sawWindowA,
      isFalse,
      reason:
          'the superseded page must never reach the channel the user '
          'switched to',
    );
    expect(state.channelId, _otherChannelId);
    expect(
      state.messages,
      isEmpty,
      reason: 'the new channel loaded nothing and must stay empty',
    );
    expect(scrolled, isNot(contains(targetA)));
    expect(state.isLoading, isFalse);
    expect(state.isSyncingMessages, isFalse);
  });

  test(
    'm8c: a same-channel no-load switch supersedes a queued commit',
    () async {
      final _GatedDatabase database = await seedChannel();
      final adapter = _MessageApiAdapter(messages: _channelMessages(400));
      final container = _container(database, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(_channelId);
      await _flushAsync();

      final String targetA = _snowflakeForIndex(50);
      var sawWindowA = false;
      container.listen<List<Message>>(
        chatViewModelProvider.select((ChatViewState s) => s.messages),
        (List<Message>? previous, List<Message> next) {
          if (next.any((Message m) => m.id == targetA)) {
            sawWindowA = true;
          }
        },
      );

      final List<String> before = container
          .read(chatViewModelProvider)
          .messages
          .map((Message m) => m.id)
          .toList();
      gate.hold(before.last, content: 'reacted');
      _emitReactions(container, id: before.last);
      await _flushAsync();
      expect(gate.outstanding, 1);

      final Future<void> jumpA = notifier.goToRepliedMessage(
        messageId: targetA,
        channelId: _channelId,
      );
      await _flushAsync();
      expect(sawWindowA, isFalse);

      await notifier.switchChannel(_channelId, loadMessages: false);
      await _flushAsync();
      expect(container.read(chatViewModelProvider).channelId, _channelId);

      gate.releaseAll();
      await jumpA;
      await _flushAsync();

      expect(
        sawWindowA,
        isFalse,
        reason:
            'a swap superseded by user intent must not land, even when the '
            'channel id is unchanged',
      );
      expect(
        container.read(chatViewModelProvider).messages.map((Message m) => m.id),
        before,
        reason: 'the no-load switch kept the window it had',
      );
    },
  );

  test('m9: supersession between the commit and the caller resuming blocks '
      'the post-commit effects', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String tailId = _snowflakeForIndex(399);
    var superseded = false;
    container.listen<List<Message>>(
      chatViewModelProvider.select((ChatViewState s) => s.messages),
      (List<Message>? previous, List<Message> next) {
        if (!superseded && next.any((Message m) => m.id == tailId)) {
          superseded = true;
          unawaited(
            notifier.switchChannel(_otherChannelId, loadMessages: false),
          );
        }
      },
    );

    final int scrollBefore = container
        .read(chatViewModelProvider)
        .scrollToBottomSignal;

    final bool ok = await notifier.jumpToLatestMessages();
    await _flushAsync();

    expect(
      superseded,
      isTrue,
      reason: 'the supersession must actually have fired, or this is vacuous',
    );
    expect(
      ok,
      isFalse,
      reason: 'a jump superseded before it resumed must not report success',
    );
    expect(
      container.read(chatViewModelProvider).scrollToBottomSignal,
      scrollBefore,
      reason: 'no scroll may fire for a window the user has already left',
    );
  });

  test('m10: a commit waiting in the lane does not erase a send that '
      'lands while it waits', () async {
    final String sentId = _snowflakeForIndex(500);
    final _GatedDatabase database = await seedChannel(guildId: '');
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400),
      sentMessageId: sentId,
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();
    expect(gate.outstanding, 1, reason: 'the worker must be parked');

    var jumpSettled = false;
    final Future<bool> jump = notifier.jumpToLatestMessages().whenComplete(() {
      jumpSettled = true;
    });
    await _flushAsync();
    expect(jumpSettled, isFalse, reason: 'the commit is waiting in the lane');

    adapter.holdSend = true;
    final Future<void> send = notifier.sendMessage(text: 'hello from me');
    await _flushAsync();
    final Message optimistic = container
        .read(chatViewModelProvider)
        .messages
        .lastWhere((Message m) => m.content == 'hello from me');
    expect(gate.outstanding, 1, reason: 'the send landed during the lane wait');

    gate.releaseAll();
    expect(await jump, isTrue);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      contains(optimistic.id),
      reason:
          'the commit must compose its list from the window as it is when '
          'it writes, not as it was before it queued',
    );

    adapter.releaseSend();
    await send;
    await _flushAsync();
  });

  test('m10f: a refresh commit waiting in the lane does not erase a send '
      'that lands while it waits', () async {
    final String sentId = _snowflakeForIndex(500);
    final _GatedDatabase database = await seedChannel(guildId: '');
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400),
      sentMessageId: sentId,
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();
    expect(gate.outstanding, 1, reason: 'the worker must be parked');

    var reloadSettled = false;
    final Future<void> reload = notifier.reloadCurrentChannel().whenComplete(
      () {
        reloadSettled = true;
      },
    );
    await _flushAsync();
    expect(
      reloadSettled,
      isFalse,
      reason: 'the refresh commit is waiting in the lane',
    );

    adapter.holdSend = true;
    final Future<void> send = notifier.sendMessage(text: 'hello from me');
    await _flushAsync();
    final Message optimistic = container
        .read(chatViewModelProvider)
        .messages
        .lastWhere((Message m) => m.content == 'hello from me');
    expect(gate.outstanding, 1, reason: 'the send landed during the lane wait');

    gate.releaseAll();
    await reload;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      contains(optimistic.id),
      reason:
          'the refresh commit must re-reduce against the window as it stands '
          'at write time, not install the pre-lane merge',
    );

    adapter.releaseSend();
    await send;
    await _flushAsync();
  });

  test('m10b: a commit does not resurrect a message deleted while it '
      'waited', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();

    final String deletedId = _snowflakeForIndex(399);
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    adapter.holdDelete = true;
    final Future<void> deletion = notifier.deleteMessage(deletedId);
    await _flushAsync();

    gate.releaseAll();
    expect(await jump, isTrue);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
      reason: 'a page fetched before the delete must not resurrect the row',
    );

    adapter.releaseDelete();
    await deletion;
    await _flushAsync();
    await notifier.goToRepliedMessage(
      messageId: deletedId,
      channelId: _channelId,
    );
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      contains(deletedId),
      reason: 'a settled delete must not leave a tombstone behind',
    );
  });

  test('m10b-ack: a completed delete still beats an older page in the '
      'lane', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();

    final String deletedId = _snowflakeForIndex(399);
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    await notifier.deleteMessage(deletedId);
    await _flushAsync();

    gate.releaseAll();
    expect(await jump, isTrue);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
      reason:
          'a confirmed delete must outlive its own request while an older '
          'page is still queued',
    );
  });

  test('m10e: a delete acknowledged after a later fetch started still '
      'wins', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();

    final String deletedId = _snowflakeForIndex(399);

    adapter.holdDelete = true;
    final Future<void> deletion = notifier.deleteMessage(deletedId);
    await _flushAsync();

    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    adapter.releaseDelete();
    await deletion;
    await _flushAsync();

    gate.releaseAll();
    expect(await jump, isTrue);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
      reason:
          'the boundary is the acknowledgement, not which of the two the '
          'client started first',
    );
  });

  test('deleting a reply then the parent keeps both gone', () async {
    final _GatedDatabase database = await seedChannel();
    final String parentId = _snowflakeForIndex(0);
    final String replyId = _snowflakeForIndex(1);
    final adapter = _MessageApiAdapter(
      messages: <Map<String, Object?>>[
        _messageJson(id: parentId, channelId: _channelId, authorId: 'me'),
        _messageJson(
            id: replyId,
            channelId: _channelId,
            authorId: 'me',
            content: 'reply',
          )
          ..['type'] = 19
          ..['message_reference'] = <String, Object?>{
            'channel_id': _channelId,
            'message_id': parentId,
            'type': 0,
          },
      ],
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      <String>[parentId, replyId],
    );

    await notifier.deleteMessage(replyId);
    await _flushAsync();
    adapter.messages.removeWhere(
      (Map<String, Object?> m) => m['id'] == replyId,
    );
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      <String>[parentId],
    );

    adapter
      ..holdDelete = true
      ..holdLatestFetch = true;
    final Future<void> parentDelete = notifier.deleteMessage(parentId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isEmpty,
    );

    _activateViewport(container);
    final Future<void> refresh = notifier.refreshAfterSessionRecovery();
    await _flushAsync();
    adapter.releaseLatestFetch();
    await refresh;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isEmpty,
      reason:
          'a stale page must not resurrect the parent after the reply '
          'delete',
    );

    adapter.messages.removeWhere(
      (Map<String, Object?> m) => m['id'] == parentId,
    );
    adapter.releaseDelete();
    await parentDelete;
    await _flushAsync();
    await notifier.refreshAfterSessionRecovery();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isEmpty,
    );
  });

  test('a parked window drops a message deleted while another channel is '
      'open', () async {
    final _GatedDatabase database = await seedChannel();
    final String targetId = _snowflakeForIndex(0);
    final adapter = _MessageApiAdapter(
      messages: <Map<String, Object?>>[
        _messageJson(id: targetId, channelId: _channelId, authorId: 'other'),
      ],
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      <String>[targetId],
    );

    await notifier.switchChannel(_otherChannelId, loadMessages: false);
    await _flushAsync();
    await database.messageDao.deleteMessages(<String>[targetId]);
    adapter.messages.removeWhere(
      (Map<String, Object?> m) => m['id'] == targetId,
    );
    _emitDeleted(container, id: targetId);
    await _flushAsync();

    await notifier.switchChannel(_channelId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(targetId)),
      reason:
          'a parked window must not resurrect a message deleted while '
          'another channel was open',
    );
  });

  test('m10c-ack: a completed edit still beats an older page in the '
      'lane', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400, attachmentAt: attachmentIndex),
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(attachmentIndex);
    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();

    final Future<void> jump = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(340),
      channelId: _channelId,
    );
    await _flushAsync();

    await notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'a local description',
    );
    await _flushAsync();

    gate.releaseAll();
    await jump;
    await _flushAsync();

    final Message committed = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    expect(
      committed.attachments.single.description,
      'a local description',
      reason:
          'a confirmed edit must outlive its own request while an older '
          'page is still queued',
    );
  });

  test('m10c-text: a saved text edit still beats an older page in the '
      'lane', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(352);
    final Message original = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();

    final Future<void> jump = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(340),
      channelId: _channelId,
    );
    await _flushAsync();

    notifier.startEdit(original);
    await notifier.saveEditedMessage(text: 'a local edit');
    await _flushAsync();

    gate.releaseAll();
    await jump;
    await _flushAsync();

    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.id == editedId)
          .content,
      'a local edit',
    );
  });

  test('m10g: an overlay operation leaves fields it never touched '
      'alone', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400, attachmentAt: attachmentIndex),
    );
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(attachmentIndex);

    adapter.holdAroundFetch = true;
    final Future<void> jump = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(340),
      channelId: _channelId,
    );
    await _flushAsync();

    await notifier.deleteMessageAttachment(
      messageId: editedId,
      attachmentId: _kAttachmentId,
    );
    await _flushAsync();

    adapter.messages[attachmentIndex] = _messageJson(
      id: editedId,
      channelId: _channelId,
      authorId: 'other',
      content: 'edited remotely',
      withAttachment: true,
    );
    adapter.releaseAroundFetch();
    await jump;
    await _flushAsync();

    final Message committed = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    expect(
      committed.content,
      'edited remotely',
      reason: 'the overlay must not own fields the operation never touched',
    );
    expect(
      committed.attachments,
      isEmpty,
      reason: 'the operation it DID perform still applies',
    );
  });

  test('m10h: a failed edit after a channel switch does not write into the '
      'new channel', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400, attachmentAt: attachmentIndex),
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(attachmentIndex);
    adapter
      ..holdEdit = true
      ..failEdit = true;
    final Future<void> edit = notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'a local description',
    );
    await _flushAsync();

    await notifier.switchChannel(_otherChannelId, loadMessages: false);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).messages, isEmpty);

    adapter.releaseEdit();
    await edit;
    await _flushAsync();

    final ChatViewState state = container.read(chatViewModelProvider);
    expect(state.channelId, _otherChannelId);
    expect(
      state.messages,
      isEmpty,
      reason:
          "a rollback must not inject the old channel's message into the "
          'channel the user is now in',
    );
  });

  test('m10h-reorder: a failed edit restores by id, not by a captured '
      'index', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400, attachmentAt: attachmentIndex),
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(attachmentIndex);
    adapter
      ..holdEdit = true
      ..failEdit = true;
    final Future<void> edit = notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'a local description',
    );
    await _flushAsync();

    await notifier.loadMore();
    await _flushAsync();

    adapter.releaseEdit();
    await edit;
    await _flushAsync();

    final List<Message> messages = container
        .read(chatViewModelProvider)
        .messages;
    expect(
      messages.where((Message m) => m.id == editedId).length,
      1,
      reason: 'restoring by a stale index duplicates the row it lands on',
    );
    final Message restored = messages.firstWhere(
      (Message m) => m.id == editedId,
    );
    expect(
      restored.attachments.single.description,
      isNull,
      reason: 'the failed edit rolled back to the server revision',
    );
    expect(
      messages.map((Message m) => m.id).toSet().length,
      messages.length,
      reason: 'no row may be overwritten by a copy of another',
    );
  });

  test('m10i: two operations on one message, both survive a page fetched '
      'between them', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(
        400,
        attachmentAt: attachmentIndex,
        twoAttachments: true,
      ),
    );
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(attachmentIndex);
    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.id == editedId)
          .attachments
          .length,
      2,
    );

    adapter.holdAroundFetch = true;
    final Future<void> jump = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(340),
      channelId: _channelId,
    );
    await _flushAsync();

    adapter
      ..holdDelete = true
      ..holdEdit = true;
    final Future<void> opA = notifier.deleteMessageAttachment(
      messageId: editedId,
      attachmentId: _kAttachmentId2,
    );
    final Future<void> opB = notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'alt for one',
    );
    await _flushAsync();

    adapter.releaseDelete();
    await opA;
    await _flushAsync();
    adapter.releaseEdit();
    await opB;
    await _flushAsync();

    adapter.releaseAroundFetch();
    await jump;
    await _flushAsync();

    final Message committed = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    expect(
      committed.attachments.map((Attachment a) => a.id),
      <String>[_kAttachmentId],
      reason:
          'the removal must survive the other operation on the same '
          'message',
    );
    expect(
      committed.attachments.single.description,
      'alt for one',
      reason: 'and so must the alt text',
    );
    await _flushAsync();
    expect(
      notifier.pendingLocalMutationCount,
      0,
      reason: 'both operations retire once no older page operation is left',
    );
  });

  test('m11: pagination is inside the protocol', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseOlderFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String deletedId = _snowflakeForIndex(340);
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
    );

    adapter.holdOlderFetch = true;
    final Future<void> older = notifier.loadMore();
    await _flushAsync();

    await notifier.deleteMessage(deletedId);
    await _flushAsync();

    expect(
      notifier.pendingLocalMutationCount,
      1,
      reason:
          'an in-flight pagination fetch older than the ack must keep the '
          'tombstone alive',
    );

    adapter.releaseOlderFetch();
    await older;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
      reason:
          'a paginated page fetched before the delete must not resurrect '
          'the row',
    );
    expect(
      notifier.pendingLocalMutationCount,
      0,
      reason: 'and it retires once that fetch closes',
    );
  });

  test('m11b: the unread-boundary fetch is inside the protocol', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAfterFetch();
      container.dispose();
    });

    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion.insert(
        channelId: _channelId,
        lastMessageId: Value(_snowflakeForIndex(360)),
      ),
    );
    final String deletedId = _snowflakeForIndex(370);

    final notifier = container.read(chatViewModelProvider.notifier);
    adapter.holdAfterFetch = true;
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    _activateViewport(container);
    final Future<void> ack = notifier.ackCurrentChannel();
    await _flushAsync();
    expect(
      adapter.afterFetchCalls,
      greaterThan(0),
      reason: 'the boundary fetch must actually be in flight',
    );

    await notifier.deleteMessage(deletedId);
    await _flushAsync();
    expect(
      notifier.pendingLocalMutationCount,
      1,
      reason:
          'an in-flight boundary fetch older than the ack must keep the '
          'tombstone alive',
    );

    adapter.releaseAfterFetch();
    await ack;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
      reason: 'the boundary rows must not resurrect a deleted message',
    );
    expect(notifier.pendingLocalMutationCount, 0);
  });

  test('m11c: a boundary fetch discards when the window is replaced under '
      'it', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAfterFetch();
      container.dispose();
    });

    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion.insert(
        channelId: _channelId,
        lastMessageId: Value(_snowflakeForIndex(360)),
      ),
    );

    final notifier = container.read(chatViewModelProvider.notifier);
    adapter.holdAfterFetch = true;
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    _activateViewport(container);
    final Future<void> ack = notifier.ackCurrentChannel();
    await _flushAsync();
    expect(adapter.afterFetchCalls, greaterThan(0));

    await notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(100),
      channelId: _channelId,
    );
    await _flushAsync();
    final List<String> replaced = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(replaced, isNot(contains(_snowflakeForIndex(370))));

    adapter.releaseAfterFetch();
    await ack;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      replaced,
      reason:
          'rows qualified against the old window must not be merged into '
          'the new one',
    );
    expect(
      notifier.loadedUnreadBoundaryKeyCount,
      0,
      reason: 'a discarded attempt must not suppress the boundary forever',
    );
  });

  test('m11d: a boundary fetch discards when a targeted switch blanks the '
      'window', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseAfterFetch()
        ..releaseAroundFetch();
      container.dispose();
    });

    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion.insert(
        channelId: _channelId,
        lastMessageId: Value(_snowflakeForIndex(360)),
      ),
    );

    final notifier = container.read(chatViewModelProvider.notifier);
    adapter.holdAfterFetch = true;
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    _activateViewport(container);
    final Future<void> ack = notifier.ackCurrentChannel();
    await _flushAsync();
    expect(adapter.afterFetchCalls, greaterThan(0));

    adapter.holdAroundFetch = true;
    final Future<void> targeted = notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(100),
    );
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages,
      isEmpty,
      reason: 'the targeted switch blanked the window',
    );

    adapter.releaseAfterFetch();
    await ack;
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages,
      isEmpty,
      reason: 'boundary rows must not become the entire window',
    );
    expect(
      notifier.loadedUnreadBoundaryKeyCount,
      0,
      reason: 'a discarded attempt must not suppress the boundary forever',
    );

    adapter.releaseAroundFetch();
    await targeted;
    await _flushAsync();
  });

  test("m12: a superseded pagination does not clear its successor's busy "
      'flag', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseOlderFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    adapter.holdOlderFetch = true;
    final Future<void> a = notifier.loadMore();
    await _flushAsync();
    expect(container.read(chatViewModelProvider).isLoadingMore, isTrue);

    await notifier.switchChannel(_channelId, loadMessages: false);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoadingMore,
      isFalse,
      reason: 'the switch reset the flag, so a new pagination may start',
    );

    final String oldest = container
        .read(chatViewModelProvider)
        .messages
        .first
        .id;
    await database.messageDao.deleteMessages(<String>[oldest]);
    _emitDeleted(container, id: oldest);
    await _flushAsync();

    final Future<void> b = notifier.loadMore();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoadingMore,
      isTrue,
      reason: 'B owns the flag now',
    );

    adapter.releaseFirstOlderFetch();
    await a;
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoadingMore,
      isTrue,
      reason: "a superseded request must not clear its successor's flag",
    );

    adapter.releaseOlderFetch();
    await b;
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoadingMore,
      isFalse,
      reason: 'the owner clears it normally',
    );
  });

  test('m12b: two paginations in flight both land, coherently', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseOlderFetch()
        ..releaseAfterFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();
    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(opened.hasMoreMessages, isTrue);
    expect(opened.hasMoreNewerMessages, isTrue);
    final String firstBefore = opened.messages.first.id;
    final String lastBefore = opened.messages.last.id;

    adapter
      ..holdOlderFetch = true
      ..holdAfterFetch = true;
    final Future<void> older = notifier.loadMore();
    final Future<void> newer = notifier.loadNewer();
    await _flushAsync();
    expect(container.read(chatViewModelProvider).isLoadingMore, isTrue);
    expect(container.read(chatViewModelProvider).isLoadingNewer, isTrue);

    adapter.releaseOlderFetch();
    await older;
    await _flushAsync();
    final ChatViewState mid = container.read(chatViewModelProvider);
    expect(
      compareSnowflakeIds(mid.messages.first.id, firstBefore) < 0,
      isTrue,
      reason: 'the older page installed rather than being discarded',
    );
    expect(mid.messages.last.id, lastBefore);
    expect(
      mid.isLoadingNewer,
      isTrue,
      reason: "the other pagination's flag is untouched",
    );
    expect(mid.isLoadingMore, isFalse);

    adapter.releaseAfterFetch();
    await newer;
    await _flushAsync();

    final ChatViewState end = container.read(chatViewModelProvider);
    final List<String> ids = end.messages.map((Message m) => m.id).toList();
    expect(
      compareSnowflakeIds(ids.first, firstBefore) < 0,
      isTrue,
      reason: 'the older page survived the newer install',
    );
    expect(
      compareSnowflakeIds(ids.last, lastBefore) > 0,
      isTrue,
      reason: 'the newer page installed too',
    );
    expect(ids.toSet().length, ids.length, reason: 'no duplicated rows');
    for (var i = 1; i < ids.length; i++) {
      expect(
        compareSnowflakeIds(ids[i], ids[i - 1]) > 0,
        isTrue,
        reason: 'the merged window is strictly ordered',
      );
    }
    expect(end.isLoadingMore, isFalse);
    expect(end.isLoadingNewer, isFalse);
  });

  test('m12c: a pagination whose flag was reset with no successor still '
      'installs', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseOlderFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    final String firstBefore = container
        .read(chatViewModelProvider)
        .messages
        .first
        .id;

    adapter.holdOlderFetch = true;
    final Future<void> older = notifier.loadMore();
    await _flushAsync();
    expect(container.read(chatViewModelProvider).isLoadingMore, isTrue);

    await notifier.switchChannel(_channelId, loadMessages: false);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).isLoadingMore, isFalse);
    expect(
      container.read(chatViewModelProvider).messages.first.id,
      firstBefore,
      reason: 'the no-load switch kept the window, so the anchor still holds',
    );

    adapter
      ..holdOlderFetch = false
      ..releaseOlderFetch();
    await older;
    await _flushAsync();

    final ChatViewState afterA = container.read(chatViewModelProvider);
    expect(
      compareSnowflakeIds(afterA.messages.first.id, firstBefore) < 0,
      isTrue,
      reason: 'the page A fetched must install; nothing superseded it',
    );
    expect(afterA.isLoadingMore, isFalse);
    expect(afterA.isLoadingNewer, isFalse);
    final List<String> ids = afterA.messages.map((Message m) => m.id).toList();
    expect(ids.toSet().length, ids.length);
  });

  test("m14: a superseded jump to latest does not clear its successor's sync "
      'flag', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseLatestFetch()
        ..releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    adapter.holdLatestFetch = true;
    final Future<bool> a = notifier.jumpToLatestMessages();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isSyncingMessages,
      isTrue,
      reason: 'A owns the flag while its page is out',
    );

    final Set<String> loaded = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toSet();
    final String targetB = List<String>.generate(
      400,
      _snowflakeForIndex,
    ).firstWhere((String id) => !loaded.contains(id));
    adapter.holdAroundFetch = true;
    final Future<void> b = notifier.goToRepliedMessage(
      channelId: _channelId,
      messageId: targetB,
    );
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isSyncingMessages,
      isTrue,
      reason: 'B set the flag for itself; it owns it now',
    );

    adapter.releaseLatestFetch();
    expect(
      await a,
      isFalse,
      reason: 'a superseded jump must not report success',
    );
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isSyncingMessages,
      isTrue,
      reason: "a superseded jump must not clear its successor's flag",
    );

    adapter.releaseAroundFetch();
    await b;
    await _flushAsync();
    final ChatViewState end = container.read(chatViewModelProvider);
    expect(
      end.messages.map((Message m) => m.id),
      contains(targetB),
      reason: 'the winning jump still lands normally',
    );
    expect(
      end.isSyncingMessages,
      isFalse,
      reason: 'the owner clears it on its own lifecycle',
    );
  });

  test('m14b: a superseded jump to latest still releases the jump '
      'mutex', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseLatestFetch()
        ..releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    adapter.holdLatestFetch = true;
    final Future<bool> a = notifier.jumpToLatestMessages();
    await _flushAsync();
    final Set<String> loaded = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toSet();
    final String targetB = List<String>.generate(
      400,
      _snowflakeForIndex,
    ).firstWhere((String id) => !loaded.contains(id));
    adapter.holdAroundFetch = true;
    final Future<void> b = notifier.goToRepliedMessage(
      channelId: _channelId,
      messageId: targetB,
    );
    await _flushAsync();

    adapter.releaseLatestFetch();
    expect(await a, isFalse, reason: 'A is superseded, as in m14');
    adapter.releaseAroundFetch();
    await b;
    await _flushAsync();

    final ChatViewState afterB = container.read(chatViewModelProvider);
    expect(
      afterB.hasMoreNewerMessages,
      isTrue,
      reason:
          'without a detached window the jump short-circuits and proves '
          'nothing about the mutex',
    );
    final String tailId = _snowflakeForIndex(399);
    expect(afterB.messages.map((Message m) => m.id), isNot(contains(tailId)));
    final int fetchesBefore = adapter.latestFetchCalls;
    final int scrollBefore = afterB.scrollToBottomSignal;

    final bool ok = await notifier.jumpToLatestMessages();
    await _flushAsync();
    expect(
      ok,
      isTrue,
      reason:
          'the mutex the superseded jump owned must have been released, or '
          'jump-to-latest is wedged shut for good',
    );
    expect(
      adapter.latestFetchCalls,
      fetchesBefore + 1,
      reason:
          'it took the normal path and fetched, rather than returning '
          'early off a stale mutex or a short-circuit',
    );
    final ChatViewState end = container.read(chatViewModelProvider);
    expect(
      end.messages.map((Message m) => m.id),
      contains(tailId),
      reason: 'the second jump landed on the live tail',
    );
    expect(end.hasMoreNewerMessages, isFalse);
    expect(end.scrollToBottomSignal, greaterThan(scrollBefore));
    expect(end.isSyncingMessages, isFalse);
  });

  test('m15: a superseded recovery reconcile neither clears the jump flag nor '
      'marks the channel reconciled', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseAroundFetch()
        ..releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    adapter.holdAroundFetch = true;
    container.read(gatewayFullRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.aroundFetchCalls,
      greaterThan(0),
      reason: 'the reconcile must actually be in flight, or this is vacuous',
    );
    expect(
      container.read(chatViewModelProvider).isSyncingMessages,
      isTrue,
      reason: 'the reconcile owns the flag while its pages are out',
    );

    adapter.holdLatestFetch = true;
    final Future<bool> b = notifier.jumpToLatestMessages();
    await _flushAsync();

    adapter.releaseAroundFetch();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isSyncingMessages,
      isTrue,
      reason: "the superseded reconcile must not clear the jump's flag",
    );

    adapter.releaseLatestFetch();
    expect(await b, isTrue, reason: 'the jump still lands normally');
    await _flushAsync();
    final ChatViewState afterJump = container.read(chatViewModelProvider);
    expect(
      afterJump.isSyncingMessages,
      isFalse,
      reason: 'the owner clears it on its own lifecycle',
    );
    expect(
      afterJump.messages.map((Message m) => m.id),
      contains(_snowflakeForIndex(399)),
    );

    final int aroundBefore = adapter.aroundFetchCalls;
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    expect(
      adapter.aroundFetchCalls,
      greaterThan(aroundBefore),
      reason: 'nothing reconciled this channel, so the resync must still run',
    );
  });

  test('m15b: a superseded refresh does not write its failure over the '
      'successor', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    final int loaded = container.read(chatViewModelProvider).messages.length;
    expect(loaded, greaterThan(0));

    adapter
      ..holdLatestFetch = true
      ..failLatestFetch = true;
    final Future<void> a = notifier.reloadCurrentChannel();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoading,
      isTrue,
      reason: 'A is in flight and owns the spinner',
    );

    await notifier.switchChannel(_channelId, loadMessages: false);
    await _flushAsync();
    final ChatViewState afterSwitch = container.read(chatViewModelProvider);
    expect(afterSwitch.isLoading, isFalse, reason: 'the switch owns the flags');
    expect(
      afterSwitch.messages.length,
      loaded,
      reason:
          'the no-load switch keeps the window, so the failure below has a '
          'cached window to lie about',
    );
    expect(afterSwitch.errorMessage, isNull);
    expect(afterSwitch.messageLoadFailed, isFalse);

    adapter.releaseLatestFetch();
    await a;
    await _flushAsync();
    final ChatViewState end = container.read(chatViewModelProvider);
    expect(
      end.errorMessage,
      isNull,
      reason:
          'a superseded refresh must not raise a failure banner over the '
          'successor that replaced it',
    );
    expect(
      end.messageLoadFailed,
      isFalse,
      reason: 'the operation that owns this state did not fail',
    );
    expect(end.messages.length, loaded, reason: 'the window is untouched');
  });

  test('m15c: a superseded sibling refresh writes no failure over the refresh '
      'that replaced it', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseAroundFetch()
        ..releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    final int loaded = container.read(chatViewModelProvider).messages.length;
    expect(loaded, greaterThan(0));

    adapter
      ..holdAroundFetch = true
      ..failAroundFetch = true;
    container.read(gatewayFullRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.aroundFetchCalls,
      greaterThan(0),
      reason: 'A must really be in flight, or this is vacuous',
    );
    expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

    adapter.holdLatestFetch = true;
    final Future<void> b = notifier.retryLoadMessages();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoading,
      isTrue,
      reason: 'B owns the spinner now',
    );

    adapter.releaseAroundFetch();
    await _flushAsync();
    final ChatViewState afterA = container.read(chatViewModelProvider);
    expect(
      afterA.isLoading,
      isTrue,
      reason: "a superseded sibling must not clear B's spinner",
    );
    expect(
      afterA.errorMessage,
      isNull,
      reason: 'B has not failed, so no banner may be raised over it',
    );
    expect(afterA.messageLoadFailed, isFalse);

    adapter.releaseLatestFetch();
    await b;
    await _flushAsync();
    final ChatViewState end = container.read(chatViewModelProvider);
    expect(end.isLoading, isFalse, reason: 'the owner clears its own spinner');
    expect(end.errorMessage, isNull);
    expect(end.messageLoadFailed, isFalse);
    expect(end.messages, isNotEmpty);
    expect(
      end.messages.last.id,
      _snowflakeForIndex(399),
      reason: "B's own page installed",
    );
  });

  test('m15d: a superseded tail recovery does not scroll to bottom - the '
      'signal belongs to the install that applied', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);

    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: _channelId,
          nearLoadedTail: true,
          distanceFromBottom: 0,
          sampledTailId: null,
        );
    await _flushAsync();
    expect(container.read(chatReadViewportProvider).nearLoadedTail, isTrue);

    final int signalBefore = container
        .read(chatViewModelProvider)
        .scrollToBottomSignal;
    final int fetchesAfterOpen = adapter.latestFetchCalls;

    adapter.holdLatestFetch = true;
    container.read(gatewayFullRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      fetchesAfterOpen + 1,
      reason:
          'A took the direct latest-tail branch and is in flight, or this '
          'is vacuous',
    );
    expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

    final Future<void> b = notifier.retryLoadMessages();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoading,
      isTrue,
      reason: 'B owns the spinner now - it armed over A, or this is vacuous',
    );

    adapter.releaseLatestFetch();
    await b;
    await _flushAsync();

    final ChatViewState end = container.read(chatViewModelProvider);
    expect(
      end.messages.last.id,
      _snowflakeForIndex(399),
      reason: "B's page installed",
    );
    expect(
      end.scrollToBottomSignal,
      signalBefore,
      reason:
          'A installed nothing, so A must not scroll - and the retry never '
          'scrolls by design',
    );

    container.read(gatewayFullRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).scrollToBottomSignal,
      signalBefore + 1,
      reason: 'the install that applied owns the scroll',
    );
  });

  test('m13: a failed removal leaves the next operation on the confirmed '
      'baseline', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(
        400,
        attachmentAt: attachmentIndex,
        twoAttachments: true,
      ),
    );
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseDelete();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String messageId = _snowflakeForIndex(attachmentIndex);

    adapter
      ..holdDelete = true
      ..failDelete = true;
    final Future<void> opA = notifier.deleteMessageAttachment(
      messageId: messageId,
      attachmentId: _kAttachmentId2,
    );
    await _flushAsync();

    final Future<void> opB = notifier.editAttachmentAltText(
      messageId: messageId,
      attachmentId: _kAttachmentId,
      description: 'B description',
    );
    await _flushAsync();
    expect(adapter.attachmentRequests, <String>[
      'DELETE $_kAttachmentId2',
    ], reason: 'B must wait for A to settle before it touches the wire');

    adapter.releaseDelete();
    await opA;
    await opB;
    await _flushAsync();
    expect(
      adapter.attachmentRequests.last,
      'PATCH $_kAttachmentId2,$_kAttachmentId=B description',
      reason:
          "a failed operation confirms nothing, so B's array is the ORIGINAL "
          'confirmed one',
    );

    final Message row = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == messageId);
    expect(
      row.attachments.map((Attachment a) => a.id),
      containsAll(<String>[_kAttachmentId, _kAttachmentId2]),
      reason: 'the failed removal put its own attachment back',
    );
    expect(
      row.attachments
          .firstWhere((Attachment a) => a.id == _kAttachmentId)
          .description,
      'B description',
      reason: "a rollback must not revert another operation's confirmed work",
    );
  });

  test('m13c: attachment mutations are serialised and derive from the '
      'confirmed row', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(
        400,
        attachmentAt: attachmentIndex,
        twoAttachments: true,
      ),
    );
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseDelete();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String messageId = _snowflakeForIndex(attachmentIndex);

    adapter.holdDelete = true;
    final Future<void> opA = notifier.deleteMessageAttachment(
      messageId: messageId,
      attachmentId: _kAttachmentId2,
    );
    final Future<void> opB = notifier.editAttachmentAltText(
      messageId: messageId,
      attachmentId: _kAttachmentId,
      description: 'alt for one',
    );
    await _flushAsync();

    expect(
      adapter.attachmentRequests,
      <String>['DELETE $_kAttachmentId2'],
      reason:
          'the whole-array PATCH must not be on the wire beside the '
          'DELETE it would undo',
    );

    adapter.releaseDelete();
    await opA;
    await opB;
    await _flushAsync();

    expect(
      adapter.attachmentRequests,
      <String>['DELETE $_kAttachmentId2', 'PATCH $_kAttachmentId=alt for one'],
      reason:
          'the edit rewrites the whole array, so it must derive from the '
          'CONFIRMED post-delete row: listing the removed attachment '
          're-creates it server-side',
    );

    final Message row = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == messageId);
    expect(row.attachments.map((Attachment a) => a.id), <String>[
      _kAttachmentId,
    ], reason: 'the canonical row the edit returned is the new baseline');
    expect(row.attachments.single.description, 'alt for one');
    expect(
      notifier.pendingLocalMutationCount,
      0,
      reason: 'both operations retired',
    );
  });

  test('m13d: an attachment edit transmits no content', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400, attachmentAt: attachmentIndex),
    );
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseEdit();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String messageId = _snowflakeForIndex(attachmentIndex);

    adapter.holdEdit = true;
    final Future<void> edit = notifier.editAttachmentAltText(
      messageId: messageId,
      attachmentId: _kAttachmentId,
      description: 'alt for one',
    );
    await _flushAsync();

    adapter.serverContent[messageId] = 'edited remotely';
    _emitUpdated(container, id: messageId, content: 'edited remotely');
    await _flushAsync();

    adapter.releaseEdit();
    await edit;
    await _flushAsync();

    expect(
      adapter.patchContents,
      <String?>[null],
      reason:
          'the attachment PATCH must omit the content part entirely, not '
          'send a value it only read',
    );
    expect(
      adapter.serverContent[messageId],
      'edited remotely',
      reason: 'an operation must not overwrite a field it does not own',
    );
    final db.Message? row = await database.messageDao.getMessage(messageId);
    expect(
      row?.content,
      'edited remotely',
      reason:
          'the canonical response is upserted, so a stale content in it '
          'poisons the local cache too',
    );
    expect(
      _contentOf(container, messageId),
      'edited remotely',
      reason: 'and the window keeps the remote edit',
    );
    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .firstWhere((Message m) => m.id == messageId)
          .attachments
          .single
          .description,
      'alt for one',
      reason: 'while the operation it DOES own still lands',
    );
  });

  test('m10d: a page fetched after the acknowledgement wins', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String recreatedId = _snowflakeForIndex(399);

    adapter.holdAroundFetch = true;
    final Future<void> holder = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(120),
      channelId: _channelId,
    );
    await _flushAsync();

    await notifier.deleteMessage(recreatedId);
    await _flushAsync();

    adapter.holdAroundFetch = false;
    await notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(390),
      channelId: _channelId,
    );
    await _flushAsync();

    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      contains(recreatedId),
      reason: 'a page fetched after the ack must not be overlaid',
    );

    adapter.releaseAroundFetch();
    await holder;
    await _flushAsync();
    expect(
      notifier.pendingLocalMutationCount,
      0,
      reason: 'the log must retire once no older page operation is left',
    );
  });

  test('m10c: a commit does not revert an edit made while it waited', () async {
    const int attachmentIndex = 352;
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(400, attachmentAt: attachmentIndex),
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(attachmentIndex);
    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .any((Message m) => m.id == editedId),
      isTrue,
      reason: 'the attachment message must start in the window',
    );

    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();

    final Future<void> jump = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(340),
      channelId: _channelId,
    );
    await _flushAsync();

    adapter.holdEdit = true;
    final Future<void> edit = notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'a local description',
    );
    await _flushAsync();

    gate.releaseAll();
    await jump;
    await _flushAsync();

    final Message committed = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    expect(
      committed.attachments.single.description,
      'a local description',
      reason: "the page's pre-edit copy must not overwrite the local revision",
    );

    adapter.releaseEdit();
    await edit;
    await _flushAsync();
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    final Message reloaded = container
        .read(chatViewModelProvider)
        .messages
        .firstWhere((Message m) => m.id == editedId);
    expect(
      reloaded.attachments.single.description,
      isNull,
      reason: 'a settled edit must not pin its revision over server truth',
    );
  });

  test('m16: a search jump into a channel not yet opened this session leaves '
      'the live tail reachable', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(399)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    final String targetId = _snowflakeForIndex(200);
    await notifier.switchChannel(_channelId, targetMessageId: targetId);
    await _flushAsync();

    final String tailId = _snowflakeForIndex(399);
    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.map((Message m) => m.id),
      contains(targetId),
      reason: 'the jump itself lands, exactly as it does on the device',
    );
    expect(
      landed.messages.map((Message m) => m.id),
      isNot(contains(tailId)),
      reason: 'and the live tail is off screen, so the window is detached',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          'an around window in a channel whose messages were never cached is '
          'not the live tail; believing it is strands the user in history',
    );
    expect(
      adapter.latestFetchCalls,
      0,
      reason:
          'and it owes NO confirmation: a page whose newer side filled the '
          'server quota is detached by construction, the flag already says so, '
          'and the confirmation exists only for the signature that is genuinely '
          'ambiguous. Firing it here would buy nothing and cost a latest fetch '
          'on every search jump',
    );

    final String liveId = _snowflakeForIndex(400);
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason:
          'appending a live message to a detached window presents searched '
          'history and the present as one contiguous conversation',
    );

    final int afterFetchesBefore = adapter.afterFetchCalls;
    await notifier.loadNewer();
    await _flushAsync();
    expect(
      adapter.afterFetchCalls,
      afterFetchesBefore + 1,
      reason: 'loadNewer must reach the network, not refuse off a false tail',
    );
    expect(
      compareSnowflakeIds(
            container.read(chatViewModelProvider).messages.last.id,
            landed.messages.last.id,
          ) >
          0,
      isTrue,
      reason: 'and the window must actually grow toward the present',
    );

    final int latestFetchesBefore = adapter.latestFetchCalls;
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      latestFetchesBefore + 1,
      reason:
          'jump-to-latest must fetch the present rather than short-circuit on '
          'a window it only believes is the tail',
    );
    final ChatViewState atTail = container.read(chatViewModelProvider);
    expect(
      atTail.messages.map((Message m) => m.id),
      contains(tailId),
      reason: 'the jump reaches the present',
    );
    expect(atTail.hasMoreNewerMessages, isFalse);
  });

  test('m16b: a tail-built window with an orphaned pointer is the live tail on '
      "the page's own proof", () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(
      opened.messages.last.id,
      _snowflakeForIndex(399),
      reason: 'the latest page really is the tail the server has',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason:
          'the open, and NOTHING else: the page it just installed is the proof, '
          'so there is no confirmation to owe. A consult here would ask the '
          'server what this fetch already answered',
    );
    expect(
      opened.hasMoreNewerMessages,
      isFalse,
      reason:
          'the latest page names 399 and 399 is our tail, so the pointer really '
          'is an orphan and the window really is live',
    );

    await notifier.loadNewer();
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'a proven tail must not start confirming on every scroll',
    );
    expect(adapter.afterFetchCalls, 0, reason: 'and no newer page was needed');
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);
  });

  test('m16c: an around window whose newest row is the channel pointer is the '
      'tail', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(215),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(215)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(216));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(215),
      reason: 'the around page really did end on the channel pointer',
    );
    expect(
      landed.hasMoreNewerMessages,
      isFalse,
      reason:
          'nothing newer than the pointer exists, so this window is the live '
          'tail even though it was built around a target',
    );
    expect(
      adapter.latestFetchCalls,
      0,
      reason:
          'and it pays NOTHING for that: equality is a positive proof, so the '
          'rung seals on the spot instead of owing a confirmation the way the '
          'non-proof rungs do (m16p, m16q)',
    );

    final String liveId = _snowflakeForIndex(216);
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'a create adjacent to the window must still append',
    );
  });

  test('m16d: an around window a few rows short of the server quota is the '
      'live tail', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(206));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(205),
      reason:
          'the page really does end on the newest message the server has, '
          'five rows past the anchor and twenty short of the quota',
    );
    expect(
      landed.hasMoreNewerMessages,
      isFalse,
      reason:
          'a newer side short of the quota is the server reporting it '
          'exhausted: this window holds the live tail',
    );

    final String liveId = _snowflakeForIndex(206);
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'a create adjacent to a live-tail window must APPEND, not vanish',
    );

    final int latestFetchesBefore = adapter.latestFetchCalls;
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      latestFetchesBefore,
      reason: 'nothing to jump to means no latest fetch on the wire',
    );
  });

  test('m16f: a reply jump that lands within the quota of the tail reattaches '
      'the window', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    await notifier.goToRepliedMessage(
      channelId: _channelId,
      messageId: _snowflakeForIndex(390),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(399),
      reason: 'the jump page ends on the real tail, nine rows past the anchor',
    );
    expect(
      landed.hasMoreNewerMessages,
      isFalse,
      reason:
          'nine newer rows where a limit-50 around fetch would have sent 25 is '
          'the newer side exhausted: the jump landed back on the live tail',
    );

    final String liveId = _snowflakeForIndex(400);
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'a create adjacent to the reattached window must APPEND',
    );
  });

  test('m16s: a cached pointer row keeps the flag true and owes ONE '
      'confirmation', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(399)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.add(_snowflakeForIndex(210));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    final int latestFetchesBefore = adapter.latestFetchCalls;

    await notifier.goToRepliedMessage(
      channelId: _channelId,
      messageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(225),
      reason: 'the jump window ends where the filtered read left it',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          'the pointer names 399, that row is in the cache, and it is not in '
          'this window: unloaded newer history, flagged pessimistically',
    );
    expect(
      adapter.latestFetchCalls,
      latestFetchesBefore + 1,
      reason:
          'a cached row is not a proof, so the confirmation is owed: its '
          'latest page ends at 399, not 225, and installs nothing',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason: 'no gap-gluing while the window is proven behind',
    );
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    final ChatViewState jumped = container.read(chatViewModelProvider);
    expect(
      jumped.messages.last.id,
      liveId,
      reason:
          'and the escape hatch the true flag keeps alive reaches the present',
    );
    expect(jumped.hasMoreNewerMessages, isFalse);
  });

  test('m16x: an unread open around a deleted ack under an orphaned pointer '
      'confirms the tail instead of looping on empty newer pages', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(370)),
        manual: const Value(true),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(373))
      ..messages.removeWhere((m) => m['id'] == _snowflakeForIndex(370));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(adapter.aroundFetchCalls, 1);
    expect(
      opened.messages.map((Message m) => m.id),
      isNot(contains(_snowflakeForIndex(370))),
      reason: 'the ack row is gone server-side',
    );
    expect(opened.messages.last.id, _snowflakeForIndex(372));
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'pointer ahead of a short newer side owes one confirmation',
    );
    expect(
      opened.hasMoreNewerMessages,
      isFalse,
      reason: 'the latest page ends at 372, our tail: proven live',
    );

    await notifier.loadNewer();
    await _flushAsync();
    expect(
      adapter.afterFetchCalls,
      0,
      reason: 'a proven tail refuses the newer edge outright',
    );

    final String liveId = _snowflakeForIndex(373);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'and the next create lands on the live window',
    );
  });

  test(
    'm16y: a cached row for an orphaned pointer is not a proof either',
    () async {
      final _GatedDatabase database = await seedChannel(
        lastMessageId: _snowflakeForIndex(399),
      );
      final adapter = _MessageApiAdapter(messages: _channelMessages(400));
      final container = _container(database, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(_channelId);
      await _flushAsync();
      expect(
        await database.messageDao.getMessage(_snowflakeForIndex(399)),
        isNotNull,
        reason: 'the first open cached the pointer row',
      );
      await notifier.switchChannel(_otherChannelId, loadMessages: false);
      await _flushAsync();

      adapter.messages.removeWhere((m) {
        final String id = m['id']! as String;
        return id == _snowflakeForIndex(370) ||
            adapter._compare(id, _snowflakeForIndex(372)) > 0;
      });
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value(_channelId),
          lastMessageId: Value(_snowflakeForIndex(370)),
          manual: const Value(true),
        ),
      );
      final int latestFetchesBefore = adapter.latestFetchCalls;
      await notifier.switchChannel(_channelId);
      await _flushAsync();

      final ChatViewState reopened = container.read(chatViewModelProvider);
      expect(reopened.messages.last.id, _snowflakeForIndex(372));
      expect(adapter.latestFetchCalls, latestFetchesBefore + 1);
      expect(
        reopened.hasMoreNewerMessages,
        isFalse,
        reason: 'the stale cached row does not outvote the latest page',
      );

      await notifier.loadNewer();
      await _flushAsync();
      expect(adapter.afterFetchCalls, 0);
    },
  );

  Future<({ProviderContainer container, _MessageApiAdapter adapter})>
  openOrphanedPointerChannel() async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(370)),
        manual: const Value(true),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(373))
      ..messages.removeWhere((m) => m['id'] == _snowflakeForIndex(370))
      ..holdLatestFetch = true
      ..holdAfterFetch = true;
    final container = _container(database, adapter);
    addTearDown(container.dispose);
    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(opened.messages.last.id, _snowflakeForIndex(372));
    expect(opened.hasMoreNewerMessages, isTrue, reason: 'probe in flight');
    expect(adapter.latestFetchCalls, 1);
    return (container: container, adapter: adapter);
  }

  test('m16z: an empty newer page racing the confirmation does not overwrite '
      'the proof', () async {
    final (:container, :adapter) = await openOrphanedPointerChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    final Future<PageLoadResult> newerLoad = notifier.loadNewer();
    await _flushAsync();
    expect(adapter.afterFetchCalls, 1, reason: 'the newer page is in flight');

    adapter.releaseLatestFetch();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).hasMoreNewerMessages,
      isFalse,
      reason: 'the confirmation landed first and sealed the tail',
    );

    adapter.releaseAfterFetch();
    final PageLoadResult result = await newerLoad;
    await _flushAsync();
    expect(result.status, PageLoadStatus.empty);
    expect(
      result.hasMoreAtEdge,
      isFalse,
      reason: 'an empty page for a confirmed tail agrees with the proof',
    );
    expect(container.read(chatViewModelProvider).hasMoreNewerMessages, isFalse);
    expect(adapter.latestFetchCalls, 1, reason: 'no second probe was owed');

    await notifier.loadNewer();
    await _flushAsync();
    expect(adapter.afterFetchCalls, 1, reason: 'a sealed tail refuses');
  });

  test('m16aa: an empty newer page landing before the confirmation is '
      'corrected by it', () async {
    final (:container, :adapter) = await openOrphanedPointerChannel();
    final notifier = container.read(chatViewModelProvider.notifier);

    final Future<PageLoadResult> newerLoad = notifier.loadNewer();
    await _flushAsync();
    adapter.releaseAfterFetch();
    final PageLoadResult result = await newerLoad;
    await _flushAsync();
    expect(result.status, PageLoadStatus.empty);
    expect(
      result.hasMoreAtEdge,
      isTrue,
      reason: 'no verdict yet: the empty page stays pessimistic',
    );
    expect(adapter.latestFetchCalls, 1, reason: 'deduped onto the open probe');

    adapter.releaseLatestFetch();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).hasMoreNewerMessages,
      isFalse,
      reason: 'the confirmation commits over the pessimistic write',
    );
  });

  test('m16g: an unread open measures its newer side against the quota for ITS '
      'own limit', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(100),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(200)),
        manual: const Value(true),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(221));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(
      opened.messages.last.id,
      _snowflakeForIndex(220),
      reason: 'twenty rows newer than the ack, against a quota of twenty-five',
    );
    expect(
      opened.hasMoreNewerMessages,
      isFalse,
      reason:
          'short of the quota for the limit THIS page was fetched with, so the '
          'unread open already holds the live tail',
    );

    final String liveId = _snowflakeForIndex(221);
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'and the next message belongs on the end of it',
    );
  });

  test('m16h: an unread open whose newer side fills the quota stays '
      'detached', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(100),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(200)),
        manual: const Value(true),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(
      opened.messages.last.id,
      _snowflakeForIndex(225),
      reason: 'the newer side came back filled to its twenty-five row quota',
    );
    expect(
      opened.hasMoreNewerMessages,
      isTrue,
      reason:
          'a filled quota is a truncated page, and a pointer behind reality '
          'cannot seal a tail this window has not reached',
    );

    _emitCreated(container, id: _snowflakeForIndex(400));
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      _snowflakeForIndex(225),
      reason: 'appending across a real gap presents history as the present',
    );
  });

  test('m16i: a filtered short read does not glue a live create across the gap '
      'it hid, and loses nothing', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.add(_snowflakeForIndex(210));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    final Iterable<String> landedIds = landed.messages.map((Message m) => m.id);
    expect(
      adapter.latestFetchCalls,
      1,
      reason:
          'the install owed the window one confirmation and made it - the open '
          'was an around fetch, so this latest page is the confirmation',
    );
    expect(
      landedIds,
      isNot(contains(_snowflakeForIndex(226))),
      reason:
          'the confirmation installs NOTHING: a latest page is anchored to the '
          'channel tail, not to this window, and stitching it on would invent '
          'the continuity we are trying not to fake',
    );
    expect(
      landedIds,
      isNot(contains(_snowflakeForIndex(210))),
      reason: 'the filtered row does not exist as far as any client can tell',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          "the channel's newest visible row is not ours, so newer rows exist: "
          'this window is detached, whatever the quota suggested',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason:
          'appending it here would present the gap as continuous history; the '
          'drop is the same ignore-past-the-window rule every detached window '
          'follows, and server truth still holds the message',
    );

    for (var i = 0; i < 12; i++) {
      if (!container.read(chatViewModelProvider).hasMoreNewerMessages) {
        break;
      }
      await notifier.loadNewer();
      await _flushAsync();
    }
    final ChatViewState recovered = container.read(chatViewModelProvider);
    final List<String> recoveredIds = recovered.messages
        .map((Message m) => m.id)
        .toList();
    expect(
      recovered.hasMoreNewerMessages,
      isFalse,
      reason: 'pagination genuinely reached the tail',
    );
    expect(
      recoveredIds.last,
      liveId,
      reason: 'the create the drop deferred is now the window tail',
    );
    expect(
      recoveredIds.where((String id) => id == liveId).length,
      1,
      reason: 'exactly once: the drop is not a buffer waiting to double-apply',
    );
    expect(
      recoveredIds[recoveredIds.length - 2],
      _snowflakeForIndex(399),
      reason: 'and it sits on the real tail, not across a gap',
    );
    expect(
      recoveredIds,
      isNot(contains(_snowflakeForIndex(210))),
      reason: 'the filtered row never materialises',
    );
  });

  test('m16j: a create that lands while the confirmation is in flight is '
      'captured, not lost', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..holdLatestFetchFromCall = 1;
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(370),
    );
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      0,
      reason:
          'the around open is detached by construction, so it owes no '
          'confirmation and cannot be the one this test parks',
    );

    await notifier.loadNewer();
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'the confirmation is in flight, or this test is vacuous',
    );
    expect(
      opened.messages.last.id,
      _snowflakeForIndex(399),
      reason: 'the window ends on the tail the server had at request time',
    );
    expect(
      opened.hasMoreNewerMessages,
      isTrue,
      reason: 'the verdict is provisional until the confirmation lands',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason:
          'not applied yet: the armed confirmation holds realtime writes at '
          'ingestion, so this create is parked rather than judged against a '
          'flag that is about to change',
    );

    adapter.releaseLatestFetch();
    await _flushAsync();

    final ChatViewState settled = container.read(chatViewModelProvider);
    final List<String> settledIds = settled.messages
        .map((Message m) => m.id)
        .toList();
    expect(
      settledIds.last,
      liveId,
      reason:
          'the held create replays onto the window the confirmation installed, '
          'so it lands PASSIVELY - no user gesture, no reselect',
    );
    expect(
      settledIds[settledIds.length - 2],
      _snowflakeForIndex(399),
      reason: 'in order, directly on the confirmed tail',
    );
    expect(
      settledIds.where((String id) => id == liveId).length,
      1,
      reason: 'exactly once',
    );
    expect(
      settled.hasMoreNewerMessages,
      isFalse,
      reason:
          'and the flag is still right: the create was appended to the live '
          'tail, so the live tail is loaded and nothing newer is unloaded',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'one confirmation, no retry loop',
    );
  });

  test('m16k: a confirmation superseded by a same-channel swap writes '
      'nothing', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..holdLatestFetchFromCall = 1;
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseLatestFetch()
        ..releaseAroundFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(370),
    );
    await _flushAsync();
    await notifier.loadNewer();
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'the confirmation is in flight with a proof it wants to apply',
    );
    expect(
      container.read(chatViewModelProvider).hasMoreNewerMessages,
      isTrue,
      reason: 'provisional until the confirmation lands',
    );

    adapter.holdAroundFetch = true;
    container.read(gatewayFullRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.aroundFetchCalls,
      greaterThan(0),
      reason: 'the reconcile must really own the arm, or this is vacuous',
    );

    adapter.releaseLatestFetch();
    await _flushAsync();

    final ChatViewState afterStale = container.read(chatViewModelProvider);
    expect(
      afterStale.hasMoreNewerMessages,
      isTrue,
      reason:
          'a superseded confirmation certifies NOTHING, however exactly its '
          "proof still matches the reconcile's window tail: the flag flip is a "
          'swap-class write and it lost the token',
    );
    expect(
      afterStale.messages.last.id,
      _snowflakeForIndex(399),
      reason: "the reconcile's window stands untouched",
    );

    adapter
      ..holdLatestFetchFromCall = 0
      ..releaseAroundFetch()
      ..releaseLatestFetch();
    await _flushAsync();
    await _flushAsync();
  });
  test('m16l: pagination under a parked confirmation wins, and the stale proof '
      'certifies nothing', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..holdLatestFetchFromCall = 1;
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..holdLatestFetchFromCall = 0
        ..releaseLatestFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(370),
    );
    await _flushAsync();
    await notifier.loadNewer();
    await _flushAsync();

    final ChatViewState atA = container.read(chatViewModelProvider);
    expect(
      atA.messages.last.id,
      _snowflakeForIndex(399),
      reason: 'tail A, and the parked proof is a statement about exactly this',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'the confirmation for A is in flight, or this test is vacuous',
    );
    expect(
      atA.hasMoreNewerMessages,
      isTrue,
      reason: 'provisional, which is what enables the pagination below',
    );

    for (var i = 400; i < 456; i++) {
      adapter.messages.add(
        _messageJson(
          id: _snowflakeForIndex(i),
          channelId: _channelId,
          authorId: 'other',
        ),
      );
    }
    await notifier.loadNewer();
    await _flushAsync();

    final ChatViewState atB = container.read(chatViewModelProvider);
    expect(
      atB.messages.last.id,
      _snowflakeForIndex(449),
      reason: 'tail B: pagination moved the window, arming nothing',
    );
    expect(
      atB.hasMoreNewerMessages,
      isTrue,
      reason:
          "B's own verdict, from a full page and a fresher consult: more newer "
          'history remains',
    );

    adapter.releaseLatestFetch();
    await _flushAsync();

    final ChatViewState settled = container.read(chatViewModelProvider);
    expect(
      settled.hasMoreNewerMessages,
      isTrue,
      reason:
          "the stale proof must not overwrite B's verdict: pagination consulted "
          'the pointer with fresher data, so a proof about A is redundant here, '
          'not merely late',
    );
    expect(
      settled.messages.last.id,
      _snowflakeForIndex(449),
      reason: 'and it must not touch the window it never described',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason: 'the conservative skip does not re-confirm: one per install',
    );
  });

  test('m16m: a filtered newer page cannot certify the tail', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.addAll(<String>[
        _snowflakeForIndex(210),
        _snowflakeForIndex(230),
      ]);
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(225),
      reason: 'the around window still ends where the filtered read left it',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          'the latest page names 399 as the channel tail and ours is 225, so no '
          'row count anywhere can talk this window into believing it is live',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason: 'no gap-gluing while the window is known to be behind',
    );

    final Set<String> seen = <String>{
      ...container
          .read(chatViewModelProvider)
          .messages
          .map((Message m) => m.id),
    };
    for (var i = 0; i < 12; i++) {
      if (!container.read(chatViewModelProvider).hasMoreNewerMessages) {
        break;
      }
      await notifier.loadNewer();
      await _flushAsync();
      seen.addAll(
        container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      );
    }
    final List<String> recovered = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      seen,
      containsAll(<String>[_snowflakeForIndex(226), _snowflakeForIndex(275)]),
      reason: 'pagination fetched the rows the filtered around read hid',
    );
    expect(
      seen,
      isNot(contains(_snowflakeForIndex(230))),
      reason: 'and the filtered rows never materialise, at any point',
    );
    expect(
      seen,
      isNot(contains(_snowflakeForIndex(210))),
      reason: 'neither of them, at any point in the walk',
    );
    expect(
      container.read(chatViewModelProvider).hasMoreNewerMessages,
      isFalse,
      reason: 'the walk ended on a PROOF: the latest page names our own tail',
    );
    expect(
      recovered.last,
      liveId,
      reason: 'the create the drop deferred is the window tail now',
    );
    expect(
      recovered.where((String id) => id == liveId).length,
      1,
      reason: 'exactly once: the drop was not a buffer waiting to double-apply',
    );
    expect(
      recovered[recovered.length - 2],
      _snowflakeForIndex(399),
      reason: 'and it sits on the real tail, in order, not across a gap',
    );
  });

  test(
    'm16n: an all-filtered latest page proves nothing and fails open',
    () async {
      final _GatedDatabase database = await seedChannel(
        lastMessageId: _snowflakeForIndex(500),
      );
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value(_channelId),
          lastMessageId: Value(_snowflakeForIndex(500)),
        ),
      );
      final adapter = _MessageApiAdapter(messages: _channelMessages(400))
        ..filteredMessageIds.add(_snowflakeForIndex(210))
        ..filteredMessageIds.addAll(<String>[
          for (var i = 350; i < 400; i++) _snowflakeForIndex(i),
        ]);
      final container = _container(database, adapter);
      addTearDown(container.dispose);

      final notifier = container.read(chatViewModelProvider.notifier);
      await notifier.switchChannel(
        _channelId,
        targetMessageId: _snowflakeForIndex(200),
      );
      await _flushAsync();

      expect(adapter.latestFetchCalls, 1, reason: 'the confirmation was made');
      expect(
        container.read(chatViewModelProvider).hasMoreNewerMessages,
        isTrue,
        reason:
            'an empty latest page cannot name a newest row, so nothing is proven '
            'and the pessimistic flag stands',
      );

      await notifier.loadNewer();
      await _flushAsync();
      expect(
        adapter.latestFetchCalls,
        1,
        reason: 'no confirmation loop on the unprovable branch',
      );
    },
  );
  test('m16o: an EMPTY newer page does not seal the tail either', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.add(_snowflakeForIndex(210))
      ..filteredMessageIds.addAll(<String>[
        for (var i = 216; i < 266; i++) _snowflakeForIndex(i),
      ]);
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      _snowflakeForIndex(215),
      reason: 'the window ends where the filtered around read left it',
    );

    final int beforeScroll = adapter.latestFetchCalls;
    expect(
      beforeScroll,
      1,
      reason:
          'the ambiguous around open owed — and made — exactly one '
          'confirmation for tail 215',
    );
    await notifier.loadNewer();
    await _flushAsync();
    expect(
      adapter.afterFetchCalls,
      1,
      reason: 'the scroll really did ask for newer rows',
    );

    final ChatViewState afterScroll = container.read(chatViewModelProvider);
    expect(
      afterScroll.messages.last.id,
      _snowflakeForIndex(215),
      reason: 'the empty page moved the window nowhere, as it must not',
    );
    expect(
      afterScroll.hasMoreNewerMessages,
      isTrue,
      reason:
          'and it did NOT seal the tail: an empty body is not a statement that '
          'the channel ends here, and the confirmation says our 215 is not the '
          "channel's newest visible row",
    );
    expect(
      adapter.latestFetchCalls,
      beforeScroll,
      reason:
          'and the empty page re-paid NOTHING for the same verdict: the open '
          'already confirmed this exact (channel, tail, window generation) '
          'and a mismatch cannot age into equality while the tail sits '
          'still — repeated empty results on one cursor must not each buy a '
          'latest fetch (ledger M-AJ)',
    );

    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    final ChatViewState jumped = container.read(chatViewModelProvider);
    expect(
      jumped.messages.last.id,
      _snowflakeForIndex(399),
      reason:
          'jump-to-latest reaches the present, which a false tail would '
          'have short-circuited away',
    );
    expect(jumped.hasMoreNewerMessages, isFalse);
  });

  test('m16p: a filtered short page in a channel with NO pointer does not seal '
      'the tail', () async {
    final _GatedDatabase database = await seedChannel();
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(399)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.addAll(<String>[
        _snowflakeForIndex(210),
        _snowflakeForIndex(230),
      ]);
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(225),
      reason: 'the around window ends where the filtered read left it',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          'a channel with no pointer has proven NOTHING about its tail, and the '
          '24-row newer side is a count and not a proof: 226..399 are right '
          'there, so sealing here strands them and welds the next create on',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason:
          'and the rung owes exactly ONE confirmation - a latest page is the '
          'only proof available to it - which came back naming 399 against our '
          '215 and therefore left the flag standing',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason: 'no gap-gluing while the window is known to be behind',
    );

    final Set<String> seen = <String>{
      ...container
          .read(chatViewModelProvider)
          .messages
          .map((Message m) => m.id),
    };
    final int latestBeforeScroll = adapter.latestFetchCalls;
    await notifier.loadNewer();
    await _flushAsync();
    final ChatViewState paged = container.read(chatViewModelProvider);
    seen.addAll(paged.messages.map((Message m) => m.id));
    expect(
      paged.messages.last.id,
      _snowflakeForIndex(275),
      reason: 'the filtered after page still moved the window forward',
    );
    expect(
      paged.hasMoreNewerMessages,
      isTrue,
      reason:
          'and its 49 rows sealed nothing: pagination hit the SAME rung with the '
          'same missing pointer, and 276..400 remain',
    );
    expect(
      adapter.latestFetchCalls,
      latestBeforeScroll + 1,
      reason:
          'exactly one confirmation for that page too, and it disproved the tail',
    );

    for (var i = 0; i < 12; i++) {
      if (!container.read(chatViewModelProvider).hasMoreNewerMessages) {
        break;
      }
      await notifier.loadNewer();
      await _flushAsync();
      seen.addAll(
        container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      );
    }
    final List<String> recovered = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      seen,
      containsAll(<String>[_snowflakeForIndex(226), _snowflakeForIndex(275)]),
      reason: 'pagination fetched the rows the filtered around read hid',
    );
    expect(
      seen,
      isNot(contains(_snowflakeForIndex(210))),
      reason: 'and the filtered rows never materialise, at any point',
    );
    expect(
      seen,
      isNot(contains(_snowflakeForIndex(230))),
      reason: 'neither of them, at any point in the walk',
    );
    expect(
      container.read(chatViewModelProvider).hasMoreNewerMessages,
      isFalse,
      reason:
          'the walk ends on a PROOF and not on a count: the last page had no '
          'newer rows behind it, and the one latest fetch it owed named our own '
          'tail - the genuine-tail half of this rung, settled in one request',
    );
    expect(
      adapter.latestFetchCalls,
      3,
      reason:
          'and only the SHORT pages ever paid for one: install, the filtered '
          'page, the final page. The full pages in between are detached by '
          'construction and the rung answers them without asking the server',
    );
    expect(
      recovered.last,
      liveId,
      reason: 'the create the drop deferred is the window tail now',
    );
    expect(
      recovered[recovered.length - 2],
      _snowflakeForIndex(399),
      reason: 'and it sits on the real tail, in order, not across a gap',
    );

    final String followUpId = _snowflakeForIndex(401);
    adapter.messages.add(
      _messageJson(id: followUpId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: followUpId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      followUpId,
      reason: 'a proven tail appends live creates normally',
    );
  });

  test('m16q: a filtered short page under a pointer BEHIND the window does not '
      'seal the tail', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(250),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(399)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.addAll(<String>[
        _snowflakeForIndex(310),
        _snowflakeForIndex(330),
      ]);
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(300),
    );
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(325),
      reason: 'the around window ends where the filtered read left it',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          'a pointer behind our newest row proves the POINTER stale and nothing '
          'else; 326..399 exist and a row count must not bury them',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason:
          'one confirmation, the only proof this rung can get, and it named 399 '
          'against our 325',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason: 'no gap-gluing while the window is known to be behind',
    );

    final Set<String> seen = <String>{
      ...container
          .read(chatViewModelProvider)
          .messages
          .map((Message m) => m.id),
    };
    final int latestBeforeScroll = adapter.latestFetchCalls;
    await notifier.loadNewer();
    await _flushAsync();
    final ChatViewState paged = container.read(chatViewModelProvider);
    seen.addAll(paged.messages.map((Message m) => m.id));
    expect(
      paged.messages.last.id,
      _snowflakeForIndex(375),
      reason: 'the filtered after page still moved the window forward',
    );
    expect(
      paged.hasMoreNewerMessages,
      isTrue,
      reason:
          'and its 49 rows sealed nothing: the pointer is further behind than '
          'ever, which is still not a statement about the tail',
    );
    expect(
      adapter.latestFetchCalls,
      latestBeforeScroll + 1,
      reason:
          'exactly one confirmation for that page too, and it disproved the tail',
    );

    for (var i = 0; i < 12; i++) {
      if (!container.read(chatViewModelProvider).hasMoreNewerMessages) {
        break;
      }
      await notifier.loadNewer();
      await _flushAsync();
      seen.addAll(
        container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      );
    }
    final List<String> recovered = container
        .read(chatViewModelProvider)
        .messages
        .map((Message m) => m.id)
        .toList();
    expect(
      seen,
      containsAll(<String>[_snowflakeForIndex(326), _snowflakeForIndex(399)]),
      reason: 'pagination fetched the rows the two filtered reads hid',
    );
    expect(
      seen,
      isNot(contains(_snowflakeForIndex(310))),
      reason: 'and the filtered rows never materialise, at any point',
    );
    expect(
      seen,
      isNot(contains(_snowflakeForIndex(330))),
      reason: 'neither of them, at any point in the walk',
    );
    expect(
      container.read(chatViewModelProvider).hasMoreNewerMessages,
      isFalse,
      reason:
          'and the walk still ends cheaply on a proof: the final short page owed '
          'one latest fetch, that page named our own tail, and the pointer is '
          'still stale at 250 and no longer deciding anything',
    );
    expect(
      recovered.last,
      liveId,
      reason: 'the create the drop deferred is the window tail now',
    );
    expect(
      recovered[recovered.length - 2],
      _snowflakeForIndex(399),
      reason: 'and it sits on the real tail, in order, not across a gap',
    );

    final String followUpId = _snowflakeForIndex(401);
    adapter.messages.add(
      _messageJson(id: followUpId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: followUpId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      followUpId,
      reason: 'a proven tail appends live creates normally',
    );
  });

  test('m16r: a direct latest load proves its own tail and asks the pointer '
      'nothing', () async {
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(
      opened.messages.last.id,
      _snowflakeForIndex(399),
      reason: 'the open really did land on the channel tail',
    );
    expect(
      opened.hasMoreNewerMessages,
      isFalse,
      reason:
          "immediately, and on the load's OWN proof: no pointer was consulted, "
          'so a missing one cannot talk this window into a provisional verdict',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason:
          'ONE fetch for an ordinary channel open, exactly as before this work: '
          'a confirmation here would re-ask what the page just proved',
    );

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'and the window is live, so the create appends',
    );

    await database.channelDao.upsertChannel(
      db.ChannelsCompanion(
        id: const Value(_channelId),
        guildId: const Value('guild-1'),
        name: const Value('general'),
        lastMessageId: Value(_snowflakeForIndex(300)),
      ),
    );
    await notifier.reloadCurrentChannel();
    await _flushAsync();

    final ChatViewState reloaded = container.read(chatViewModelProvider);
    expect(
      reloaded.messages.last.id,
      liveId,
      reason: 'the reload lands on the tail server truth now has',
    );
    expect(
      reloaded.hasMoreNewerMessages,
      isFalse,
      reason:
          'a pointer 100 rows behind the page cannot make a latest load '
          'provisional either: the page is the proof, the pointer is an opinion',
    );
    expect(
      adapter.latestFetchCalls,
      2,
      reason: 'the reload itself, and no confirmation owed',
    );

    final String followUpId = _snowflakeForIndex(401);
    adapter.messages.add(
      _messageJson(id: followUpId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: followUpId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      followUpId,
      reason: 'still live after the reload, so creates keep appending',
    );
  });

  test('m16t: an all-raw-filtered EMPTY direct latest load recovers by ONE '
      'before-pointer rescue when the filtered run is shorter than the '
      'limit', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    for (var i = 350; i < 400; i++) {
      adapter.filteredMessageIds.add(_snowflakeForIndex(i));
    }
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(
      adapter.latestFetchCalls,
      2,
      reason:
          'the direct load came back empty, and the rescued tail sits under a '
          'pointer ahead of it, so the consult owes one confirmation: also '
          'empty, so it proves nothing and fails open',
    );
    expect(
      adapter.olderFetchCalls,
      1,
      reason: 'the rescue fired, and fired exactly once',
    );
    expect(
      opened.messages.map((Message m) => m.id),
      [_snowflakeForIndex(349)],
      reason:
          'the window recovered: the one visible row inside the raw reach '
          'of before=<pointer> is installed instead of a stranded empty page',
    );
    expect(
      opened.hasMoreNewerMessages,
      isTrue,
      reason:
          'a rescued window is NOT a latest-tail proof - its reach started at '
          'the pointer, not the newest bucket - so the normal consult rules, '
          'and a pointer strictly ahead of the rescued tail answers true',
    );
    expect(
      adapter.afterFetchCalls,
      0,
      reason: 'the confirmation is a latest page, never an after page',
    );
    expect(
      opened.hasMoreMessages,
      isTrue,
      reason:
          'a before page short of the limit is the post-truncation-filter '
          'ambiguity, not proof of exhaustion: older stays open',
    );
    expect(
      shouldResyncStrandedEmptyChannel(
        widgetChannelId: _channelId,
        state: opened,
        alreadyResyncedChannelId: null,
        canSyncForRoute: true,
      ),
      isFalse,
      reason: 'a recovered window is not stranded',
    );

    await notifier.loadMore();
    await _flushAsync();
    final ChatViewState paged = container.read(chatViewModelProvider);
    expect(
      paged.messages.first.id,
      _snowflakeForIndex(299),
      reason: 'pagination reaches the older visible rows the rescue unlocked',
    );
    expect(paged.messages.last.id, _snowflakeForIndex(349));

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(liveId)),
      reason: 'a create must not be welded across the unloaded newer range',
    );

    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    final ChatViewState live = container.read(chatViewModelProvider);
    expect(live.messages.last.id, liveId);
    expect(live.hasMoreNewerMessages, isFalse);
  });

  test('m16u: a filtered run at or past the limit leaves the rescue empty, '
      'seals as inherited behavior, does not re-fire, and stays live', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    for (var i = 349; i < 400; i++) {
      adapter.filteredMessageIds.add(_snowflakeForIndex(i));
    }
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState opened = container.read(chatViewModelProvider);
    expect(opened.messages, isEmpty, reason: 'the rescue reach was consumed');
    expect(
      opened.hasMoreNewerMessages,
      isFalse,
      reason: 'the empty direct latest load seals, exactly as it always has',
    );
    expect(
      opened.hasMoreMessages,
      isFalse,
      reason:
          'an EMPTY rescue page is fallen through, never adopted: the install '
          'keeps the inherited empty-page verdicts on both edges',
    );
    expect(adapter.latestFetchCalls, 1);
    expect(
      adapter.olderFetchCalls,
      1,
      reason:
          'the rescue fired once and its empty result did NOT re-fire it: '
          'no rows means no new cursor, so a retry could only repeat the '
          'same question',
    );
    expect(
      adapter.afterFetchCalls,
      0,
      reason: 'and no after-page confirmation either',
    );

    expect(
      shouldResyncStrandedEmptyChannel(
        widgetChannelId: _channelId,
        state: opened,
        alreadyResyncedChannelId: null,
        canSyncForRoute: true,
      ),
      isTrue,
      reason: 'the stranded-empty resync fires on this exact state',
    );
    expect(
      shouldResyncStrandedEmptyChannel(
        widgetChannelId: _channelId,
        state: opened,
        alreadyResyncedChannelId: _channelId,
        canSyncForRoute: true,
      ),
      isFalse,
      reason: 'and fires only once: the remembered channel id blocks a repeat',
    );

    await notifier.switchChannel(_channelId);
    await _flushAsync();
    expect(adapter.latestFetchCalls, 2, reason: 'the resync refetched');
    expect(
      adapter.olderFetchCalls,
      2,
      reason: 'one rescue per install, not a loop within one',
    );
    expect(container.read(chatViewModelProvider).messages, isEmpty);

    final String liveId = _snowflakeForIndex(400);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    final ChatViewState after = container.read(chatViewModelProvider);
    expect(
      after.messages.map((Message m) => m.id),
      contains(liveId),
      reason: 'a create appends onto the empty sealed window',
    );
    expect(after.messages.last.id, liveId);
  });

  test('m16v: a mutation acknowledged between the empty latest response and '
      'the rescue request is not overlaid onto the rescue page', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(390),
    );
    final List<Map<String, Object?>> channelMessages = _channelMessages(
      400,
      attachmentAt: 340,
    );
    channelMessages[341]['attachments'] = <Map<String, Object?>>[
      <String, Object?>{
        'id': _kAttachmentId2,
        'filename': 'doc.pdf',
        'size': 2048,
        'flags': 0,
        'url': 'https://cdn.fluxer.app/doc.pdf',
        'proxy_url': 'https://cdn.fluxer.app/doc.pdf',
        'content_type': 'application/pdf',
        'description': null,
      },
    ];
    final adapter = _MessageApiAdapter(messages: channelMessages);
    final container = _container(database, adapter);
    addTearDown(() {
      adapter
        ..releaseLatestFetch()
        ..releaseOlderFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final String editedId = _snowflakeForIndex(340);
    await notifier.goToRepliedMessage(
      messageId: editedId,
      channelId: _channelId,
    );
    await _flushAsync();
    expect(
      container
          .read(chatViewModelProvider)
          .messages
          .any((Message m) => m.id == editedId),
      isTrue,
      reason: 'the attachment message must start in the window',
    );

    for (var i = 350; i < 400; i++) {
      adapter.filteredMessageIds.add(_snowflakeForIndex(i));
    }

    adapter.holdLatestFetch = true;
    final Future<void> reload = notifier.reloadCurrentChannel();
    await _flushAsync();
    expect(adapter.latestFetchCalls, 2);

    await notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'a local description',
    );
    await _flushAsync();
    expect(adapter.attachmentRequests, <String>[
      'PATCH $_kAttachmentId=a local description',
    ], reason: 'the edit settled on the wire: the mutation is ACKNOWLEDGED');
    expect(
      notifier.pendingLocalMutationCount,
      1,
      reason:
          'the acked op is still owed protection while the primary ordinal '
          'is outstanding',
    );

    final Map<String, Object?> serverRow = adapter.messages.firstWhere(
      (Map<String, Object?> m) => m['id'] == editedId,
    );
    ((serverRow['attachments']! as List<Object?>).first!
            as Map<String, Object?>)['description'] =
        'a newer remote description';

    adapter
      ..holdOlderFetch = true
      ..releaseLatestFetch();
    await _flushAsync();
    expect(
      adapter.olderFetchCalls,
      1,
      reason: 'the rescue fired, once, after the acknowledgement',
    );

    final String secondEditedId = _snowflakeForIndex(341);
    await notifier.editAttachmentAltText(
      messageId: secondEditedId,
      attachmentId: _kAttachmentId2,
      description: 'a second local description',
    );
    await _flushAsync();
    expect(
      adapter.attachmentRequests,
      <String>[
        'PATCH $_kAttachmentId=a local description',
        'PATCH $_kAttachmentId2=a second local description',
      ],
      reason:
          'the second edit settled on the wire while the rescue is parked: '
          'its ack ordinal exceeds the rescue ordinal',
    );
    expect(
      notifier.pendingLocalMutationCount,
      2,
      reason:
          'both acked ops are owed protection while the primary and rescue '
          'ordinals are outstanding',
    );

    adapter.releaseOlderFetch();
    await reload;
    await _flushAsync();

    final ChatViewState installed = container.read(chatViewModelProvider);
    expect(
      installed.messages.first.id,
      editedId,
      reason: 'the rescue page (340..349) was adopted and installed',
    );
    final Message row = installed.messages.firstWhere(
      (Message m) => m.id == editedId,
    );
    expect(
      row.attachments.single.description,
      'a newer remote description',
      reason:
          'the rescue fetch began AFTER the acknowledgement, so its page is '
          'server truth: overlaying the stale local op here masks the newer '
          'same-field server value (ledger M-AE, the borrowed primary '
          'ordinal)',
    );
    expect(
      notifier.pendingLocalMutationCount,
      0,
      reason:
          'both ops retired once the lanes drained: no outstanding ordinal - '
          "the rescue's included - leaked to hold the boundary down. The "
          "second op's ack sits ABOVE the rescue ordinal, so a leaked "
          'rescueOrdinal (ledger M-AF) strands it at count 1',
    );
  });

  test('m16w: an unread open whose ack row was deleted still reaches the live '
      'tail', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(203),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(200)),
      ),
    );
    final adapter = _MessageApiAdapter(
      messages: _channelMessages(206)
        ..removeWhere((m) => m['id'] == _snowflakeForIndex(200)),
    );
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    final ChatViewState landed = container.read(chatViewModelProvider);
    expect(
      adapter.aroundFetchCalls,
      1,
      reason: 'the unread open builds its window around the ack',
    );
    expect(
      landed.messages.any((Message m) => m.id == _snowflakeForIndex(200)),
      isFalse,
      reason: 'the deleted ack row is not in the page',
    );
    expect(
      landed.messages.last.id,
      _snowflakeForIndex(205),
      reason: 'the page ends on the newest message the server has',
    );
    expect(
      adapter.latestFetchCalls,
      1,
      reason:
          'the pointer sits behind the window, so the tail is provisional and '
          'owes exactly one latest-page confirmation',
    );
    expect(
      landed.hasMoreNewerMessages,
      isFalse,
      reason:
          'the confirmation named 205 against our 205: this window holds the '
          'live tail, deleted anchor or not',
    );

    final String liveId = _snowflakeForIndex(206);
    adapter.messages.add(
      _messageJson(id: liveId, channelId: _channelId, authorId: 'other'),
    );
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'a create adjacent to a live-tail window must APPEND, not vanish',
    );
  });

  test('m17c: a park dies with its window — a same-channel rejump onto the '
      'same tail fetches again', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400))
      ..filteredMessageIds.add(_snowflakeForIndex(210))
      ..filteredMessageIds.addAll(<String>[
        for (var i = 216; i < 266; i++) _snowflakeForIndex(i),
      ]);
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    await notifier.loadNewer();
    await _flushAsync();
    expect(adapter.afterFetchCalls, 1, reason: 'empty page, cursor parked');

    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();

    await notifier.loadNewer();
    await _flushAsync();
    expect(
      adapter.afterFetchCalls,
      2,
      reason:
          'the rebuilt window owes its own probe of the edge: a park is '
          'scoped to the generations it was minted under (M-AK)',
    );
  });

  test('m17d: a superseded newer page leaves a live edge — released owner, '
      'no strand, next window immediately loadable', () async {
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAfterFetch();
      container.dispose();
    });

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(200),
    );
    await _flushAsync();
    final String firstTail = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;

    adapter.holdAfterFetch = true;
    final Future<void> stale = notifier.loadNewer();
    await _flushAsync();
    expect(adapter.afterFetchCalls, 1, reason: 'the stale fetch is in flight');

    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    final String swappedTail = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    expect(swappedTail, isNot(firstTail));
    expect(swappedTail, _snowflakeForIndex(399));

    adapter.releaseAfterFetch();
    await stale;
    await _flushAsync();

    final ChatViewState afterStale = container.read(chatViewModelProvider);
    expect(
      afterStale.messages.last.id,
      swappedTail,
      reason: 'the superseded page installed nothing',
    );
    expect(
      afterStale.isLoadingNewer,
      isFalse,
      reason:
          'and released its owner: supersession never strands the edge '
          '(ledger M-AL)',
    );

    await notifier.switchChannel(
      _channelId,
      targetMessageId: _snowflakeForIndex(100),
    );
    await _flushAsync();
    await notifier.loadNewer();
    await _flushAsync();
    expect(adapter.afterFetchCalls, 2);
    expect(
      compareSnowflakeIds(
            container.read(chatViewModelProvider).messages.last.id,
            _snowflakeForIndex(125),
          ) >=
          0,
      isTrue,
      reason: 'and the window actually grew: the edge is alive (M-AL)',
    );
  });
}

ProviderContainer _container(
  db.FluxerDatabase database,
  _MessageApiAdapter adapter,
) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final client = FluxerClient(dio, baseUrl: 'https://api.fluxer.app/v1');
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
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
        NoopGuildMemberHydrationService(database: database),
      ),
    ],
  );
}

void _activateViewport(ProviderContainer container) {
  container.read(chatReadViewportProvider.notifier)
    ..setViewportActive(channelId: _channelId, isActive: true)
    ..updateViewport(
      channelId: _channelId,
      nearLoadedTail: true,
      distanceFromBottom: 0,
      sampledTailId: newestServerBackedMessageId(
        container.read(chatViewModelProvider).messages,
      ),
    );
}

Future<void> _flushAsync() async {
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
  SchedulerBinding.instance.handleBeginFrame(Duration.zero);
  SchedulerBinding.instance.handleDrawFrame();
  for (var i = 0; i < 8; i++) {
    await pumpEventQueue();
  }
}

class _GatedRead {
  final Completer<void> completer = Completer<void>();
}

class _MessageDaoGate {
  final Set<String> _parked = <String>{};
  final Map<String, String> _content = <String, String>{};
  final List<_GatedRead> _reads = <_GatedRead>[];

  void hold(String messageId, {required String content}) {
    _parked.add(messageId);
    _content[messageId] = content;
  }

  int get outstanding =>
      _reads.where((_GatedRead r) => !r.completer.isCompleted).length;

  _GatedRead? register(String messageId) {
    if (!_parked.contains(messageId)) {
      return null;
    }
    final _GatedRead read = _GatedRead();
    _reads.add(read);
    return read;
  }

  String? contentFor(String messageId) => _content[messageId];

  void releaseAll() {
    _parked.clear();
    for (final _GatedRead read in _reads) {
      if (!read.completer.isCompleted) {
        read.completer.complete();
      }
    }
  }
}

class _GatedMessageDao extends MessageDao {
  _GatedMessageDao(super.attachedDatabase, this._gate);

  final _MessageDaoGate _gate;

  @override
  Future<db.Message?> getMessage(String id) async {
    final _GatedRead? read = _gate.register(id);
    if (read != null) {
      await read.completer.future;
    }
    final db.Message? row = await super.getMessage(id);
    final String? content = _gate.contentFor(id);
    if (row == null || content == null) {
      return row;
    }
    return row.copyWith(content: content);
  }
}

class _GatedDatabase extends db.FluxerDatabase {
  _GatedDatabase(super.e, this._gate) : super.forTesting();

  final _MessageDaoGate _gate;

  late final MessageDao _gatedMessageDao = _GatedMessageDao(this, _gate);

  @override
  MessageDao get messageDao => _gatedMessageDao;
}

class _MessageApiAdapter implements HttpClientAdapter {
  _MessageApiAdapter({required this.messages, this.sentMessageId = ''});

  final List<Map<String, Object?>> messages;

  final Set<String> filteredMessageIds = <String>{};

  final String sentMessageId;

  bool holdLatestFetch = false;

  int holdLatestFetchFromCall = 0;

  int latestFetchCalls = 0;

  bool failLatestFetch = false;

  Completer<void>? _latestCompleter;

  bool holdSend = false;
  Completer<void>? _sendCompleter;

  bool holdDelete = false;

  bool failDelete = false;
  Completer<void>? _deleteCompleter;

  final List<String?> patchContents = <String?>[];

  final Map<String, String> serverContent = <String, String>{};

  String _contentFor(String messageId) =>
      serverContent.putIfAbsent(messageId, () {
        final Map<String, Object?> row = messages.firstWhere(
          (Map<String, Object?> m) => m['id'] == messageId,
          orElse: () => const <String, Object?>{},
        );
        return row['content'] as String? ?? 'message $messageId';
      });

  final List<String> attachmentRequests = <String>[];

  final Map<String, List<Map<String, Object?>>> _serverAttachments =
      <String, List<Map<String, Object?>>>{};

  List<Map<String, Object?>> _attachmentsFor(String messageId) =>
      _serverAttachments.putIfAbsent(messageId, () {
        final Map<String, Object?> row = messages.firstWhere(
          (Map<String, Object?> m) => m['id'] == messageId,
          orElse: () => const <String, Object?>{},
        );
        return <Map<String, Object?>>[
          for (final Object? a
              in row['attachments'] as List<Object?>? ?? const <Object?>[])
            Map<String, Object?>.from(a! as Map<String, Object?>),
        ];
      });

  bool holdEdit = false;

  bool failEdit = false;
  Completer<void>? _editCompleter;

  bool holdAfterFetch = false;
  int afterFetchCalls = 0;
  Completer<void>? _afterCompleter;

  bool holdOlderFetch = false;
  int olderFetchCalls = 0;
  final List<Completer<void>> _olderCompleters = <Completer<void>>[];

  bool holdAroundFetch = false;

  bool failAroundFetch = false;

  int aroundFetchCalls = 0;
  Completer<void>? _aroundCompleter;

  void releaseLatestFetch() {
    holdLatestFetch = false;
    final completer = _latestCompleter;
    _latestCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseAfterFetch() {
    holdAfterFetch = false;
    final completer = _afterCompleter;
    _afterCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseOlderFetch() {
    holdOlderFetch = false;
    for (final Completer<void> completer in _olderCompleters) {
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
    _olderCompleters.clear();
  }

  void releaseFirstOlderFetch() {
    for (final Completer<void> completer in _olderCompleters) {
      if (!completer.isCompleted) {
        completer.complete();
        return;
      }
    }
  }

  void releaseAroundFetch() {
    holdAroundFetch = false;
    final completer = _aroundCompleter;
    _aroundCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseEdit() {
    holdEdit = false;
    final completer = _editCompleter;
    _editCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseSend() {
    holdSend = false;
    final completer = _sendCompleter;
    _sendCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  void releaseDelete() {
    holdDelete = false;
    final completer = _deleteCompleter;
    _deleteCompleter = null;
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
    if (RegExp(
      r'/channels/[^/]+/messages/[^/]+/ack$',
    ).hasMatch(options.uri.path)) {
      return ResponseBody.fromString('{}', 200, headers: _jsonHeaders);
    }
    final match = RegExp(
      r'/channels/([^/]+)/messages$',
    ).firstMatch(options.uri.path);
    if (options.method == 'PATCH') {
      final RegExpMatch? edited = RegExp(
        r'/channels/[^/]+/messages/([^/]+)$',
      ).firstMatch(options.uri.path);
      final String? rawBody = await _readRequestBody(
        requestStream,
        options.data,
      );
      final List<Object?> sent = _sentAttachments(rawBody);
      final String? sentContent = _sentContent(rawBody, 'content');
      if (edited != null) {
        patchContents.add(sentContent);
        attachmentRequests.add(
          'PATCH ${sent.map((Object? e) {
            final Map<String, Object?> u = e! as Map<String, Object?>;
            return u.containsKey('description') ? '${u['id']}=${u['description']}' : '${u['id']}';
          }).join(',')}',
        );
      }
      if (holdEdit) {
        _editCompleter ??= Completer<void>();
        await _editCompleter!.future;
      }
      if (failEdit) {
        return ResponseBody.fromString('boom', 500);
      }
      if (edited != null) {
        final List<Map<String, Object?>> current = _attachmentsFor(
          edited.group(1)!,
        );
        final List<Map<String, Object?>> next = <Map<String, Object?>>[
          for (final Object? entry in sent)
            () {
              final Map<String, Object?> update =
                  entry! as Map<String, Object?>;
              final Map<String, Object?> row = Map<String, Object?>.from(
                current.firstWhere(
                  (Map<String, Object?> a) => a['id'] == update['id'],
                  orElse: () => <String, Object?>{
                    'id': update['id'],
                    'filename': 'pic.png',
                    'size': 1024,
                    'flags': 0,
                    'url': 'https://cdn.fluxer.app/pic.png',
                    'proxy_url': 'https://cdn.fluxer.app/pic.png',
                    'content_type': 'image/png',
                    'description': null,
                  },
                ),
              );
              if (update.containsKey('description')) {
                row['description'] = update['description'];
              }
              return row;
            }(),
        ];
        _serverAttachments[edited.group(1)!] = next;
        _contentFor(edited.group(1)!);
        if (sentContent != null) {
          serverContent[edited.group(1)!] = sentContent;
        }
        return ResponseBody.fromString(
          jsonEncode(<String, Object?>{
            ..._messageJson(
              id: edited.group(1)!,
              channelId: _channelId,
              authorId: 'other',
              content: serverContent[edited.group(1)!],
            ),
            'attachments': next,
          }),
          200,
          headers: _jsonHeaders,
        );
      }
      return ResponseBody.fromString('Not found', 404);
    }
    if (options.method == 'DELETE') {
      final RegExpMatch? removed = RegExp(
        r'/channels/[^/]+/messages/([^/]+)/attachments/([^/]+)$',
      ).firstMatch(options.uri.path);
      if (removed != null) {
        attachmentRequests.add('DELETE ${removed.group(2)}');
      }
      if (holdDelete) {
        _deleteCompleter ??= Completer<void>();
        await _deleteCompleter!.future;
      }
      if (failDelete) {
        return ResponseBody.fromString('boom', 500);
      }
      if (removed != null) {
        _attachmentsFor(
          removed.group(1)!,
        ).removeWhere((Map<String, Object?> a) => a['id'] == removed.group(2));
      }
      return ResponseBody.fromString('', 204, statusMessage: 'No Content');
    }
    if (options.method == 'POST' && match != null) {
      final String? raw = await _readRequestBody(requestStream, options.data);
      final Map<String, dynamic> body = raw == null || raw.isEmpty
          ? <String, dynamic>{}
          : jsonDecode(raw) as Map<String, dynamic>;
      if (holdSend) {
        _sendCompleter ??= Completer<void>();
        await _sendCompleter!.future;
      }
      return ResponseBody.fromString(
        jsonEncode(
          _messageJson(
            id: sentMessageId,
            channelId: _channelId,
            authorId: 'me',
            content: body['content'] as String? ?? '',
            nonce: body['nonce'] as String?,
          ),
        ),
        200,
        headers: _jsonHeaders,
      );
    }
    if (options.method != 'GET' || match == null) {
      return ResponseBody.fromString('Not found', 404);
    }
    final before = options.uri.queryParameters['before'];
    final after = options.uri.queryParameters['after'];
    final around = options.uri.queryParameters['around'];
    final int limit =
        int.tryParse(options.uri.queryParameters['limit'] ?? '') ?? 30;

    final bool isLatestRequest =
        before == null && after == null && around == null;
    final bool snapshotAtRequestTime =
        after != null ||
        (isLatestRequest &&
            holdLatestFetchFromCall > 0 &&
            latestFetchCalls + 1 >= holdLatestFetchFromCall);
    final List<Map<String, Object?>>? snapshotPage = snapshotAtRequestTime
        ? _evaluate(before: before, after: after, around: around, limit: limit)
        : null;

    if (after != null) {
      afterFetchCalls++;
      if (holdAfterFetch) {
        _afterCompleter ??= Completer<void>();
        await _afterCompleter!.future;
      }
    }
    if (before != null) {
      olderFetchCalls++;
    }
    if (before != null && holdOlderFetch) {
      final Completer<void> completer = Completer<void>();
      _olderCompleters.add(completer);
      await completer.future;
    }
    if (around != null) {
      aroundFetchCalls++;
    }
    if (around != null && holdAroundFetch) {
      _aroundCompleter ??= Completer<void>();
      await _aroundCompleter!.future;
    }
    if (around != null && failAroundFetch) {
      return ResponseBody.fromString('boom', 500);
    }
    final bool isLatest = isLatestRequest;
    if (isLatest) {
      latestFetchCalls++;
    }
    if (isLatest &&
        (holdLatestFetch ||
            (holdLatestFetchFromCall > 0 &&
                latestFetchCalls >= holdLatestFetchFromCall))) {
      _latestCompleter ??= Completer<void>();
      await _latestCompleter!.future;
    }
    if (isLatest && failLatestFetch) {
      return ResponseBody.fromString('boom', 500);
    }
    final List<Map<String, Object?>> page =
        snapshotPage ??
        _evaluate(before: before, after: after, around: around, limit: limit);
    return ResponseBody.fromString(
      jsonEncode(page.reversed.toList()),
      200,
      headers: _jsonHeaders,
    );
  }

  List<Map<String, Object?>> _evaluate({
    required String? before,
    required String? after,
    required String? around,
    required int limit,
  }) {
    final List<Map<String, Object?>> rawWindow;
    if (before != null) {
      final older = messages
          .where((m) => _compare(m['id']! as String, before) < 0)
          .toList();
      rawWindow = older.length <= limit
          ? older
          : older.sublist(older.length - limit);
    } else if (after != null) {
      final newer = messages
          .where((m) => _compare(m['id']! as String, after) > 0)
          .toList();
      rawWindow = newer.length <= limit ? newer : newer.sublist(0, limit);
    } else if (around != null) {
      var anchorIndex = messages.indexWhere((m) => m['id'] == around);
      if (anchorIndex == -1) {
        anchorIndex = messages.indexWhere(
          (m) => _compare(m['id']! as String, around) > 0,
        );
        if (anchorIndex == -1) {
          anchorIndex = messages.length - 1;
        }
      }
      final int halfLimit = limit ~/ 2;
      final int end = (anchorIndex + halfLimit + 1).clamp(0, messages.length);
      final int start = (end - limit).clamp(0, messages.length);
      rawWindow = messages.sublist(start, end);
    } else {
      rawWindow = messages.length <= limit
          ? messages
          : messages.sublist(messages.length - limit);
    }
    if (filteredMessageIds.isEmpty) {
      return rawWindow;
    }
    return rawWindow
        .where(
          (Map<String, Object?> m) => !filteredMessageIds.contains(m['id']),
        )
        .toList();
  }

  static const Map<String, List<String>> _jsonHeaders = {
    Headers.contentTypeHeader: ['application/json'],
  };

  int _compare(String a, String b) => int.parse(a).compareTo(int.parse(b));

  @override
  void close({bool force = false}) {}
}

String? _sentContent(String? body, String name) {
  if (body == null) {
    return null;
  }
  if (body.startsWith('{')) {
    return (jsonDecode(body) as Map<String, dynamic>)[name] as String?;
  }
  return RegExp(
    'name="$name"'
    r'\r?\n\r?\n(.*?)\r?\n--',
    dotAll: true,
  ).firstMatch(body)?.group(1);
}

List<Object?> _sentAttachments(String? body) {
  if (body == null) {
    return const <Object?>[];
  }
  if (body.startsWith('{')) {
    final Object? decoded =
        (jsonDecode(body) as Map<String, dynamic>)['attachments'];
    return decoded is List<Object?> ? decoded : const <Object?>[];
  }
  final RegExpMatch? part = RegExp(
    r'name="attachments"\r?\n\r?\n(.*?)\r?\n--',
    dotAll: true,
  ).firstMatch(body);
  if (part == null) {
    return const <Object?>[];
  }
  final Object? decoded = jsonDecode(part.group(1)!);
  return decoded is List<Object?> ? decoded : const <Object?>[];
}

Future<String?> _readRequestBody(
  Stream<Uint8List>? requestStream,
  dynamic data,
) async {
  if (requestStream != null) {
    final List<Uint8List> chunks = await requestStream.toList();
    if (chunks.isEmpty) {
      return null;
    }
    final int totalLength = chunks.fold<int>(0, (int sum, c) => sum + c.length);
    final Uint8List bytes = Uint8List(totalLength);
    var offset = 0;
    for (final Uint8List chunk in chunks) {
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
