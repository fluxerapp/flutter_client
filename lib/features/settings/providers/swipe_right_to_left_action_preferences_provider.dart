import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'swipe_right_to_left_action_preferences_provider.g.dart';

enum SwipeRightToLeftActionPreference { unspecified, reply, channelDetails }

extension SwipeRightToLeftActionPreferenceBehavior
    on SwipeRightToLeftActionPreference {
  SwipeRightToLeftActionPreference get effective {
    if (this == SwipeRightToLeftActionPreference.unspecified) {
      return SwipeRightToLeftActionPreference.reply;
    }
    return this;
  }
}

@immutable
class SwipeRightToLeftActionPreferencesState {
  const SwipeRightToLeftActionPreferencesState({
    this.action = SwipeRightToLeftActionPreference.unspecified,
  });

  final SwipeRightToLeftActionPreference action;

  SwipeRightToLeftActionPreference get effectiveAction => action.effective;

  @override
  bool operator ==(Object other) {
    return other is SwipeRightToLeftActionPreferencesState &&
        other.action == action;
  }

  @override
  int get hashCode => action.hashCode;
}

@Riverpod(keepAlive: true)
class SwipeRightToLeftActionPreferences
    extends _$SwipeRightToLeftActionPreferences {
  @override
  SwipeRightToLeftActionPreferencesState build() {
    ref.watch(currentUserIdProvider);
    return const SwipeRightToLeftActionPreferencesState();
  }

  Future<void> applySynced(SwipeRightToLeftActionPreferencesState value) async {
    state = value;
  }

  Future<void> setAction(SwipeRightToLeftActionPreference action) async {
    state = SwipeRightToLeftActionPreferencesState(action: action);
    ref.markSyncedDirty(SyncedPreferenceField.swipeRightToLeftAction);
  }
}
