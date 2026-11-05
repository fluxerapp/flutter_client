import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

import 'fluxer_settings_test.dart' show buildTestApp;

Rect _logicalRect(SemanticsNode node, double devicePixelRatio) {
  Rect rect = node.rect;
  for (SemanticsNode? n = node; n != null; n = n.parent) {
    final Matrix4? transform = n.transform;
    if (transform != null) {
      rect = MatrixUtils.transformRect(transform, rect);
    }
  }
  return Rect.fromLTRB(
    rect.left / devicePixelRatio,
    rect.top / devicePixelRatio,
    rect.right / devicePixelRatio,
    rect.bottom / devicePixelRatio,
  );
}

Matcher _closeTo(Rect expected) => predicate<Rect>(
  (Rect actual) =>
      (actual.left - expected.left).abs() <= 1 &&
      (actual.top - expected.top).abs() <= 1 &&
      (actual.right - expected.right).abs() <= 1 &&
      (actual.bottom - expected.bottom).abs() <= 1,
  'within 1 px of $expected',
);

void main() {
  group('FluxerSaveBar semantics', () {
    late ValueNotifier<bool> dirty;
    late ValueNotifier<bool> saving;
    late BuildContext pageContext;

    Future<void> pumpPage(WidgetTester tester) async {
      dirty = ValueNotifier<bool>(false);
      saving = ValueNotifier<bool>(false);
      addTearDown(dirty.dispose);
      addTearDown(saving.dispose);
      await tester.pumpWidget(
        buildTestApp(
          ListenableBuilder(
            listenable: Listenable.merge(<Listenable>[dirty, saving]),
            builder: (BuildContext context, Widget? _) {
              return FluxerSettingsSheet(
                hasUnsavedChanges: dirty.value,
                isSaving: saving.value,
                onReset: () {},
                onSave: () {},
                child: Builder(
                  builder: (BuildContext context) {
                    pageContext = context;
                    return const SizedBox.expand();
                  },
                ),
              );
            },
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    Future<void> editUnderSheet(WidgetTester tester) async {
      showModalBottomSheet<void>(
        context: pageContext,
        builder: (_) => const SizedBox(height: 200),
      );
      await tester.pumpAndSettle();
      dirty.value = true;
      await tester.pumpAndSettle();
      Navigator.of(pageContext).pop();
      await tester.pumpAndSettle();
    }

    void expectSaveReachable(WidgetTester tester) {
      final SemanticsNode save = find.semantics
          .byLabel('Save')
          .evaluate()
          .single;
      expect(
        _logicalRect(save, tester.view.devicePixelRatio).center,
        within(distance: 1, from: tester.getCenter(find.text('Save'))),
      );
    }

    testWidgets('bar shown under a sheet is in the tree where it is drawn', (
      tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await pumpPage(tester);
      expect(find.semantics.byLabel('Save'), findsNothing);

      await editUnderSheet(tester);

      expectSaveReachable(tester);
      handle.dispose();
    });

    testWidgets('bar shown again under a sheet after hiding is reachable', (
      tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await pumpPage(tester);
      dirty.value = true;
      await tester.pumpAndSettle();
      dirty.value = false;
      await tester.pump();
      expect(find.semantics.byLabel('Save'), findsNothing);
      await tester.pumpAndSettle();

      await editUnderSheet(tester);

      expectSaveReachable(tester);
      handle.dispose();
    });

    testWidgets(
      'bar shown again under a sheet after saving matches drawn bar',
      (tester) async {
        final SemanticsHandle handle = tester.ensureSemantics();
        await pumpPage(tester);
        dirty.value = true;
        await tester.pumpAndSettle();
        saving.value = true;
        await tester.pump(const Duration(milliseconds: 100));
        saving.value = false;
        dirty.value = false;
        await tester.pumpAndSettle();

        await editUnderSheet(tester);

        final double dpr = tester.view.devicePixelRatio;
        for (final (String label, Finder drawn) in <(String, Finder)>[
          ('Unsaved changes', find.text('Unsaved changes')),
          ('Reset', find.widgetWithText(FluxerButton, 'Reset')),
          ('Save', find.widgetWithText(FluxerButton, 'Save')),
        ]) {
          final SemanticsNode node = find.semantics
              .byLabel(label)
              .evaluate()
              .single;
          expect(_logicalRect(node, dpr), _closeTo(tester.getRect(drawn)));
        }
        handle.dispose();
      },
    );
  });
}
