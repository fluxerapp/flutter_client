import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_dart/export.dart';

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi({this.onPatch, this.shouldThrow = false});

  UserGuildSettingsUpdateRequest? lastRequest;
  int patchCount = 0;
  final UserGuildSettingsResponse Function(
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
      return onPatch!(guildId, body);
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
}) {
  return ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(database),
      fluxerClientProvider.overrideWithValue(_FakeClient(usersApi)),
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
      database = db.FluxerDatabase.forTesting(NativeDatabase.memory());
      usersApi = _FakeUsersApi();
      container = _createContainer(database: database, usersApi: usersApi);
    });

    tearDown(() async {
      container.dispose();
      await database.close();
    });

    test(
      'toggleCategoryCollapsed flips collapsed in drift and PATCH',
      () async {
        const guildId = 'guild-1';
        const categoryId = 'category-1';
        final repo = container.read(guildUserSettingsRepositoryProvider);

        await repo.toggleCategoryCollapsed(
          guildId: guildId,
          categoryId: categoryId,
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
      final repo = container.read(guildUserSettingsRepositoryProvider);

      await repo.toggleCategoryCollapsed(
        guildId: guildId,
        categoryId: categoryId,
      );
      await repo.toggleCategoryCollapsed(
        guildId: guildId,
        categoryId: categoryId,
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
        final repo = container.read(guildUserSettingsRepositoryProvider);

        await repo.toggleCategoryCollapsed(
          guildId: guildId,
          categoryId: categoryId,
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
        final repo = container.read(guildUserSettingsRepositoryProvider);

        await repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelId,
          muted: true,
        );

        final overrides = usersApi.lastRequest?.channelOverrides;
        expect(overrides!.keys, containsAll([categoryId, channelId]));
        expect(overrides[categoryId]?.collapsed, isTrue);
        expect(overrides[channelId]?.muted, isTrue);
      },
    );

    test('persists drift from API response not pre-merge state', () async {
      const guildId = 'guild-1';
      const channelId = 'channel-1';
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
      final repo = container.read(guildUserSettingsRepositoryProvider);

      await repo.updateChannelOverride(
        guildId: guildId,
        channelId: channelId,
        muted: true,
        durationSeconds: 900,
      );

      final row = await database.userGuildSettingsDao.getByGuildId(guildId);
      final stored = UserGuildSettingsResponse.fromJson(
        jsonDecode(row!.data) as Map<String, dynamic>,
      );
      expect(stored.version, 42);
      expect(stored.channelOverrides?[channelId]?.muteConfig, isNull);
    });

    test('does not write drift when PATCH fails', () async {
      const guildId = 'guild-1';
      const channelId = 'channel-1';
      usersApi = _FakeUsersApi(shouldThrow: true);
      container.dispose();
      container = _createContainer(database: database, usersApi: usersApi);
      final repo = container.read(guildUserSettingsRepositoryProvider);

      await expectLater(
        repo.updateChannelOverride(
          guildId: guildId,
          channelId: channelId,
          muted: true,
        ),
        throwsException,
      );

      final row = await database.userGuildSettingsDao.getByGuildId(guildId);
      expect(row, isNull);
    });
  });
}
