import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:material_ui/material_ui.dart';

class KeyboardSpamHarness extends ConsumerStatefulWidget {
  const KeyboardSpamHarness({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  KeyboardSpamHarnessState createState() => KeyboardSpamHarnessState();
}

class KeyboardSpamHarnessState extends ConsumerState<KeyboardSpamHarness> {
  double _viewInsetBottom = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref
          .read(mobileKeyboardMetricsProvider.notifier)
          .updateLayout(screenHeight: 800, isPortrait: true, isIos: false);
    });
  }

  void applyViewInset(double bottom) {
    setState(() => _viewInsetBottom = bottom);
    ref
        .read(mobileKeyboardMetricsProvider.notifier)
        .syncViewInsets(bottom, safeAreaBottom: 0);
  }

  void applyNative({required double keyboardHeight, required bool visible}) {
    ref
        .read(mobileKeyboardMetricsProvider.notifier)
        .debugApplyNativeMetrics(
          keyboardHeight: keyboardHeight,
          isKeyboardVisible: visible,
          nativeSafeAreaBottom: 34,
        );
  }

  void showKeyboard({
    required double keyboardHeight,
    required double viewInset,
  }) {
    applyNative(keyboardHeight: keyboardHeight, visible: true);
    applyViewInset(viewInset);
  }

  void hideKeyboard({required double keyboardHeight}) {
    applyNative(keyboardHeight: keyboardHeight, visible: false);
  }

  void resetKeyboardLayoutState() {
    ref
      ..read(mobileKeyboardMetricsProvider.notifier).resetTransientLayoutState()
      ..read(bottomInputSlotProvider.notifier).resetAfterChannelChange();
  }

  void resetLayoutAndHideKeyboard({required double keyboardHeight}) {
    resetKeyboardLayoutState();
    hideKeyboard(keyboardHeight: keyboardHeight);
  }

  Future<void> runOpenCloseSpamCycles(int count) async {
    for (int i = 0; i < count; i++) {
      applyNative(keyboardHeight: 336, visible: true);
      applyViewInset(302);
      applyViewInset(0);
      applyNative(keyboardHeight: 336, visible: true);
      applyNative(keyboardHeight: 0, visible: false);
    }
    applyNative(keyboardHeight: 336, visible: true);
    applyViewInset(302);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(bottomInputSlotProvider);
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(viewInsets: EdgeInsets.only(bottom: _viewInsetBottom)),
      child: Material(child: TextField(focusNode: widget.focusNode)),
    );
  }
}

void main() {
  testWidgets('typed text stays visible after keyboard height spam', (
    tester,
  ) async {
    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    final GlobalKey<KeyboardSpamHarnessState> harnessKey =
        GlobalKey<KeyboardSpamHarnessState>();

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: KeyboardSpamHarness(key: harnessKey, focusNode: focusNode),
        ),
      ),
    );
    await tester.pumpAndSettle();
    focusNode.requestFocus();
    await tester.pumpAndSettle();

    final KeyboardSpamHarnessState harness = harnessKey.currentState!;
    await harness.runOpenCloseSpamCycles(6);
    for (int i = 0; i < 6 * 4 + 2; i++) {
      await tester.pump();
    }
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'hello');
    await tester.pump();
    expect(find.text('hello'), findsOneWidget);
    expect(
      harnessKey.currentState!.ref.read(bottomInputSlotProvider).slotHeight,
      302,
    );
  });

  testWidgets('typing after channel reset does not keep old slot height', (
    tester,
  ) async {
    const double oldHeight = 302;
    const double newHeight = 280;

    final FocusNode focusNode = FocusNode();
    addTearDown(focusNode.dispose);
    final GlobalKey<KeyboardSpamHarnessState> harnessKey =
        GlobalKey<KeyboardSpamHarnessState>();

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: KeyboardSpamHarness(key: harnessKey, focusNode: focusNode),
        ),
      ),
    );
    await tester.pumpAndSettle();
    focusNode.requestFocus();
    await tester.pumpAndSettle();

    KeyboardSpamHarnessState harness() => harnessKey.currentState!;

    harness().showKeyboard(keyboardHeight: 336, viewInset: oldHeight);
    await tester.pump();

    harness().resetLayoutAndHideKeyboard(keyboardHeight: 336);
    await tester.pump();
    expect(harness().ref.read(bottomInputSlotProvider).slotHeight, 0);

    harness().showKeyboard(keyboardHeight: 310, viewInset: newHeight);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'abc');
    await tester.pump();
    expect(find.text('abc'), findsOneWidget);
    expect(harness().ref.read(bottomInputSlotProvider).slotHeight, newHeight);
    expect(
      harness().ref.read(bottomInputSlotProvider).slotHeight,
      isNot(oldHeight),
    );
  });
}
