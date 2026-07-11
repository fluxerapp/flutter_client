import 'dart:async';

import 'package:fluxer_app/core/constants/user_flags.dart';
import 'package:fluxer_app/core/database/daos/local_spam_overrides_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/moderation/data/local_user_spam_override_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_user_spam_override_provider.g.dart';

class LocalUserSpamOverrideState {
  const LocalUserSpamOverrideState({
    required this.spammerUserIds,
    required this.notSpammerUserIds,
    required this.version,
  });

  final Set<String> spammerUserIds;
  final Set<String> notSpammerUserIds;
  final int version;

  static const empty = LocalUserSpamOverrideState(
    spammerUserIds: {},
    notSpammerUserIds: {},
    version: 0,
  );
}

@Riverpod(keepAlive: true)
LocalUserSpamOverrideRepository localUserSpamOverrideRepository(Ref ref) {
  return LocalUserSpamOverrideRepository(
    ref.watch(fluxerDatabaseProvider),
    ref.watch(syncedPreferencesStoreProvider),
  );
}

@Riverpod(keepAlive: true)
class LocalUserSpamOverride extends _$LocalUserSpamOverride {
  @override
  LocalUserSpamOverrideState build() {
    unawaited(_loadInitialState());
    return LocalUserSpamOverrideState.empty;
  }

  Future<void> _loadInitialState() async {
    final LocalSpamOverrideSets sets = await ref
        .read(localUserSpamOverrideRepositoryProvider)
        .getOverrides();
    if (!ref.mounted) {
      return;
    }
    _setStateFromSets(sets);
  }

  bool isUserMarkedAsSpammer(String userId, int userFlags) {
    if (state.notSpammerUserIds.contains(userId)) {
      return false;
    }
    if (state.spammerUserIds.contains(userId)) {
      return true;
    }
    return isServerSpammer(userFlags);
  }

  Future<void> applySynced({
    required Set<String> spammerUserIds,
    required Set<String> notSpammerUserIds,
  }) async {
    _setStateFromSets(
      LocalSpamOverrideSets(
        spammerUserIds: spammerUserIds,
        notSpammerUserIds: notSpammerUserIds,
      ),
      bumpVersion: true,
    );
  }

  Future<void> markAsSpammer(String userId) async {
    final bool hadSpammer = state.spammerUserIds.contains(userId);
    final bool hadNotSpammer = state.notSpammerUserIds.contains(userId);
    if (hadSpammer && !hadNotSpammer) {
      return;
    }
    await _persist(
      spammerUserIds: Set<String>.from(state.spammerUserIds)..add(userId),
      notSpammerUserIds: Set<String>.from(state.notSpammerUserIds)
        ..remove(userId),
    );
  }

  Future<void> markAsNotSpammer(String userId) async {
    final bool hadSpammer = state.spammerUserIds.contains(userId);
    final bool hadNotSpammer = state.notSpammerUserIds.contains(userId);
    if (!hadSpammer && hadNotSpammer) {
      return;
    }
    await _persist(
      spammerUserIds: Set<String>.from(state.spammerUserIds)..remove(userId),
      notSpammerUserIds: Set<String>.from(state.notSpammerUserIds)..add(userId),
    );
  }

  Future<void> clearOverride(String userId) async {
    final bool hadOverride =
        state.spammerUserIds.contains(userId) ||
        state.notSpammerUserIds.contains(userId);
    if (!hadOverride) {
      return;
    }
    await _persist(
      spammerUserIds: Set<String>.from(state.spammerUserIds)..remove(userId),
      notSpammerUserIds: Set<String>.from(state.notSpammerUserIds)
        ..remove(userId),
    );
  }

  void _setStateFromSets(
    LocalSpamOverrideSets sets, {
    bool bumpVersion = false,
  }) {
    state = LocalUserSpamOverrideState(
      spammerUserIds: Set<String>.unmodifiable(sets.spammerUserIds),
      notSpammerUserIds: Set<String>.unmodifiable(sets.notSpammerUserIds),
      version: bumpVersion ? state.version + 1 : state.version,
    );
  }

  Future<void> _persist({
    required Set<String> spammerUserIds,
    required Set<String> notSpammerUserIds,
  }) async {
    final LocalSpamOverrideSets sets = LocalSpamOverrideSets(
      spammerUserIds: spammerUserIds,
      notSpammerUserIds: notSpammerUserIds,
    );
    await ref
        .read(localUserSpamOverrideRepositoryProvider)
        .replaceOverrides(sets);
    _setStateFromSets(sets, bumpVersion: true);
  }
}
