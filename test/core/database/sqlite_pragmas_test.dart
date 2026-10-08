import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/sqlite_pragmas.dart';
import 'package:sqlite3/sqlite3.dart';

int _cacheSize(Database database) {
  return database.select('PRAGMA cache_size;').single.values.single! as int;
}

void main() {
  group('driftSqliteSetup', () {
    test('mobile sqlite connections cap the page cache at 8 MiB', () {
      final Database database = sqlite3.openInMemory();
      addTearDown(database.close);

      driftSqliteSetup(isMobile: true)(database);

      expect(_cacheSize(database), -8000);
    });

    test('desktop sqlite connections keep the 64000 KiB page cache', () {
      final Database database = sqlite3.openInMemory();
      addTearDown(database.close);

      driftSqliteSetup(isMobile: false)(database);

      expect(_cacheSize(database), -64000);
    });
  });
}
