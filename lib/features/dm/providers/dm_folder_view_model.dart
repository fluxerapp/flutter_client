import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_folder_view_model.g.dart';

class DmFolderViewState {
  final bool expanded;
  final Set<String> allowlistedIds;

  const DmFolderViewState({
    this.expanded = false,
    this.allowlistedIds = const {},
  });

  DmFolderViewState copyWith({bool? expanded, Set<String>? allowlistedIds}) {
    return DmFolderViewState(
      expanded: expanded ?? this.expanded,
      allowlistedIds: allowlistedIds ?? this.allowlistedIds,
    );
  }
}

@Riverpod(keepAlive: true)
class DmFolder extends _$DmFolder {
  @override
  DmFolderViewState build() {
    ref.watch(currentUserIdProvider);
    ref.listen(appearancePreferencesProvider, (
      AppearancePreferencesState? previous,
      AppearancePreferencesState next,
    ) {
      if (previous != null &&
          previous.collapseDMs != next.collapseDMs &&
          state.expanded) {
        state = state.copyWith(expanded: false);
      }
    });
    unawaited(_loadFromDb());
    return const DmFolderViewState();
  }

  Future<void> _loadFromDb() async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final db = ref.read(fluxerDatabaseProvider);
    final row = await db.dmFolderSettingsDao.getSettings();
    if (!ref.mounted || ref.read(currentUserIdProvider) != userId) {
      return;
    }
    if (row == null) {
      return;
    }
    final allowlist = row.allowlistedIdsJson.isNotEmpty
        ? List<String>.from(
            jsonDecode(row.allowlistedIdsJson) as List<dynamic>,
          ).toSet()
        : <String>{};
    state = state.copyWith(allowlistedIds: allowlist);
  }

  Future<void> _persist() async {
    final db = ref.read(fluxerDatabaseProvider);
    await db.dmFolderSettingsDao.upsertSettings(
      DmFolderSettingsTableCompanion(
        id: const Value(0),
        allowlistedIdsJson: Value(jsonEncode(state.allowlistedIds.toList())),
      ),
    );
  }

  void toggleExpanded() {
    state = state.copyWith(expanded: !state.expanded);
  }

  void addToAllowlist(String channelId) {
    state = state.copyWith(
      allowlistedIds: {...state.allowlistedIds, channelId},
    );
    unawaited(_persist());
  }

  void removeFromAllowlist(String channelId) {
    state = state.copyWith(
      allowlistedIds: state.allowlistedIds.difference({channelId}),
    );
    unawaited(_persist());
  }
}
