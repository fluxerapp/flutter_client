import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as drift_db;
import 'package:fluxer_app/core/providers/database_provider.dart';

final savedMessageIdsProvider = StreamProvider<List<String>>((Ref ref) {
  return ref
      .watch(fluxerDatabaseProvider)
      .savedMessageDao
      .watchAll()
      .map(
        (List<drift_db.SavedMessage> rows) =>
            rows.map((drift_db.SavedMessage row) => row.messageId).toList(),
      );
});
