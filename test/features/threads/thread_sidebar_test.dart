import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/guild_sidebar_entries_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/presentation/thread_composer_gate.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:riverpod/riverpod.dart';

const Channel _general = Channel(
  id: '100',
  guildId: 'g1',
  name: 'general',
  parentId: 'cat1',
);
const Channel _random = Channel(
  id: '200',
  guildId: 'g1',
  name: 'random',
  parentId: 'cat1',
);

Channel _thread(String id, {String parentId = '100', bool archived = false}) =>
    Channel(
      id: id,
      guildId: 'g1',
      name: 'thread $id',
      type: ChannelType.publicThread,
      parentId: parentId,
      threadArchived: archived,
    );

List<GuildSidebarEntry> _flatten({
  Map<String, List<Channel>> threadsByParent = const <String, List<Channel>>{},
  Set<String> collapsed = const <String>{},
  String? selectedId,
}) => flattenGuildSidebarEntries(
  categories: const <ChannelCategory>[
    ChannelCategory(
      id: 'cat1',
      name: 'Text',
      channels: <Channel>[_general, _random],
    ),
  ],
  collapsed: collapsed,
  mutedSet: const <String>{},
  hideMuted: false,
  selectedId: selectedId,
  connectedChannelId: null,
  showFadedUnread: false,
  guildId: 'g1',
  unreadForChannel: (_) => const UnreadState(),
  threadsByParent: threadsByParent,
);

List<String> _ids(List<GuildSidebarEntry> entries) => <String>[
  for (final GuildSidebarEntry entry in entries)
    '${entry.kind.name}:${entry.channel?.id ?? entry.category?.id}',
];

ThreadActorContext _actor({
  int permissions = 0,
  bool archived = false,
  bool locked = false,
  bool isMember = false,
}) => ThreadActorContext(
  permissions:
      Permission.viewChannel.value |
      Permission.readMessageHistory.value |
      permissions,
  thread: ThreadFacts(type: 11, archived: archived, locked: locked),
  isMember: isMember,
);

void main() {
  group('sidebar thread entries', () {
    test('without threads the entries match the control layout', () {
      expect(_ids(_flatten()), <String>[
        'categoryHeader:cat1',
        'channel:100',
        'channel:200',
      ]);
    });

    test('threads follow their parent and mark the last one', () {
      final List<GuildSidebarEntry> entries = _flatten(
        threadsByParent: <String, List<Channel>>{
          '100': <Channel>[_thread('101'), _thread('102')],
        },
      );
      expect(_ids(entries), <String>[
        'categoryHeader:cat1',
        'channel:100',
        'thread:101',
        'thread:102',
        'channel:200',
      ]);
      expect(entries[2].isLastThread, isFalse);
      expect(entries[3].isLastThread, isTrue);
    });

    test('a collapsed category keeps only the selected thread and parent', () {
      final List<GuildSidebarEntry> entries = _flatten(
        threadsByParent: <String, List<Channel>>{
          '100': <Channel>[_thread('101'), _thread('102')],
        },
        collapsed: const <String>{'cat1'},
        selectedId: '102',
      );
      expect(_ids(entries), <String>[
        'categoryHeader:cat1',
        'channel:100',
        'thread:102',
      ]);
    });

    test('groups joined threads and always keeps the open thread', () {
      final Channel open = _thread('103', archived: true);
      final Map<String, List<Channel>> grouped = groupSidebarThreads(
        activeThreads: <Channel>[_thread('101'), _thread('102')],
        joinedIds: const <String>{'102'},
        selected: open,
      );
      expect(grouped['100']!.map((Channel c) => c.id).toList(), <String>[
        '102',
        '103',
      ]);
    });

    test('an inactive guild yields no sidebar threads', () {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      expect(container.read(sidebarThreadsByParentProvider('g1')), isEmpty);
      expect(container.read(threadsGateProvider).isActive('g1'), isFalse);
    });
  });

  group('thread composer state', () {
    test('a locked thread blocks non moderators', () {
      expect(
        resolveThreadComposerState(
          thread: _thread('101').copyWith(threadLocked: true),
          actor: _actor(isMember: true),
          isMember: true,
        ),
        ThreadComposerState.locked,
      );
    });

    test('moderators keep the composer in a locked thread', () {
      expect(
        resolveThreadComposerState(
          thread: _thread('101').copyWith(threadLocked: true),
          actor: _actor(
            permissions: Permission.manageThreads.value,
            locked: true,
            isMember: true,
          ),
          isMember: true,
        ),
        ThreadComposerState.open,
      );
    });

    test('an archived thread shows the reopen notice', () {
      expect(
        resolveThreadComposerState(
          thread: _thread('101', archived: true),
          actor: _actor(archived: true, isMember: true),
          isMember: true,
        ),
        ThreadComposerState.archived,
      );
    });

    test('non members of an open thread get the join bar', () {
      expect(
        resolveThreadComposerState(
          thread: _thread('101'),
          actor: _actor(),
          isMember: false,
        ),
        ThreadComposerState.joinable,
      );
    });
  });

  test('notification flags keep one notify bit and drop HAS_INTERACTED', () {
    const int current = 1 | threadMemberFlagAllMessages;
    expect(
      threadNotificationFlags(current, ThreadNotificationSetting.onlyMentions),
      threadMemberFlagOnlyMentions,
    );
    expect(
      threadNotificationFlags(current, ThreadNotificationSetting.parentDefault),
      0,
    );
    expect(
      threadNotificationSettingOf(threadMemberFlagNoMessages),
      ThreadNotificationSetting.none,
    );
  });
}
