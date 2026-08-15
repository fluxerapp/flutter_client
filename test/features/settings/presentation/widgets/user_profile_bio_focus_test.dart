import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:material_ui/material_ui.dart';

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

class _ProfileBioEditorHarness extends StatefulWidget {
  const _ProfileBioEditorHarness();

  @override
  State<_ProfileBioEditorHarness> createState() =>
      _ProfileBioEditorHarnessState();
}

class _ProfileBioEditorHarnessState extends State<_ProfileBioEditorHarness> {
  final FocusNode bioFocusNode = FocusNode();
  final TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    bioFocusNode.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldTapRegion(
            child: FluxerInput.multiline(
              controller: bioController,
              focusNode: bioFocusNode,
              label: 'About Me',
              maxLines: 8,
              onChanged: (_) => setState(() {}),
              onTapOutside: (_) => bioFocusNode.unfocus(),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.opaque,
            child: Text(
              bioController.text.isEmpty ? 'Preview' : bioController.text,
              key: const Key('preview'),
            ),
          ),
          const SizedBox(height: 400),
        ],
      ),
    );
  }
}

void main() {
  group('profile About Me focus', () {
    testWidgets('keeps focus when newlines resize the field and preview', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1;
      tester.view.viewInsets = const FakeViewPadding(bottom: 280);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetViewInsets);

      await tester.pumpWidget(_wrap(const _ProfileBioEditorHarness()));

      final state = tester.state<_ProfileBioEditorHarnessState>(
        find.byType(_ProfileBioEditorHarness),
      );

      await tester.tap(find.byType(EditableText));
      await tester.pump();
      expect(state.bioFocusNode.hasFocus, isTrue);

      await tester.enterText(find.byType(EditableText), 'line one');
      await tester.pump();
      expect(state.bioFocusNode.hasFocus, isTrue);

      final fieldHeightBefore = tester
          .getSize(find.byType(EditableText))
          .height;

      await tester.enterText(
        find.byType(EditableText),
        'line one\nline two\nline three\nline four',
      );
      await tester.pump();

      final fieldHeightAfter = tester.getSize(find.byType(EditableText)).height;
      expect(
        fieldHeightAfter,
        greaterThan(fieldHeightBefore),
        reason: 'field should grow with newlines (maxLines > minLines)',
      );
      expect(
        state.bioFocusNode.hasFocus,
        isTrue,
        reason: 'focus must survive field + preview growth on newlines',
      );

      await tester.enterText(find.byType(EditableText), 'line one');
      await tester.pump();
      expect(
        state.bioFocusNode.hasFocus,
        isTrue,
        reason: 'focus must survive shrink when newlines are removed',
      );
    });

    testWidgets('tap outside dismisses About Me focus', (tester) async {
      await tester.pumpWidget(_wrap(const _ProfileBioEditorHarness()));

      final state = tester.state<_ProfileBioEditorHarnessState>(
        find.byType(_ProfileBioEditorHarness),
      );

      await tester.tap(find.byType(EditableText));
      await tester.pump();
      expect(state.bioFocusNode.hasFocus, isTrue);

      await tester.tap(find.byKey(const Key('preview')));
      await tester.pump();
      expect(state.bioFocusNode.hasFocus, isFalse);
    });

    testWidgets('single-line fields dismiss focus on tap outside', (
      tester,
    ) async {
      final focusNode = FocusNode();
      final controller = TextEditingController(text: 'Ada');
      addTearDown(focusNode.dispose);
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          Column(
            children: [
              FluxerInput(
                controller: controller,
                focusNode: focusNode,
                label: 'Display Name',
                onTapOutside: (_) => focusNode.unfocus(),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                behavior: HitTestBehavior.opaque,
                child: const Text('Outside', key: Key('outside')),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.byType(EditableText));
      await tester.pump();
      expect(focusNode.hasFocus, isTrue);

      await tester.tap(find.byKey(const Key('outside')));
      await tester.pump();
      expect(focusNode.hasFocus, isFalse);
    });

    test('profile editor does not wrap scroll body in unfocus detector', () {
      final file = File(
        'lib/features/settings/presentation/widgets/user_profile.dart',
      );
      final source = file.readAsStringSync();
      final scrollIdx = source.indexOf(
        'keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag',
      );
      expect(scrollIdx, greaterThan(0));
      final beforeScroll = source.substring(
        (scrollIdx - 400).clamp(0, scrollIdx),
        scrollIdx,
      );
      expect(
        beforeScroll.contains('FocusManager.instance.primaryFocus?.unfocus()'),
        isFalse,
        reason:
            'do not put an unfocus GestureDetector around the profile '
            'scroll view; keep dismiss handlers on non-input siblings',
      );
    });
  });
}
