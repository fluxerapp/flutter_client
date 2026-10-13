import 'package:sqlite3/common.dart';

const int kMobileSqliteCacheSizeKib = 8000;
const int kDesktopSqliteCacheSizeKib = 64000;

void Function(CommonDatabase) driftSqliteSetup({required bool isMobile}) {
  return (CommonDatabase database) =>
      applyDriftSqlitePragmas(database, isMobile: isMobile);
}

void applyDriftSqlitePragmas(
  CommonDatabase database, {
  required bool isMobile,
}) {
  final int cacheSizeKib = isMobile
      ? kMobileSqliteCacheSizeKib
      : kDesktopSqliteCacheSizeKib;
  database
    ..execute('PRAGMA journal_mode=WAL;')
    ..execute('PRAGMA synchronous=NORMAL;')
    ..execute('PRAGMA cache_size=-$cacheSizeKib;')
    ..execute('PRAGMA busy_timeout=5000;');
}
