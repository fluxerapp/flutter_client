import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

const GuildUserSettingsPersistenceOptions _immediateSync =
    GuildUserSettingsPersistenceOptions(persistImmediately: true);

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi({this.onPatch, this.shouldThrow = false});

  UserGuildSettingsUpdateRequest? lastRequest;
  int patchCount = 0;
  final FutureOr<UserGuildSettingsResponse> Function(
    String guildId,
    UserGuildSettingsUpdateRequest body,
  )?
  onPatch;
  final bool shouldThrow;

  @override
  Future<UserGuildSettingsResponse> updateGuildSettingsForUser({
    required String guildId,
    required UserGuildSettingsUpdateRequest body,
  }) async {
    patchCount++;
    lastRequest = body;
    if (shouldThrow) {
      throw Exception('patch failed');
    }
    if (onPatch != null) {
      return await onPatch!(guildId, body);
    }
    return UserGuildSettingsResponse(
      guildId: guildId,
      messageNotifications: UserNotificationSettings.inherit,
      muted: false,
      muteConfig: null,
      mobilePush: true,
      suppressEveryone: false,
      suppressRoles: false,
      hideMutedChannels: false,
      channelOverrides: body.channelOverrides,
      version: 1,
    );
  }

  @override
  Future<UserGuildSettingsResponse> updateDmNotificationSettings({
    required UserGuildSettingsUpdateRequest body,
  }) => updateGuildSettingsForUser(guildId: '@me', body: body);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._usersApi) : super(Dio());

  final UsersApi _usersApi;

  @override
  UsersApi get users => _usersApi;
}

ProviderContainer _createContainer({
  required db.FluxerDatabase database,
  required _FakeUsersApi usersApi,
  Duration patchDebounce = kGuildUserSettingsPatchDebounce,
}) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
      fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
      guildUserSettingsRepositoryProvider.overrideWith(
        (Ref ref) =>
            GuildUserSettingsRepository(ref, patchDebounce: patchDebounce),
      ),
    ],
  );
}

Future<void> _seedGuildSettings({
  required db.FluxerDatabase database,
  required String guildId,
  required Map<String, ChannelOverrides> channelOverrides,
}) {
  return database.userGuildSettingsDao.upsert(
    db.UserGuildSettingsTableCompanion(
      guildId: Value(guildId),
      data: Value(
        jsonEncode(
          UserGuildSettingsResponse(
            guildId: guildId,
            messageNotifications: UserNotificationSettings.inherit,
            muted: false,
            muteConfig: null,
            mobilePush: true,
            suppressEveryone: false,
            suppressRoles: false,
            hideMutedChannels: false,
            channelOverrides: channelOverrides,
            version: 1,
          ).toJson(),
        ),
      ),
    ),
  );
}

