import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_registry.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';

void main() {
  test('registerDefaultSyncedFieldAdapters registers every store adapter', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final List<SyncedPreferenceField> registered = container.read(
      Provider<List<SyncedPreferenceField>>((Ref ref) {
        final List<SyncedPreferenceField> fields = <SyncedPreferenceField>[];
        registerDefaultSyncedFieldAdapters(
          registerAdapter: (adapter) => fields.add(adapter.field),
          ref: ref,
        );
        return fields;
      }),
    );
    expect(registered, hasLength(20));
    expect(registered.toSet(), {
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
      SyncedPreferenceField.chatInput,
      SyncedPreferenceField.doubleTapReaction,
      SyncedPreferenceField.doubleTapAction,
    });
  });
}
