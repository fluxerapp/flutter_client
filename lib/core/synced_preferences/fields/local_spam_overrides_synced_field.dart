import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/local_spam_overrides_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/moderation/providers/local_user_spam_override_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class LocalSpamOverridesLocalState {
  const LocalSpamOverridesLocalState({
    required this.spammerUserIds,
    required this.notSpammerUserIds,
  });

  final List<String> spammerUserIds;
  final List<String> notSpammerUserIds;

  static const empty = LocalSpamOverridesLocalState(
    spammerUserIds: [],
    notSpammerUserIds: [],
  );
}

class LocalSpamOverridesSyncedField
    extends SyncedFieldAdapter<LocalSpamOverridesLocalState> {
  LocalSpamOverridesSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field => SyncedPreferenceField.localSpamOverrides;

  @override
  LocalSpamOverridesLocalState readLocal() {
    final state = _ref.read(localUserSpamOverrideProvider);
    return LocalSpamOverridesLocalState(
      spammerUserIds: state.spammerUserIds.toList()..sort(),
      notSpammerUserIds: state.notSpammerUserIds.toList()..sort(),
    );
  }

  @override
  Future<LocalSpamOverridesLocalState> readLocalValue() async {
    final LocalSpamOverrideSets sets = await _ref
        .read(fluxerDatabaseProvider)
        .localSpamOverridesDao
        .getOverrides();
    final List<String> spammerUserIds = sets.spammerUserIds.toList()..sort();
    final List<String> notSpammerUserIds = sets.notSpammerUserIds.toList()
      ..sort();
    return LocalSpamOverridesLocalState(
      spammerUserIds: spammerUserIds,
      notSpammerUserIds: notSpammerUserIds,
    );
  }

  @override
  Future<void> applyRemote(LocalSpamOverridesLocalState value) async {
    final LocalSpamOverrideSets sets = LocalSpamOverrideSets(
      spammerUserIds: value.spammerUserIds.toSet(),
      notSpammerUserIds: value.notSpammerUserIds.toSet(),
    );
    await _ref
        .read(fluxerDatabaseProvider)
        .localSpamOverridesDao
        .replaceOverrides(sets);
    await _ref
        .read(localUserSpamOverrideProvider.notifier)
        .applySynced(
          spammerUserIds: sets.spammerUserIds,
          notSpammerUserIds: sets.notSpammerUserIds,
        );
  }

  @override
  LocalSpamOverridesLocalState? readFromProto(pb.SyncedPreferences message) {
    if (!message.hasLocalSpamOverrides()) {
      return null;
    }
    final pb.LocalUserSpamOverrides overrides = message.localSpamOverrides;
    final List<String> spammerUserIds = List<String>.from(
      overrides.spammerUserIds,
    )..sort();
    final List<String> notSpammerUserIds = List<String>.from(
      overrides.notSpammerUserIds,
    )..sort();
    return LocalSpamOverridesLocalState(
      spammerUserIds: spammerUserIds,
      notSpammerUserIds: notSpammerUserIds,
    );
  }

  @override
  $pb.GeneratedMessage toProtoMessage(LocalSpamOverridesLocalState local) {
    return pb.LocalUserSpamOverrides(
      spammerUserIds: List<String>.from(local.spammerUserIds)..sort(),
      notSpammerUserIds: List<String>.from(local.notSpammerUserIds)..sort(),
    );
  }

  @override
  bool statesEqual(
    LocalSpamOverridesLocalState a,
    LocalSpamOverridesLocalState b,
  ) {
    return _sortedListEquals(a.spammerUserIds, b.spammerUserIds) &&
        _sortedListEquals(a.notSpammerUserIds, b.notSpammerUserIds);
  }

  @override
  LocalSpamOverridesLocalState mergeForMigration({
    required LocalSpamOverridesLocalState local,
    required LocalSpamOverridesLocalState remote,
  }) {
    final Set<String> spammerUserIds = {
      ...local.spammerUserIds,
      ...remote.spammerUserIds,
    };
    final Set<String> notSpammerUserIds = {
      ...local.notSpammerUserIds,
      ...remote.notSpammerUserIds,
    };
    for (final String userId in notSpammerUserIds.toList()) {
      if (spammerUserIds.contains(userId)) {
        spammerUserIds.remove(userId);
        notSpammerUserIds.remove(userId);
      }
    }
    final List<String> sortedSpammer = spammerUserIds.toList()..sort();
    final List<String> sortedNotSpammer = notSpammerUserIds.toList()..sort();
    return LocalSpamOverridesLocalState(
      spammerUserIds: sortedSpammer,
      notSpammerUserIds: sortedNotSpammer,
    );
  }

  @override
  bool verifyRoundtrip(LocalSpamOverridesLocalState candidate) {
    final proto = toProtoMessage(candidate) as pb.LocalUserSpamOverrides;
    final roundtripped = readFromProto(
      pb.SyncedPreferences(localSpamOverrides: proto),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  static bool _sortedListEquals(List<String> a, List<String> b) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  bool hasLocalData(LocalSpamOverridesLocalState local) {
    return local.spammerUserIds.isNotEmpty ||
        local.notSpammerUserIds.isNotEmpty;
  }

  @override
  bool hasRemoteData(LocalSpamOverridesLocalState remote) {
    return remote.spammerUserIds.isNotEmpty ||
        remote.notSpammerUserIds.isNotEmpty;
  }
}
