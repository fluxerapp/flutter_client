import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dm_folder_view_model.g.dart';

class DmFolderViewState {
  final bool collapseDMs;
  final bool expanded;
  final Set<String> allowlistedIds;

  const DmFolderViewState({
    this.collapseDMs = false,
    this.expanded = false,
    this.allowlistedIds = const {},
  });

  DmFolderViewState copyWith({
    bool? collapseDMs,
    bool? expanded,
    Set<String>? allowlistedIds,
  }) {
    return DmFolderViewState(
      collapseDMs: collapseDMs ?? this.collapseDMs,
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
    unawaited(_loadFromDb());
    return const DmFolderViewState();
  }

  Future<void> _loadFromDb() async {
    final db = ref.read(fluxerDatabaseProvider);
    final row = await db.dmFolderSettingsDao.getSettings();
    if (row == null) {
      return;
    }
    final allowlist = row.allowlistedIdsJson.isNotEmpty
        ? List<String>.from(
            jsonDecode(row.allowlistedIdsJson) as List<dynamic>,
          ).toSet()
        : <String>{};
    state = DmFolderViewState(
      collapseDMs: row.collapseDms,
      allowlistedIds: allowlist,
    );
  }

  Future<void> _persist() async {
    final db = ref.read(fluxerDatabaseProvider);
    await db.dmFolderSettingsDao.upsertSettings(
      DmFolderSettingsTableCompanion(
        id: const Value(0),
        collapseDms: Value(state.collapseDMs),
        allowlistedIdsJson: Value(jsonEncode(state.allowlistedIds.toList())),
      ),
    );
  }

  void setCollapseDMs({required bool value}) {
    state = state.copyWith(
      collapseDMs: value,
      expanded: value && state.expanded,
    );
    unawaited(_persist());
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

  bool isAllowlisted(String channelId) =>
      state.allowlistedIds.contains(channelId);
}