void main() {
  group('GuildUserSettingsRepository', () {
    late db.FluxerDatabase database;
    late _FakeUsersApi usersApi;
    late ProviderContainer container;

    setUp(() {
      database = openTestDatabase();
      usersApi = _FakeUsersApi();
      container = _createContainer(database: database, usersApi: usersApi);
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'toggleCategoryCollapsed flips collapsed in drift and PATCH',
      () async {
        const guildId = 'guild-1';
        const categoryId = 'category-1';
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.toggleCategoryCollapsed(
          guildId: guildId,
          categoryId: categoryId,
          options: _immediateSync,
        );

        expect(usersApi.patchCount, 1);
        expect(
          usersApi.lastRequest?.channelOverrides?[categoryId]?.collapsed,
          isTrue,
        );

        final row = await database.userGuildSettingsDao.getByGuildId(guildId);
        expect(row, isNotNull);
        final data = jsonDecode(row!.data) as Map<String, dynamic>;
        final overrides = data['channel_overrides'] as Map<String, dynamic>;
        final categoryOverride = overrides[categoryId] as Map<String, dynamic>;
        expect(categoryOverride['collapsed'], isTrue);

        final subscription = container.listen(
          guildCollapsedCategoriesProvider(guildId),
          (_, _) {},
          fireImmediately: true,
        );
        addTearDown(subscription.close);
        await pumpEventQueue();
        expect(subscription.read().requireValue, {categoryId});
      },
    );

    test('toggleCategoryCollapsed collapses then expands', () async {
      const guildId = 'guild-1';
      const categoryId = 'category-1';
      final GuildUserSettingsRepository repo = container.read(
        guildUserSettingsRepositoryProvider,
      );

      await repo.toggleCategoryCollapsed(
        guildId: guildId,
        categoryId: categoryId,
        options: _immediateSync,
      );
      await repo.toggleCategoryCollapsed(
        guildId: guildId,
        categoryId: categoryId,
        options: _immediateSync,
      );

      expect(
        usersApi.lastRequest?.channelOverrides?[categoryId]?.collapsed,
        isFalse,
      );

      final subscription = container.listen(
        guildCollapsedCategoriesProvider(guildId),
        (_, _) {},
        fireImmediately: true,
      );
      addTearDown(subscription.close);
      await pumpEventQueue();
      expect(subscription.read().requireValue, isEmpty);
    });

    test(
      'toggleCategoryCollapsed preserves existing muted channel overrides in PATCH',
      () async {
        const guildId = 'guild-1';
        const categoryId = 'category-1';
        const mutedChannelId = 'channel-muted';
        await _seedGuildSettings(
          database: database,
          guildId: guildId,
          channelOverrides: {
            mutedChannelId: const ChannelOverrides(
              collapsed: false,
              messageNotifications: UserNotificationSettings.inherit,
              muted: true,
              muteConfig: null,
            ),
          },
        );
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.toggleCategoryCollapsed(
          guildId: guildId,
          categoryId: categoryId,
          options: _immediateSync,
        );

        expect(usersApi.patchCount, 1);
        final overrides = usersApi.lastRequest?.channelOverrides;
        expect(overrides, isNotNull);
        expect(overrides!.keys, containsAll([categoryId, mutedChannelId]));
        expect(overrides[mutedChannelId]?.muted, isTrue);
        expect(overrides[categoryId]?.collapsed, isTrue);
      },
    );

    test(
      'toggleAllCategoriesCollapsed collapses all when some are expanded',
      () async {
        const guildId = 'guild-1';
        const categoryA = 'category-a';
        const categoryB = 'category-b';
        const categoryC = 'category-c';
        await _seedGuildSettings(
          database: database,
          guildId: guildId,
          channelOverrides: {
            categoryA: const ChannelOverrides(
              collapsed: false,
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
            ),
            categoryB: const ChannelOverrides(
              collapsed: true,
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
            ),
          },
        );
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.toggleAllCategoriesCollapsed(
          guildId: guildId,
          categoryIds: const [categoryA, categoryB, categoryC],
          options: _immediateSync,
        );

        expect(usersApi.patchCount, 1);
        final overrides = usersApi.lastRequest?.channelOverrides;
        expect(overrides, isNotNull);
        expect(overrides!.keys, containsAll([categoryA, categoryB, categoryC]));
        expect(overrides[categoryA]?.collapsed, isTrue);
        expect(overrides[categoryB]?.collapsed, isTrue);
        expect(overrides[categoryC]?.collapsed, isTrue);
      },
    );

    test(
      'toggleAllCategoriesCollapsed expands all when all are collapsed',
      () async {
        const guildId = 'guild-1';
        const categoryA = 'category-a';
        const categoryB = 'category-b';
        await _seedGuildSettings(
          database: database,
          guildId: guildId,
          channelOverrides: {
            categoryA: const ChannelOverrides(
              collapsed: true,
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
            ),
            categoryB: const ChannelOverrides(
              collapsed: true,
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
            ),
          },
        );
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.toggleAllCategoriesCollapsed(
          guildId: guildId,
          categoryIds: const [categoryA, categoryB],
          options: _immediateSync,
        );

        final overrides = usersApi.lastRequest?.channelOverrides;
        expect(overrides, isNotNull);
        expect(overrides![categoryA]?.collapsed, isFalse);
        expect(overrides[categoryB]?.collapsed, isFalse);
      },
    );

    test(
      'updateChannelOverride mute preserves unrelated overrides in PATCH',
      () async {
        const guildId = 'guild-1';
        const categoryId = 'category-1';
        const channelId = 'channel-1';
        await _seedGuildSettings(
          database: database,
          guildId: guildId,
          channelOverrides: {
            categoryId: const ChannelOverrides(
              collapsed: true,
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
            ),
          },
        );
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelId,
          muted: true,
          options: _immediateSync,
        );

        final overrides = usersApi.lastRequest?.channelOverrides;
        expect(overrides!.keys, containsAll([categoryId, channelId]));
        expect(overrides[categoryId]?.collapsed, isTrue);
        expect(overrides[channelId]?.muted, isTrue);
      },
    );

    test(
      'persists merged channel overrides when API response is partial',
      () async {
        const guildId = 'guild-1';
        const channelId = 'channel-1';
        const otherChannelId = 'channel-other';
        await _seedGuildSettings(
          database: database,
          guildId: guildId,
          channelOverrides: {
            otherChannelId: const ChannelOverrides(
              collapsed: false,
              messageNotifications: UserNotificationSettings.inherit,
              muted: true,
              muteConfig: null,
            ),
          },
        );
        usersApi = _FakeUsersApi(
          onPatch: (guildId, body) {
            return UserGuildSettingsResponse(
              guildId: guildId,
              messageNotifications: UserNotificationSettings.inherit,
              muted: false,
              muteConfig: null,
              mobilePush: true,
              suppressEveryone: false,
              suppressRoles: false,
              hideMutedChannels: false,
              channelOverrides: {
                channelId: const ChannelOverrides(
                  collapsed: false,
                  messageNotifications: UserNotificationSettings.inherit,
                  muted: true,
                  muteConfig: null,
                ),
              },
              version: 42,
            );
          },
        );
        container.dispose();
        container = _createContainer(database: database, usersApi: usersApi);
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelId,
          muted: true,
          durationSeconds: 900,
          options: _immediateSync,
        );

        final row = await database.userGuildSettingsDao.getByGuildId(guildId);
        final stored = UserGuildSettingsResponse.fromJson(
          jsonDecode(row!.data) as Map<String, dynamic>,
        );
        expect(stored.version, 42);
        expect(
          stored.channelOverrides?.keys,
          containsAll([channelId, otherChannelId]),
        );
        expect(stored.channelOverrides?[channelId]?.muted, isTrue);
        expect(stored.channelOverrides?[channelId]?.muteConfig, isNull);
        expect(stored.channelOverrides?[otherChannelId]?.muted, isTrue);
      },
    );

    test(
      'debounced channel override updates coalesce into one PATCH',
      () async {
        const guildId = 'guild-1';
        const channelA = 'channel-a';
        const channelB = 'channel-b';
        const channelC = 'channel-c';
        container.dispose();
        container = _createContainer(
          database: database,
          usersApi: usersApi,
          patchDebounce: const Duration(milliseconds: 50),
        );
        final GuildUserSettingsRepository repo = container.read(
          guildUserSettingsRepositoryProvider,
        );

        await repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelA,
          muted: true,
        );
        await repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelB,
          muted: true,
        );
        await repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelC,
          muted: true,
        );

        expect(usersApi.patchCount, 0);

        final rowBeforeFlush = await database.userGuildSettingsDao.getByGuildId(
          guildId,
        );
        final storedBeforeFlush = UserGuildSettingsResponse.fromJson(
          jsonDecode(rowBeforeFlush!.data) as Map<String, dynamic>,
        );
        expect(
          storedBeforeFlush.channelOverrides?.keys,
          containsAll([channelA, channelB, channelC]),
        );

        await repo.flushPendingPatches(guildId: guildId);

        expect(usersApi.patchCount, 1);
        final lastOverrides = usersApi.lastRequest?.channelOverrides;
        expect(
          lastOverrides?.keys,
          containsAll([channelA, channelB, channelC]),
        );
      },
    );

    test('concurrent mutes include every channel in final PATCH', () async {
      const guildId = 'guild-1';
      const channelA = 'channel-a';
      const channelB = 'channel-b';
      const channelC = 'channel-c';
      usersApi = _FakeUsersApi(
        onPatch: (guildId, body) async {
          await Future<void>.delayed(const Duration(milliseconds: 10));
          return UserGuildSettingsResponse(
            guildId: guildId,
            messageNotifications: UserNotificationSettings.inherit,
            muted: false,
            muteConfig: null,
            mobilePush: true,
            suppressEveryone: false,
            suppressRoles: false,
            hideMutedChannels: false,
            channelOverrides: body.channelOverrides,
            version: 1,
          );
        },
      );
      container.dispose();
      container = _createContainer(database: database, usersApi: usersApi);
      final GuildUserSettingsRepository repo = container.read(
        guildUserSettingsRepositoryProvider,
      );

      await Future.wait<void>(<Future<void>>[
        repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelA,
          muted: true,
          options: _immediateSync,
        ),
        repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelB,
          muted: true,
          options: _immediateSync,
        ),
        repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelC,
          muted: true,
          options: _immediateSync,
        ),
      ]);

      expect(usersApi.patchCount, 3);
      final lastOverrides = usersApi.lastRequest?.channelOverrides;
      expect(lastOverrides?.keys, containsAll([channelA, channelB, channelC]));
      expect(lastOverrides?[channelA]?.muted, isTrue);
      expect(lastOverrides?[channelB]?.muted, isTrue);
      expect(lastOverrides?[channelC]?.muted, isTrue);

      final row = await database.userGuildSettingsDao.getByGuildId(guildId);
      final stored = UserGuildSettingsResponse.fromJson(
        jsonDecode(row!.data) as Map<String, dynamic>,
      );
      expect(
        stored.channelOverrides?.keys,
        containsAll([channelA, channelB, channelC]),
      );
      expect(stored.channelOverrides?[channelA]?.muted, isTrue);
      expect(stored.channelOverrides?[channelB]?.muted, isTrue);
      expect(stored.channelOverrides?[channelC]?.muted, isTrue);
    });

    test('keeps optimistic local mute when immediate PATCH fails', () async {
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      usersApi = _FakeUsersApi(shouldThrow: true);
      container.dispose();
      container = _createContainer(database: database, usersApi: usersApi);
      final GuildUserSettingsRepository repo = container.read(
        guildUserSettingsRepositoryProvider,
      );

      await expectLater(
        repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelId,
          muted: true,
          options: _immediateSync,
        ),
        throwsException,
      );

      final row = await database.userGuildSettingsDao.getByGuildId(guildId);
      expect(row, isNotNull);
      final stored = UserGuildSettingsResponse.fromJson(
        jsonDecode(row!.data) as Map<String, dynamic>,
      );
      expect(stored.channelOverrides?[channelId]?.muted, isTrue);
    });
  });
}
