import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/guild_channel_unread_snapshot_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';

import '../../../helpers/open_test_database.dart';

const String _guildId = 'g1';
const UnreadState _unread = UnreadState(hasUnread: true);

ChannelListState _state() => const ChannelListState(
  guild: Guild(id: _guildId, name: 'Guild'),
  hasReceivedInitialChannelList: true,
  selectedChannelId: null,
  categories: <ChannelCategory>[
    ChannelCategory(
      id: 'cat1',
      name: 'Category',
      channels: <Channel>[
        Channel(id: 'c1', guildId: _guildId, name: 'general', parentId: 'cat1'),
        Channel(
          id: 'l1',
          guildId: _guildId,
          name: 'docs',
          url: 'https://example.com',
          type: ChannelType.guildLink,
          parentId: 'cat1',
        ),
      ],
    ),
  ],
);

class _FakeChannelListViewModel extends ChannelListViewModel {
  @override
  ChannelListState build() => _state();
}

ProviderContainer _container(
  Map<String, UnreadState> streamed, {
  Set<String> pending = const <String>{},
}) {
  final StreamController<UnreadState> never = StreamController<UnreadState>();
  addTearDown(() => unawaited(never.close()));
  final container =
      ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
            currentUserIdProvider.overrideWithValue('me'),
            channelListViewModelProvider.overrideWith(
              _FakeChannelListViewModel.new,
            ),
            for (final MapEntry<String, UnreadState> entry in streamed.entries)
              channelUnreadProvider(entry.key).overrideWith(
                (Ref ref) => Stream<UnreadState>.value(entry.value),
              ),
            for (final String channelId in pending)
              channelUnreadProvider(
                channelId,
              ).overrideWith((Ref ref) => never.stream),
          ],
        )
        ..listen(guildChannelUnreadKnownProvider(_guildId), (_, _) {})
        ..listen(guildChannelUnreadSnapshotProvider(_guildId), (_, _) {});
  addTearDown(container.dispose);
  return container;
}

Future<void> _settle() => Future<void>.delayed(Duration.zero);

void main() {
  test('channels are known from computed unread before the seed', () async {
    final container = _container(<String, UnreadState>{
      'c1': _unread,
      'l1': const UnreadState(),
    });
    await _settle();

    expect(container.read(guildReadStateReadyProvider), isFalse);
    expect(container.read(guildChannelUnreadKnownProvider(_guildId)), isTrue);
    expect(
      container.read(guildChannelUnreadSnapshotProvider(_guildId))['c1'],
      _unread,
    );
  });

  test(
    'a link channel outside the fold does not hide a seeded guild',
    () async {
      final container = _container(<String, UnreadState>{
        'l1': const UnreadState(),
      });
      container.read(guildChannelUnreadFoldProvider.notifier).apply(
        <String, UnreadState>{'c1': _unread},
      );
      container.read(guildReadStateReadyProvider.notifier).markReady();
      await _settle();

      expect(container.read(guildChannelUnreadKnownProvider(_guildId)), isTrue);
      expect(
        container.read(guildChannelUnreadSnapshotProvider(_guildId))['c1'],
        _unread,
      );
    },
  );

  test(
    'channels stay unknown until every tracked unread is computed',
    () async {
      final container = _container(
        <String, UnreadState>{'l1': const UnreadState()},
        pending: <String>{'c1'},
      );
      await _settle();

      expect(
        container.read(guildChannelUnreadKnownProvider(_guildId)),
        isFalse,
      );
    },
  );
}
