import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';

extension SyncedPreferencesDirtyRef on Ref {
  void markSyncedDirty(SyncedPreferenceField field) {
    read(syncedPreferencesStoreProvider).markDirty(field);
  }
}
