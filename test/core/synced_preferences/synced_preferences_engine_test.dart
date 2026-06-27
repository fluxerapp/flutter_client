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
      final wire = pb.SyncedPreferences(
        favorites: pb.FavoritesState(
          channels: [
            pb.FavoriteChannel(channelId: 'wire', guildId: 'g', position: 0),
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
        wire: wire,
        incoming: incoming,
        protectedFields: {SyncedPreferenceField.favorites},
        recentlyAckedFields: {},
        inFlight: null,
        syncInFlight: false,
      );
      expect(result.merged.favorites.channels.single.channelId, 'local');
    });

    test('mergeIncoming applies acked field mismatch from local', () {
      final local = pb.SyncedPreferences(
        sidebar: pb.SidebarPreferences(inlineDmsCollapsed: true),
      );
      final wire = pb.SyncedPreferences(
        sidebar: pb.SidebarPreferences(inlineDmsCollapsed: false),
      );
      final incoming = pb.SyncedPreferences(
        sidebar: pb.SidebarPreferences(inlineDmsCollapsed: false),
      );
      final result = SyncedPreferencesEngine.mergeIncoming(
        local: local,
        wire: wire,
        incoming: incoming,
        protectedFields: {},
        recentlyAckedFields: {SyncedPreferenceField.sidebar},
        inFlight: null,
        syncInFlight: false,
      );
      expect(result.merged.sidebar.inlineDmsCollapsed, isTrue);
      expect(result.wire.sidebar.inlineDmsCollapsed, isTrue);
    });

    test('changedFields detects field differences', () {
      final left = pb.SyncedPreferences(
        privacy: pb.PrivacyPreferences(showActiveNow: true),
      );
      final right = pb.SyncedPreferences(
        privacy: pb.PrivacyPreferences(showActiveNow: false),
      );
      final changed = SyncedPreferencesEngine.changedFields(
        left: left,
        right: right,
      );
      expect(changed, [SyncedPreferenceField.privacy]);
    });

    test('decode and encode roundtrip', () {
      final message = pb.SyncedPreferences(
        accessibility: accessibility_pb.AccessibilitySettings(
          hideKeyboardHints: true,
          showFavorites: false,
        ),
      );
      final encoded = SyncedPreferencesEngine.encode(message);
      final decoded = SyncedPreferencesEngine.decode(encoded);
      expect(decoded.accessibility.hideKeyboardHints, isTrue);
      expect(decoded.accessibility.showFavorites, isFalse);
    });
  });
}
