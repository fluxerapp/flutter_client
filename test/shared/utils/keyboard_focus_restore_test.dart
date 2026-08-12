import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';

void main() {
  Future<void> backgroundApp(KeyboardFocusRestoreHandle handle) async {
    handle.handleLifecycleState(AppLifecycleState.inactive);
    handle.handleLifecycleState(AppLifecycleState.hidden);
    handle.handleLifecycleState(AppLifecycleState.paused);
  }

  Future<void> resumeApp(KeyboardFocusRestoreHandle handle) async {
    handle.handleLifecycleState(AppLifecycleState.hidden);
    handle.handleLifecycleState(AppLifecycleState.inactive);
    handle.handleLifecycleState(AppLifecycleState.resumed);
  }

  testWidgets('restores focus when app resumes from background', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    const canRestore = true;
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

    await backgroundApp(handle);
    focusNode.unfocus();
    await tester.pump();

    await resumeApp(handle);
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

    await backgroundApp(handle);
    focusNode.unfocus();
    await tester.pump();

    await resumeApp(handle);
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

  testWidgets('inactive alone does not schedule a focus restore', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    final KeyboardFocusRestoreHandle handle = KeyboardFocusRestoreHandle(
      focusNode: focusNode,
      shouldTrackOnBackground: () => true,
      canRestoreFocus: () => true,
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
    expect(handle.hasPendingRestore, isFalse);

    handle.handleLifecycleState(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(kKeyboardFocusRestoreRetryDelay);

    expect(focusNode.hasFocus, isTrue);
    expect(handle.hasPendingRestore, isFalse);
  });

  test('isAppBackgroundLifecycleState covers paused and hidden only', () {
    expect(isAppBackgroundLifecycleState(AppLifecycleState.inactive), isFalse);
    expect(isAppBackgroundLifecycleState(AppLifecycleState.paused), isTrue);
    expect(isAppBackgroundLifecycleState(AppLifecycleState.hidden), isTrue);
    expect(isAppBackgroundLifecycleState(AppLifecycleState.resumed), isFalse);
  });
}
