import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_keyboard_session.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';

void main() {
  testWidgets('cancelImeReconnect ends ime reconnect state', (tester) async {
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

    session.reconnectOpenField();
    await tester.pump();
    expect(session.keyboardState, ComposerKeyboardState.imeReconnecting);

    session.cancelImeReconnect();
    expect(session.keyboardState, isNot(ComposerKeyboardState.imeReconnecting));
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
    expect(
      widgetRef.read(bottomInputSlotProvider).transition,
      BottomInputTransition.idle,
    );
    session.dispose();
  });

  testWidgets(
    'composer tap nudges keyboard when metrics show open but insets are zero',
    (tester) async {
      final FocusNode focusNode = FocusNode();
      addTearDown(focusNode.dispose);
      late ComposerKeyboardSession session;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            mobileKeyboardMetricsProvider.overrideWith(
              _OpenKeyboardMetrics.new,
            ),
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

      session.onComposerFieldTap(tester.element(find.byType(TextField)));
      await tester.pump();

      expect(
        session.keyboardState,
        isNot(ComposerKeyboardState.imeReconnecting),
      );
      session.dispose();
    },
  );
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
