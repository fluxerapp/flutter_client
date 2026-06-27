import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart'
    as engine;
import 'package:fluxer_app/core/synced_preferences/favorites_state_codec.dart';

export 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';

const int kSyncedPreferencesFavoritesFieldNumber = 40;

// TODO(Elias): Sync proto files from the Fluxer repo once the backend is
// published.
class SyncedPreferencesWireCodec {
  const SyncedPreferencesWireCodec._();

  static String encodeFavoritesIntoWire({
    required String? currentWire,
    required FavoritesLocalState local,
  }) {
    return FavoritesStateCodec.encodeFavoritesIntoWire(
      currentWire: currentWire,
      local: local,
    );
  }

  static bool verifyWirePreservesForeignFields({
    required String before,
    required String after,
  }) {
    return engine.SyncedPreferencesWireCodec.verifyWirePreservesForeignFields(
      before: before,
      after: after,
      replacedFieldNumber: kSyncedPreferencesFavoritesFieldNumber,
    );
  }

  static int countForeignFields(String wire) {
    return engine.SyncedPreferencesWireCodec.countForeignFields(
      wire,
      exceptFieldNumber: kSyncedPreferencesFavoritesFieldNumber,
    );
  }
}
