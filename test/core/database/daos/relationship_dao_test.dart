import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('replaceAll drops rows that are no longer in the snapshot', () async {
    final db = openTestDatabase();

    await db.relationshipDao.upsertRelationships([
      RelationshipsCompanion.insert(userId: 'kept', type: 4),
      RelationshipsCompanion.insert(userId: 'stale', type: 3),
    ]);

    await db.relationshipDao.replaceAll([
      RelationshipsCompanion.insert(userId: 'kept', type: 1),
    ]);

    final rows = await db.relationshipDao.getRelationships();
    expect(rows, hasLength(1));
    expect(rows.single.userId, 'kept');
    expect(rows.single.type, 1);
  });

  test('replaceAll with an empty list clears the table', () async {
    final db = openTestDatabase();

    await db.relationshipDao.upsertRelationships([
      RelationshipsCompanion.insert(userId: 'pending', type: 4),
    ]);
    await db.relationshipDao.replaceAll(const []);

    expect(await db.relationshipDao.getRelationships(), isEmpty);
  });
}
