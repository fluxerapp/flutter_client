import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/fields/favorites_synced_field.dart';

export 'package:fluxer_app/core/synced_preferences/fields/favorites_synced_field.dart'
    show
        FavoritesLocalState,
        FavoritesStateHelpers,
        FavoritesWireDecodeResult,
        FavoritesWireDecodeStatus;

class FavoritesStateCodec {
  const FavoritesStateCodec._();

  static FavoritesLocalState decodeFavoritesFromWire(String encoded) {
    return FavoritesSyncedField.decodeFromWireResult(encoded).state;
  }

  static FavoritesWireDecodeResult decodeFavoritesFromWireResult(
    String encoded,
  ) {
    return FavoritesSyncedField.decodeFromWireResult(encoded);
  }

  static String encodeFavoritesIntoWire({
    required String? currentWire,
    required FavoritesLocalState local,
  }) {
    return SyncedPreferencesWireCodec.encodeFieldIntoWire(
      currentWire: currentWire,
      fieldNumber: SyncedPreferenceField.favorites.fieldNumber,
      fieldMessageBytes: FavoritesStateHelpers.toProto(
        FavoritesStateHelpers.normalizeForSync(local),
      ).writeToBuffer(),
    );
  }

  static bool verifyRoundtripStability(FavoritesLocalState candidate) {
    return FavoritesStateHelpers.verifyRoundtripStability(candidate);
  }

  static FavoritesLocalState normalizeForSync(FavoritesLocalState state) {
    return FavoritesStateHelpers.normalizeForSync(state);
  }

  static bool statesEqual(FavoritesLocalState a, FavoritesLocalState b) {
    return FavoritesStateHelpers.statesEqual(a, b);
  }

  static FavoritesLocalState mergeForMigration({
    required FavoritesLocalState local,
    required FavoritesLocalState server,
    FavoritesLocalState? syncedLocal,
  }) {
    return FavoritesStateHelpers.mergeForMigration(
      local: local,
      server: server,
      syncedLocal: syncedLocal,
    );
  }
}
