import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_keyboard_session.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';

void main() {
  testWidgets('cancelPendingFocusRestore drops pending background restore', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    late ComposerKeyboardSession session;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) {
                session = ComposerKeyboardSession(
                  ref: ref,
                  focusNode: focusNode,
                  isMounted: () => true,
                  isMobileLayout: () => true,
                  isSlashSessionActive: () => false,
                  composerEntryFocused: () => focusNode.hasFocus,
                );
                return TextField(focusNode: focusNode);
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    focusNode.requestFocus();
    await tester.pumpAndSettle();

    session.handleAppLifecycle(AppLifecycleState.paused);
    focusNode.unfocus();
    await tester.pump();
    expect(session.hasPendingRestore, isTrue);

    session.cancelPendingFocusRestore();
    expect(session.hasPendingRestore, isFalse);
    session.dispose();
  });

  testWidgets('onComposerDeactivated resets bottom slot transition state', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    late ComposerKeyboardSession session;
    late WidgetRef widgetRef;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) {
                widgetRef = ref;
                session = ComposerKeyboardSession(
                  ref: ref,
                  focusNode: focusNode,
                  isMounted: () => true,
                  isMobileLayout: () => true,
                  isSlashSessionActive: () => false,
                  composerEntryFocused: () => focusNode.hasFocus,
                );
                return TextField(focusNode: focusNode);
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    widgetRef
        .read(bottomInputSlotProvider.notifier)
        .beginKeyboardTransition(280);
    session.onComposerDeactivated();
    await tester.pump();
    expect(
      widgetRef.read(bottomInputSlotProvider).transition,
      BottomInputTransition.idle,
    );
    session.dispose();
  });

  testWidgets('onChannelChanged resets bottom slot transition state', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    late ComposerKeyboardSession session;
    late WidgetRef widgetRef;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) {
                widgetRef = ref;
                session = ComposerKeyboardSession(
                  ref: ref,
                  focusNode: focusNode,
                  isMounted: () => true,
                  isMobileLayout: () => true,
                  isSlashSessionActive: () => false,
                  composerEntryFocused: () => focusNode.hasFocus,
                );
                return TextField(focusNode: focusNode);
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    widgetRef
        .read(bottomInputSlotProvider.notifier)
        .beginKeyboardTransition(280);
    expect(
      widgetRef.read(bottomInputSlotProvider).transition,
      BottomInputTransition.lockingToKeyboard,
    );

    session.onChannelChanged();
    await tester.pump();
    expect(
      widgetRef.read(bottomInputSlotProvider).transition,
      BottomInputTransition.idle,
    );
    session.dispose();
  });

  testWidgets('composer tap does not restart an already focused field', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    late ComposerKeyboardSession session;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          mobileKeyboardMetricsProvider.overrideWith(_OpenKeyboardMetrics.new),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) {
                session = ComposerKeyboardSession(
                  ref: ref,
                  focusNode: focusNode,
                  isMounted: () => true,
                  isMobileLayout: () => true,
                  isSlashSessionActive: () => false,
                  composerEntryFocused: () => focusNode.hasFocus,
                );
                return TextField(focusNode: focusNode);
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    focusNode.requestFocus();
    await tester.pumpAndSettle();
    tester.testTextInput.log.clear();

    session.onComposerFieldTap(tester.element(find.byType(TextField)));
    await tester.pump();

    expect(focusNode.hasFocus, isTrue);
    expect(
      tester.testTextInput.log.map((call) => call.method),
      isNot(contains('TextInput.show')),
    );
    session.dispose();
  });

  testWidgets('a closed keyboard stays closed while the composer keeps focus', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    late ComposerKeyboardSession session;
    late WidgetRef widgetRef;

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) {
                widgetRef = ref;
                session = ComposerKeyboardSession(
                  ref: ref,
                  focusNode: focusNode,
                  isMounted: () => true,
                  isMobileLayout: () => true,
                  isSlashSessionActive: () => false,
                  composerEntryFocused: () => focusNode.hasFocus,
                );
                return TextField(focusNode: focusNode);
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    focusNode.requestFocus();
    await tester.pumpAndSettle();

    widgetRef.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(screenHeight: 800, isPortrait: true, isIos: false)
      ..debugApplyNativeMetrics(
        keyboardHeight: 336,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: 34,
      )
      ..syncViewInsets(302, safeAreaBottom: 0)
      ..debugApplyNativeMetrics(
        keyboardHeight: 0,
        isKeyboardVisible: false,
        nativeSafeAreaBottom: 34,
      )
      ..syncViewInsets(0, safeAreaBottom: 0)
      ..syncViewInsets(0, safeAreaBottom: 0);

    expect(focusNode.hasFocus, isTrue);
    expect(
      widgetRef.read(mobileKeyboardMetricsProvider).unmeasuredKeyboardReserved,
      isFalse,
    );
    expect(widgetRef.read(bottomInputSlotProvider).slotHeight, 0);
    session.dispose();
  });
}

class _OpenKeyboardMetrics extends MobileKeyboardMetrics {
  @override
  MobileKeyboardMetricsState build() {
    return const MobileKeyboardMetricsState(
      liveKeyboardHeight: 320,
      isKeyboardVisible: true,
      safeAreaBottom: 0,
      fallbackKeyboardHeight: 300,
      isPortrait: true,
      unmeasuredKeyboardReserved: true,
    );
  }
}
