import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';

void main() {
  test('suppressDriftCancellation swallows CancellationException', () async {
    final StreamController<int> controller = StreamController<int>();
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
}
