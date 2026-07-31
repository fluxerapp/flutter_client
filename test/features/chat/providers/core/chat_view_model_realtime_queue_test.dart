/// The ordered realtime apply queue.
///
/// Every mutation of `state.messages` that originates from the gateway is a
/// queue item, and so is the commit half of a wholesale window replacement.
/// These tests drive the hard interleavings through public behaviour only
/// (`switchChannel`, `loadMore`, `jumpToLatestMessages`, the realtime bus) plus
/// one seam: a message DAO that parks `getMessage` on a completer, which is the
/// database await `_nextMessagesFor` performs for the `MessageUpdated` fallback
/// and for `MessageReactionsChanged`. Parking there suspends a reducer exactly
/// where a real one suspends, so a swap, a batch or another event can be
/// ingested while it is mid-flight.
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
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
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
            guildStorageId: null,
            acknowledgedByGateway: true,
          ),
        ),
      );
}

/// Reaction changes always re-read the row from the database, which is the
/// park point these tests use.
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

/// Edits for a message that IS in the window take the event's payload and never
/// touch the database, so they carry content the DAO gate cannot forge.
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

  /// Opens the channel, pages backwards past the trim cap, then applies the
  /// scroll-end around-trim (the widget's settle path) near the oldest row,
  /// which drops the newest side and detaches the window from the live
  /// tail - the state a jump to latest replaces wholesale.
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
    notifier.trimAroundVisible(loaded.first.id);
    await _flushAsync();
    if (!c.read(chatViewModelProvider).hasMoreNewerMessages) {
      fail('window never detached from the live tail');
    }
  }

  test('m1: a swap cannot commit while a reducer is parked in the '
      'database', () async {
    // The commit half of a window replacement is a QUEUE ITEM. A reducer that
    // is parked in its database read therefore holds the commit off, instead of
    // the two writing over each other in whichever order the event loop picks.
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
    // The REST page resolves inside this flush; only the COMMIT is blocked.
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
    // The reducer entered before there was any swap to notice, so nothing
    // captured it on the way in. It resumes owing the queue a decision: writing
    // onto the window the swap is about to replace loses it outright.
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

    // Arm, and keep the page in flight so the reducer is released strictly
    // BEFORE the swap has anything to write.
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
    // The straddler is older than everything the swap held, so it goes back on
    // the queue AT ITS OWN ORDINAL rather than at either end of the list.
    // Resolving the two in the wrong order leaves the earlier revision winning.
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await detachWindow(notifier, container);

    final String tailId = _snowflakeForIndex(399);
    gate.hold(tailId, content: 'reacted');

    // A: arrives first, parks in the database read, straddles the arm.
    _emitReactions(container, id: tailId);
    await _flushAsync();
    expect(gate.outstanding, 1);

    adapter.holdLatestFetch = true;
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    // B: arrives after the arm, so it is strictly newer than A and must win.
    // Its content comes from the event payload, not from the database, so the
    // two are distinguishable no matter how the DAO answers.
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
    // The batch computes its list from a snapshot and writes once at the end.
    // Running it against the window the swap is replacing throws away every
    // create in it, because a detached window refuses live creates outright.
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
    // No swap anywhere. A reducer parks in its database read and two coalesced
    // create batches plus a later edit are ingested behind it. Unserialised,
    // all three run over the parked reducer and the reducer then resumes and
    // writes its own older revision over the edit: the LAST event to arrive is
    // the one that disappears.
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
    // A non-create flushes the buffered creates on the spot, so this is four
    // separate applications: a batch, the parking reducer, a second batch and
    // an edit whose payload needs no database read at all.
    _emitCreated(container, id: created[0]);
    _emitCreated(container, id: created[1]);
    _emitReactions(container, id: target);
    _emitCreated(container, id: created[2]);
    _emitCreated(container, id: created[3]);
    _emitUpdated(container, id: target, content: 'edited');

    await _flushAsync();

    // Anti-vacuity: everything after the reaction really was ingested while the
    // reaction sat parked, and the queue held all of it behind that reducer.
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
    // state.messages has writers the queue does not own: pagination, optimistic
    // sends, edits and deletes. A queued reducer must therefore commit a list
    // derived from state as it is when the reducer WRITES, not as it was when
    // the reducer entered, or the user's own message disappears the moment a
    // reaction happens to be parked in its database read.
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

    // A writer the queue does not own, landing squarely inside the park.
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
    // The batch path is the one that used to carry a base across awaits, and
    // the reason it looked safe was that the create reducer touches no
    // database. That is an invariant nothing enforced. Gate the message DAO on
    // the batch's own ids: the shipped batch never reads it and commits
    // atomically, while any batch that reduces against a carried base parks
    // mid-loop right here, lets the send land, and then erases it.
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

    // A writer the queue does not own, landing while the batch is between
    // creates for anything that reduces against a carried base.
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
    // The worker returns the instant a swap arms, so everything enqueued during
    // the swap sits in the queue with nobody running. Clearing the barrier is
    // the eligibility transition that has to wake it: a swap that dies without
    // committing must not leave its events stranded until unrelated later
    // traffic happens to pump the queue.
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

    // A message that is IN the detached window, edited by an event whose
    // payload needs no database read: the reduction is pure, so the only thing
    // this test can fail on is the wakeup.
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

    // The swap dies here: its page fails, so it disarms without ever
    // committing. NOTHING is emitted after this point, so only the disarm
    // itself can get the queue moving again.
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
    // A commit is validated where it is ENQUEUED, but it runs later, behind
    // whatever reducer was mid application. A newer jump can arm in that gap.
    // Executing the older commit anyway installs the page for a message the
    // user has already navigated away from, scrolls to it, and if the newer
    // swap then dies and disarms, that stale window is what sticks.
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(container.dispose);

    final notifier = container.read(chatViewModelProvider.notifier);
    await notifier.switchChannel(_channelId);
    await _flushAsync();

    // Far apart, so the two around-windows are disjoint from each other and
    // from the tail window the channel opened on.
    final String targetA = _snowflakeForIndex(50);
    final String targetB = _snowflakeForIndex(300);

    // Transient states matter here: asserting only the final window would miss
    // a superseded write that lands and is then overwritten by the winner.
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

    // Park the worker so any commit has to queue behind it.
    final String parked = container
        .read(chatViewModelProvider)
        .messages
        .last
        .id;
    gate.hold(parked, content: 'reacted');
    _emitReactions(container, id: parked);
    await _flushAsync();
    expect(gate.outstanding, 1, reason: 'the worker must be parked');

    // A runs to the point of committing, and its commit lands in the lane.
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

    // B supersedes A: generation bump plus a fresh arm, all while the worker is
    // still parked and A's commit is still waiting.
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
    // switchChannel bumps the switch generation unconditionally, but its
    // loadMessages:false branch writes the new channel's state directly and
    // returns without arming anything. A commit queued before it therefore
    // still holds the armed token: a token-only gate lets it through and it
    // wholesale-writes channel-1's page into the channel the user just opened.
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

    // Supersede with NO arm at all.
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
      // The channel id never changes here, so a channel check cannot see it
      // either. Only the caller's own generation predicate can.
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
    // The commit's own write is what wakes the superseding intent here: the
    // state listener fires before the awaiting caller resumes, so the switch
    // generation moves in the microtask BETWEEN commit.done completing and
    // jumpToLatestMessages continuing. applied is already true and stale.
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
          // Real API, no test hook: this bumps the switch generation
          // synchronously, before its first await.
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
    // The payload twin of the validity work. The commit is entirely legitimate
    // when it runs: token current, generation current, channel current. Its
    // DATA is what is stale, because the merge against local state ran before
    // the lane wait and the user sent a message during it.
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

    // Held open so the row is still an unsent local message at write time,
    // which is exactly the shape the merge is supposed to preserve.
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
    // m10 through the OTHER wholesale-write site. jumpToLatestMessages
    // composes its list inside the commit closure and m10 kills the pre-lane
    // twin there; _refreshMessagesFromNetwork has the same shape - a merge
    // computed on a pre-lane snapshot purely to derive the consult and
    // hydration, and a commit closure that re-reduces against the window as
    // it stands at write time. Committing the pre-lane merge instead survives
    // every jump-site test, because the jump never runs this closure; only a
    // send landing while a REFRESH commit waits in the lane can tell the two
    // apart, and that is exactly this fixture.
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

    // Held open so the row is still an unsent local message at write time,
    // which is exactly the shape the write-time reduction must preserve.
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
    // A pending delete has no representation a fresh read can recover: the row
    // is simply absent, and the page, fetched before the server saw the delete,
    // puts it straight back. Only the pending-mutation overlay catches this.
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

    // In the tail page the jump is about to install, not in the detached
    // window: the page is the only thing that can put it on screen.
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

    // Cleanup: once the request settles the overlay entry must go, or the
    // message is hidden forever. Jumping to the very id that was filtered out
    // isolates the overlay: the fake server still serves it, so the only thing
    // that can keep it off screen now is a leaked tombstone.
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
    // The sharpened case. The delete is SERVER CONFIRMED before the queued
    // commit ever runs, so anything that retires the tombstone at request
    // completion consults an empty log and lets the older page reinstate a
    // message the server has already deleted.
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

    // Starts AND finishes while the commit waits in the lane.
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
    // Client start order cannot order server visibility. The delete STARTS
    // first and is still in flight when the fetch STARTS, so a start-order
    // comparison concludes the page is newer and skips the overlay, while in
    // truth the page reached the server first and carries the pre-delete row.
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

    // 1. the mutation starts and stays pending
    adapter.holdDelete = true;
    final Future<void> deletion = notifier.deleteMessage(deletedId);
    await _flushAsync();

    // 2. the fetch starts AFTER it, and its commit queues behind the reducer
    final Future<bool> jump = notifier.jumpToLatestMessages();
    await _flushAsync();

    // 3. only now does the server acknowledge
    adapter.releaseDelete();
    await deletion;
    await _flushAsync();

    // 4. and only now does the stale page get to write
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

  test('m10c-ack: a completed edit still beats an older page in the '
      'lane', () async {
    // Edit twin of m10b-ack: the edit is server confirmed before the older
    // page commits, and retiring the revision at request completion lets the
    // page's pre-edit copy overwrite it.
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

    // Starts AND finishes while the older page waits in the lane.
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

  test('m10g: an overlay operation leaves fields it never touched '
      'alone', () async {
    // The page row carries a NEWER remote text edit AND the pre-delete
    // attachment. Substituting a stored whole-message revision would take the
    // attachment off correctly and revert the text along with it, because the
    // revision owns every field. The operation only owns the attachment.
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

    // A page whose fetch BEGINS before the acknowledgement, so the overlay is
    // in force for it, and which is served only after everything else happens.
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

    // Somebody else edits the TEXT of the same message, server side, after our
    // attachment removal was acknowledged. The still-held page picks it up.
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
    // The request outlives the window it was issued against. An index captured
    // before the switch either points at a different row or past the end of a
    // shorter one, and restoring an old channel's message into the new channel
    // is wrong even when the index happens to be in range.
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
    // Same request, same window, but the window grew underneath it. The
    // captured index now names a different message, so an index-based restore
    // overwrites that row with a copy of the edited one.
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

    // Prepend a page: every index in the window shifts.
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
    // One message, two attachments, two different operations outstanding at
    // once. A log that keeps one slot per message would drop whichever lost
    // the race. They now settle in issue order, because the transport forces
    // serialisation, but both are recorded from the moment they are issued.
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

    // A page whose fetch begins before either acknowledgement.
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

    // Issue order, the only order the queue allows. The edit is not even on
    // the wire yet, so releasing it first would release nothing.
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
    // loadMore is a page-producing fetch. Unregistered, it is invisible to
    // retirement, so an acknowledged tombstone is dropped while its page is
    // still in flight, and the page then reinstates the message. Registering
    // the fetch is what makes the overlay reachable at all.
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

    // In the older page loadMore is about to fetch, not in the window.
    final String deletedId = _snowflakeForIndex(340);
    expect(
      container.read(chatViewModelProvider).messages.map((Message m) => m.id),
      isNot(contains(deletedId)),
    );

    adapter.holdOlderFetch = true;
    final Future<void> older = notifier.loadMore();
    await _flushAsync();

    // Acknowledged while that page is still in flight.
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
    // Same two holes as pagination, on a fetch that lives outside
    // loadMore/loadNewer entirely.
    final _GatedDatabase database = await seedChannel();
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    final container = _container(database, adapter);
    addTearDown(() {
      adapter.releaseAfterFetch();
      container.dispose();
    });

    // An ack strictly inside the loaded window is what triggers the boundary
    // load; the row it will resurrect sits after that ack.
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
    // Every post-await guard here used to be a channel check. A jump replacing
    // the window in the SAME channel leaves the fetched rows describing a
    // window that no longer exists.
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

    // Same channel, wholesale replacement: the around window lands far from
    // the tail the boundary rows belong to.
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
    // The dimension neither window counter can see: switchChannel's targeted
    // branch blanks the window synchronously in the SAME channel. It is a
    // direct write, not a swap commit, and it bumps only the switch
    // generation, so channelId, _windowGeneration and _windowWrites all still
    // match when the boundary fetch returns.
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

    // Same channel, targeted: the window blanks on the spot and its load is
    // held, so the boundary rows come back to an EMPTY window.
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
    // Inverted sibling of the isLoading wedge: instead of holding its own flag
    // down forever, a stale request clears somebody else's. B is then running
    // with its busy flag false, so a third load can start on top of it, which
    // is exactly the overlap the flag exists to prevent.
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

    // Same channel, no load: keeps the window and RESETS the busy flag.
    await notifier.switchChannel(_channelId, loadMessages: false);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoadingMore,
      isFalse,
      reason: 'the switch reset the flag, so a new pagination may start',
    );

    // Move the window anchor so B issues a genuinely distinct request rather
    // than being deduplicated onto A's in-flight future. Dropping the row from
    // the store as well keeps B off the cache path, which would otherwise
    // satisfy it synchronously and defeat the interleave.
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

    // A returns to a window whose anchor moved: superseded.
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
    // Adjudicates whether a pagination completing while another is in flight
    // should install or go inert. It installs: both helpers recompute from a
    // FRESH window and only the anchor proves adjacency, so the two pages are
    // independent and both are genuinely valid.
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
    // A small detached window: both sides open, and far enough under the trim
    // cap that neither install can drop the other's anchor.
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

    // The older page lands while the newer one is still out.
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
    // The reachable-but-unobserved case behind the install-vs-inert
    // adjudication: a same-channel no-load switch resets the busy flag while
    // KEEPING the window, and no second pagination ever starts. A returns
    // anchor-intact and its page is valid, so it must land. Without this pin,
    // a plausible hardening that skips the install when the flag is down would
    // silently discard pages the user scrolled for, with the suite green.
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

    // Resets the flag, keeps the window, starts nothing.
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

    // _contiguity.extendOlder is not observable in this shape: the store holds
    // nothing older than the page A just installed, so the next load goes to
    // the network whether or not contiguity was extended. The install, the
    // flags and the ordering above are what the inert policies change.
  });

  test("m14: a superseded jump to latest does not clear its successor's sync "
      'flag', () async {
    // Flag-ownership twin of m12, one flag over and one operation over. A jump
    // to latest is preempted by a same-channel around jump, which sets
    // isSyncingMessages for ITSELF. A then resumes, finds itself superseded and
    // runs its finally while B is still fetching: a clear gated only on the
    // channel id matches, so it drops B's flag and every dedup guard and busy
    // gate reads the channel as idle for the rest of B's run.
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

    // B is same-channel, so no channel check can tell the two apart. Target the
    // oldest row the window does NOT hold, so B has to fetch instead of
    // scrolling to something already loaded, and its own arm is what
    // supersedes A.
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

    // A comes back to a window that moved under it and reaches its finally
    // while B is still parked in its fetch.
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
    // The m12c lesson one flag over: the SAFE half of the ownership rule needs
    // pinning too. _jumpToLatestActive is a mutex, not a busy flag, and the
    // entry guard means no successor can ever own it, so a superseded jump must
    // ALWAYS clear it. Symmetry-gating it like the isSyncingMessages line below
    // it looks like the same hardening and instead wedges jump-to-latest shut
    // for the rest of the channel's life, with every other test still green.
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

    // Same interleave as m14: A is held, B supersedes it in the same channel.
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

    // B installed an around window, so the tail is still off screen and a jump
    // is the only way back to it.
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
    // The reconcile is the repair path for a stale window after session
    // recovery, and it had both halves of the ownership bug at once. It must not
    // report success on a page it never installed, because the mark suppresses
    // the NEXT resync and the stale window then outlives the recovery it exists
    // to repair; and it must not clear the busy flag of the jump that
    // superseded it. _refreshMessagesFromNetwork returns NORMALLY when
    // superseded, so neither half can be read off control flow or a channel id.
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
    // A detached window: the reconcile preserves it and fetches AROUND it, which
    // also keeps its gate independent of the jump's latest-page gate.
    await detachWindow(notifier, container);

    // A is the real recovery path: production bumps this on gateway
    // READY/RESUMED and the view model reconciles off the listener.
    adapter.holdAroundFetch = true;
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
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

    // B supersedes A by bumping the window generation. It sets the flag for
    // itself, and it is already true, which is exactly why a channel check
    // cannot tell the two owners apart.
    adapter.holdLatestFetch = true;
    final Future<bool> b = notifier.jumpToLatestMessages();
    await _flushAsync();

    // A returns to a window that is no longer its own and installs nothing.
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

    // The mark itself is private, but the machinery that reads it is not: a
    // same-channel switch resyncs only while the channel is NOT marked
    // reconciled for the current recovery generation. A mark from the
    // superseded reconcile silences that resync, and the stale window stays.
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
    // reloadCurrentChannel passes no shouldApplyResult, so this refresh's
    // shouldApply predicate is the window generation ALONE. A same-channel
    // no-load switch supersedes it by bumping the SWITCH generation while
    // keeping the window and writing its own flags, which that predicate cannot
    // see. The refresh then fails, and its cleanup raises a banner and clears
    // busy flags over state owned by an operation that never failed.
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

    // A fails only now, long after it stopped owning any of this.
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
    // Refresh-vs-refresh supersession bumps NO generation. The second refresh's
    // arm silently replaces the first's token, and that IS the whole difference
    // between them, so no generation predicate can separate the two. A recovery
    // reconcile and a manual retry are two such refreshes on one channel, and
    // retry has no busy-entry guard by design, so the overlap is reachable
    // straight from the UI.
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

    // A: the recovery reconcile, arming and then parked in its window-preserving
    // around fetch, rigged to fail when released.
    adapter
      ..holdAroundFetch = true
      ..failAroundFetch = true;
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.aroundFetchCalls,
      greaterThan(0),
      reason: 'A must really be in flight, or this is vacuous',
    );
    expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

    // B: a manual retry on the SAME channel. Re-arming is the only trace it
    // leaves of superseding A; it raises its own spinner.
    adapter.holdLatestFetch = true;
    final Future<void> b = notifier.retryLoadMessages();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoading,
      isTrue,
      reason: 'B owns the spinner now',
    );

    // A fails, after B has taken the arm.
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

    // B finishes normally and owns every flag it raised.
    adapter.releaseLatestFetch();
    await b;
    await _flushAsync();
    final ChatViewState end = container.read(chatViewModelProvider);
    expect(end.isLoading, isFalse, reason: 'the owner clears its own spinner');
    expect(end.errorMessage, isNull);
    expect(end.messageLoadFailed, isFalse);
    // A retry installs a fresh latest page wholesale, so it is the tail that
    // proves the install, not the count: its page size is smaller than the one
    // the channel opened with.
    expect(end.messages, isNotEmpty);
    expect(
      end.messages.last.id,
      _snowflakeForIndex(399),
      reason: "B's own page installed",
    );
  });

  test('m15d: a superseded tail recovery does not scroll to bottom - the '
      'signal belongs to the install that applied', () async {
    // The recovery reconcile scrolls to the tail when the reader sits at the
    // loaded tail - but only on the install that applied. A same-channel
    // sibling supersedes through the arm token ALONE (no generation moves),
    // so a scroll gated on generations - a bare stillOurs() recheck - fires
    // for a refresh that installed nothing. This pins exactly that, plus the
    // ordinary winner path: superseded-before-commit never scrolls, applied
    // scrolls once. It does NOT distinguish WHEN the applied path scrolls;
    // the post-install ordering (commit-time callback vs a flag checked
    // after the refresh's later awaits) has no deterministic seam here.
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

    // The reader sits at the loaded tail, so the reconcile takes the direct
    // latest-tail branch - the only branch that scrolls on install.
    container
        .read(chatReadViewportProvider.notifier)
        .updateViewport(
          channelId: _channelId,
          nearLoadedTail: true,
          distanceFromBottom: 0,
          viewportHeight: 600,
          sampledTailId: null,
        );
    await _flushAsync();
    expect(container.read(chatReadViewportProvider).nearLoadedTail, isTrue);

    final int signalBefore = container
        .read(chatViewModelProvider)
        .scrollToBottomSignal;
    final int fetchesAfterOpen = adapter.latestFetchCalls;

    // A: the recovery reconcile, armed and parked in its latest fetch.
    adapter.holdLatestFetch = true;
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.latestFetchCalls,
      fetchesAfterOpen + 1,
      reason:
          'A took the direct latest-tail branch and is in flight, or this '
          'is vacuous',
    );
    expect(container.read(chatViewModelProvider).isSyncingMessages, isTrue);

    // B: a manual retry on the SAME channel takes the arm from A. No
    // generation moves; the token swap is the only trace. B's identical
    // latest request coalesces onto A's parked response in the repository,
    // so the wire count stays flat - the spinner is the proof B entered.
    final Future<void> b = notifier.retryLoadMessages();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).isLoading,
      isTrue,
      reason: 'B owns the spinner now - it armed over A, or this is vacuous',
    );

    // Both parked fetches complete together; only B's commit owns the arm.
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

    // The same recovery WITHOUT a sibling applies, and the guarded
    // post-commit callback is what scrolls: exactly one bump.
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).scrollToBottomSignal,
      signalBefore + 1,
      reason: 'the install that applied owns the scroll',
    );
  });

  test('m13: a failed removal leaves the next operation on the confirmed '
      'baseline', () async {
    // The failure leg of the serialised queue. A is held and will fail; B is
    // issued behind it. When A fails there is no inverse to apply: the
    // optimistic row is re-derived as confirmed + whatever is still queued, so
    // A's attachment simply comes back. B then dispatches against the
    // ORIGINAL confirmed row, both attachments included, and lands.
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

    // A: remove the second attachment. Held, and it will fail.
    adapter
      ..holdDelete = true
      ..failDelete = true;
    final Future<void> opA = notifier.deleteMessageAttachment(
      messageId: messageId,
      attachmentId: _kAttachmentId2,
    );
    await _flushAsync();

    // B: alt text on the OTHER attachment of the same message. Queued behind
    // A, so it is not on the wire yet.
    final Future<void> opB = notifier.editAttachmentAltText(
      messageId: messageId,
      attachmentId: _kAttachmentId,
      description: 'B description',
    );
    await _flushAsync();
    expect(
      adapter.attachmentRequests,
      <String>['DELETE $_kAttachmentId2'],
      reason: 'B must wait for A to settle before it touches the wire',
    );

    // A now fails; B dispatches behind it.
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
    // The transport pin. `deleteAttachment` is a targeted DELETE, but
    // `editMessageAttachments` PATCHes the WHOLE array. Run them at once and
    // the edit's array - built while the delete is still in flight - still
    // lists the deleted attachment, so the server RE-CREATES it after the
    // delete confirmed. No client-side rollback can undo that, so the client
    // must not create the race: one request per message at a time, each built
    // at dispatch time from the row the server last confirmed.
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
    expect(
      row.attachments.map((Attachment a) => a.id),
      <String>[_kAttachmentId],
      reason: 'the canonical row the edit returned is the new baseline',
    );
    expect(row.attachments.single.description, 'alt for one');
    expect(
      notifier.pendingLocalMutationCount,
      0,
      reason: 'both operations retired',
    );
  });

  test('m13d: an attachment edit transmits no content', () async {
    // Field ownership, one layer down, on the wire. The endpoint accepts
    // `content` on the same PATCH that rewrites the attachment array, so an
    // alt-text op that fills the field in ships a value it merely READ. The
    // per-message queue serialises OUR requests; it cannot serialise against
    // another client, so a remote edit landing while our request is in flight
    // is overwritten by the text we sent. The only defence is to send nothing
    // this operation owns, and the SDK omits the part when the argument is
    // null.
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

    // Another client edits the text while our request is in flight: server
    // side, and on the bus, which is how it reaches this window.
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
    // The other direction, and it is load-bearing: once the server has
    // confirmed the mutation, a fetch begun later is guaranteed to reflect it.
    // Overlaying that page would mask server truth forever, so a
    // delete-then-recreate could never come back.
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

    // An older page operation, held open for the whole test, so the log cannot
    // retire the entry before the assertion and the ordinal comparison is what
    // is actually under test.
    adapter.holdAroundFetch = true;
    final Future<void> holder = notifier.goToRepliedMessage(
      messageId: _snowflakeForIndex(120),
      channelId: _channelId,
    );
    await _flushAsync();

    await notifier.deleteMessage(recreatedId);
    await _flushAsync();

    // A fetch that BEGINS after the acknowledgement. Its page is server truth.
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
    // An optimistic edit is a REPLACEMENT, and mergeMessagesSorted gives the
    // fetched page precedence over the local row, so a fresh read alone still
    // loses it. The overlay re-applies the local revision after the merge.
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

    // An around page that OVERLAPS the current window, so the page carries its
    // own pre-edit copy of the edited message.
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

    // Cleanup: once the edit settles the overlay entry must go, or the local
    // revision is pinned over every future page forever. A fresh page install
    // must show server truth again.
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

  // TAIL-SEMANTICS MUTATION LEDGER, and it is only worth anything while it
  // matches reality: every row below was re-verified by applying the mutation to
  // the source and running this file (plus, where named,
  // test/features/chat/utils/message_page_sync_test.dart and
  // test/features/chat/domain/message_window_test.dart). Re-run it after
  // touching the pointer-consult ladder, the tail confirmation, the around-quota
  // helper or applyNewerPage. The one rule the whole family defends: COUNTS ARE
  // HINTS, ONLY PROOFS SEAL hasMoreNewerMessages.
  //
  //   M-A  equality rung fails open (returns true)          -> m16c
  //   M-B  equality rung goes provisional                    -> m16c
  //   M-C  loaded-pointer rung seals                         -> NOT KILLABLE, and
  //        not a coverage hole: the rung is unreachable. Its only caller passes
  //        the merged window's ids together with that window's newest
  //        server-backed id, so a pointer IN the window can never be strictly
  //        ahead of it. No test in test/features/chat executes the branch (probed
  //        by throwing inside it).
  //   M-D  cached-pointer rung seals                         -> m16s
  //   M-E  detachedWindow rung deleted                       -> m16, m16j, m16n
  //   M-F  goToRepliedMessage hardcodes detachedWindow: true -> m16f
  //   M-G  quota drops the anchor-present requirement        -> quota unit test
  //   M-H  quota boundary <= instead of <                    -> quota unit, m16e,
  //        m16, m16j
  //   M-I  quota derives `limit` instead of `limit ~/ 2`     -> quota unit, m16e,
  //        m16, m16j
  //   M-J  quota reverts to zero-newer                       -> quota unit, m16e,
  //        m16d, m16f, m16g, m16i, m16n, m16p, m16q
  //   M-K  install-site consult limit hardcoded              -> m16g
  //   M-L  ack rung claims the tail outright                 -> m16i, m16j, m16k,
  //        m16l, m16m, m16n, m16o
  //   M-M  no rung ever asks for a probe                     -> m16d, m16f, m16g,
  //        m16i, m16j, m16k, m16l, m16m, m16n, m16o, m16p, m16q
  //   M-N  confirmation gutted (never writes)                -> m16d, m16f, m16g,
  //        m16i, m16j, m16m, m16p, m16q
  //   M-O  confirmation never fired at any install site      -> m16d, m16f, m16g,
  //        m16i, m16j, m16k, m16l, m16m, m16n, m16o, m16p, m16q
  //   M-P  unarmed bare fetch plus a direct flag write       -> m16j, m16k
  //   M-Q  armed-swap capture inverted                       -> m16j, as a HANG:
  //        the realtime worker never drains, so the run never completes rather
  //        than failing an assertion. Detected, but read the timeout as the kill.
  //   M-R  flag flip bypasses the commit lane                -> m16k
  //   M-S  confirmation gate drops the anchor-identity clause-> m16l, alone
  //   M-T  confirmation reverts to an after-page short count -> m16i, m16j, m16k,
  //        m16l, m16m, m16n, m16o, m16p, m16q
  //   M-U  loadNewer seals on a short-page count             -> m16j, m16k, m16l,
  //        m16m, m16o, m16p, m16q
  //   M-V  loadNewer never fires the confirmation it owes    -> m16i, m16j, m16k,
  //        m16l, m16m, m16p, m16q (m16o moved to the dedupe row M-AJ: its
  //        empty page now re-uses the open's verdict by design)
  //   M-W  applyNewerPage seals on an empty page             -> m16o, plus the
  //        message_window reducer contract test
  //   M-X  null-pointer rung returns detachedWindow verbatim -> m16p
  //   M-Y  behind-pointer rung returns detachedWindow verbatim -> m16q
  //   M-Z  a direct latest load consults the pointer instead of standing on its
  //        own proof                                         -> m16b, m16r
  //   M-AA the refresh commit installs its pre-lane merge    -> m10f, alone:
  //        the m10 family kills the identical mutation only at the
  //        jump-to-latest site, whose closure the refresh path never runs
  //   M-AB an empty direct latest load fails open (true)     -> m16u, plus the
  //        unread suite's "opening an empty channel clears unread" test
  //   M-AC the before-pointer rescue is deleted               -> m16t: the
  //        window stays empty, so the recovery assertions (rescue fired once,
  //        row 349 installed, pagination reaching 319) all fail
  //   M-AD an EMPTY rescue page is adopted instead of fallen through
  //        (rescued=true on empty)                            -> m16u: adoption
  //        flips hasMoreMessages to true on the sealed-empty install
  //   M-AE the rescue install borrows the PRIMARY's fetch ordinal (the
  //        shipped code: effectiveFetchOrdinal never reassigned) -> m16v: a
  //        mutation acked between the empty latest response and the rescue
  //        request sits between the two ordinals, so the overlay reads the
  //        post-ack rescue page as pre-ack and stamps the stale alt-text op
  //        over the newer same-field server value
  //   M-AF the rescue's _endPageFetch is deleted (rescueOrdinal leaks
  //        outstanding forever)                             -> m16v: the second
  //        edit acks while the rescue is PARKED, so its ack ordinal exceeds
  //        the rescue's; the leaked ordinal pins the retirement boundary
  //        below that ack and the op is stranded - the final
  //        pendingLocalMutationCount expects 0, gets 1. (The FIRST op alone
  //        cannot see this leak: its ack predates the rescue ordinal, so any
  //        boundary the leaked ordinal yields still satisfies it.)
  //
  //   --- Stage A of the history-pagination redesign: the PAGINATION PROGRESS
  //   ledger. The parked-cursor half (edge parks, cursor identity, gesture
  //   re-arm: M-AG, M-AH, M-AI) moved out of the VM into
  //   MessagePaginationCoordinator, and its contracts - the old m17/m17b
  //   tests - are pinned by message_pagination_coordinator_test.dart. What
  //   remains VM-owned keeps the same verification protocol:
  //   M-AJ  tail-probe dedupe deleted (every empty install on one tail
  //         re-pays a full latest fetch)                     -> m16o
  //   M-AK  a window's edge state outlives it (the epoch/generation keys
  //         dropped from in-flight page supersession)        -> m17c
  //   M-AL  the superseded-newer-page path strands its owner (both releases
  //         dropped: isLoadingNewer survives the jump swap's copyWith and
  //         wedges the edge)                                 -> m17d

  test('m16: a search jump into a channel not yet opened this session leaves '
      'the live tail reachable', () async {
    // The cold-channel repro, and the whole point is what a COLD channel really
    // contains. READY seeds every guild channel row's last_message_id
    // authoritatively and every read state from the same snapshot, for channels
    // this session never opened as much as for the ones it did; what it does
    // NOT seed is the message cache. So a search result that jumps into an
    // unopened channel builds its window AROUND the hit with the pointer ahead
    // of that window, the pointer's own row absent from the cache, and the ack
    // at or past the hit. Read that as "this window is the live tail" and all
    // three device symptoms follow at once: jump-to-latest short-circuits,
    // loadNewer refuses, and the next MESSAGE_CREATE is stitched onto the far
    // side of the gap. A warm channel differs in exactly one respect, and it is
    // the one that saves it: opening it cached its tail row, so the pointer
    // lookup hits and the window is correctly reported as detached.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    // Read to the end, which is the harshest version and the common one. Unread
    // takes the same branch: any ack at or past the searched message does.
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
    // No prior switchChannel to this channel: the jump is the session's first
    // contact with it, so nothing has cached a single one of its messages.
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

    // Symptom 3, and the destructive one: a gateway create belongs to the tail,
    // not to the far side of the gap this window ends at.
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

    // Symptom 2: scrolling toward newest must actually page forward.
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

    // Symptom 1: the jump button has to do a jump.
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
    // The other half of the m16 adjudication, and the reason the fix keys on how
    // the window was BUILT rather than on the pointer lookup alone. A deleted
    // tail leaves last_message_id pointing at a message no fetch will ever
    // return, and reading that orphan as unloaded newer history keeps a permanent
    // phantom jump button on a live channel and suppresses auto-ack for good,
    // with m16 still green.
    //
    // The open settles it WITHOUT asking about the pointer at all, and that is
    // the point of this fixture now: a non-empty latest page's newest row is the
    // channel's newest visible row, so a direct latest load proves its own newer
    // edge and an orphaned pointer has nothing to add. Contrast m16i, where the
    // very same pointer signature arrives on an around page that carries no such
    // proof and therefore does owe a confirmation.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    // Acked to the pointer, not to the last real message: the live-tail ack
    // targets max(visibleTail, channel pointer), so acking a channel whose tail
    // was deleted lands exactly here. It also keeps the channel READ, which is
    // what makes the open a tail-built one rather than an around-unread jump.
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

    // No confirmation loops: the proof left the flag false, and that is the
    // condition loadNewer refuses on, so nothing can re-arm.
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
    // The branch m16 does NOT travel, pinned so the m16 fix cannot be widened
    // into it. Pointer EQUAL to the around page's newest row is the one
    // pointer comparison that still proves liveness, because the row pointer
    // advances on every MESSAGE_CREATE in every channel, visited or not
    // (MessageWriteBatcher.enqueueMessage records last_message_id per channel
    // unconditionally). Equality therefore means the around page ended on the
    // newest message the server has told us about, and the common unread open
    // rides on it: switchChannel builds its window AROUND the ack, that window
    // normally contains the tail, and failing this branch open would leave
    // every such channel showing a phantom jump button with auto-ack
    // suppressed until the user scrolled.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(215),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(215)),
      ),
    );
    // A channel whose newest message really is 215, so the around page for 200
    // ends exactly on the pointer.
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

    // The consequence that makes the reading safe: there is no gap, so a live
    // message belongs on the end of this window.
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
    // The bug the m16 fix created on its way past, and the more dangerous of
    // the two. The server fills an around window's newer side INDEPENDENTLY,
    // up to limit / 2 rows (shard_impl.rs::around_window_limits), so an anchor
    // sitting 1..limit/2 - 1 rows behind the live tail comes back with a newer
    // side SHORT of that quota -- which is the server saying the newer side is
    // exhausted, the same short-page report the latest path already trusts.
    // Read "any newer row at all" as centred-and-truncated and this window,
    // which really does hold the tail, is declared detached: the next
    // MESSAGE_CREATE is DROPPED at the hasMoreNewerMessages guard and never
    // appears at all, auto-ack stays blocked, and a jump button appears with
    // nowhere to jump to. Silently losing live messages is strictly worse than
    // the stranding m16 fixed, so the newer count is measured against the
    // quota rather than against zero.
    //
    // 206 messages, an anchor at 200: five rows newer, against a quota of 25
    // (limit 50 ~/ 2) for the targeted switch. The pointer is an orphan far
    // ahead, so
    // the verdict cannot come from pointer equality -- the detached rung is
    // the only thing standing between this window and the tail.
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
    // Cold channel again: the jump is this session's first contact with it, so
    // no cached row can answer for the orphaned pointer.
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

    // The symptom that makes a false detached worse than a false tail: the
    // create is adjacent to this window, and a detached window drops it.
    final String liveId = _snowflakeForIndex(206);
    _emitCreated(container, id: liveId);
    await _flushAsync();
    expect(
      container.read(chatViewModelProvider).messages.last.id,
      liveId,
      reason: 'a create adjacent to a live-tail window must APPEND, not vanish',
    );

    // And no phantom jump: with the tail already loaded the button has nothing
    // to fetch, so a jump must short-circuit to a scroll.
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
    // The OTHER call site that reads a page's shape, and it has its own limit:
    // goToRepliedMessage asks for _kPageSize. Since _kPageSize moved to 50 its
    // quota is the SAME 25 as the 50-row unread open, so the per-call-site
    // derivation is no longer observable from here; the reattach contract
    // below still is. Same failure as m16d if the shape is misread --
    // a reply jump that lands next to the tail would keep the window detached
    // and drop every message that follows -- and nothing else in the model can
    // catch it here, because the pointer is an orphan the cache cannot resolve.
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
    // Paging back until the trim drops the newest side is what puts a near-tail
    // message OUTSIDE the window, which is the only way a reply jump to one
    // reaches the network instead of just scrolling.
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

  test('m16s: a cached pointer row is a proof, so it seals without a '
      'confirmation', () async {
    // The OTHER positive proof, and the one the ladder's own comment leans on
    // when it says warm channels escaped the cold-channel bug: the pointer is
    // ahead of this window and its row is IN the cache, so the row it names
    // exists, is newer than everything we hold, and is not loaded - unloaded
    // newer history, proven, with nothing left to ask the server. It answers
    // immediately and owes no confirmation, exactly like the equality rung
    // (m16c) and unlike the three non-proof rungs (m16p, m16q, m16j).
    //
    // Warm channel: the open caches 350..399 including the pointer's own row,
    // and then a reply jump lands deep in history - far outside that window, so
    // it really does fetch - on a page the filter shortened below the server's
    // quota, which is the shape that would otherwise fall through to a count.
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
      // 200 + quota 25 = 225: the raw newer side 201..225 loses only the
      // filtered 210, so 225 is still the last delivered row.
      _snowflakeForIndex(225),
      reason: 'the jump window ends where the filtered read left it',
    );
    expect(
      landed.hasMoreNewerMessages,
      isTrue,
      reason:
          'the pointer names 399, that row is in the cache, and it is not in '
          'this window: unloaded newer history, proven outright',
    );
    expect(
      adapter.latestFetchCalls,
      latestFetchesBefore,
      reason:
          'and proven for free - a positive proof seals on the spot, so no '
          'confirmation is owed and none is fired',
    );

    // The proof is load-bearing in the same way the provisional verdict is: a
    // create must not be welded onto a window known to be behind.
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

  test('m16g: an unread open measures its newer side against the quota for ITS '
      'own limit', () async {
    // The limit is per CALL SITE: an unread open fetches _kInitialPageSize
    // rows, so the server fills 25 newer ones. NOTE: with _kPageSize now 50,
    // every call site shares the quota of 25, so this test no longer
    // distinguishes a per-limit quota from one hardcoded to the pagination
    // page size; it still pins that a 20-row newer side is read as the live
    // tail rather than a detach.
    //
    // 221 messages, the ack at 200, and a channel pointer left BEHIND reality
    // (the row the client never saw arrive), so the pointer cannot answer and
    // the page's own shape is the whole verdict.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(100),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(200)),
        // Marked unread by hand: the switch takes its around-the-ack branch
        // without depending on how the pointer compares to the ack.
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
    // m16g's other half, and the reason the quota is a threshold rather than a
    // free pass: an ack deep in history comes back with the newer side FULL,
    // which is a truncated page and proves nothing. With the pointer behind
    // reality it cannot be rescued by a pointer comparison either, so the page
    // shape has to hold the window detached until pagination proves otherwise.
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

    // The gap is real, so a live create must NOT be stitched onto this window.
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
    // The variant the quota rule alone CANNOT see, and the reason a
    // quota-shortfall tail claim is provisional rather than final. The server
    // truncates the raw scan to the limit FIRST and filters invisible and
    // orphaned rows afterwards, backfilling nothing (shard_impl.rs:610-628), so
    // a newer side one row under quota can mean the side is exhausted OR that a
    // filtered row is standing in front of real messages. Believing the first
    // reading unconditionally recreates the m16 bug with the volume turned
    // down: the window claims the tail, the next MESSAGE_CREATE is welded onto
    // the far side of a gap nobody knows is there, and the messages inside it
    // are never shown at all.
    //
    // 400 messages, a jump to 200, and index 210 filtered. The raw newer scan
    // takes 201..225 (quota 25), the filter drops one, and 24 rows come back:
    // short of quota, with 226..399 sitting right there unseen. The confirmation
    // asks for the LATEST page, whose newest row is 399 where ours is 225, so
    // the tail claim is DISPROVED by identity - no counting, no inference.
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
      // First row past the around window (200 + quota 25 = 225 is its tail).
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

    // The create the advisory cares about: it arrives before the user has done
    // anything at all. Server truth gains it too, which is the whole reason
    // dropping it from the view loses nothing.
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

    // ...and it is not lost: paging forward reaches the true tail and brings
    // the create with it, in order, once.
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
    // THE race, and the reason the confirmation is an ARMED operation rather
    // than a bare fetch. Its answer describes the channel as the SERVER saw it:
    // everything after that instant is invisible to the response. So the
    // dangerous interleave is not "create before the request" but "create after
    // the server answered, before this client applied the answer" - the create
    // meets a still-true flag, the answer then certifies the tail and flips the
    // flag false, and every fetch that could have gone back for it is gated off.
    // The message is gone until the channel is reselected, which is the report
    // this work started from.
    //
    // The trigger is a PAGINATION confirmation, because that is a shape that can
    // still be provisional while sitting on the real tail: a direct latest load
    // proves its own newer edge and owes nothing (m16b, m16r). So the fixture
    // opens AROUND 370, whose newer side fills the server's 25-row quota and is
    // therefore detached by construction with no confirmation owed (m16), and
    // then pages forward onto the SHORT final page - pointer ahead, its row
    // nowhere, ack past us - which is the ambiguous signature, on a window whose
    // tail IS 399.
    //
    // The hold is what makes the test precise instead of accidentally green: the
    // parked latest page is evaluated at REQUEST time, so it certifies tail 399
    // from a moment before the create existed, and only its delivery is
    // deferred.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    // Park the FIRST latest page: the around open and the newer page both carry
    // cursors, so the only no-cursor request this fixture makes is the
    // confirmation itself.
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

    // The create the response can never mention. Server truth gains it, exactly
    // as it would on the device.
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

    // The answer lands, certifying a channel state that has since moved on.
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
    // The m8c/m15c lesson, mapped onto the confirmation. Arming promotes it into
    // the swap class, and swap-class writes cannot validate on channel and
    // anchor alone: a same-channel reconcile moves NO generation and leaves the
    // window's tail exactly where the confirmation measured it, so both of those
    // checks wave the stale certification through. Only execution-time
    // validation in the commit lane - token ownership at write time - can see
    // it, which is why the flag flip goes through _commitWindowSwap.
    //
    // m16j's shape, because that is where a provisional verdict on the real tail
    // still comes from: the around open owes nothing, the short newer page owes
    // the confirmation, and the parked latest page certifies tail 399 - exactly
    // ours, so the stale proof has something it very much wants to write.
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

    // The superseding owner: a session-recovery reconcile on the SAME channel.
    // It arms, taking the token, and parks in its own window-preserving fetch,
    // so it never installs and never fires a confirmation of its own. Nothing
    // else about the window changes - same channel, same tail, no generation
    // moved - which is exactly the interleave a weaker guard cannot see.
    adapter.holdAroundFetch = true;
    container.read(gatewaySessionRecoveryProvider.notifier).bump();
    await _flushAsync();
    expect(
      adapter.aroundFetchCalls,
      greaterThan(0),
      reason: 'the reconcile must really own the arm, or this is vacuous',
    );

    // The stale confirmation lands now.
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

    // Let the owner finish inside the test, so its own post-await writes - and
    // the confirmation ITS install owes - happen while the container and the
    // database are still alive rather than after teardown.
    adapter
      ..holdLatestFetchFromCall = 0
      ..releaseAroundFetch()
      ..releaseLatestFetch();
    await _flushAsync();
    await _flushAsync();
  });
  test('m16l: pagination under a parked confirmation wins, and the stale proof '
      'certifies nothing', () async {
    // The guard the lane CANNOT provide. Pagination moves the window's tail
    // without arming and without bumping any generation - that is its class, and
    // m11/m12 pin it - so token ownership and every generation predicate still
    // read as valid while the thing they were validating has moved underneath.
    // The race is not exotic either: the confirmation window is exactly when the
    // flag is provisionally TRUE, which is precisely what lets loadNewer run.
    //
    // Confirmation armed for tail A=399 and parked, its proof of A fixed at
    // request time. The channel then GROWS and the user pages A -> B=449, whose
    // own consult says "more newer remains". The proof of A lands afterwards,
    // still saying "399 is the tail" - true when it was made, meaningless now.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(500),
    );
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: const Value(_channelId),
        lastMessageId: Value(_snowflakeForIndex(500)),
      ),
    );
    // Park the FIRST latest page: the around open and the newer pages carry
    // cursors, so the confirmation is the only no-cursor request in this fixture.
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
    // m16j's trigger, for the same reason: a direct latest load proves its own
    // tail and owes nothing, so the provisional verdict on tail A has to come
    // from pagination - an around open that owes no confirmation, then the short
    // final page whose ambiguous signature arms one for A.
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

    // The channel grows past A while the proof of A is still in flight, and a
    // full newer page means B's own consult keeps the flag TRUE.
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
      // 399 + one full 50-row page: 400..449 installed, 450..455 remain.
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

    // The proof of A arrives, wanting to certify a tail that is two pages back.
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
    // Why the confirmation asks for the LATEST page and not for `after` rows. An
    // after page is truncated to the limit and filtered afterwards, exactly like
    // the around page whose shortfall raised the question, so counting its rows
    // re-runs the same broken inference one request later: 50 raw rows, one
    // filtered, 49 delivered, "short page, must be the tail" - and the real rows
    // beyond it are gone from the window until a reselect. Identity against a
    // descending-from-newest scan has no such failure mode.
    //
    // 400 messages; 210 shortens the around window, 230 shortens the newer page
    // that a count-based confirmation would have trusted.
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
      // 200 + quota 25 = 225: the filter only cost the newer side row 210.
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

    // And the consequence that matters: a create before any gesture is not glued
    // onto a window known to be behind.
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

    // Accumulated across the walk, because the window TRIMS older rows as it
    // advances: "did these rows ever arrive" is a question about the walk, not
    // about the final window.
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
      // 226 = first row the around window could not reach; 275 = last row of
      // the first 50-row after page.
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
    // FULL recovery, and the reason it works is that pagination stopped sealing
    // the tail on a row count too: the after page 226..275 lost 230 to the
    // filter and came back 49 long, which used to end the walk right there with
    // everything past it unreachable until a reselect. Now a short page keeps the
    // flag true and asks the same confirmation the around install asks, so the
    // walk continues to the real tail.
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
      // The pathological end of the monotonicity argument. Identity only proves
      // something when the latest page has a newest row at all; if every row in
      // the raw top-N was filtered away the page comes back EMPTY, and an empty
      // page is not a statement about the tail. Fail open: keep the pessimistic
      // flag, take the phantom jump button, lose no messages, and do not retry.
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
        // 210 shortens the around window into the ambiguous signature; the whole
        // top 50 is filtered, which is what the confirmation's latest page asks
        // for, so it comes back with nothing.
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

      // One shot even here: nothing re-arms off an unprovable answer.
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
    // The last place a count still decided a tail: applyNewerPage's empty branch,
    // which read "nothing came back" as "nothing exists". It is the same
    // truncate-then-filter ambiguity in its most extreme form - the raw scan
    // after our tail returned rows and every single one was filtered away, so an
    // empty body can sit in front of perfectly visible messages.
    //
    // Window ends at 215 (the around read's raw span 176..225 lost 210 and its
    // whole 216..225 tail to the filter), and the entire raw after window
    // 216..265 is filtered: the newer page comes back EMPTY while 266..399 are
    // right there.
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

    // The state is honest but stuck - the filtered rows block forward paging
    // until they are cleaned up server-side - so what matters is that the escape
    // hatch the true flag keeps alive actually works.
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
    // The first of the two rungs the family above never seeded, and the reason
    // it could not: every fixture up to here hands the ladder a pointer AHEAD of
    // the window, which is the only side of it the orphan tests and the ambiguous
    // rung live on. A channel row whose last_message_id is NULL leaves the ladder
    // before any of them, and a MISSING pointer proves nothing whatsoever - not
    // that the channel ends at our newest row, not that it does not. What decided
    // there instead was the caller's row count, handed back verbatim: a page
    // under the limit read as "this side is exhausted", when post-truncation
    // filtering produces exactly that shortfall standing in front of perfectly
    // visible rows. Same stranded gap, same welded create, one rung over.
    //
    // 400 messages and no pointer at all: 210 shortens the around window - and
    // with it the newer side, below the server's quota, so the count claims the
    // tail - and 230 shortens the newer page that continues the walk.
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
      // 200 + quota 25 = 225: the filter only cost the newer side row 210.
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

    // The consequence that matters, before any gesture: a create belongs to the
    // tail, not to the far side of the gap this window ends at.
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

    // Accumulated across the walk, because the window TRIMS older rows as it
    // advances: "did these rows ever arrive" is a question about the walk.
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
      // 225 + one 50-row after page (226..275) minus the filtered 230.
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

    // And the seal is a LIVE one: a create against a window proven to be the
    // tail appends, which is what makes the provisional detour cost nothing.
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
    // The other rung, and the one a real device reaches most often. The row
    // pointer is written by the MessageWriteBatcher flush, so any fetch that
    // races that flush comes back holding rows NEWER than the pointer claims
    // exist. All that proves is that the local record is out of date; it
    // certainly does not prove that nothing newer remains, yet a count claiming
    // the tail was returned from this rung verbatim too.
    //
    // 400 messages, pointer parked at 250, window built around 300: 310 shortens
    // the around window below the server quota - so the count claims the tail
    // while the pointer sits 75 rows behind that window's tail - and 330
    // shortens the page that follows.
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
      // 300 + quota 25 = 325: the filter only cost the newer side row 310.
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
      // 325 + one 50-row after page (326..375) minus the filtered 330.
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
    // The blast radius of the two rungs above, pinned. They answer a count
    // claiming the tail with a PROVISIONAL verdict, and the ordinary channel open
    // reaches them constantly: a cold open fetches the latest page and a channel
    // whose pointer is missing or stale-behind is the common case, not the exotic
    // one. Left to the ladder, every such open would go provisional and buy a
    // confirmation fetch - a request asking the server a question the open itself
    // just answered.
    //
    // Because it DID answer it. `get_latest` scans descending from the newest
    // bucket with no cursor and the visibility and orphan filters run after that
    // scan, removing rows and never adding any, so a non-empty latest page's
    // newest row IS the channel's newest visible row - the same monotonicity the
    // confirmation itself rests on - and this install replaces the window with
    // that page. Nothing newer exists, whatever the pointer says, and page
    // fullness has nothing to do with it: the count speaks to the OLDER edge.
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

    // Same proof, the other non-proof pointer state: stale-BEHIND, which is what
    // any fetch racing the write batcher's flush sees.
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
    // The one latest-page shape m16r's proof does NOT cover. The raw scan is
    // truncated to the limit FIRST and the visibility filter runs after it
    // (shard_impl.rs:610-628), so a page whose whole raw top-N was filtered
    // arrives EMPTY while older visible rows exist beyond the raw window. The
    // latest-equality probe is structurally out (an empty window has no tail
    // to anchor it), but the channel pointer IS a cursor: get_before raw-scans
    // descending from it before the filter runs, so filtered rows consume
    // limit slots without hiding a visible row inside the raw reach. ONE
    // bounded before=<pointer> page therefore recovers the window exactly when
    // the filtered run below the pointer is shorter than the limit - here 49
    // filtered rows against a rescue limit of 50, so row 349 is inside reach.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    // _kInitialPageSize is 50: filter exactly the raw top-50, so the latest
    // page comes back empty with rows 0..349 still visible behind it and the
    // channel pointer aimed straight into the filtered zone. Below the
    // POINTER the filtered run is 49 rows (350..398), one short of the rescue
    // limit.
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
      1,
      reason: 'one latest fetch, which came back empty',
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
      reason: 'no probe owed: the ack rung never fired (no read state seeded)',
    );
    expect(
      opened.hasMoreMessages,
      isTrue,
      reason:
          'a before page short of the limit is the post-truncation-filter '
          'ambiguity, not proof of exhaustion: older stays open',
    );
    // The widget layer's stranded-empty resync is no longer needed - the
    // window is not empty - so the rescue does not stack a second fetch cycle
    // on top of its own.
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

    // The recovery the sealed-empty install used to forfeit: ordinary
    // pagination now walks the older visible history.
    await notifier.loadMore();
    await _flushAsync();
    final ChatViewState paged = container.read(chatViewModelProvider);
    expect(
      paged.messages.first.id,
      // 349 - _kPageSize (50): one older page below the rescued row.
      _snowflakeForIndex(299),
      reason: 'pagination reaches the older visible rows the rescue unlocked',
    );
    expect(paged.messages.last.id, _snowflakeForIndex(349));

    // And the honest flag does honest work: a create is not glued onto a
    // window the consult just called behind.
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

    // Jump-to-latest completes the round trip: the latest page now has a
    // visible newest row, so the direct proof applies and the tail goes live.
    expect(await notifier.jumpToLatestMessages(), isTrue);
    await _flushAsync();
    final ChatViewState live = container.read(chatViewModelProvider);
    expect(live.messages.last.id, liveId);
    expect(live.hasMoreNewerMessages, isFalse);
  });

  test('m16u: a filtered run at or past the limit leaves the rescue empty, '
      'seals as inherited behavior, does not re-fire, and stays live', () async {
    // The residual, pinned exactly as it IS. With the filtered run below the
    // pointer at the rescue limit (50 rows, 349..398), the rescue's raw reach
    // is consumed whole: the page comes back EMPTY, yields no new cursor to
    // advance to (no rows, no id), and the install falls through to the
    // inherited sealed-empty behavior. The older visible rows stay unreachable
    // until the server reports a raw-exhaustion flag it does not have today -
    // a server limitation, named here so nobody reads this test as an
    // endorsement. Recovery remains the widget layer's stranded-empty resync,
    // which fires ONCE; the rescue is one straight-line fetch per install,
    // never a loop.
    final _GatedDatabase database = await seedChannel(
      lastMessageId: _snowflakeForIndex(399),
    );
    final adapter = _MessageApiAdapter(messages: _channelMessages(400));
    // Filter the raw top-51: the latest page's raw top-50 (350..399) AND the
    // rescue's full raw reach below the pointer (349..398) are both consumed.
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

    // The recovery, as the widget layer decides it: a matched, settled, EMPTY
    // window asks for one resync, and the remembered channel id stops a second.
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

    // The resync the widget schedules is a plain same-channel switch; drive it
    // and observe that it really refetches - one latest page plus ONE rescue
    // per install, bounded - and, with the server unchanged, really comes back
    // empty again. That unreachable remainder is the residual this test names.
    await notifier.switchChannel(_channelId);
    await _flushAsync();
    expect(adapter.latestFetchCalls, 2, reason: 'the resync refetched');
    expect(
      adapter.olderFetchCalls,
      2,
      reason: 'one rescue per install, not a loop within one',
    );
    expect(container.read(chatViewModelProvider).messages, isEmpty);

    // Sealed means LIVE: the next create appends onto the empty window instead
    // of being dropped against a detached one.
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
    // The rescue's request goes on the wire a full await AFTER the primary
    // latest fetch answered, and the primary's ordinal was minted before
    // both. An alt-text edit that acknowledges in that gap sits BETWEEN the
    // two: after the primary's ordinal, before the rescue's request. Under
    // the borrowed primary ordinal the overlay reads the rescue page as
    // pre-ack and stamps the local op over it - masking a NEWER remote value
    // of the very same field. The rescue is its own page fetch: an adopted
    // rescue page installs under the RESCUE's ordinal, and a page whose
    // fetch began after the ack is server truth and must win. Ledger M-AE.
    // And the rescue's own ordinal must END. The first op cannot prove that:
    // its ack predates the rescue ordinal, so even a rescue ordinal leaked
    // outstanding forever yields a boundary at or above that ack. The leak
    // probe below acks a SECOND edit (different message, different
    // attachment) while the rescue is PARKED - an ack ordinal strictly ABOVE
    // the rescue's - so a leaked rescue ordinal pins the retirement boundary
    // below it and strands the op. Ledger M-AF.
    final _GatedDatabase database = await seedChannel(
      // Stale-behind on purpose: the pointer is an opinion, and 390 aims the
      // rescue's raw reach (340..389) straight over the attachment row.
      lastMessageId: _snowflakeForIndex(390),
    );
    final List<Map<String, Object?>> channelMessages = _channelMessages(
      400,
      attachmentAt: 340,
    );
    // A second attachment row on a DIFFERENT message, one slot above the
    // first and inside the rescue's raw reach: the leak probe edits it while
    // the rescue is parked.
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

    // Jump the window around the attachment row so the edit has a row to
    // enqueue against.
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

    // Filter the raw top-50 (350..399): the next direct latest load comes
    // back EMPTY, so the rescue fires; below the POINTER the filtered run is
    // 40 rows (350..389), so rows 340..349 - the edited row included -
    // survive inside the rescue's raw reach.
    for (var i = 350; i < 400; i++) {
      adapter.filteredMessageIds.add(_snowflakeForIndex(i));
    }

    // Park the PRIMARY latest fetch: its ordinal is now pinned strictly
    // before everything that follows.
    adapter.holdLatestFetch = true;
    final Future<void> reload = notifier.reloadCurrentChannel();
    await _flushAsync();
    expect(adapter.latestFetchCalls, 2);

    // The alt-text edit ACKS in the gap between the empty latest response
    // and the rescue request.
    await notifier.editAttachmentAltText(
      messageId: editedId,
      attachmentId: _kAttachmentId,
      description: 'a local description',
    );
    await _flushAsync();
    expect(
      adapter.attachmentRequests,
      <String>['PATCH $_kAttachmentId=a local description'],
      reason: 'the edit settled on the wire: the mutation is ACKNOWLEDGED',
    );
    expect(
      notifier.pendingLocalMutationCount,
      1,
      reason:
          'the acked op is still owed protection while the primary ordinal '
          'is outstanding',
    );

    // A NEWER remote edit to the SAME field lands after the ack, so
    // overlay-versus-page is observable: the rescue page carries this value,
    // the stale local op the other.
    final Map<String, Object?> serverRow = adapter.messages.firstWhere(
      (Map<String, Object?> m) => m['id'] == editedId,
    );
    ((serverRow['attachments']! as List<Object?>).first!
            as Map<String, Object?>)['description'] =
        'a newer remote description';

    // Release the empty latest page; the rescue fires POST-ACK and parks.
    adapter
      ..holdOlderFetch = true
      ..releaseLatestFetch();
    await _flushAsync();
    expect(
      adapter.olderFetchCalls,
      1,
      reason: 'the rescue fired, once, after the acknowledgement',
    );

    // LEAK PROBE (ledger M-AF): the rescue's ordinal is minted and its fetch
    // is parked on the wire. An edit that acks NOW - a different message, a
    // different attachment - takes an ack ordinal strictly ABOVE the rescue's,
    // so this op retires only if the rescue's outstanding entry actually ends:
    // a leaked rescueOrdinal holds the boundary below the ack forever.
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

    // A rejump rebuilds the window around the same target: same channel, same
    // tail id, but a NEW window. The park must not follow it (ledger M-AK).
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

    // Jump-to-latest replaces the window wholesale while that page is on the
    // wire. Its swap commit is a copyWith, so a stranded isLoadingNewer would
    // SURVIVE the swap — which is exactly what makes the release observable
    // here, unlike a channel switch that rebuilds the state from scratch.
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

    // The replacement window is immediately workable — a rejump into history
    // rebuilds a detached window whose edge loads with no gesture ceremony.
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
      viewportHeight: 600,
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

/// A single held `getMessage`.
class _GatedRead {
  _GatedRead(this.messageId);

  final String messageId;
  final Completer<void> completer = Completer<void>();
}

/// Parks `getMessage` for chosen message ids, and rewrites the content of the
/// row those reads return so a reducer that answers from the database is
/// distinguishable from one that answers from an event payload.
///
/// Releasing stops the parking but keeps the rewrite, so a reducer that has to
/// recompute after a swap does not deadlock on a gate it already passed.
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
    final _GatedRead read = _GatedRead(messageId);
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

/// Models the message endpoint closely enough for window work: `around` on an
/// unknown id still returns the window it would have sorted into, and the
/// latest page can be held open so events land mid-swap.
class _MessageApiAdapter implements HttpClientAdapter {
  _MessageApiAdapter({required this.messages, this.sentMessageId = ''});

  final List<Map<String, Object?>> messages;

  /// Ids the endpoint drops AFTER the raw scan has already been truncated to
  /// the limit, which is what the server does: `list_api_responses` takes the
  /// raw window (`get_around`/`get_after`, truncated), then retains only
  /// visible rows and partitions off authorless orphans
  /// (shard_impl.rs:610-628), and never backfills the slots they used. A page
  /// shortened this way is indistinguishable from an exhausted side.
  final Set<String> filteredMessageIds = <String>{};

  /// Id the endpoint hands back for a POSTed message.
  final String sentMessageId;

  bool holdLatestFetch = false;

  /// Parks latest-page requests from the Nth call onward (1-based), leaving
  /// earlier ones to complete. The tail confirmation fetches a latest page, so
  /// this is how a test parks THAT fetch without also parking the channel open
  /// that triggered it. Bodies parked this way are fixed at request time.
  int holdLatestFetchFromCall = 0;

  /// Latest-page requests the client actually put on the wire. A jump that
  /// returns early off a stale mutex never reaches the endpoint at all.
  int latestFetchCalls = 0;

  /// Makes the held latest page fail once released, so the swap that armed on
  /// it reaches its finally without ever committing.
  bool failLatestFetch = false;

  Completer<void>? _latestCompleter;

  /// Keeps a POSTed message in flight so its optimistic row stays local-only.
  bool holdSend = false;
  Completer<void>? _sendCompleter;

  /// Keeps a DELETE in flight so its pending-mutation entry stays live.
  bool holdDelete = false;

  /// Makes the held DELETE fail once released, to drive the rollback path.
  bool failDelete = false;
  Completer<void>? _deleteCompleter;

  /// The `content` part of each attachment PATCH, `null` when the request
  /// omitted the field entirely. An operation that does not own the text must
  /// never transmit it.
  final List<String?> patchContents = <String?>[];

  /// The server's own content per message. A PATCH that carries `content`
  /// overwrites it, exactly as the endpoint does; one that omits the part
  /// leaves it alone.
  final Map<String, String> serverContent = <String, String>{};

  String _contentFor(String messageId) =>
      serverContent.putIfAbsent(messageId, () {
        final Map<String, Object?> row = messages.firstWhere(
          (Map<String, Object?> m) => m['id'] == messageId,
          orElse: () => const <String, Object?>{},
        );
        return row['content'] as String? ?? 'message $messageId';
      });

  /// Every attachment request the client actually put on the wire, in order.
  /// `DELETE <attachmentId>` or `PATCH <id>=<description>,...`.
  final List<String> attachmentRequests = <String>[];

  /// The server's own attachment array per message, seeded from the seeded
  /// message and mutated by DELETE and PATCH. A PATCH echoes it back, which is
  /// what the real endpoint does: it rewrites the WHOLE array and returns the
  /// canonical row.
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

  /// Keeps an attachment edit in flight for the same reason.
  bool holdEdit = false;

  /// Makes the attachment edit fail once released, to drive the rollback path.
  bool failEdit = false;
  Completer<void>? _editCompleter;

  /// Keeps an `after` page in flight. This is the unread-boundary fetch: the
  /// repository routes it through the network page loader, not the DAO.
  bool holdAfterFetch = false;
  int afterFetchCalls = 0;
  Completer<void>? _afterCompleter;

  /// Keeps `before` (pagination) pages in flight, one completer per call, so
  /// two overlapping paginations can be released independently.
  bool holdOlderFetch = false;
  int olderFetchCalls = 0;
  final List<Completer<void>> _olderCompleters = <Completer<void>>[];

  /// Keeps an `around` page in flight, so its fetch ordinal stays outstanding.
  bool holdAroundFetch = false;

  /// Makes the held `around` page fail once released, which is how a refresh
  /// that has already been superseded reaches its failure cleanup.
  bool failAroundFetch = false;

  /// `around` requests on the wire. The window-preserving reconcile fetches
  /// around its window, so a resync the skip machinery silenced is visible as
  /// this count staying flat.
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

  /// Releases only the EARLIEST outstanding pagination fetch.
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
      final List<Object?> sent = _multipartAttachments(rawBody);
      final String? sentContent = _multipartField(rawBody, 'content');
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
        // The endpoint rewrites the whole array: keep exactly the ids sent, in
        // the order sent, applying any description the request carries.
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

    // TWO models of a slow endpoint live in this file, and they are not the
    // same. A held `around` page models a slow SERVER: the fixture edits server
    // truth while the request is parked and expects the release to reflect it
    // (m10g). A page parked by [holdLatestFetchFromCall] models a slow RESPONSE:
    // the server already answered, so the body is fixed HERE, at request time,
    // and a create landing during the hold cannot leak into it. That is the
    // confirmation race m16j pins, and it exists only because the answer is older
    // than its own delivery. `holdLatestFetch` keeps the slow-SERVER reading the
    // jump-to-latest fixtures were written against.
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

  /// The endpoint's query, raw window then post-truncation filter, in that
  /// order: the raw scan is capped at [limit] and the rows the filter drops
  /// simply lose their slots, which is what makes a short side ambiguous.
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

/// Pulls one named part out of a multipart body, `null` when it is absent.
String? _multipartField(String? body, String name) {
  if (body == null) {
    return null;
  }
  return RegExp(
    'name="$name"'
    r'\r?\n\r?\n(.*?)\r?\n--',
    dotAll: true,
  ).firstMatch(body)?.group(1);
}

/// Pulls the `attachments` part out of a multipart edit body.
List<Object?> _multipartAttachments(String? body) {
  if (body == null) {
    return const <Object?>[];
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
