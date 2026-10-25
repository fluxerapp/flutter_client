import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_engine.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

void main() {
  group('SyncedPreferencesEngine', () {
    test('mergeIncoming keeps protected local field bytes', () {
      final local = pb.SyncedPreferences(
        favorites: pb.FavoritesState(
          channels: [
            pb.FavoriteChannel(channelId: 'local', guildId: 'g', position: 0),
          ],
        ),
      );
      final incoming = pb.SyncedPreferences(
        favorites: pb.FavoritesState(
          channels: [
            pb.FavoriteChannel(channelId: 'remote', guildId: 'g', position: 0),
          ],
        ),
      );
      final result = SyncedPreferencesEngine.mergeIncoming(
        local: local,
        incoming: incoming,
        protectedFields: {SyncedPreferenceField.favorites},
        inFlight: null,
        syncInFlight: false,
      );
      expect(result.merged.favorites.channels.single.channelId, 'local');
    });

    test('decode reads base64 wire bytes', () {
      final message = pb.SyncedPreferences(
        accessibility: accessibility_pb.AccessibilitySettings(
          hideKeyboardHints: true,
          showFavorites: false,
        ),
      );
      final String encoded = base64Encode(message.writeToBuffer());
      final decoded = SyncedPreferencesEngine.decode(encoded);
      expect(decoded.accessibility.hideKeyboardHints, isTrue);
      expect(decoded.accessibility.showFavorites, isFalse);
    });
  });
}
