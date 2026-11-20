import 'dart:async';

import 'package:drift/drift.dart';

// ignore: do_not_use_environment -- compile-time opt-in for query stats logging
const bool kFluxerQueryStatsEnabled = bool.fromEnvironment(
  'FLUXER_QUERY_STATS',
);

const Duration kQueryStatsWindow = Duration(seconds: 10);

final RegExp _tablePattern = RegExp(
  r'\b(?:FROM|INTO|UPDATE)\s+"?([A-Za-z_][A-Za-z0-9_]*)"?',
  caseSensitive: false,
);

String queryStatsKey(String statement) {
  final String trimmed = statement.trimLeft();
  final int space = trimmed.indexOf(RegExp(r'\s'));
  final String verb = (space < 0 ? trimmed : trimmed.substring(0, space))
      .toUpperCase();
  final RegExpMatch? match = _tablePattern.firstMatch(statement);
  final String table = match?.group(1) ?? '?';
  return '$verb $table';
}

class QueryStatsInterceptor extends QueryInterceptor {
  QueryStatsInterceptor({required this._log, this._window = kQueryStatsWindow});

  final void Function(String report) _log;
  final Duration _window;
  final Map<String, int> _counts = <String, int>{};
  Timer? _timer;

  Map<String, int> get counts => Map<String, int>.unmodifiable(_counts);

  void record(String statement) {
    final String key = queryStatsKey(statement);
    _counts[key] = (_counts[key] ?? 0) + 1;
    _timer ??= Timer(_window, flushReport);
  }

  void flushReport() {
    _timer?.cancel();
    _timer = null;
    if (_counts.isEmpty) {
      return;
    }
    final List<MapEntry<String, int>> entries = _counts.entries.toList()
      ..sort(
        (MapEntry<String, int> a, MapEntry<String, int> b) =>
            b.value.compareTo(a.value),
      );
    final int total = entries.fold(
      0,
      (int sum, MapEntry<String, int> e) => sum + e.value,
    );
    _counts.clear();
    _log(
      '[QueryStats] ${_window.inSeconds}s total=$total '
      '${entries.map((MapEntry<String, int> e) => '${e.key}=${e.value}').join(' ')}',
    );
  }

  @override
  Future<List<Map<String, Object?>>> runSelect(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    record(statement);
    return executor.runSelect(statement, args);
  }

  @override
  Future<int> runInsert(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    record(statement);
    return executor.runInsert(statement, args);
  }

  @override
  Future<int> runUpdate(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    record(statement);
    return executor.runUpdate(statement, args);
  }

  @override
  Future<int> runDelete(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    record(statement);
    return executor.runDelete(statement, args);
  }

  @override
  Future<void> runCustom(
    QueryExecutor executor,
    String statement,
    List<Object?> args,
  ) {
    record(statement);
    return executor.runCustom(statement, args);
  }

  @override
  Future<void> runBatched(
    QueryExecutor executor,
    BatchedStatements statements,
  ) {
    for (final ArgumentsForBatchedStatement argument in statements.arguments) {
      record(statements.statements[argument.statementIndex]);
    }
    return executor.runBatched(statements);
  }
}
