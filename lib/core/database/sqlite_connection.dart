import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/sqlite_pragmas.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

const int kSqliteReadPoolSize = 2;

QueryExecutor openFluxerSqliteConnection() {
  return LazyDatabase(() async {
    final File file = await _resolveDatabaseFile();
    await file.parent.create(recursive: true);
    return NativeDatabase.createInBackground(
      file,
      setup: driftSqliteSetup(isMobile: isFluxerNativeMobileOs),
      readPool: kSqliteReadPoolSize,
    );
  });
}

const String _iosDatabaseFileName = 'fluxer.sqlite';
const List<String> _sqliteFileSuffixes = <String>[
  '-wal',
  '-shm',
  '-journal',
  '',
];

Future<File> _resolveDatabaseFile() async {
  if (isFluxerDesktopOs) {
    final Directory dir = await getApplicationDocumentsDirectory();
    return File(p.join(dir.path, 'fluxer_app', 'fluxer.db'));
  }
  if (Platform.isIOS) {
    final Directory support = await getApplicationSupportDirectory();
    final Directory documents = await getApplicationDocumentsDirectory();
    return moveLegacyIosDatabase(
      legacyDirectory: documents,
      databaseDirectory: Directory(p.join(support.path, 'database')),
    );
  }
  final Directory dir = await getApplicationDocumentsDirectory();
  return File(p.join(dir.path, 'fluxer.sqlite'));
}

@visibleForTesting
Future<File> moveLegacyIosDatabase({
  required Directory legacyDirectory,
  required Directory databaseDirectory,
}) async {
  final File target = File(
    p.join(databaseDirectory.path, _iosDatabaseFileName),
  );
  final File legacy = File(p.join(legacyDirectory.path, _iosDatabaseFileName));
  if (target.existsSync() || !legacy.existsSync()) {
    return target;
  }
  await databaseDirectory.create(recursive: true);
  for (final String suffix in _sqliteFileSuffixes) {
    final File source = File('${legacy.path}$suffix');
    if (source.existsSync()) {
      await source.rename('${target.path}$suffix');
    }
  }
  return target;
}
