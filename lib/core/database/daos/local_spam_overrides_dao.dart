import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/local_spam_overrides.dart';

part 'local_spam_overrides_dao.g.dart';

class LocalSpamOverrideSets {
  const LocalSpamOverrideSets({
    required this.spammerUserIds,
    required this.notSpammerUserIds,
  });

  final Set<String> spammerUserIds;
  final Set<String> notSpammerUserIds;
}

@DriftAccessor(tables: [LocalSpamOverrides])
class LocalSpamOverridesDao extends DatabaseAccessor<FluxerDatabase>
    with _$LocalSpamOverridesDaoMixin {
  LocalSpamOverridesDao(super.attachedDatabase);

  Future<LocalSpamOverrideSets> getOverrides() async {
    final LocalSpamOverride? row = await (select(
      localSpamOverrides,
    )..where((t) => t.id.equals(1))).getSingleOrNull();
    if (row == null) {
      return const LocalSpamOverrideSets(
        spammerUserIds: {},
        notSpammerUserIds: {},
      );
    }
    return LocalSpamOverrideSets(
      spammerUserIds: _decodeIds(row.spammerUserIdsJson),
      notSpammerUserIds: _decodeIds(row.notSpammerUserIdsJson),
    );
  }

  Future<void> replaceOverrides(LocalSpamOverrideSets sets) async {
    await into(localSpamOverrides).insertOnConflictUpdate(
      LocalSpamOverridesCompanion.insert(
        id: const Value(1),
        spammerUserIdsJson: Value(_encodeIds(sets.spammerUserIds)),
        notSpammerUserIdsJson: Value(_encodeIds(sets.notSpammerUserIds)),
      ),
    );
  }

  Future<void> clearAll() => delete(localSpamOverrides).go();

  static Set<String> _decodeIds(String json) {
    final Object? decoded = jsonDecode(json);
    if (decoded is! List<Object?>) {
      return {};
    }
    return decoded.whereType<String>().toSet();
  }

  static String _encodeIds(Set<String> ids) {
    final List<String> sorted = ids.toList()..sort();
    return jsonEncode(sorted);
  }
}
