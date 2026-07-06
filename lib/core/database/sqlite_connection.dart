import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/sqlite_pragmas.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const int kSqliteReadPoolSize = 2;

QueryExecutor openFluxerSqliteConnection() {
  if (kIsWeb) {
    return driftDatabase(name: 'fluxer');
  }
  return LazyDatabase(() async {
    final File file = await _resolveDatabaseFile();
    await file.parent.create(recursive: true);
    return NativeDatabase.createInBackground(
      file,
      setup: applyDriftSqlitePragmas,
      readPool: kSqliteReadPoolSize,
    );
  });
}

Future<File> _resolveDatabaseFile() async {
  if (!kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
    final Directory dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'fluxer_app', 'fluxer.db'));
  }
  final Directory dir = await getApplicationDocumentsDirectory();
  return File(p.join(dir.path, 'fluxer.sqlite'));
}
