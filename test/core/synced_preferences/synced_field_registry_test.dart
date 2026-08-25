import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_registry.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';

void main() {
  test('kRegisteredSyncedPreferenceFields lists every store adapter', () {
    expect(kRegisteredSyncedPreferenceFields, {
      SyncedPreferenceField.favorites,
      SyncedPreferenceField.accessibility,
      SyncedPreferenceField.accessibilityOverrides,
      SyncedPreferenceField.searchEngines,
      SyncedPreferenceField.sidebar,
      SyncedPreferenceField.privacy,
      SyncedPreferenceField.memberList,
      SyncedPreferenceField.unreadChannels,
      SyncedPreferenceField.voicePrompts,
      SyncedPreferenceField.sound,
      SyncedPreferenceField.guildFolders,
      SyncedPreferenceField.localSpamOverrides,
      SyncedPreferenceField.nagbars,
      SyncedPreferenceField.textualPreview,
      SyncedPreferenceField.emojiPicker,
      SyncedPreferenceField.stickerPicker,
      SyncedPreferenceField.favoriteGifs,
    });
  });
}
