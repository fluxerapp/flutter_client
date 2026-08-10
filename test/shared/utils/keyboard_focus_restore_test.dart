import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';

void main() {
  testWidgets('restores focus when app resumes from background', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var canRestore = true;
    final KeyboardFocusRestoreHandle handle = KeyboardFocusRestoreHandle(
      focusNode: focusNode,
      shouldTrackOnBackground: () => true,
      canRestoreFocus: () => canRestore,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: TextField(focusNode: focusNode)),
      ),
    );
    await tester.pumpAndSettle();

    focusNode.requestFocus();
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isTrue);

    handle.handleLifecycleState(AppLifecycleState.inactive);
    focusNode.unfocus();
    await tester.pump();

    handle.handleLifecycleState(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);

    expect(focusNode.hasFocus, isTrue);
  });

  testWidgets('defers restore until canRestoreFocus becomes true', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    var canRestore = false;
    final KeyboardFocusRestoreHandle handle = KeyboardFocusRestoreHandle(
      focusNode: focusNode,
      shouldTrackOnBackground: () => true,
      canRestoreFocus: () => canRestore,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: TextField(focusNode: focusNode)),
      ),
    );
    await tester.pumpAndSettle();

    focusNode.requestFocus();
    await tester.pumpAndSettle();

    handle.handleLifecycleState(AppLifecycleState.inactive);
    focusNode.unfocus();
    await tester.pump();

    handle.handleLifecycleState(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);
    expect(focusNode.hasFocus, isFalse);
    expect(handle.hasPendingRestore, isTrue);

    canRestore = true;
    handle.scheduleRestoreIfPending();
    await tester.pump();
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);
    expect(focusNode.hasFocus, isTrue);
    expect(handle.hasPendingRestore, isFalse);
  });

  test('isAppBackgroundLifecycleState covers inactive paused and hidden', () {
    expect(isAppBackgroundLifecycleState(AppLifecycleState.inactive), isTrue);
    expect(isAppBackgroundLifecycleState(AppLifecycleState.paused), isTrue);
    expect(isAppBackgroundLifecycleState(AppLifecycleState.hidden), isTrue);
    expect(isAppBackgroundLifecycleState(AppLifecycleState.resumed), isFalse);
  });
}
