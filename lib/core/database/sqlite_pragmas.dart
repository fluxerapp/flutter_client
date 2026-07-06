import 'package:sqlite3/common.dart';

void applyDriftSqlitePragmas(CommonDatabase database) {
  database
    ..execute('PRAGMA journal_mode=WAL;')
    ..execute('PRAGMA synchronous=NORMAL;')
    ..execute('PRAGMA cache_size=-64000;')
    ..execute('PRAGMA busy_timeout=5000;');
}
