import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('system back unfocuses a text field before onBack', (
    tester,
  ) async {
    tester.view.viewInsets = const FakeViewPadding(bottom: 960);
    addTearDown(tester.view.resetViewInsets);
    var backCount = 0;
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: wrapFluxerOverlayBackHandler(
          canDismiss: true,
          onBack: () => backCount++,
          onDismiss: null,
          child: Scaffold(body: TextField(focusNode: focusNode)),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    final bool firstBack = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(firstBack, isTrue);
    expect(focusNode.hasFocus, isFalse);
    expect(backCount, 0);

    final bool secondBack = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(secondBack, isTrue);
    expect(backCount, 1);
  });

  testWidgets('system back unfocuses a text field before dismissing', (
    tester,
  ) async {
    tester.view.viewInsets = const FakeViewPadding(bottom: 960);
    addTearDown(tester.view.resetViewInsets);
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);

    var dismissed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: wrapFluxerOverlayBackHandler(
          canDismiss: true,
          onBack: null,
          onDismiss: () => dismissed = true,
          child: Scaffold(body: TextField(focusNode: focusNode)),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    final bool firstBack = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(firstBack, isTrue);
    expect(focusNode.hasFocus, isFalse);
    expect(dismissed, isFalse);

    final bool secondBack = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(secondBack, isTrue);
    expect(dismissed, isTrue);
  });

  testWidgets('keeps text focus when the soft keyboard hides', (tester) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var dismissed = false;
    tester.view.viewInsets = const FakeViewPadding(bottom: 960);
    addTearDown(tester.view.resetViewInsets);

    await tester.pumpWidget(
      MaterialApp(
        home: wrapFluxerOverlayBackHandler(
          canDismiss: true,
          onBack: null,
          onDismiss: () => dismissed = true,
          child: Scaffold(body: TextField(focusNode: focusNode)),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    tester.view.viewInsets = FakeViewPadding.zero;
    await tester.pump();
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    final bool back = await tester.binding.handlePopRoute();
    await tester.pump();

    expect(back, isTrue);
    expect(dismissed, isTrue);
  });

  testWidgets('desktop back unfocuses a text field without a soft keyboard', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var dismissed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: wrapFluxerOverlayBackHandler(
          canDismiss: true,
          onBack: null,
          onDismiss: () => dismissed = true,
          child: Scaffold(body: TextField(focusNode: focusNode)),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(focusNode.hasFocus, isFalse);
    expect(dismissed, isFalse);
  }, variant: TargetPlatformVariant.only(TargetPlatform.macOS));
}
