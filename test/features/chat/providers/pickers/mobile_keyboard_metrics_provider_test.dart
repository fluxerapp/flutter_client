import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
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
      },
    );

    test('viewInsets wins over a taller native sample', () async {
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

      // Native gross height must not replace a live viewInsets sample.
      notifier.debugApplyNativeMetrics(
        keyboardHeight: 336,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: 34,
      );
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        180,
      );

      notifier.syncViewInsets(302, safeAreaBottom: 0);
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

        // viewInsets dropped first. Keep the gross native height, not the
        // stripped IME-only value, until the plugin also reports hidden.
        notifier.syncViewInsets(0, safeAreaBottom: 34);
        expect(
          container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
          336,
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

    test('stale native height drops after viewInsets closes', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(
        mobileKeyboardMetricsProvider,
        (_, _) {},
        fireImmediately: true,
      );
      await Future<void>.value();

      final MobileKeyboardMetrics notifier =
          container.read(mobileKeyboardMetricsProvider.notifier)
            ..debugApplyNativeMetrics(
              keyboardHeight: 336,
              isKeyboardVisible: true,
              nativeSafeAreaBottom: 34,
            )
            ..syncViewInsets(302, safeAreaBottom: 0)
            ..syncViewInsets(0, safeAreaBottom: 0);
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        336,
      );

      await Future<void>.delayed(kUnmeasuredKeyboardReservationTimeout);
      await Future<void>.value();

      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        0,
      );

      notifier.debugApplyNativeMetrics(
        keyboardHeight: 336,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: 34,
      );
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        0,
      );

      notifier.syncViewInsets(302, safeAreaBottom: 0);
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        302,
      );
    });

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
          ),
          302,
        );
      },
    );
  });

  test('shortcut bar insets do not become the panel anchor', () async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container
      ..listen(mobileKeyboardMetricsProvider, (_, _) {})
      ..listen(bottomInputSlotProvider, (_, _) {});
    await Future<void>.value();

    container.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
      ..syncViewInsets(55, safeAreaBottom: 0)
      ..captureKeyboardAnchor(55);

    expect(
      container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
      55,
    );
    expect(
      container.read(mobileKeyboardMetricsProvider).isKeyboardVisible,
      isTrue,
    );
    expect(
      container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
      isNull,
    );
    expect(
      container.read(mobileKeyboardMetricsProvider).resolveAnchorHeight(),
      kIosFallbackKeyboardHeight,
    );
  });

  group('unmeasured keyboard reservation', () {
    test('reserve sets flag when live height is zero', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(mobileKeyboardMetricsProvider, (_, _) {});
      await Future<void>.value();

      container
          .read(mobileKeyboardMetricsProvider.notifier)
          .reserveUnmeasuredKeyboard();

      expect(
        container
            .read(mobileKeyboardMetricsProvider)
            .unmeasuredKeyboardReserved,
        isTrue,
      );
    });

    test('live inset clears reservation', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(
        bottomInputSlotProvider,
        (_, _) {},
        fireImmediately: true,
      );
      await Future<void>.value();

      container.read(mobileKeyboardMetricsProvider.notifier)
        ..reserveUnmeasuredKeyboard()
        ..syncViewInsets(302, safeAreaBottom: 0);

      expect(
        container
            .read(mobileKeyboardMetricsProvider)
            .unmeasuredKeyboardReserved,
        isFalse,
      );
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        302,
      );
    });

    test('reservation clears when no inset arrives', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(mobileKeyboardMetricsProvider, (_, _) {});
      await Future<void>.value();

      container
          .read(mobileKeyboardMetricsProvider.notifier)
          .reserveUnmeasuredKeyboard();
      expect(
        container
            .read(mobileKeyboardMetricsProvider)
            .unmeasuredKeyboardReserved,
        isTrue,
      );

      await Future<void>.delayed(kUnmeasuredKeyboardReservationTimeout);
      await Future<void>.value();

      expect(
        container
            .read(mobileKeyboardMetricsProvider)
            .unmeasuredKeyboardReserved,
        isFalse,
      );
    });

    test('clearUnmeasuredKeyboardReservation drops flag', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(mobileKeyboardMetricsProvider, (_, _) {});
      await Future<void>.value();

      container.read(mobileKeyboardMetricsProvider.notifier)
        ..reserveUnmeasuredKeyboard()
        ..clearUnmeasuredKeyboardReservation();

      expect(
        container
            .read(mobileKeyboardMetricsProvider)
            .unmeasuredKeyboardReserved,
        isFalse,
      );
    });

    test(
      'keyboard dismiss after inset clears reservation without live height',
      () async {
        final ProviderContainer container = ProviderContainer();
        addTearDown(container.dispose);
        container.listen(
          bottomInputSlotProvider,
          (_, _) {},
          fireImmediately: true,
        );
        await Future<void>.value();

        container.read(mobileKeyboardMetricsProvider.notifier)
          ..reserveUnmeasuredKeyboard()
          ..syncViewInsets(180, safeAreaBottom: 0)
          ..syncViewInsets(0, safeAreaBottom: 0);

        expect(
          container
              .read(mobileKeyboardMetricsProvider)
              .unmeasuredKeyboardReserved,
          isFalse,
        );
        expect(container.read(bottomInputSlotProvider).slotHeight, 0);
      },
    );

    test('keyboard dismiss after open clears reservation', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container.listen(mobileKeyboardMetricsProvider, (_, _) {});
      await Future<void>.value();

      container.read(mobileKeyboardMetricsProvider.notifier)
        ..syncViewInsets(302, safeAreaBottom: 0)
        ..reserveUnmeasuredKeyboard()
        ..syncViewInsets(0, safeAreaBottom: 0);

      expect(
        container
            .read(mobileKeyboardMetricsProvider)
            .unmeasuredKeyboardReserved,
        isFalse,
      );
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        0,
      );
    });

    test('reserved slot uses anchor until live height arrives', () async {
      final ProviderContainer container = ProviderContainer();
      addTearDown(container.dispose);
      container
        ..listen(
          mobileKeyboardMetricsProvider,
          (_, _) {},
          fireImmediately: true,
        )
        ..listen(bottomInputSlotProvider, (_, _) {}, fireImmediately: true);
      await Future<void>.value();

      final MobileKeyboardMetrics notifier =
          container.read(mobileKeyboardMetricsProvider.notifier)
            ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
            ..debugApplyNativeMetrics(
              keyboardHeight: 336,
              isKeyboardVisible: true,
              nativeSafeAreaBottom: 34,
            )
            ..syncViewInsets(0, safeAreaBottom: 0)
            ..clearUnmeasuredKeyboardReservation()
            ..syncViewInsets(0, safeAreaBottom: 0)
            ..debugApplyNativeMetrics(
              keyboardHeight: 0,
              isKeyboardVisible: false,
              nativeSafeAreaBottom: 34,
            )
            ..reserveUnmeasuredKeyboard();
      expect(
        container.read(bottomInputSlotProvider).slotHeight,
        container.read(mobileKeyboardMetricsProvider).resolveAnchorHeight(),
      );

      notifier.syncViewInsets(318, safeAreaBottom: 0);
      expect(container.read(bottomInputSlotProvider).slotHeight, 318);
    });
  });

  test('shorter keyboard replaces a taller saved anchor', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'mobile_keyboard_anchor_height_portrait': 420.0,
    });
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(mobileKeyboardMetricsProvider, (_, _) {});
    await Future<void>.value();
    await Future<void>.delayed(Duration.zero);

    expect(
      container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
      420,
    );

    final MobileKeyboardMetrics notifier =
        container.read(mobileKeyboardMetricsProvider.notifier)
          ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
          ..syncViewInsets(180, safeAreaBottom: 0);
    expect(
      container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
      420,
    );

    notifier.syncViewInsets(302, safeAreaBottom: 0);
    expect(
      container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
      420,
    );

    notifier.syncViewInsets(0, safeAreaBottom: 0);
    expect(
      container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
      302,
    );

    await Future<void>.delayed(const Duration(milliseconds: 350));
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(
      preferences.getDouble('mobile_keyboard_anchor_height_portrait'),
      302,
    );
  });

  test('stuck short viewInsets yields to the native ime', () async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(mobileKeyboardMetricsProvider, (_, _) {});
    await Future<void>.value();

    container.read(mobileKeyboardMetricsProvider.notifier)
      ..debugApplyNativeMetrics(
        keyboardHeight: 336,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: 34,
      )
      ..syncViewInsets(180, safeAreaBottom: 0);
    expect(
      container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
      180,
    );

    await Future<void>.delayed(kUnmeasuredKeyboardReservationTimeout);
    await Future<void>.value();

    expect(
      container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
      302,
    );
  });

  test('ignores a persisted shortcut-bar anchor', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      'mobile_keyboard_anchor_height_portrait': 55.0,
    });
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.listen(mobileKeyboardMetricsProvider, (_, _) {});
    await Future<void>.value();
    await Future<void>.delayed(Duration.zero);

    expect(
      container.read(mobileKeyboardMetricsProvider).anchoredKeyboardHeight,
      isNull,
    );
    expect(
      container.read(mobileKeyboardMetricsProvider).resolveAnchorHeight(),
      kIosFallbackKeyboardHeight,
    );
  });
}
