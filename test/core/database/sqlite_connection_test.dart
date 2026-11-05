import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/sqlite_connection.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory root;

  setUp(() {
    root = Directory.systemTemp.createTempSync('fluxer_db_move_');
  });

  tearDown(() {
    root.deleteSync(recursive: true);
  });

  test('moves the iOS database and its WAL out of Documents once', () async {
    final Directory documents = Directory(p.join(root.path, 'Documents'))
      ..createSync();
    final Directory databaseDirectory = Directory(
      p.join(root.path, 'Library', 'Application Support', 'database'),
    );
    final List<int> mainBytes = <int>[1, 2, 3, 4];
    final List<int> walBytes = <int>[5, 6, 7];
    File(p.join(documents.path, 'fluxer.sqlite')).writeAsBytesSync(mainBytes);
    File(
      p.join(documents.path, 'fluxer.sqlite-wal'),
    ).writeAsBytesSync(walBytes);

    final File moved = await moveLegacyIosDatabase(
      legacyDirectory: documents,
      databaseDirectory: databaseDirectory,
    );

    expect(moved.path, p.join(databaseDirectory.path, 'fluxer.sqlite'));
    expect(moved.readAsBytesSync(), mainBytes);
    expect(File('${moved.path}-wal').readAsBytesSync(), walBytes);
    expect(File(p.join(documents.path, 'fluxer.sqlite')).existsSync(), isFalse);
    expect(
      File(p.join(documents.path, 'fluxer.sqlite-wal')).existsSync(),
      isFalse,
    );

    final File again = await moveLegacyIosDatabase(
      legacyDirectory: documents,
      databaseDirectory: databaseDirectory,
    );

    expect(again.path, moved.path);
    expect(again.readAsBytesSync(), mainBytes);
    expect(File('${again.path}-wal').readAsBytesSync(), walBytes);
    expect(documents.listSync(), isEmpty);
  });
}
