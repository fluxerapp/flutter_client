import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'double_tap_reaction_preferences_provider.g.dart';

const String kDefaultDoubleTapReactionName = '\u{1F44D}';

@immutable
class DoubleTapReactionPreferencesState {
  const DoubleTapReactionPreferencesState({
    this.name = kDefaultDoubleTapReactionName,
    this.id,
    this.isSet = false,
  });

  static const unset = DoubleTapReactionPreferencesState();

  final String name;
  final String? id;
  final bool isSet;

  bool get isCustom {
    final emojiId = id;
    return emojiId != null && emojiId.isNotEmpty;
  }

  @override
  bool operator ==(Object other) {
    return other is DoubleTapReactionPreferencesState &&
        other.name == name &&
        other.id == id &&
        other.isSet == isSet;
  }

  @override
  int get hashCode => Object.hash(name, id, isSet);
}

@Riverpod(keepAlive: true)
class DoubleTapReactionPreferences extends _$DoubleTapReactionPreferences {
  @override
  DoubleTapReactionPreferencesState build() {
    return DoubleTapReactionPreferencesState.unset;
  }

  Future<void> applySynced(DoubleTapReactionPreferencesState value) async {
    state = value;
  }

  Future<void> setReaction({required String name, String? id}) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      return;
    }
    final emojiId = id == null || id.isEmpty ? null : id;
    state = DoubleTapReactionPreferencesState(
      name: trimmed,
      id: emojiId,
      isSet: true,
    );
    ref.markSyncedDirty(SyncedPreferenceField.doubleTapReaction);
  }
}
