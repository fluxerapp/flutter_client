import 'dart:async';

import 'package:drift/drift.dart';

bool isDriftCancellation(Object error) => error is CancellationException;

Stream<T> suppressDriftCancellationStream<T>(Stream<T> stream) {
  return stream.handleError((Object error, StackTrace stackTrace) {
    if (isDriftCancellation(error)) {
      return;
    }
    Error.throwWithStackTrace(error, stackTrace);
  });
}

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

Stream<T> watchCoalesced<T>(
  DatabaseConnectionUser database,
  Iterable<ResultSetImplementation<dynamic, dynamic>> tables,
  Future<T> Function() load, {
  Duration window = const Duration(milliseconds: 100),
}) {
  late final StreamController<T> controller;
  StreamSubscription<Set<TableUpdate>>? updates;
  Timer? timer;
  var loading = false;
  var dirty = false;
  late final void Function() schedule;

  Future<void> run() async {
    if (loading) {
      dirty = true;
      return;
    }
    loading = true;
    try {
      final T value = await load();
      if (!controller.isClosed) {
        controller.add(value);
      }
    } on Object catch (error, stackTrace) {
      if (!controller.isClosed && !isDriftCancellation(error)) {
        controller.addError(error, stackTrace);
      }
    } finally {
      loading = false;
      if (dirty && !controller.isClosed) {
        dirty = false;
        schedule();
      }
    }
  }

  schedule = () {
    timer ??= Timer(window, () {
      timer = null;
      unawaited(run());
    });
  };

  controller = StreamController<T>(
    onListen: () {
      updates = database
          .tableUpdates(TableUpdateQuery.onAllTables(tables))
          .listen((_) => schedule());
      unawaited(run());
    },
    onCancel: () async {
      timer?.cancel();
      timer = null;
      await updates?.cancel();
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
