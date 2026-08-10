import 'dart:async' show unawaited;

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pre_reconnecting_location_provider.g.dart';

String _locationFromPathAndQuery(String path, String query) {
  if (query.isEmpty) {
    return path;
  }
  return '$path?$query';
}

@Riverpod(keepAlive: true)
class PreReconnectingLocation extends _$PreReconnectingLocation {
  @override
  String? build() => null;

  void clear() {
    state = null;
  }

  void remember({required String path, required String query}) {
    final String location = _locationFromPathAndQuery(path, query);
    if (!isRestorableAppLocation(location)) {
      return;
    }
    state = location;
  }

  Future<String> takeOrRestore(FluxerDatabase db) {
    final String? saved = state;
    if (saved != null) {
      unawaited(
        Future<void>(() {
          if (state == saved) {
            state = null;
          }
        }),
      );
    }
    return restoreAppLocation(db: db, inMemory: saved);
  }
}
