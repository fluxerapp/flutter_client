import 'package:fixnum/fixnum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/fields/save_camera_uploads_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/chat_input_preferences_provider.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/synced_preferences_test_helpers.dart';

pb.SyncedPreferences _withField113(bool value) => pb.SyncedPreferences()
  ..unknownFields.mergeVarintField(
    kSaveCameraUploadsToDeviceFieldNumber,
    Int64(value ? 1 : 0),
  );

void main() {
  late RecordingUsersApi api;
  late ProviderContainer container;
  late SyncedPreferencesStore store;

  setUp(() {
    api = RecordingUsersApi();
    container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
        fluxerClientProvider.overrideWithValue(RecordingFluxerClient(api)),
        currentUserIdProvider.overrideWithValue('user-1'),
      ],
    );
    addTearDown(container.dispose);
    store = container.read(syncedPreferencesStoreProvider);
  });

  test('reads the canonical top-level field 113', () async {
    await store.hydrateFromUserSettings(
      syncedPreferencesUserSettings(_withField113(false)),
    );
    expect(
      container.read(chatInputPreferencesProvider).saveCameraCapturesToDevice,
      isFalse,
    );
  });

  test('falls back to the legacy chat input field', () async {
    await store.hydrateFromUserSettings(
      syncedPreferencesUserSettings(
        pb.SyncedPreferences(
          chatInput: pb.ChatInputSettings(saveCameraCapturesToDevice: false),
        ),
      ),
    );
    expect(
      container.read(chatInputPreferencesProvider).saveCameraCapturesToDevice,
      isFalse,
    );
  });

  test('pushes to field 113 and leaves chat input alone', () async {
    await store.hydrateFromUserSettings(
      syncedPreferencesUserSettings(
        pb.SyncedPreferences(
          chatInput: pb.ChatInputSettings(),
          sidebar: pb.SidebarPreferences(inlineDmsCollapsed: true),
        ),
      ),
    );
    await container
        .read(chatInputPreferencesProvider.notifier)
        .setSaveCameraCapturesToDevice(value: false);
    await flushSyncedPreferencesDebounce(store);

    final pushed = api.lastPush;
    expect(
      pushed.unknownFields
          .getField(kSaveCameraUploadsToDeviceFieldNumber)
          ?.varints,
      [Int64.ZERO],
    );
    expect(pushed.chatInput.hasSaveCameraCapturesToDevice(), isFalse);
    expect(pushed.sidebar.inlineDmsCollapsed, isTrue);
  });
}
