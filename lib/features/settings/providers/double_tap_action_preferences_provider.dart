import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'double_tap_action_preferences_provider.g.dart';

enum DoubleTapActionPreference { unspecified, react, edit, none }

extension DoubleTapActionPreferenceBehavior on DoubleTapActionPreference {
  DoubleTapActionPreference get effective {
    if (this == DoubleTapActionPreference.unspecified) {
      return DoubleTapActionPreference.react;
    }
    return this;
  }
}

@immutable
class DoubleTapActionPreferencesState {
  const DoubleTapActionPreferencesState({
    this.action = DoubleTapActionPreference.unspecified,
  });

  final DoubleTapActionPreference action;

  DoubleTapActionPreference get effectiveAction => action.effective;

  @override
  bool operator ==(Object other) {
    return other is DoubleTapActionPreferencesState && other.action == action;
  }

  @override
  int get hashCode => action.hashCode;
}

@Riverpod(keepAlive: true)
class DoubleTapActionPreferences extends _$DoubleTapActionPreferences {
  @override
  DoubleTapActionPreferencesState build() {
    return const DoubleTapActionPreferencesState();
  }

  Future<void> applySynced(DoubleTapActionPreferencesState value) async {
    state = value;
  }

  Future<void> setAction(DoubleTapActionPreference action) async {
    state = DoubleTapActionPreferencesState(action: action);
    ref.markSyncedDirty(SyncedPreferenceField.doubleTapAction);
  }
}
