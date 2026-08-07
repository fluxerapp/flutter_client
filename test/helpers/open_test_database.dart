import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';

FluxerDatabase openTestDatabase() {
  final FluxerDatabase database = FluxerDatabase.forTesting(
    NativeDatabase.memory(),
  );
  addTearDown(() async {
    await _releaseWidgetTree();
    // Backstop for any other zone-bound wait inside drift. `executor.close()`
    // releases the sqlite handle and never blocks on stream teardown.
    await database.close().timeout(
      const Duration(seconds: 2),
      onTimeout: () => database.executor.close(),
    );
  });
  return database;
}

/// Unmounts the widget tree so the database can actually close.
///
/// A `testWidgets` body that throws leaves the tree mounted: `_runTestBody` in
/// `flutter_test/src/binding.dart` only unmounts when no exception is pending.
/// drift query streams therefore stay subscribed and their zero-duration cache
/// timers stay unfired, and both belong to the test's `FakeAsync` zone that
/// `postTest` then discards. `StreamQueryStore.close()` waits on them forever,
/// and package:test kills the test at its 10 minute default instead.
///
/// `binding.postTest` is registered as the first tear-down in
/// `flutter_test/src/widget_tester.dart`, so it runs last and tear-downs still
/// observe `inTest == true`. This is the final point at which the tree can be
/// released.
Future<void> _releaseWidgetTree() async {
  if (BindingBase.debugBindingType() == null) {
    return; // No binding was ever initialised, so there is no tree.
  }
  if (WidgetsBinding.instance case final TestWidgetsFlutterBinding binding
      when binding.inTest) {
    binding
      ..attachRootWidget(binding.wrapWithDefaultView(const SizedBox.shrink()))
      ..scheduleFrame();
    // The elapsed duration fires drift's `Timer.run` stream-cache timers,
    // which `StreamQueryStore.close()` awaits.
    await binding.pump(const Duration(milliseconds: 1));
  }
}
