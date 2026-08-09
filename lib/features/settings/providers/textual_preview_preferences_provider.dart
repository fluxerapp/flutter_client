import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'textual_preview_preferences_provider.g.dart';

class TextualPreviewPreferencesState {
  const TextualPreviewPreferencesState({this.wrapText = false});

  final bool wrapText;

  TextualPreviewPreferencesState copyWith({bool? wrapText}) {
    return TextualPreviewPreferencesState(wrapText: wrapText ?? this.wrapText);
  }
}

@Riverpod(keepAlive: true)
class TextualPreviewPreferences extends _$TextualPreviewPreferences {
  @override
  TextualPreviewPreferencesState build() {
    return const TextualPreviewPreferencesState();
  }

  Future<void> applySynced(TextualPreviewPreferencesState value) async {
    state = value;
  }

  Future<void> setWrapText({required bool value}) async {
    state = state.copyWith(wrapText: value);
    ref
        .read(syncedPreferencesStoreProvider)
        .markDirty(SyncedPreferenceField.textualPreview);
  }

  Future<void> toggleWrapText() async {
    await setWrapText(value: !state.wrapText);
  }
}
