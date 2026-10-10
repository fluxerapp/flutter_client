import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mention_filters_provider.g.dart';

@immutable
class MentionFilters {
  const MentionFilters({
    this.includeEveryone = true,
    this.includeRoles = true,
    this.includeGuilds = true,
  });

  final bool includeEveryone;
  final bool includeRoles;
  final bool includeGuilds;

  bool includes({
    required bool inGuild,
    required bool mentionsEveryone,
    required bool mentionsRoles,
  }) {
    if (!includeGuilds && inGuild) {
      return false;
    }
    if (!includeEveryone && mentionsEveryone) {
      return false;
    }
    return includeRoles || !mentionsRoles;
  }

  @override
  bool operator ==(Object other) {
    return other is MentionFilters &&
        other.includeEveryone == includeEveryone &&
        other.includeRoles == includeRoles &&
        other.includeGuilds == includeGuilds;
  }

  @override
  int get hashCode => Object.hash(includeEveryone, includeRoles, includeGuilds);
}

@Riverpod(keepAlive: true)
class MentionFiltersPreferences extends _$MentionFiltersPreferences {
  @override
  MentionFilters build() {
    ref.watch(currentUserIdProvider);
    return const MentionFilters();
  }

  Future<void> applySynced(MentionFilters value) async {
    state = value;
  }

  void set(MentionFilters value) {
    if (state == value) {
      return;
    }
    state = value;
    ref.markSyncedDirty(SyncedPreferenceField.recentMentions);
  }
}
