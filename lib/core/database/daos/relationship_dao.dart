import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/tables/relationships.dart';

part 'relationship_dao.g.dart';

const int _blockedRelationshipType = 2;

@DriftAccessor(tables: [Relationships])
class RelationshipDao extends DatabaseAccessor<FluxerDatabase>
    with _$RelationshipDaoMixin {
  RelationshipDao(super.attachedDatabase);

  Future<List<Relationship>> getRelationships() => select(relationships).get();

  Future<Map<String, String?>> getNicknamesByUserId() async {
    final List<Relationship> rows = await select(relationships).get();
    return <String, String?>{
      for (final Relationship r in rows) r.userId: r.nickname,
    };
  }

  Stream<List<Relationship>> watchRelationships() =>
      select(relationships).watch().suppressDriftCancellation;

  Stream<Relationship?> watchRelationship(String userId) =>
      (select(relationships)
            ..where((r) => r.userId.equals(userId))
            ..limit(1))
          .watchSingleOrNull()
          .suppressDriftCancellation;

  Future<Relationship?> getRelationship(String userId) =>
      (select(relationships)
            ..where((r) => r.userId.equals(userId))
            ..limit(1))
          .getSingleOrNull();

  Future<void> upsertRelationships(
    List<RelationshipsCompanion> relationshipList,
  ) async {
    await batch((b) {
      for (final rel in relationshipList) {
        b.insert(relationships, rel, onConflict: DoUpdate((_) => rel));
      }
    });
  }

  Future<void> deleteRelationship(String userId) =>
      (delete(relationships)..where((r) => r.userId.equals(userId))).go();

  Future<void> clearAll() => delete(relationships).go();

  Future<bool> isBlocked(String userId) async {
    final row =
        await (select(relationships)..where(
              (r) =>
                  r.userId.equals(userId) &
                  r.type.equals(_blockedRelationshipType),
            ))
            .getSingleOrNull();
    return row != null;
  }

  Future<Set<String>> getBlockedUserIds() async {
    final rows = await (select(
      relationships,
    )..where((r) => r.type.equals(_blockedRelationshipType))).get();
    return rows.map((r) => r.userId).toSet();
  }
}
