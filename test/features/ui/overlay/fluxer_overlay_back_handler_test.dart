import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/overlay/fluxer_overlay_back_handler.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('system back unfocuses a text field before onBack', (
    tester,
  ) async {
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

  testWidgets('hides text focus when the keyboard inset collapses', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var keyboardInset = 320.0;

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(viewInsets: EdgeInsets.only(bottom: keyboardInset)),
              child: wrapFluxerOverlayBackHandler(
                canDismiss: true,
                onBack: null,
                onDismiss: null,
                child: Scaffold(
                  body: Column(
                    children: <Widget>[
                      TextField(focusNode: focusNode),
                      ElevatedButton(
                        onPressed: () => setState(() => keyboardInset = 0),
                        child: const Text('Hide keyboard'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();
    expect(focusNode.hasFocus, isTrue);

    await tester.tap(find.text('Hide keyboard'));
    await tester.pump();
    await tester.pump();

    expect(focusNode.hasFocus, isFalse);
  });

  testWidgets('keyboard inset collapse ignores fields outside the overlay', (
    tester,
  ) async {
    final FocusNode outsideFocus = FocusNode();
    addTearDown(outsideFocus.dispose);
    var keyboardInset = 320.0;

    await tester.pumpWidget(
      MaterialApp(
        home: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Scaffold(
              body: Column(
                children: <Widget>[
                  TextField(focusNode: outsideFocus),
                  MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      viewInsets: EdgeInsets.only(bottom: keyboardInset),
                    ),
                    child: wrapFluxerOverlayBackHandler(
                      canDismiss: true,
                      onBack: null,
                      onDismiss: null,
                      child: ElevatedButton(
                        onPressed: () => setState(() => keyboardInset = 0),
                        child: const Text('Hide keyboard'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );

    outsideFocus.requestFocus();
    await tester.pump();
    expect(outsideFocus.hasFocus, isTrue);

    await tester.tap(find.text('Hide keyboard'));
    await tester.pump();
    await tester.pump();

    expect(outsideFocus.hasFocus, isTrue);
  });
}
