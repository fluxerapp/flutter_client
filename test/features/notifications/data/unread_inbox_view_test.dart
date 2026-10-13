import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/notifications/data/inbox_visit.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_cache.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_view.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';

UnreadInboxEntry _entry(String channelId, {String? guildId = 'g1'}) =>
    UnreadInboxEntry(
      channelId: channelId,
      guildId: guildId,
      isDm: guildId == null,
      mentionCount: 0,
      isCollapsed: false,
      recencyComparator: 0,
      ackMessageId: '1',
      lastMessageId: '2',
    );

Future<UnreadInboxCardData> _load(UnreadInboxEntry entry) async =>
    UnreadInboxCardData(
      cacheKey: UnreadInboxCardCache.cacheKeyFor(entry),
      meta: UnreadInboxCardMeta.empty(),
      messages: <Message>[
        Message(
          id: '2',
          channelId: entry.channelId,
          authorId: 'u',
          authorName: 'u',
          content: 'hi',
          timestamp: DateTime.utc(2026),
        ),
      ],
      hasMoreUnread: false,
    );

List<String> _ids(UnreadInboxView view) =>
    view.rows.map((UnreadInboxRow row) => row.channelId).toList();

void main() {
  test('holds order and acked rows across a quick tab switch', () {
    fakeAsync((FakeAsync async) {
      DateTime now = DateTime.utc(2026, 10, 13);
      final UnreadInboxView view =
          UnreadInboxView(
              loadCard: _load,
              visit: InboxVisit(clock: () => now),
            )
            ..updateLive(<UnreadInboxEntry>[_entry('a'), _entry('b')])
            ..enter();
      async.flushMicrotasks();
      expect(_ids(view), <String>['a', 'b']);

      view
        ..leave()
        ..updateLive(<UnreadInboxEntry>[_entry('c'), _entry('b')]);
      now = now.add(const Duration(minutes: 2));
      view.enter();
      async.flushMicrotasks();

      expect(_ids(view), <String>['a', 'b']);
      expect(view.rows.first.read, isTrue);
      expect(view.rows.last.read, isFalse);
      view.dispose();
    });
  });

  test('takes a new snapshot after the stale threshold', () {
    fakeAsync((FakeAsync async) {
      DateTime now = DateTime.utc(2026, 10, 13);
      final UnreadInboxView view =
          UnreadInboxView(
              loadCard: _load,
              visit: InboxVisit(clock: () => now),
            )
            ..updateLive(<UnreadInboxEntry>[_entry('a')])
            ..enter();
      async.flushMicrotasks();
      view
        ..leave()
        ..updateLive(<UnreadInboxEntry>[_entry('c'), _entry('a')]);
      now = now.add(kInboxVisitStaleAfter);
      view.enter();
      async.flushMicrotasks();

      expect(_ids(view), <String>['c', 'a']);
      view.dispose();
    });
  });

  test('pull to refresh replaces the snapshot while visiting', () {
    fakeAsync((FakeAsync async) {
      final UnreadInboxView view = UnreadInboxView(loadCard: _load)
        ..updateLive(<UnreadInboxEntry>[_entry('a')])
        ..enter();
      async.flushMicrotasks();
      view.updateLive(<UnreadInboxEntry>[_entry('b'), _entry('a')]);
      async.flushMicrotasks();
      expect(_ids(view), <String>['a']);

      unawaited(view.refresh(<UnreadInboxEntry>[_entry('b'), _entry('a')]));
      async.flushMicrotasks();
      expect(_ids(view), <String>['b', 'a']);
      view.dispose();
    });
  });

  test('loads more rows by appending pages', () {
    fakeAsync((FakeAsync async) {
      final UnreadInboxView view = UnreadInboxView(loadCard: _load);
      final List<UnreadInboxEntry> live = <UnreadInboxEntry>[
        for (int i = 0; i < kUnreadInboxPageSize + 3; i++) _entry('c$i'),
      ];
      view
        ..updateLive(live)
        ..enter();
      async.flushMicrotasks();
      expect(view.rows, hasLength(kUnreadInboxPageSize));
      expect(view.hasMore, isTrue);
      final List<String> firstPage = _ids(view);

      unawaited(view.loadMore());
      async.flushMicrotasks();
      expect(view.rows, hasLength(kUnreadInboxPageSize + 3));
      expect(_ids(view).take(kUnreadInboxPageSize), firstPage);
      expect(view.hasMore, isFalse);
      view.dispose();
    });
  });
}
