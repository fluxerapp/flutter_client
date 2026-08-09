import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/settings/providers/textual_preview_preferences_provider.dart';

class _FakeSyncedPreferencesStore extends SyncedPreferencesStore {
  _FakeSyncedPreferencesStore(super.ref);

  final List<SyncedPreferenceField> dirty = <SyncedPreferenceField>[];

  @override
  void registerDefaultAdapters() {}

  @override
  void markDirty(SyncedPreferenceField field) {
    dirty.add(field);
  }
}

void main() {
  test('toggleWrapText updates state and marks textualPreview dirty', () async {
    late _FakeSyncedPreferencesStore store;
    final ProviderContainer container = ProviderContainer(
      overrides: [
        syncedPreferencesStoreProvider.overrideWith((Ref ref) {
          store = _FakeSyncedPreferencesStore(ref);
          return store;
        }),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(textualPreviewPreferencesProvider).wrapText, isFalse);

    await container
        .read(textualPreviewPreferencesProvider.notifier)
        .toggleWrapText();

    expect(container.read(textualPreviewPreferencesProvider).wrapText, isTrue);
    expect(store.dirty, contains(SyncedPreferenceField.textualPreview));
  });
}
