import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_keyboard_insets/smart_keyboard_insets.dart';

part 'mobile_keyboard_metrics_provider.g.dart';

const String _kPortraitAnchorHeightKey =
    'mobile_keyboard_anchor_height_portrait';
const String _kLandscapeAnchorHeightKey =
    'mobile_keyboard_anchor_height_landscape';

const Duration kUnmeasuredKeyboardReservationTimeout = Duration(
  milliseconds: 400,
);

const Duration kFocusedKeyboardDismissHold = Duration(milliseconds: 200);

class MobileKeyboardMetricsState {
  const MobileKeyboardMetricsState({
    required this.liveKeyboardHeight,
    required this.isKeyboardVisible,
    required this.safeAreaBottom,
    required this.fallbackKeyboardHeight,
    required this.isPortrait,
    this.anchoredKeyboardHeight,
    this.unmeasuredKeyboardReserved = false,
    this.viewInsetsKeyboardHeight = 0,
  });

  final double liveKeyboardHeight;
  final bool isKeyboardVisible;
  final double safeAreaBottom;
  final double? anchoredKeyboardHeight;
  final double fallbackKeyboardHeight;
  final bool isPortrait;
  final bool unmeasuredKeyboardReserved;
  final double viewInsetsKeyboardHeight;

  double resolveAnchorHeight() => inlineExpressionPanelAnchorHeight(
    anchoredKeyboardHeight: anchoredKeyboardHeight,
    fallbackHeight: fallbackKeyboardHeight,
  );

  MobileKeyboardMetricsState copyWith({
    double? liveKeyboardHeight,
    bool? isKeyboardVisible,
    double? safeAreaBottom,
    double? anchoredKeyboardHeight,
    bool clearAnchoredKeyboardHeight = false,
    double? fallbackKeyboardHeight,
    bool? isPortrait,
    bool? unmeasuredKeyboardReserved,
    double? viewInsetsKeyboardHeight,
  }) {
    return MobileKeyboardMetricsState(
      liveKeyboardHeight: liveKeyboardHeight ?? this.liveKeyboardHeight,
      isKeyboardVisible: isKeyboardVisible ?? this.isKeyboardVisible,
      safeAreaBottom: safeAreaBottom ?? this.safeAreaBottom,
      anchoredKeyboardHeight: clearAnchoredKeyboardHeight
          ? null
          : (anchoredKeyboardHeight ?? this.anchoredKeyboardHeight),
      fallbackKeyboardHeight:
          fallbackKeyboardHeight ?? this.fallbackKeyboardHeight,
      isPortrait: isPortrait ?? this.isPortrait,
      unmeasuredKeyboardReserved:
          unmeasuredKeyboardReserved ?? this.unmeasuredKeyboardReserved,
      viewInsetsKeyboardHeight:
          viewInsetsKeyboardHeight ?? this.viewInsetsKeyboardHeight,
    );
  }
}

@Riverpod()
class MobileKeyboardMetrics extends _$MobileKeyboardMetrics {
  StreamSubscription<KeyboardMetrics>? _metricsSubscription;
  VoidCallback? _metricsNotifierListener;
  Timer? _persistDebounce;
  double _pendingPersistHeight = 0;

  double _nativeKeyboardHeight = 0;
  bool _nativeKeyboardVisible = false;

  double _viewInsetsKeyboardHeight = 0;

  double _nativeSafeAreaBottom = 0;

  bool _hadKeyboardInsetWhileReserved = false;
  bool _sawViewInsets = false;
  bool _preferNativeIme = false;
  double _sessionPeak = 0;
  double _lastPersistedAnchor = 0;
  Timer? _unmeasuredReservationTimer;
  Timer? _shortInsetTimer;
  Timer? _focusedDismissTimer;
  bool _focusedDismissPending = false;
  int _unmeasuredReservationExtensions = 0;
  bool _acceptVisibleNativeSamples = true;
  bool _isIos = defaultTargetPlatform == TargetPlatform.iOS;

  @override
  MobileKeyboardMetricsState build() {
    ref.onDispose(_disposeListeners);
    _nativeKeyboardHeight = 0;
    _nativeKeyboardVisible = false;
    _viewInsetsKeyboardHeight = 0;
    _nativeSafeAreaBottom = 0;
    _hadKeyboardInsetWhileReserved = false;
    const MobileKeyboardMetricsState initialState = MobileKeyboardMetricsState(
      liveKeyboardHeight: 0,
      isKeyboardVisible: false,
      safeAreaBottom: 0,
      fallbackKeyboardHeight: kIosFallbackKeyboardHeight,
      isPortrait: true,
    );
    unawaited(
      Future.microtask(() {
        if (!ref.mounted) {
          return;
        }
        unawaited(_loadPersistedAnchor());
        _attachMetricsListener();
      }),
    );
    return initialState;
  }

