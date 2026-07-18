import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  group('MobileKeyboardMetrics dual-source merge', () {
    test(
      'gap case: native 336/safe 34 + viewInsets 302 settles at IME-only 302',
      () async {
        final ProviderContainer container = ProviderContainer();
        addTearDown(container.dispose);
        final ProviderSubscription<MobileKeyboardMetricsState> metricsSub =
            container.listen(
              mobileKeyboardMetricsProvider,
              (_, _) {},
              fireImmediately: true,
            );
        final ProviderSubscription<BottomInputSlotState> slotSub = container
            .listen(bottomInputSlotProvider, (_, _) {}, fireImmediately: true);
        addTearDown(metricsSub.close);
        addTearDown(slotSub.close);

        final MobileKeyboardMetrics notifier = container.read(
          mobileKeyboardMetricsProvider.notifier,
        );
        await Future<void>.value();

        // Android native includes systemBars; viewInsets is IME-only.
        notifier
          ..debugApplyNativeMetrics(
            keyboardHeight: 336,
            isKeyboardVisible: true,
            nativeSafeAreaBottom: 34,
          )
          ..syncViewInsets(302, safeAreaBottom: 0);

        final MobileKeyboardMetricsState settled = container.read(
          mobileKeyboardMetricsProvider,
        );
        expect(settled.liveKeyboardHeight, 302);
        expect(settled.isKeyboardVisible, isTrue);

        final BottomInputSlotState slot = container.read(
          bottomInputSlotProvider,
        );
        expect(slot.slotHeight, 302);
        expect(slot.mode, BottomInputMode.keyboard);
      },
    );

    test('out-of-order IME-only samples settle at final max height', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      final ProviderSubscription<MobileKeyboardMetricsState> metricsSub =
          container.listen(
            mobileKeyboardMetricsProvider,
            (_, _) {},
            fireImmediately: true,
          );
      final ProviderSubscription<BottomInputSlotState> slotSub = container
          .listen(bottomInputSlotProvider, (_, _) {}, fireImmediately: true);
      addTearDown(metricsSub.close);
      addTearDown(slotSub.close);

      final MobileKeyboardMetrics notifier = container.read(
        mobileKeyboardMetricsProvider.notifier,
      );
      await Future<void>.value();

      // Stale viewInsets frame arrives first (partial open).
      notifier.syncViewInsets(180, safeAreaBottom: 34);
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        180,
      );

      // Native stream reaches full height (gross 336, safe 34 → IME 302).
      notifier.debugApplyNativeMetrics(
        keyboardHeight: 336,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: 34,
      );
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        302,
      );

      // Lagged lower viewInsets must not regress the live IME height.
      notifier.syncViewInsets(200, safeAreaBottom: 0);
      final MobileKeyboardMetricsState settled = container.read(
        mobileKeyboardMetricsProvider,
      );
      expect(settled.liveKeyboardHeight, 302);
      expect(settled.isKeyboardVisible, isTrue);

      final BottomInputSlotState slot = container.read(bottomInputSlotProvider);
      expect(slot.slotHeight, 302);
    });

    test(
      'native full height followed by hidden viewInsets keeps IME height until both clear',
      () async {
        final ProviderContainer container = ProviderContainer();
        addTearDown(container.dispose);
        final ProviderSubscription<MobileKeyboardMetricsState> metricsSub =
            container.listen(
              mobileKeyboardMetricsProvider,
              (_, _) {},
              fireImmediately: true,
            );
        addTearDown(metricsSub.close);

        final MobileKeyboardMetrics notifier = container.read(
          mobileKeyboardMetricsProvider.notifier,
        );
        await Future<void>.value();

        notifier
          ..debugApplyNativeMetrics(
            keyboardHeight: 336,
            isKeyboardVisible: true,
            nativeSafeAreaBottom: 34,
          )
          ..syncViewInsets(302, safeAreaBottom: 0);
        expect(
          container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
          302,
        );

        // One source drops first during close — keep the remaining IME source.
        notifier.syncViewInsets(0, safeAreaBottom: 34);
        expect(
          container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
          302,
        );

        notifier.debugApplyNativeMetrics(
          keyboardHeight: 0,
          isKeyboardVisible: false,
          nativeSafeAreaBottom: 34,
        );
        final MobileKeyboardMetricsState closed = container.read(
          mobileKeyboardMetricsProvider,
        );
        expect(closed.liveKeyboardHeight, 0);
        expect(closed.isKeyboardVisible, isFalse);
      },
    );

    test(
      'slot height is full IME height without MediaQuery safe-area netting',
      () {
        expect(
          resolveBottomInputSlotHeight(
            isPanelOpen: false,
            transition: BottomInputTransition.idle,
            lockedHeight: 0,
            anchorHeight: 336,
            panelHeight: 0,
            liveKeyboardHeight: 302,
            isKeyboardVisible: true,
            safeAreaBottom: 34,
          ),
          302,
        );
      },
    );
  });
}
