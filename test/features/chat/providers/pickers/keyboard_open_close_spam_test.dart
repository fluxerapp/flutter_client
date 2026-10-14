import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const double _kOpenHeight = 302;
const double _kNativeGross = 336;
const double _kNativeSafe = 34;

ProviderContainer _openFocusedKeyboard() {
  final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator()
    ..register(requestFocus: () {}, readText: () => '', hasFocus: () => true);
  final ProviderContainer container =
      ProviderContainer(
          overrides: [
            composerFocusCoordinatorProvider.overrideWith(
              (Ref ref) => coordinator,
            ),
          ],
        )
        ..listen(
          mobileKeyboardMetricsProvider,
          (_, _) {},
          fireImmediately: true,
        )
        ..listen(bottomInputSlotProvider, (_, _) {}, fireImmediately: true);
  container.read(mobileKeyboardMetricsProvider.notifier)
    ..updateLayout(screenHeight: 800, isPortrait: true, isIos: false)
    ..debugApplyNativeMetrics(
      keyboardHeight: _kNativeGross,
      isKeyboardVisible: true,
      nativeSafeAreaBottom: _kNativeSafe,
    )
    ..syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
  return container;
}

void _hideKeyboard(ProviderContainer container) {
  container.read(mobileKeyboardMetricsProvider.notifier)
    ..syncViewInsets(0, safeAreaBottom: 0)
    ..debugApplyNativeMetrics(
      keyboardHeight: 0,
      isKeyboardVisible: false,
      nativeSafeAreaBottom: _kNativeSafe,
    );
}

void _dropViewInsetsOnly(ProviderContainer container) {
  container
      .read(mobileKeyboardMetricsProvider.notifier)
      .syncViewInsets(0, safeAreaBottom: 0);
}