  void _disposeListeners() {
    unawaited(_metricsSubscription?.cancel());
    _metricsSubscription = null;
    if (_metricsNotifierListener != null) {
      SmartKeyboardInsets.instance.metricsNotifier.removeListener(
        _metricsNotifierListener!,
      );
      _metricsNotifierListener = null;
    }
    _persistDebounce?.cancel();
    _unmeasuredReservationTimer?.cancel();
    _shortInsetTimer?.cancel();
    _cancelFocusedDismissHold();
  }

  Future<void> _loadPersistedAnchor() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (!ref.mounted) {
      return;
    }
    final bool isPortrait = state.isPortrait;
    final double? stored = _readStoredAnchor(preferences, isPortrait);
    if (!ref.mounted || stored == null) {
      return;
    }
    _lastPersistedAnchor = stored;
    state = state.copyWith(anchoredKeyboardHeight: stored);
  }

  double? _readStoredAnchor(SharedPreferences preferences, bool isPortrait) {
    final String key = isPortrait
        ? _kPortraitAnchorHeightKey
        : _kLandscapeAnchorHeightKey;
    final double stored = preferences.getDouble(key) ?? 0;
    if (!isImeKeyboardHeight(stored)) {
      return null;
    }
    return stored;
  }

  void _attachMetricsListener() {
    if (!(Platform.isIOS || Platform.isAndroid)) {
      return;
    }
    unawaited(_metricsSubscription?.cancel());
    _metricsSubscription = SmartKeyboardInsets.instance.metricsStream.listen(
      _applyNativeMetrics,
    );
    _metricsNotifierListener ??= () {
      _applyNativeMetrics(SmartKeyboardInsets.instance.metricsNotifier.value);
    };
    SmartKeyboardInsets.instance.metricsNotifier.addListener(
      _metricsNotifierListener!,
    );
    unawaited(
      SmartKeyboardInsets.instance.getCurrentMetrics().then((
        KeyboardMetrics metrics,
      ) {
        if (!ref.mounted) {
          return;
        }
        if (!metrics.isKeyboardVisible && metrics.keyboardHeight <= 0) {
          return;
        }
        _applyNativeMetrics(metrics);
      }),
    );
  }

  void _applyNativeMetrics(KeyboardMetrics metrics) {
    _setNativeKeyboardHeight(
      metrics.keyboardHeight,
      visible: metrics.isKeyboardVisible,
    );
    _nativeSafeAreaBottom = metrics.safeAreaBottom;
    _commitMergedHeights();
  }

  void syncViewInsets(double bottomInset, {double? safeAreaBottom}) {
    _viewInsetsKeyboardHeight = bottomInset > 0 ? bottomInset : 0;
    if (_viewInsetsKeyboardHeight > 0) {
      _sawViewInsets = true;
      _acceptVisibleNativeSamples = true;
    }
    _commitMergedHeights(safeAreaBottom: safeAreaBottom);
  }

  @visibleForTesting
  void debugApplyNativeMetrics({
    required double keyboardHeight,
    required bool isKeyboardVisible,
    double nativeSafeAreaBottom = 0,
  }) {
    _setNativeKeyboardHeight(keyboardHeight, visible: isKeyboardVisible);
    _nativeSafeAreaBottom = nativeSafeAreaBottom;
    _commitMergedHeights();
  }

  void _commitMergedHeights({double? safeAreaBottom}) {
    if (!ref.mounted) {
      return;
    }
    final double nativeImeOnly = resolveNativeImeOnlyHeight(
      nativeKeyboardHeight: _nativeKeyboardHeight,
      nativeSafeAreaBottom: _nativeSafeAreaBottom,
    );
    final double nativeHeightForMerge = _viewInsetsKeyboardHeight > 0
        ? _nativeKeyboardHeight
        : nativeImeOnly;
    final double mergedFromSources = resolveDualSourceLiveKeyboardHeight(
      nativeHeight: nativeHeightForMerge,
      viewInsetsHeight: _viewInsetsKeyboardHeight,
    );
    double mergedHeight = _preferNativeIme && nativeImeOnly > mergedFromSources
        ? nativeImeOnly
        : mergedFromSources;
    if (_viewInsetsKeyboardHeight <= 0 && !_nativeKeyboardHoldsOpen) {
      mergedHeight = 0;
    }
    final bool composerEntryFocused = ref
        .read(composerFocusCoordinatorProvider)
        .composerHasFocus();
    if (_shouldHoldFocusedDismiss(
      mergedHeight: mergedHeight,
      composerEntryFocused: composerEntryFocused,
    )) {
      _armFocusedDismissHold();
      mergedHeight = state.liveKeyboardHeight;
    } else if (!_focusedDismissPending) {
      _cancelFocusedDismissHold();
    }
    final double anchorSample = _preferNativeIme && nativeImeOnly > 0
        ? nativeImeOnly
        : (_viewInsetsKeyboardHeight > 0
              ? _viewInsetsKeyboardHeight
              : nativeImeOnly);
    final bool nextVisible = mergedHeight > 0;
    if (state.unmeasuredKeyboardReserved &&
        (nativeImeOnly > 0 || _viewInsetsKeyboardHeight > 0)) {
      _hadKeyboardInsetWhileReserved = true;
    }
    final bool clearUnmeasuredReservation =
        shouldClearUnmeasuredKeyboardReservation(
          unmeasuredKeyboardReserved: state.unmeasuredKeyboardReserved,
          previousLiveHeight: state.liveKeyboardHeight,
          mergedHeight: mergedHeight,
          hadKeyboardInsetWhileReserved: _hadKeyboardInsetWhileReserved,
          composerEntryFocused: composerEntryFocused,
          nativeKeyboardVisible: _nativeKeyboardHoldsOpen,
        );
    if (clearUnmeasuredReservation) {
      _unmeasuredReservationTimer?.cancel();
      _unmeasuredReservationTimer = null;
    }
    final bool shouldEmit = shouldEmitKeyboardHeightUpdate(
      previousHeight: state.liveKeyboardHeight,
      nextHeight: mergedHeight,
      previousVisible: state.isKeyboardVisible,
      nextVisible: nextVisible,
    );
    final double resolvedSafeAreaBottom =
        safeAreaBottom ?? state.safeAreaBottom;
    if (!shouldEmit) {
      if (_viewInsetsKeyboardHeight != state.viewInsetsKeyboardHeight) {
        state = state.copyWith(
          viewInsetsKeyboardHeight: _viewInsetsKeyboardHeight,
        );
      }
      if (safeAreaBottom != null && safeAreaBottom != state.safeAreaBottom) {
        state = state.copyWith(safeAreaBottom: safeAreaBottom);
      }
      if (clearUnmeasuredReservation && state.unmeasuredKeyboardReserved) {
        state = state.copyWith(unmeasuredKeyboardReserved: false);
      }
      _applyAnchorSample(anchorSample, nextVisible: nextVisible);
      _syncShortInsetCorrection(nativeImeOnly);
      return;
    }
    final double? previousAnchored = state.anchoredKeyboardHeight;
    final double? nextAnchored = _anchorForSample(
      anchorSample,
      nextVisible: nextVisible,
    );
    state = state.copyWith(
      liveKeyboardHeight: mergedHeight,
      isKeyboardVisible: nextVisible,
      safeAreaBottom: resolvedSafeAreaBottom,
      anchoredKeyboardHeight: nextAnchored,
      unmeasuredKeyboardReserved:
          !clearUnmeasuredReservation && state.unmeasuredKeyboardReserved,
      viewInsetsKeyboardHeight: _viewInsetsKeyboardHeight,
    );
    if (nextAnchored != null && nextAnchored != previousAnchored) {
      _schedulePersistAnchor(nextAnchored);
    }
    _syncShortInsetCorrection(nativeImeOnly);
  }

  bool _shouldHoldFocusedDismiss({
    required double mergedHeight,
    required bool composerEntryFocused,
  }) {
    if (mergedHeight > 0 || _focusedDismissPending || !composerEntryFocused) {
      return false;
    }
    if (!isImeKeyboardHeight(state.liveKeyboardHeight)) {
      return false;
    }
    return _viewInsetsKeyboardHeight <= 0 &&
        _nativeKeyboardVisible &&
        !_nativeKeyboardHoldsOpen;
  }

  bool get _nativeKeyboardHoldsOpen =>
      _isIos && _nativeKeyboardVisible && !_sawViewInsets;

  void _armFocusedDismissHold() {
    if (_focusedDismissTimer != null) {
      return;
    }
    _focusedDismissTimer = Timer(kFocusedKeyboardDismissHold, () {
      _focusedDismissTimer = null;
      if (!ref.mounted) {
        return;
      }
      if (_viewInsetsKeyboardHeight > 0 || _nativeKeyboardHoldsOpen) {
        _focusedDismissPending = false;
        return;
      }
      _focusedDismissPending = true;
      _commitMergedHeights();
      _focusedDismissPending = false;
    });
  }

  void _cancelFocusedDismissHold() {
    _focusedDismissTimer?.cancel();
    _focusedDismissTimer = null;
    _focusedDismissPending = false;
  }

  void onComposerEntryFocusLost() {
    _cancelFocusedDismissHold();
    if (!ref.mounted) {
      return;
    }
    if (_viewInsetsKeyboardHeight <= 0 && !_nativeKeyboardHoldsOpen) {
      _commitMergedHeights();
    }
  }

  double? _anchorForSample(double anchorSample, {required bool nextVisible}) {
    if (nextVisible && isImeKeyboardHeight(anchorSample)) {
      _sessionPeak = math.max(_sessionPeak, anchorSample);
    }
    if (!nextVisible && _sessionPeak > 0) {
      final double peak = _sessionPeak;
      _sessionPeak = 0;
      return peak;
    }
    final double stored = state.anchoredKeyboardHeight ?? 0;
    if (_sessionPeak > stored) {
      return _sessionPeak;
    }
    return state.anchoredKeyboardHeight;
  }

  void _applyAnchorSample(double anchorSample, {required bool nextVisible}) {
    final double? previous = state.anchoredKeyboardHeight;
    final double? next = _anchorForSample(
      anchorSample,
      nextVisible: nextVisible,
    );
    if (next == null || next == previous) {
      return;
    }
    state = state.copyWith(anchoredKeyboardHeight: next);
    _schedulePersistAnchor(next);
  }

  void _setNativeKeyboardHeight(double height, {required bool visible}) {
    if (visible &&
        height > 0 &&
        !_acceptVisibleNativeSamples &&
        _viewInsetsKeyboardHeight <= 0) {
      return;
    }
    _nativeKeyboardVisible = visible && height > 0;
    if (!visible || height <= 0) {
      _nativeKeyboardHeight = 0;
      if (_viewInsetsKeyboardHeight <= 0) {
        _sawViewInsets = false;
      }
      return;
    }
    _nativeKeyboardHeight = height;
  }

  void _syncShortInsetCorrection(double nativeIme) {
    final bool shortInset =
        _viewInsetsKeyboardHeight > 0 &&
        nativeIme > _viewInsetsKeyboardHeight + kShortKeyboardInsetGap;
    if (!shortInset) {
      _shortInsetTimer?.cancel();
      _shortInsetTimer = null;
      if (!_preferNativeIme) {
        return;
      }
      _preferNativeIme = false;
      _commitMergedHeights();
      return;
    }
    if (_preferNativeIme) {
      return;
    }
    _shortInsetTimer ??= Timer(kUnmeasuredKeyboardReservationTimeout, () {
      _shortInsetTimer = null;
      if (!ref.mounted || _viewInsetsKeyboardHeight <= 0) {
        return;
      }
      final double ime = resolveNativeImeOnlyHeight(
        nativeKeyboardHeight: _nativeKeyboardHeight,
        nativeSafeAreaBottom: _nativeSafeAreaBottom,
      );
      if (ime <= _viewInsetsKeyboardHeight + kShortKeyboardInsetGap) {
        return;
      }
      _preferNativeIme = true;
      _commitMergedHeights();
    });
  }

  void reserveUnmeasuredKeyboard() {
    if (!_isIos || !ref.mounted || state.liveKeyboardHeight > 0) {
      return;
    }
    if (state.unmeasuredKeyboardReserved) {
      return;
    }
    _hadKeyboardInsetWhileReserved = false;
    _unmeasuredReservationExtensions = 0;
    state = state.copyWith(unmeasuredKeyboardReserved: true);
    _armUnmeasuredReservationTimeout();
  }

  void _armUnmeasuredReservationTimeout() {
    _unmeasuredReservationTimer?.cancel();
    _unmeasuredReservationTimer = Timer(
      kUnmeasuredKeyboardReservationTimeout,
      () {
        if (!ref.mounted || !state.unmeasuredKeyboardReserved) {
          return;
        }
        if (state.liveKeyboardHeight > 0) {
          return;
        }
        if (ref.read(composerFocusCoordinatorProvider).composerHasFocus()) {
          if (_unmeasuredReservationExtensions >= 1) {
            clearUnmeasuredKeyboardReservation();
            return;
          }
          _unmeasuredReservationExtensions++;
          _armUnmeasuredReservationTimeout();
          return;
        }
        clearUnmeasuredKeyboardReservation();
      },
    );
  }

  void clearUnmeasuredKeyboardReservation() {
    _unmeasuredReservationTimer?.cancel();
    _unmeasuredReservationTimer = null;
    _unmeasuredReservationExtensions = 0;
    if (!ref.mounted || !state.unmeasuredKeyboardReserved) {
      return;
    }
    _hadKeyboardInsetWhileReserved = false;
    state = state.copyWith(unmeasuredKeyboardReserved: false);
  }

  void resetTransientLayoutState({bool preserveFocusedKeyboard = false}) {
    _cancelFocusedDismissHold();
    _unmeasuredReservationTimer?.cancel();
    _unmeasuredReservationTimer = null;
    _shortInsetTimer?.cancel();
    _shortInsetTimer = null;
    _hadKeyboardInsetWhileReserved = false;
    _unmeasuredReservationExtensions = 0;
    if (!ref.mounted) {
      return;
    }
    final bool keepOpenHeight =
        preserveFocusedKeyboard &&
        ref.read(composerFocusCoordinatorProvider).composerHasFocus() &&
        isImeKeyboardHeight(state.liveKeyboardHeight);
    if (keepOpenHeight) {
      state = state.copyWith(unmeasuredKeyboardReserved: false);
      return;
    }
    _preferNativeIme = false;
    _sessionPeak = 0;
    _viewInsetsKeyboardHeight = 0;
    _nativeKeyboardHeight = 0;
    _nativeKeyboardVisible = false;
    _sawViewInsets = false;
    _acceptVisibleNativeSamples = false;
    state = state.copyWith(
      unmeasuredKeyboardReserved: false,
      liveKeyboardHeight: 0,
      isKeyboardVisible: false,
      viewInsetsKeyboardHeight: 0,
    );
    _commitMergedHeights();
  }

  void captureKeyboardAnchor(double height) {
    if (!ref.mounted || !isImeKeyboardHeight(height)) {
      return;
    }
    final double next = math.max(height, state.anchoredKeyboardHeight ?? 0);
    if (next == state.anchoredKeyboardHeight) {
      return;
    }
    state = state.copyWith(anchoredKeyboardHeight: next);
    _schedulePersistAnchor(next);
  }

  void _schedulePersistAnchor(double height) {
    _pendingPersistHeight = height;
    _persistDebounce?.cancel();
    _persistDebounce = Timer(const Duration(milliseconds: 300), () {
      unawaited(_persistAnchorIfNeeded(_pendingPersistHeight));
    });
  }

  Future<void> _persistAnchorIfNeeded(double height) async {
    if (!shouldPersistKeyboardAnchor(
      storedHeight: _lastPersistedAnchor,
      nextHeight: height,
    )) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String key = state.isPortrait
        ? _kPortraitAnchorHeightKey
        : _kLandscapeAnchorHeightKey;
    await preferences.setDouble(key, height);
    _lastPersistedAnchor = height;
    if (!ref.mounted) {
      return;
    }
    if (state.anchoredKeyboardHeight != height) {
      state = state.copyWith(anchoredKeyboardHeight: height);
    }
  }

  void updateLayout({
    required double screenHeight,
    required bool isPortrait,
    required bool isIos,
  }) {
    _isIos = isIos;
    final double fallback = fallbackKeyboardHeightForScreen(
      screenHeight: screenHeight,
      isIos: isIos,
    );
    if (state.fallbackKeyboardHeight == fallback &&
        state.isPortrait == isPortrait) {
      return;
    }
    if (state.isPortrait != isPortrait) {
      _sessionPeak = 0;
    }
    state = state.copyWith(
      fallbackKeyboardHeight: fallback,
      isPortrait: isPortrait,
    );
    if (state.anchoredKeyboardHeight == null) {
      unawaited(_loadPersistedAnchor());
    }
  }
}
