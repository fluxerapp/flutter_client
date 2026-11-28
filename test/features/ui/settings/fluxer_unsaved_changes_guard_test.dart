import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_controller.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_guard.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  late FluxerUnsavedChangesController controller;
  late ValueNotifier<bool> dirty;

  setUp(() {
    controller = FluxerUnsavedChangesController();
    dirty = ValueNotifier<bool>(true);
  });

  tearDown(() {
    controller.dispose();
    dirty.dispose();
  });

  Future<void> openModal(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) => TextButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (BuildContext context) => FluxerUnsavedChangesGuard(
                controller: controller,
                showsHeaderBanner: true,
                child: ValueListenableBuilder<bool>(
                  valueListenable: dirty,
                  builder: (BuildContext context, bool value, Widget? _) =>
                      FluxerSettingsSheet(
                        hasUnsavedChanges: value,
                        onReset: () {},
                        onSave: () {},
                        child: const Text('modal body'),
                      ),
                ),
              ),
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('escape is blocked and flashes while dirty', (
    WidgetTester tester,
  ) async {
    await openModal(tester);
    expect(controller.isDirty, isTrue);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pump();

    expect(find.text('modal body'), findsOneWidget);
    expect(controller.flashing, isTrue);

    await tester.pump(FluxerUnsavedChangesController.flashDuration);
    expect(controller.flashing, isFalse);
  });

  testWidgets('escape closes once changes are cleared', (
    WidgetTester tester,
  ) async {
    await openModal(tester);
    dirty.value = false;
    await tester.pumpAndSettle();
    expect(controller.isDirty, isFalse);

    await tester.sendKeyEvent(LogicalKeyboardKey.escape);
    await tester.pumpAndSettle();

    expect(find.text('modal body'), findsNothing);
  });

  testWidgets('blocksNavigation only blocks while dirty', (
    WidgetTester tester,
  ) async {
    await openModal(tester);
    expect(controller.blocksNavigation(), isTrue);
    await tester.pump(FluxerUnsavedChangesController.flashDuration);

    dirty.value = false;
    await tester.pumpAndSettle();
    expect(controller.blocksNavigation(), isFalse);
  });
}