double _liveHeight(ProviderContainer container) =>
    container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  group('keyboard open/close spam', () {
    late ProviderContainer container;
    late MobileKeyboardMetrics notifier;

    setUp(() async {
      container = ProviderContainer()
        ..listen(
          mobileKeyboardMetricsProvider,
          (_, _) {},
          fireImmediately: true,
        )
        ..listen(bottomInputSlotProvider, (_, _) {}, fireImmediately: true);
      await Future<void>.value();
      notifier = container.read(mobileKeyboardMetricsProvider.notifier)
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: false);
    });

    tearDown(() {
      container.dispose();
    });

    void expectOpen() {
      final MobileKeyboardMetricsState metrics = container.read(
        mobileKeyboardMetricsProvider,
      );
      final BottomInputSlotState slot = container.read(bottomInputSlotProvider);
      expect(metrics.liveKeyboardHeight, _kOpenHeight);
      expect(slot.slotHeight, _kOpenHeight);
    }

    void expectClosed() {
      final MobileKeyboardMetricsState metrics = container.read(
        mobileKeyboardMetricsProvider,
      );
      final BottomInputSlotState slot = container.read(bottomInputSlotProvider);
      expect(metrics.liveKeyboardHeight, 0);
      expect(slot.slotHeight, 0);
      expect(metrics.unmeasuredKeyboardReserved, isFalse);
    }

    void openInOrder() {
      notifier
        ..debugApplyNativeMetrics(
          keyboardHeight: _kNativeGross,
          isKeyboardVisible: true,
          nativeSafeAreaBottom: _kNativeSafe,
        )
        ..syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
    }

    void closeInOrder() {
      notifier
        ..syncViewInsets(0, safeAreaBottom: 0)
        ..debugApplyNativeMetrics(
          keyboardHeight: 0,
          isKeyboardVisible: false,
          nativeSafeAreaBottom: _kNativeSafe,
        );
    }

    void closeOutOfOrder() {
      notifier
        ..syncViewInsets(0, safeAreaBottom: 0)
        ..debugApplyNativeMetrics(
          keyboardHeight: _kNativeGross,
          isKeyboardVisible: true,
          nativeSafeAreaBottom: _kNativeSafe,
        )
        ..debugApplyNativeMetrics(
          keyboardHeight: 0,
          isKeyboardVisible: false,
          nativeSafeAreaBottom: _kNativeSafe,
        );
    }

    test('in-order spam settles at 0 or 302 every toggle', () {
      for (int i = 0; i < 8; i++) {
        openInOrder();
        expectOpen();
        closeInOrder();
        expectClosed();
      }
    });

    test('out-of-order close spam ends at zero slot height', () {
      for (int i = 0; i < 8; i++) {
        openInOrder();
        expectOpen();
        closeOutOfOrder();
        expectClosed();
      }
    });

    test('stale visible native after reset is ignored until inset returns', () {
      for (int i = 0; i < 4; i++) {
        openInOrder();
        closeInOrder();
      }
      notifier.resetTransientLayoutState();
      expectClosed();

      notifier.debugApplyNativeMetrics(
        keyboardHeight: _kNativeGross,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: _kNativeSafe,
      );
      expectClosed();

      notifier.syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        _kOpenHeight,
      );
    });

    test('channel switch mid-spam uses new keyboard height', () {
      for (int i = 0; i < 4; i++) {
        openInOrder();
        closeInOrder();
      }
      notifier.resetTransientLayoutState();
      container
          .read(bottomInputSlotProvider.notifier)
          .resetAfterChannelChange();
      expectClosed();

      notifier.debugApplyNativeMetrics(
        keyboardHeight: _kNativeGross,
        isKeyboardVisible: true,
        nativeSafeAreaBottom: _kNativeSafe,
      );
      expectClosed();

      const double newHeight = 280;
      notifier
        ..debugApplyNativeMetrics(
          keyboardHeight: newHeight + _kNativeSafe,
          isKeyboardVisible: true,
          nativeSafeAreaBottom: _kNativeSafe,
        )
        ..syncViewInsets(newHeight, safeAreaBottom: 0);
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        newHeight,
      );
      expect(container.read(bottomInputSlotProvider).slotHeight, newHeight);
    });

    test('android back clears reservation while composer focused', () {
      fakeAsync((FakeAsync async) {
        final ProviderContainer focused = _openFocusedKeyboard();
        try {
          focused
              .read(mobileKeyboardMetricsProvider.notifier)
              .reserveUnmeasuredKeyboard();
          _hideKeyboard(focused);

          expect(
            focused
                .read(mobileKeyboardMetricsProvider)
                .unmeasuredKeyboardReserved,
            isFalse,
          );
          expect(focused.read(bottomInputSlotProvider).slotHeight, 0);
          expect(_liveHeight(focused), 0);
        } finally {
          focused.dispose();
        }
      });
    });

    test('back without a close animation drops the composer at once', () {
      fakeAsync((FakeAsync async) {
        final ProviderContainer focused = _openFocusedKeyboard();
        try {
          focused.read(mobileKeyboardMetricsProvider.notifier)
            ..debugApplyNativeMetrics(
              keyboardHeight: 0,
              isKeyboardVisible: false,
              nativeSafeAreaBottom: _kNativeSafe,
            )
            ..syncViewInsets(0, safeAreaBottom: 0);

          expect(_liveHeight(focused), 0);
          expect(focused.read(bottomInputSlotProvider).slotHeight, 0);
        } finally {
          focused.dispose();
        }
      });
    });

    test('android open follows the inset animation, not the native frame', () {
      final ProviderContainer focused = _openFocusedKeyboard();
      try {
        _hideKeyboard(focused);
        final MobileKeyboardMetrics metrics =
            focused.read(mobileKeyboardMetricsProvider.notifier)
              ..debugApplyNativeMetrics(
                keyboardHeight: _kNativeGross,
                isKeyboardVisible: true,
                nativeSafeAreaBottom: _kNativeSafe,
              );
        expect(_liveHeight(focused), 0);

        metrics.syncViewInsets(40, safeAreaBottom: 0);
        expect(_liveHeight(focused), 40);
        metrics.syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
        expect(_liveHeight(focused), _kOpenHeight);
      } finally {
        focused.dispose();
      }
    });

    test('losing focus clears a held keyboard immediately', () {
      fakeAsync((FakeAsync async) {
        var focused = true;
        final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator()
          ..register(
            requestFocus: () {},
            readText: () => '',
            hasFocus: () => focused,
          );
        final ProviderContainer container =
            ProviderContainer(
              overrides: [
                composerFocusCoordinatorProvider.overrideWith(
                  (Ref ref) => coordinator,
                ),
              ],
            )..listen(
              mobileKeyboardMetricsProvider,
              (_, _) {},
              fireImmediately: true,
            );
        final MobileKeyboardMetrics notifier =
            container.read(mobileKeyboardMetricsProvider.notifier)
              ..updateLayout(screenHeight: 800, isPortrait: true, isIos: false)
              ..debugApplyNativeMetrics(
                keyboardHeight: _kNativeGross,
                isKeyboardVisible: true,
                nativeSafeAreaBottom: _kNativeSafe,
              )
              ..syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
        _dropViewInsetsOnly(container);
        expect(
          container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
          _kOpenHeight,
        );
        focused = false;
        notifier.onComposerEntryFocusLost();
        expect(
          container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
          0,
        );
        async.elapse(kFocusedKeyboardDismissHold);
        expect(
          container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
          0,
        );
        container.dispose();
      });
    });

    test('focused unmeasured reservation clears after one grace period', () {
      fakeAsync((FakeAsync async) {
        final ComposerFocusCoordinator coordinator = ComposerFocusCoordinator()
          ..register(
            requestFocus: () {},
            readText: () => '',
            hasFocus: () => true,
          );
        final ProviderContainer focused =
            ProviderContainer(
              overrides: [
                composerFocusCoordinatorProvider.overrideWith(
                  (Ref ref) => coordinator,
                ),
              ],
            )..listen(
              mobileKeyboardMetricsProvider,
              (_, _) {},
              fireImmediately: true,
            );
        focused.read(mobileKeyboardMetricsProvider.notifier)
          ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
          ..reserveUnmeasuredKeyboard();
        expect(
          focused
              .read(mobileKeyboardMetricsProvider)
              .unmeasuredKeyboardReserved,
          isTrue,
        );
        async.elapse(kUnmeasuredKeyboardReservationTimeout);
        expect(
          focused
              .read(mobileKeyboardMetricsProvider)
              .unmeasuredKeyboardReserved,
          isTrue,
        );
        async.elapse(kUnmeasuredKeyboardReservationTimeout);
        expect(
          focused
              .read(mobileKeyboardMetricsProvider)
              .unmeasuredKeyboardReserved,
          isFalse,
        );
        focused.dispose();
      });
    });

    test('focused composer keeps height through a one-sample inset drop', () {
      fakeAsync((FakeAsync async) {
        final ProviderContainer focused = _openFocusedKeyboard();
        try {
          _dropViewInsetsOnly(focused);

          expect(
            focused.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
            _kOpenHeight,
          );
          expect(
            focused.read(bottomInputSlotProvider).slotHeight,
            _kOpenHeight,
          );

          focused.read(mobileKeyboardMetricsProvider.notifier)
            ..debugApplyNativeMetrics(
              keyboardHeight: _kNativeGross,
              isKeyboardVisible: true,
              nativeSafeAreaBottom: _kNativeSafe,
            )
            ..syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
          async.elapse(kFocusedKeyboardDismissHold);
          expect(
            focused.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
            _kOpenHeight,
          );
          expect(
            focused.read(bottomInputSlotProvider).slotHeight,
            _kOpenHeight,
          );
        } finally {
          focused.dispose();
        }
      });
    });

    test('ios open keeps native-visible height until inset arrives', () {
      notifier
        ..updateLayout(screenHeight: 800, isPortrait: true, isIos: true)
        ..debugApplyNativeMetrics(
          keyboardHeight: _kNativeGross,
          isKeyboardVisible: true,
          nativeSafeAreaBottom: _kNativeSafe,
        )
        ..syncViewInsets(0, safeAreaBottom: 0)
        ..reserveUnmeasuredKeyboard();
      expect(
        container.read(mobileKeyboardMetricsProvider).liveKeyboardHeight,
        greaterThan(0),
      );

      notifier.syncViewInsets(_kOpenHeight, safeAreaBottom: 0);
      expectOpen();
    });
  });

  group('resolveKeyboardSpacerRawHeight', () {
    test('uses inset only when keyboard layout is inactive', () {
      expect(
        resolveKeyboardSpacerRawHeight(
          viewInsetBottom: 0,
          slotHeight: 302,
          keyboardLayoutActive: false,
        ),
        0,
      );
      expect(
        resolveKeyboardSpacerRawHeight(
          viewInsetBottom: 120,
          slotHeight: 302,
          keyboardLayoutActive: false,
        ),
        120,
      );
    });

    test('maxes inset and slot while keyboard layout is active', () {
      expect(
        resolveKeyboardSpacerRawHeight(
          viewInsetBottom: 0,
          slotHeight: 302,
          keyboardLayoutActive: true,
        ),
        302,
      );
    });

    test('drops the slot by an inset shrink the provider has not seen', () {
      expect(
        resolveKeyboardSpacerRawHeight(
          viewInsetBottom: 270,
          slotHeight: 336,
          keyboardLayoutActive: true,
          syncedViewInsetBottom: 336,
        ),
        270,
      );
      expect(
        resolveKeyboardSpacerRawHeight(
          viewInsetBottom: 250,
          slotHeight: 336,
          keyboardLayoutActive: true,
          syncedViewInsetBottom: 300,
        ),
        286,
      );
      expect(
        resolveKeyboardSpacerRawHeight(
          viewInsetBottom: 0,
          slotHeight: 336,
          keyboardLayoutActive: true,
          syncedViewInsetBottom: 302,
        ),
        336,
      );
    });
  });
}
