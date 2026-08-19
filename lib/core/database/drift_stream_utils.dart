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

/// Combines the latest values from [streamA] and [streamB].
///
/// Subscriptions start when the returned stream is listened to and are torn
/// down when that listener cancels.
Stream<R> combineLatest2<A, B, R>(
  Stream<A> streamA,
  Stream<B> streamB,
  R Function(A a, B b) combiner,
) {
  final List<StreamSubscription<dynamic>> subscriptions =
      <StreamSubscription<dynamic>>[];
  late final StreamController<R> controller;
  A? latestA;
  B? latestB;
  var aReady = false;
  var bReady = false;

  void emit() {
    if (controller.isClosed || !aReady || !bReady) {
      return;
    }
    controller.add(combiner(latestA as A, latestB as B));
  }

  void onSourceError(Object error, StackTrace stackTrace) {
    if (isDriftCancellation(error)) {
      return;
    }
    if (!controller.isClosed) {
      controller.addError(error, stackTrace);
    }
  }

  controller = StreamController<R>(
    onListen: () {
      subscriptions
        ..add(
          streamA.listen((A value) {
            latestA = value;
            aReady = true;
            emit();
          }, onError: onSourceError),
        )
        ..add(
          streamB.listen((B value) {
            latestB = value;
            bReady = true;
            emit();
          }, onError: onSourceError),
        );
    },
    onCancel: () async {
      for (final StreamSubscription<dynamic> subscription in subscriptions) {
        await subscription.cancel();
      }
      subscriptions.clear();
      if (!controller.isClosed) {
        await controller.close();
      }
    },
  );

  return controller.stream;
}

extension DriftStreamExtensions<T> on Stream<T> {
  Stream<T> get suppressDriftCancellation =>
      suppressDriftCancellationStream(this);
}
