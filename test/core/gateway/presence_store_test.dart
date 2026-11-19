import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/presence_store.dart';

void main() {
  test('notifies only listeners of users whose presence changed', () {
    final PresenceStore store = PresenceStore();
    final List<String> calls = <String>[];
    store
      ..listen('a', () => calls.add('a'))
      ..listen('b', () => calls.add('b'))
      ..applyAll(<PresenceUpdateRecord>[
        (userId: 'a', status: 'online', customStatus: null, mobile: false),
      ]);
    expect(calls, <String>['a']);

    store.applyAll(<PresenceUpdateRecord>[
      (userId: 'a', status: 'online', customStatus: null, mobile: false),
      (userId: 'b', status: 'idle', customStatus: null, mobile: false),
    ]);
    expect(calls, <String>['a', 'b']);
  });

  test('offline without custom status is stored as absent', () {
    final PresenceStore store = PresenceStore()..set('a', status: 'online');
    var notified = 0;
    store
      ..listen('a', () => notified++)
      ..set('a', status: 'offline');
    expect(store['a'], isNull);
    expect(notified, 1);

    store.set('a', status: 'offline');
    expect(notified, 1);
  });

  test('cancelled listeners stop receiving updates', () {
    final PresenceStore store = PresenceStore();
    var notified = 0;
    final void Function() cancel = store.listen('a', () => notified++);
    cancel();
    store.set('a', status: 'online');
    expect(notified, 0);
  });

  test('replaceAll swaps the whole set and notifies only real changes', () {
    final PresenceStore store = PresenceStore()
      ..set('kept', status: 'online')
      ..set('gone', status: 'idle')
      ..set('changed', status: 'online');
    final List<String> calls = <String>[];
    store
      ..listen('kept', () => calls.add('kept'))
      ..listen('gone', () => calls.add('gone'))
      ..listen('changed', () => calls.add('changed'))
      ..listen('new', () => calls.add('new'))
      ..replaceAll(<PresenceUpdateRecord>[
        (userId: 'kept', status: 'online', customStatus: null, mobile: false),
        (userId: 'changed', status: 'dnd', customStatus: null, mobile: false),
        (userId: 'new', status: 'online', customStatus: null, mobile: true),
      ]);

    expect(calls, unorderedEquals(<String>['gone', 'changed', 'new']));
    expect(store['gone'], isNull);
    expect(store['changed']?.status, 'dnd');
    expect(store['new']?.mobile, isTrue);
  });
}
