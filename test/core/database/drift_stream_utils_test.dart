import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('suppressDriftCancellation swallows CancellationException', () async {
    final StreamController<int> controller = StreamController<int>();
    addTearDown(controller.close);
    final List<Object?> errors = <Object?>[];
    final StreamSubscription<int> sub = controller
        .stream
        .suppressDriftCancellation
        .listen(null, onError: errors.add);
    addTearDown(sub.cancel);
    controller.addError(const CancellationException());
    await pumpEventQueue();
    expect(errors, isEmpty);
  });

  test('suppressDriftCancellation rethrows other errors', () async {
    final StreamController<int> controller = StreamController<int>();
    addTearDown(controller.close);
    final List<Object?> errors = <Object?>[];
    final StreamSubscription<int> sub = controller
        .stream
        .suppressDriftCancellation
        .listen(null, onError: errors.add);
    addTearDown(sub.cancel);
    controller.addError(StateError('boom'));
    await pumpEventQueue();
    expect(errors.single, isA<StateError>());
  });

  test('isDriftCancellation identifies CancellationException', () {
    expect(isDriftCancellation(const CancellationException()), isTrue);
    expect(isDriftCancellation(StateError('nope')), isFalse);
  });

  group('combineLatest2', () {
    test('subscribes lazily and emits when both streams have values', () async {
      var aListened = false;
      var bListened = false;
      final StreamController<int> streamA = StreamController<int>(
        onListen: () => aListened = true,
      );
      final StreamController<int> streamB = StreamController<int>(
        onListen: () => bListened = true,
      );
      addTearDown(streamA.close);
      addTearDown(streamB.close);

      final Stream<int> combined = combineLatest2<int, int, int>(
        streamA.stream,
        streamB.stream,
        (int a, int b) => a + b,
      );

      expect(aListened, isFalse);
      expect(bListened, isFalse);

      final List<int> values = <int>[];
      final StreamSubscription<int> subscription = combined.listen(values.add);
      addTearDown(subscription.cancel);

      await pumpEventQueue();
      expect(aListened, isTrue);
      expect(bListened, isTrue);
      expect(values, isEmpty);

      streamA.add(2);
      await pumpEventQueue();
      expect(values, isEmpty);

      streamB.add(3);
      await pumpEventQueue();
      expect(values, <int>[5]);

      streamA.add(10);
      await pumpEventQueue();
      expect(values, <int>[5, 13]);
    });

    test('cancels source subscriptions when output listener cancels', () async {
      var aListened = false;
      var aCancelled = false;
      final StreamController<int> streamA = StreamController<int>(
        onListen: () => aListened = true,
        onCancel: () => aCancelled = true,
      );
      final StreamController<int> streamB = StreamController<int>();
      addTearDown(streamA.close);
      addTearDown(streamB.close);

      final StreamSubscription<int> subscription =
          combineLatest2<int, int, int>(
            streamA.stream,
            streamB.stream,
            (int a, int b) => a + b,
          ).listen(null);
      await pumpEventQueue();
      expect(aListened, isTrue);

      await subscription.cancel();
      await pumpEventQueue();
      expect(aCancelled, isTrue);
    });

    test('swallows drift cancellation errors from source streams', () async {
      final StreamController<int> streamA = StreamController<int>();
      final StreamController<int> streamB = StreamController<int>();
      addTearDown(streamA.close);
      addTearDown(streamB.close);

      final List<Object?> errors = <Object?>[];
      final StreamSubscription<int> subscription =
          combineLatest2<int, int, int>(
            streamA.stream,
            streamB.stream,
            (int a, int b) => a + b,
          ).listen(null, onError: errors.add);
      addTearDown(subscription.cancel);

      streamA.add(1);
      streamB.addError(const CancellationException());
      await pumpEventQueue();
      expect(errors, isEmpty);
    });
  });

  test('watchCoalesced re-queries once for a burst of writes', () async {
    final FluxerDatabase db = openTestDatabase();
    addTearDown(db.close);
    var loads = 0;
    final List<int> emitted = <int>[];
    final StreamSubscription<int> sub = watchCoalesced(
      db,
      <TableInfo<Table, Object?>>[db.readStates],
      () async {
        loads++;
        return (await db.readStateDao.getReadStates()).length;
      },
      window: const Duration(milliseconds: 20),
    ).listen(emitted.add);
    addTearDown(sub.cancel);
    await Future<void>.delayed(const Duration(milliseconds: 40));
    expect(emitted, <int>[0]);

    for (int i = 0; i < 10; i++) {
      await db.readStateDao.upsertReadState(
        ReadStatesCompanion.insert(channelId: 'channel-$i'),
      );
    }
    await Future<void>.delayed(const Duration(milliseconds: 80));

    expect(emitted.last, 10);
    expect(loads, lessThan(5));
  });
}
