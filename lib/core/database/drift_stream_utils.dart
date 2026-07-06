import 'dart:async';

import 'package:drift/drift.dart';

bool isDriftCancellation(Object error) => error is CancellationException;

/// suppresses [CancellationException] from Drift watch streams when a
/// subscription is cancelled while a refetch is still in flight.
Stream<T> suppressDriftCancellationStream<T>(Stream<T> stream) {
  return stream.handleError((Object error, StackTrace stackTrace) {
    if (isDriftCancellation(error)) {
      return;
    }
    Error.throwWithStackTrace(error, stackTrace);
  });
}

extension DriftStreamExtensions<T> on Stream<T> {
  Stream<T> get suppressDriftCancellation =>
      suppressDriftCancellationStream(this);
}
