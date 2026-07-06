import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

FluxerDatabase openTestDatabase() {
  final FluxerDatabase database = FluxerDatabase.forTesting(
    NativeDatabase.memory(),
  );
  addTearDown(database.close);
  return database;
}
