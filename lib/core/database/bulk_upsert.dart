import 'package:drift/drift.dart';

void batchUpsert<T extends Table, D>(
  Batch batch,
  DatabaseConnectionUser database,
  TableInfo<T, D> table,
  Iterable<Insertable<D>> rows,
) {
  final GenerationContext context = GenerationContext.fromDb(database);
  final Set<String> keys = <String>{
    for (final GeneratedColumn<Object> column in table.$primaryKey)
      column.$name,
  };
  final Set<TableUpdate> updates = <TableUpdate>{
    TableUpdate.onTable(table, kind: UpdateKind.insert),
  };
  final Map<String, String> sqlByShape = <String, String>{};
  for (final Insertable<D> row in rows) {
    final Map<String, Expression<Object>> columns = row.toColumns(true);
    final List<Object?>? args = _simpleValues(columns.values, context);
    if (args == null) {
      batch.insert(table, row, onConflict: DoUpdate((_) => row));
      continue;
    }
    final String sql = sqlByShape[columns.keys.join(',')] ??= _upsertSql(
      table.actualTableName,
      columns.keys,
      keys,
    );
    batch.customStatement(sql, args, updates);
  }
}

bool rowDiffersFromStored<D>(
  DatabaseConnectionUser database,
  Insertable<D> row,
  D? stored,
) {
  if (stored == null) {
    return true;
  }
  final GenerationContext context = GenerationContext.fromDb(database);
  final Map<String, Expression<Object>> storedColumns =
      (stored as Insertable<D>).toColumns(false);
  for (final MapEntry<String, Expression<Object>> entry
      in row.toColumns(true).entries) {
    final Expression<Object> value = entry.value;
    final Expression<Object>? current = storedColumns[entry.key];
    if (value is! Variable<Object> || current is! Variable<Object>) {
      return true;
    }
    if (value.mapToSimpleValue(context) != current.mapToSimpleValue(context)) {
      return true;
    }
  }
  return false;
}

List<Object?>? _simpleValues(
  Iterable<Expression<Object>> values,
  GenerationContext context,
) {
  final List<Object?> mapped = <Object?>[];
  for (final Expression<Object> value in values) {
    if (value is! Variable<Object>) {
      return null;
    }
    mapped.add(value.mapToSimpleValue(context));
  }
  return mapped;
}

String _upsertSql(String table, Iterable<String> columns, Set<String> keys) {
  final String names = columns.map(_quote).join(', ');
  final String marks = List<String>.filled(columns.length, '?').join(', ');
  final List<String> assignments = <String>[
    for (final String column in columns)
      if (!keys.contains(column))
        '${_quote(column)} = excluded.${_quote(column)}',
  ];
  final String action = assignments.isEmpty
      ? 'DO NOTHING'
      : 'DO UPDATE SET ${assignments.join(', ')}';
  return 'INSERT INTO ${_quote(table)} ($names) VALUES ($marks) '
      'ON CONFLICT(${keys.map(_quote).join(', ')}) $action';
}

String _quote(String identifier) => '"$identifier"';
