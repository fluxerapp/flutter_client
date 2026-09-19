import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('watchAll returns newly saved messages first', () async {
    final FluxerDatabase db = openTestDatabase();

    await db.savedMessageDao.addSavedMessage('older');
    await db.savedMessageDao.addSavedMessage('newer');

    final List<SavedMessage> rows = await db.savedMessageDao.watchAll().first;
    expect(
      rows.map((SavedMessage row) => row.messageId).toList(),
      <String>['newer', 'older'],
    );
  });
}
