import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/data/guild_order_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_dart/export.dart';

class _FakeUsersApi implements UsersApi {
  @override
  Future<UserSettingsResponse> updateCurrentUserSettings({
    required UserSettingsUpdateRequest body,
  }) async {
    return UserSettingsResponse.fromJson({
      'status': 'online',
      'theme': 'dark',
      'locale': 'en-US',
      'synced_preferences': '',
      'render_embeds': true,
      'profile_privacy': 0,
      'restricted_guilds': <String>[],
      'bot_restricted_guilds': <String>[],
      'default_guilds_restricted': false,
      'bot_default_guilds_restricted': false,
      'inline_attachment_media': true,
      'inline_embed_media': true,
      'gif_auto_play': true,
      'render_reactions': true,
      'animate_emoji': true,
      'animate_stickers': 0,
      'render_spoilers': 0,
      'message_display_compact': false,
      'friend_source_flags': 0,
      'incoming_call_flags': 0,
      'group_dm_add_permission_flags': 0,
      'guild_folders': <Map<String, Object?>>[],
      'afk_timeout': 600,
      'time_format': 0,
      'developer_mode': false,
      'trusted_domains': <String>[],
      'default_hide_muted_channels': false,
      'sensitive_content_friend_dm_filter': 0,
      'sensitive_content_non_friend_dm_filter': 0,
      'sensitive_content_guild_filter': 0,
      'suppress_unprivileged_self_mentions': false,
      'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
      'staff_dm_access_user_ids': <String>[],
      'default_share_voice_activity': false,
    });
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient() : super(Dio());

  @override
  UsersApi get users => _FakeUsersApi();
}

ProviderContainer _organizedGuildListTestContainer() {
  return ProviderContainer(
    overrides: [
      guildOrderRepositoryProvider.overrideWith(
        (Ref ref) => GuildOrderRepository(_FakeClient()),
      ),
      guildListViewModelProvider.overrideWithValue(
        const GuildListViewState(guilds: []),
      ),
      guildFoldersProvider.overrideWith((Ref ref) => Stream.value([])),
    ],
  );
}

GuildNavbarFolder _navbarFolder({
  required int id,
  required List<String> guildIds,
}) {
  return GuildNavbarFolder(id: id, guilds: guildIds.map(_guild).toList());
}

Guild _guild(String id, {bool unavailable = false}) {
  return Guild(id: id, name: 'Guild $id', unavailable: unavailable);
}

UserSettingsResponseGuildFolders _folder({
  required List<String> guildIds,
  int? id,
}) {
  return UserSettingsResponseGuildFolders(id: id, guildIds: guildIds);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('computeOrganizedGuildList', () {
    test('returns all guilds when folders are empty', () {
      final guilds = [_guild('a'), _guild('b')];
      final items = computeOrganizedGuildList(guilds: guilds, folders: []);
      expect(items.length, 2);
      expect(items[0], isA<GuildNavbarGuild>());
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
      expect((items[1] as GuildNavbarGuild).guild.id, 'b');
    });

    test('prepends unplaced guilds before folder items', () {
      final guilds = [_guild('a'), _guild('b')];
      final folders = [
        _folder(id: 1, guildIds: ['a']),
      ];
      final items = computeOrganizedGuildList(guilds: guilds, folders: folders);
      expect(items.length, 2);
      expect((items[0] as GuildNavbarGuild).guild.id, 'b');
      expect(items[1], isA<GuildNavbarFolder>());
      final folder = items[1] as GuildNavbarFolder;
      expect(folder.guilds.map((g) => g.id).toList(), ['a']);
    });

    test('does not duplicate guilds listed in folders', () {
      final guilds = [_guild('a'), _guild('b')];
      final folders = [
        _folder(id: -1, guildIds: ['a', 'b']),
      ];
      final items = computeOrganizedGuildList(guilds: guilds, folders: folders);
      expect(items.length, 2);
      expect(items.every((item) => item is GuildNavbarGuild), isTrue);
    });

    test('excludes unavailable guilds when folders are empty', () {
      final guilds = [_guild('a'), _guild('b', unavailable: true)];
      final items = computeOrganizedGuildList(guilds: guilds, folders: []);
      expect(items.length, 1);
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
    });

    test('excludes unavailable guilds from folders', () {
      final guilds = [_guild('a'), _guild('b', unavailable: true)];
      final folders = [
        _folder(id: -1, guildIds: ['a', 'b']),
      ];
      final items = computeOrganizedGuildList(guilds: guilds, folders: folders);
      expect(items.length, 1);
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
    });

    test('excludes tracked outage guilds before db unavailable flag syncs', () {
      final guilds = [_guild('a'), _guild('b')];
      final items = computeOrganizedGuildList(
        guilds: guilds,
        folders: [],
        trackedUnavailableGuildIds: {'b'},
      );
      expect(items.length, 1);
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
    });

    test('excludes unavailable guilds from unplaced prepend', () {
      final guilds = [_guild('a'), _guild('b', unavailable: true)];
      final folders = [
        _folder(id: 1, guildIds: ['a']),
      ];
      final items = computeOrganizedGuildList(guilds: guilds, folders: folders);
      expect(items.length, 1);
      expect(items[0], isA<GuildNavbarFolder>());
    });

    test('renders uncategorized folder entries as top-level guilds', () {
      final guilds = [_guild('a'), _guild('b')];
      final folders = [
        _folder(id: -1, guildIds: ['b']),
      ];
      final items = computeOrganizedGuildList(guilds: guilds, folders: folders);
      expect(items.length, 2);
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
      expect((items[1] as GuildNavbarGuild).guild.id, 'b');
    });
  });

  group('flattenOrganizedGuildList', () {
    test('linearizes top-level guilds and folder guilds in sidebar order', () {
      final items = <GuildNavbarItem>[
        GuildNavbarGuild(guild: _guild('unplaced')),
        _navbarFolder(id: 1, guildIds: ['a', 'b']),
        GuildNavbarGuild(guild: _guild('solo')),
      ];

      expect(
        flattenOrganizedGuildList(items).map((guild) => guild.id).toList(),
        ['unplaced', 'a', 'b', 'solo'],
      );
    });

    test('preserves unplaced prefix order from organized list', () {
      final guilds = [_guild('a'), _guild('b')];
      final folders = [
        _folder(id: 1, guildIds: ['a']),
      ];
      final organized = computeOrganizedGuildList(
        guilds: guilds,
        folders: folders,
      );

      expect(
        flattenOrganizedGuildList(organized).map((guild) => guild.id).toList(),
        ['b', 'a'],
      );
    });
  });

  group('pinActiveGuildToFront', () {
    const guilds = <Guild>[
      Guild(id: '1', name: 'One'),
      Guild(id: '2', name: 'Two'),
      Guild(id: '3', name: 'Three'),
    ];

    test('moves active guild from middle to front', () {
      expect(
        pinActiveGuildToFront(guilds, '2').map((guild) => guild.id).toList(),
        ['2', '1', '3'],
      );
    });

    test('moves active guild from end to front', () {
      expect(
        pinActiveGuildToFront(guilds, '3').map((guild) => guild.id).toList(),
        ['3', '1', '2'],
      );
    });

    test('leaves list unchanged when active guild is already first', () {
      expect(pinActiveGuildToFront(guilds, '1'), guilds);
    });

    test('leaves list unchanged when active guild is absent', () {
      expect(pinActiveGuildToFront(guilds, 'missing'), guilds);
    });
  });

  group('guildsForExpressionPicker', () {
    test('flattens organized list and pins active guild first', () {
      final organized = <GuildNavbarItem>[
        GuildNavbarGuild(guild: _guild('b')),
        _navbarFolder(id: 1, guildIds: ['a', 'c']),
      ];

      expect(
        guildsForExpressionPicker(
          organized: organized,
          activeGuildId: 'c',
        ).map((guild) => guild.id).toList(),
        ['c', 'b', 'a'],
      );
    });
  });

  group('OrganizedGuildList reorder', () {
    test('moves guild out of folder before target guild', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('top')),
              _navbarFolder(id: 1, guildIds: ['a', 'b', 'c']),
            ]
            ..reorder(sourceId: 'a', targetId: 'top', insertAfter: false);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 3);
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
      expect((items[1] as GuildNavbarGuild).guild.id, 'top');
      expect(items[2], isA<GuildNavbarFolder>());
      final GuildNavbarFolder folder = items[2] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['b', 'c']);
    });

    test('moves guild out of folder after target folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              _navbarFolder(id: 1, guildIds: ['a', 'b', 'c']),
              GuildNavbarGuild(guild: _guild('bottom')),
            ]
            ..reorder(sourceId: 'a', targetId: '1', insertAfter: true);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 3);
      expect(items[0], isA<GuildNavbarFolder>());
      expect((items[1] as GuildNavbarGuild).guild.id, 'a');
      expect((items[2] as GuildNavbarGuild).guild.id, 'bottom');
    });

    test('dissolves folder when last guild is moved out', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              _navbarFolder(id: 1, guildIds: ['a']),
              GuildNavbarGuild(guild: _guild('bottom')),
            ]
            ..reorder(sourceId: 'a', targetId: 'bottom', insertAfter: false);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 2);
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
      expect((items[1] as GuildNavbarGuild).guild.id, 'bottom');
    });
  });

  group('OrganizedGuildList moveIntoFolder', () {
    test('ignores dropping guild onto its own folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              _navbarFolder(id: 1, guildIds: ['a', 'b']),
            ]
            ..moveIntoFolder(guildId: 'a', folderId: 1);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 1);
      final GuildNavbarFolder folder = items[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['a', 'b']);
    });

    test('moves top-level guild into folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('solo')),
              _navbarFolder(id: 1, guildIds: ['a', 'b']),
            ]
            ..moveIntoFolder(guildId: 'solo', folderId: 1);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 1);
      final GuildNavbarFolder folder = items[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['a', 'b', 'solo']);
    });

    test('moves guild back into folder after it was dragged out', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('a')),
              _navbarFolder(id: 1, guildIds: ['b', 'c']),
            ]
            ..moveIntoFolder(guildId: 'a', folderId: 1);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 1);
      final GuildNavbarFolder folder = items[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['b', 'c', 'a']);
    });

    test('inserts guild at hovered position inside folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('solo')),
              _navbarFolder(id: 1, guildIds: ['a', 'b', 'c']),
            ]
            ..moveIntoFolderAtPosition(
              guildId: 'solo',
              folderId: 1,
              referenceGuildId: 'b',
              insertAfter: false,
            );

      final GuildNavbarFolder folder = notifier.state[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), [
        'a',
        'solo',
        'b',
        'c',
      ]);
    });

    test('reorders guild within the same folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              _navbarFolder(id: 1, guildIds: ['a', 'b', 'c']),
            ]
            ..moveIntoFolderAtPosition(
              guildId: 'c',
              folderId: 1,
              referenceGuildId: 'a',
              insertAfter: true,
            );

      final GuildNavbarFolder folder = notifier.state[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['a', 'c', 'b']);
    });
  });

  group('OrganizedGuildList folder settings', () {
    test('updateFolder updates metadata without changing guild membership', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              _navbarFolder(id: 1, guildIds: ['a', 'b']),
            ]
            ..updateFolder(
              1,
              name: 'Gaming',
              color: 0xFF5733,
              flags: 1,
              icon: 'star',
            );

      final GuildNavbarFolder folder = notifier.state[0] as GuildNavbarFolder;
      expect(folder.name, 'Gaming');
      expect(folder.color, 0xFF5733);
      expect(folder.flags, 1);
      expect(folder.icon, 'star');
      expect(folder.showIconWhenCollapsed, isTrue);
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['a', 'b']);
    });

    test('dissolveFolder expands guilds to top-level items', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('top')),
              _navbarFolder(id: 1, guildIds: ['a', 'b']),
            ]
            ..dissolveFolder(1);

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 3);
      expect((items[0] as GuildNavbarGuild).guild.id, 'top');
      expect((items[1] as GuildNavbarGuild).guild.id, 'a');
      expect((items[2] as GuildNavbarGuild).guild.id, 'b');
    });
  });

  group('OrganizedGuildList applyDragDrop', () {
    test('reorder path moves guild out of folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('top')),
              _navbarFolder(id: 1, guildIds: ['a', 'b']),
            ]
            ..applyDragDrop(
              sourceId: 'a',
              targetId: 'top',
              targetIsFolder: false,
              position: DropPosition.before,
            );

      final List<GuildNavbarItem> items = notifier.state;
      expect((items[0] as GuildNavbarGuild).guild.id, 'a');
    });

    test('combine path moves top-level guild into folder', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('solo')),
              _navbarFolder(id: 1, guildIds: ['a', 'b']),
            ]
            ..applyDragDrop(
              sourceId: 'solo',
              targetId: '1',
              targetIsFolder: true,
              position: DropPosition.combine,
            );

      final List<GuildNavbarItem> items = notifier.state;
      expect(items.length, 1);
      final GuildNavbarFolder folder = items[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), ['a', 'b', 'solo']);
    });

    test('before path inserts guild at hovered folder position', () {
      final ProviderContainer container = _organizedGuildListTestContainer();
      addTearDown(container.dispose);
      final OrganizedGuildList notifier =
          container.read(organizedGuildListProvider.notifier)
            ..state = [
              GuildNavbarGuild(guild: _guild('solo')),
              _navbarFolder(id: 1, guildIds: ['a', 'b', 'c']),
            ]
            ..applyDragDrop(
              sourceId: 'solo',
              targetId: 'b',
              targetIsFolder: false,
              position: DropPosition.before,
            );

      final GuildNavbarFolder folder = notifier.state[0] as GuildNavbarFolder;
      expect(folder.guilds.map((Guild g) => g.id).toList(), [
        'a',
        'solo',
        'b',
        'c',
      ]);
    });
  });
}
