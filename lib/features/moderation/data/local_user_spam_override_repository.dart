import 'package:fluxer_app/core/database/daos/local_spam_overrides_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';

class LocalUserSpamOverrideRepository {
  LocalUserSpamOverrideRepository(this._database, this._store);

  final db.FluxerDatabase _database;
  final SyncedPreferencesStore _store;

  Future<LocalSpamOverrideSets> getOverrides() =>
      _database.localSpamOverridesDao.getOverrides();

  Future<void> replaceOverrides(LocalSpamOverrideSets sets) async {
    await _database.localSpamOverridesDao.replaceOverrides(sets);
    _store.markDirty(SyncedPreferenceField.localSpamOverrides);
  }
}
