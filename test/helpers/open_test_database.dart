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
    await database.close().timeout(
      const Duration(seconds: 2),
      onTimeout: database.executor.close,
    );
  });
  return database;
}

Future<void> releaseTestWidgetTree(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 1));
}

Future<void> _releaseWidgetTree() async {
  if (BindingBase.debugBindingType() == null) {
    return;
  }
  if (WidgetsBinding.instance case final TestWidgetsFlutterBinding binding
      when binding.inTest) {
    binding
      ..attachRootWidget(binding.wrapWithDefaultView(const SizedBox.shrink()))
      ..scheduleFrame();
    await binding.pump(const Duration(milliseconds: 1));
  }
}
