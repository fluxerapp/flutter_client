import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/members/data/member_list_update_batcher.dart';
import 'package:fluxer_app/features/members/domain/member_list_viewport_state.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  ProviderContainer buildContainer() {
    final FluxerDatabase database = openTestDatabase();
    final container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
        activeChannelIdProvider.overrideWith((ref) => null),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  MemberListViewportListState? listState(ProviderContainer container) =>
      container
          .read(memberListViewportProvider.notifier)
          .getList(guildId: 'g1', channelId: 'c1');

  String? rowStatus(ProviderContainer container, String userId) {
    for (final row in listState(container)!.rows.values) {
      if (row.userId == userId) {
        return row.listMember?.status;
      }
    }
    return null;
  }

  void enqueue(ProviderContainer container, GuildMemberListUpdateEvent update) {
    container.read(memberListUpdateBatcherProvider).enqueue(update);
  }

  void clearAll(ProviderContainer container) {
    container.read(memberListUpdateBatcherProvider).clearAll();
  }

  void flushAll(ProviderContainer container) {
    container.read(memberListUpdateBatcherProvider).flushAll();
  }

  test('applies the first payload immediately', () async {
    final container = buildContainer();

    enqueue(container, event(memberCount: 5));

    final state = listState(container);
    expect(state, isNotNull);
    expect(state!.hasReceivedInitialPayload, isTrue);
    expect(state.memberCount, 5);
    await pumpEventQueue();
  });

  test('defers updates after the first payload until flushed', () async {
    final container = buildContainer();

    enqueue(container, event(memberCount: 5));
    expect(listState(container)!.memberCount, 5);

    enqueue(container, event(memberCount: 9));
    // Still the first value: the second event is queued, not applied.
    expect(listState(container)!.memberCount, 5);

    flushAll(container);
    expect(listState(container)!.memberCount, 9);
    await pumpEventQueue();
  });

  test('clearAll drops pending updates without applying them', () async {
    final container = buildContainer();

    enqueue(container, event(memberCount: 5));
    enqueue(container, event(memberCount: 9));
    clearAll(container);
    flushAll(container);

    expect(listState(container)!.memberCount, 5);
    await pumpEventQueue();
  });

  test('merges ops across batched updates instead of dropping them', () async {
    final container = buildContainer();

    // Establish the initial payload with a large list so both row indices below
    // stay in bounds.
    enqueue(
      container,
      event(groups: const [MemberListGroup(id: 'all', count: 100)]),
    );
    expect(listState(container)!.rows, isEmpty);

    enqueue(
      container,
      event(
        groups: const [MemberListGroup(id: 'all', count: 100)],
        ops: <MemberListOp>[
          syncGroups(0, <String>['a']),
        ],
      ),
    );
    enqueue(
      container,
      event(
        groups: const [MemberListGroup(id: 'all', count: 100)],
        ops: <MemberListOp>[
          syncGroups(50, <String>['b']),
        ],
      ),
    );
    flushAll(container);

    // Both ops survived the merge: dropping the earlier op would leave one row.
    expect(listState(container)!.rows.length, 2);
    await pumpEventQueue();
  });

  test('auto-applies a queued update after the debounce window', () async {
    final container = buildContainer();

    enqueue(container, event(memberCount: 5));
    enqueue(container, event(memberCount: 9));
    expect(listState(container)!.memberCount, 5);

    await Future<void>.delayed(
      const Duration(milliseconds: kMemberListUpdateBatchMs + 400),
    );

    expect(listState(container)!.memberCount, 9);
    await pumpEventQueue();
  });

  test('applies the local user own presence change immediately', () async {
    final container = buildContainer();
    container
        .read(memberListViewportProvider.notifier)
        .setSubscribedRanges(
          guildId: 'g1',
          channelId: 'c1',
          ranges: const [
            [0, 99],
          ],
        );

    // First payload paints the local user as online.
    enqueue(
      container,
      event(
        memberCount: 1,
        ops: [
          syncMembers(0, [memberItem('me', status: 'online')]),
        ],
      ),
    );
    expect(rowStatus(container, 'me'), 'online');

    // The local user's own status change skips the batch window entirely.
    enqueue(
      container,
      event(
        memberCount: 1,
        ops: [
          syncMembers(0, [memberItem('me', status: 'idle')]),
        ],
      ),
    );

    expect(rowStatus(container, 'me'), 'idle');
    await pumpEventQueue();
  });
}

GuildMemberListUpdateEvent event({
  String guildId = 'g1',
  String listId = 'everyone',
  String channelId = 'c1',
  int memberCount = 0,
  int onlineCount = 0,
  List<MemberListGroup> groups = const <MemberListGroup>[],
  List<MemberListOp> ops = const <MemberListOp>[],
}) {
  return GuildMemberListUpdateEvent(
    guildId: guildId,
    id: listId,
    channelId: channelId,
    memberCount: memberCount,
    onlineCount: onlineCount,
    groups: groups,
    ops: ops,
  );
}

MemberListOp syncGroups(int start, List<String> groupIds) {
  return MemberListOp(
    op: 'SYNC',
    range: <int>[start, start + groupIds.length - 1],
    items: <MemberListItem>[
      for (final String id in groupIds)
        MemberListItem(group: MemberListGroup(id: id, count: 1)),
    ],
  );
}

GuildMemberResponse member(String userId) => GuildMemberResponse(
  user: UserPartialResponse(
    id: userId,
    username: 'user-$userId',
    discriminator: '0001',
    globalName: null,
    avatar: null,
    avatarColor: null,
    flags: 0,
  ),
  roles: const <String>[],
  joinedAt: DateTime.utc(2024),
  mute: false,
  deaf: false,
);

MemberListItem memberItem(String userId, {required String status}) =>
    MemberListItem(
      member: MemberListMember(member: member(userId), status: status),
    );

MemberListOp syncMembers(int start, List<MemberListItem> items) => MemberListOp(
  op: 'SYNC',
  range: <int>[start, start + items.length - 1],
  items: items,
);

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: 'me',
    username: '',
    displayName: '',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'offline',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: [],
  );
}
