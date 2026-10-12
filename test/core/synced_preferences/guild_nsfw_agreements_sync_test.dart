import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

const _userId = 'user-1';

void main() {
  late db.FluxerDatabase database;
  late RecordingUsersApi api;
  late ProviderContainer container;
  late SyncedPreferencesStore store;

  setUp(() {
    database = openTestDatabase();
    api = RecordingUsersApi();
    container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerClientProvider.overrideWithValue(RecordingFluxerClient(api)),
        currentUserIdProvider.overrideWithValue(_userId),
      ],
    );
    addTearDown(container.dispose);
    store = container.read(syncedPreferencesStoreProvider);
  });

  test('an age gate accepted on web applies on mobile', () async {
    await store.hydrateFromUserSettings(
      syncedPreferencesUserSettings(
        pb.SyncedPreferences(
          guildNsfwAgreements: pb.GuildNsfwAgreements(
            agreedChannelIds: ['c1'],
            agreedGuildIds: ['g1'],
            agreedCategoryIds: ['k1'],
          ),
        ),
      ),
    );

    final agreements = await database.userPreferencesDao
        .getMatureContentAgreements(_userId);
    expect(agreements.agreedChannelIds, ['c1']);
    expect(agreements.agreedGuildIds, ['g1']);
    expect(agreements.agreedCategoryIds, ['k1']);
  });

  test('a mobile agreement is pushed without touching other fields', () async {
    await store.hydrateFromUserSettings(
      syncedPreferencesUserSettings(
        pb.SyncedPreferences(
          sidebar: pb.SidebarPreferences(inlineDmsCollapsed: true),
          guildNsfwAgreements: pb.GuildNsfwAgreements(agreedGuildIds: ['g1']),
        ),
      ),
    );

    await database.userPreferencesDao.setMatureContentAgreements(
      _userId,
      const MatureContentAgreements(
        agreedChannelIds: ['c2'],
        agreedGuildIds: ['g1'],
      ),
    );
    store.markDirty(SyncedPreferenceField.guildNsfwAgreements);
    await flushSyncedPreferencesDebounce(store);

    final pushed = api.lastPush;
    expect(pushed.guildNsfwAgreements.agreedChannelIds, ['c2']);
    expect(pushed.guildNsfwAgreements.agreedGuildIds, ['g1']);
    expect(pushed.sidebar.inlineDmsCollapsed, isTrue);
  });
}
