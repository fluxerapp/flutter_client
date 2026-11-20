import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/database/query_stats_interceptor.dart';

void main() {
  test('queryStatsKey extracts verb and table', () {
    expect(queryStatsKey('SELECT * FROM "users" WHERE id = ?'), 'SELECT users');
    expect(
      queryStatsKey('INSERT INTO "messages" (id) VALUES (?)'),
      'INSERT messages',
    );
    expect(queryStatsKey('UPDATE channels SET x = 1'), 'UPDATE channels');
    expect(queryStatsKey('  DELETE FROM read_states'), 'DELETE read_states');
    expect(queryStatsKey('PRAGMA shrink_memory;'), 'PRAGMA ?');
  });

  test('counts statements per table and reports on flush', () async {
    final List<String> reports = <String>[];
    final QueryStatsInterceptor stats = QueryStatsInterceptor(
      log: reports.add,
      window: const Duration(hours: 1),
    );
    final FluxerDatabase db = FluxerDatabase.forTesting(
      NativeDatabase.memory().interceptWith(stats),
    );
    addTearDown(db.close);

    await db.userDao.getUsersByIds(<String>['1']);
    await db.userDao.getUsersByIds(<String>['2']);
    expect(stats.counts['SELECT users'], 2);

    stats.flushReport();
    expect(reports, hasLength(1));
    expect(reports.single, contains('SELECT users=2'));
    expect(stats.counts, isEmpty);
  });
}
