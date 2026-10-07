import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
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

class MobileKeyboardMetricsState {
  const MobileKeyboardMetricsState({
    required this.liveKeyboardHeight,
    required this.isKeyboardVisible,
    required this.safeAreaBottom,
    required this.fallbackKeyboardHeight,
    required this.isPortrait,
    this.anchoredKeyboardHeight,
    this.unmeasuredKeyboardReserved = false,
  });

  final double liveKeyboardHeight;
  final bool isKeyboardVisible;
  final double safeAreaBottom;
  final double? anchoredKeyboardHeight;
  final double fallbackKeyboardHeight;
  final bool isPortrait;
  final bool unmeasuredKeyboardReserved;

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
    );
  }
}

@Riverpod()
class MobileKeyboardMetrics extends _$MobileKeyboardMetrics {
  StreamSubscription<KeyboardMetrics>? _metricsSubscription;
  VoidCallback? _metricsNotifierListener;
  Timer? _persistDebounce;
  double _pendingPersistHeight = 0;

  /// Last height reported by smart_keyboard_insets (0 when that source is hidden).
  double _nativeKeyboardHeight = 0;

  /// Last height reported by MediaQuery.viewInsets (0 when that source is hidden).
  double _viewInsetsKeyboardHeight = 0;

  /// Paired native systemBars inset for IME-only normalization.
  double _nativeSafeAreaBottom = 0;

  bool _hadKeyboardInsetWhileReserved = false;
  bool _sawViewInsets = false;
  bool _ignoreNativeUntilHidden = false;
  bool _preferNativeIme = false;
  double _sessionPeak = 0;
  double _lastPersistedAnchor = 0;
  Timer? _unmeasuredReservationTimer;
  Timer? _nativeOnlyTimer;
  Timer? _shortInsetTimer;

  @override
  MobileKeyboardMetricsState build() {
    ref.onDispose(_disposeListeners);
    _nativeKeyboardHeight = 0;
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
    _nativeOnlyTimer?.cancel();
    _shortInsetTimer?.cancel();
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
    // Skip hidden bootstrap: iOS getCurrentMetrics is always hidden, and a late
    // Future must not clobber live stream/viewInsets after focus.
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
    // Keep the paired native safeArea for IME normalization; do not write it
    // into state (MediaQuery.padding is the slot-netting source when needed).
    _nativeSafeAreaBottom = metrics.safeAreaBottom;
    _commitMergedHeights();
  }

  void syncViewInsets(double bottomInset, {double? safeAreaBottom}) {
    _viewInsetsKeyboardHeight = bottomInset > 0 ? bottomInset : 0;
    if (_viewInsetsKeyboardHeight > 0) {
      _sawViewInsets = true;
      _ignoreNativeUntilHidden = false;
    }
    _commitMergedHeights(safeAreaBottom: safeAreaBottom);
  }

  /// Test entry: apply a native-style sample without the platform plugin.
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
    // viewInsets when present, otherwise the raw native height.
    final double nativeImeOnly = resolveNativeImeOnlyHeight(
      nativeKeyboardHeight: _nativeKeyboardHeight,
      nativeSafeAreaBottom: _nativeSafeAreaBottom,
    );
    final double mergedFromSources = resolveDualSourceLiveKeyboardHeight(
      nativeHeight: _nativeKeyboardHeight,
      viewInsetsHeight: _viewInsetsKeyboardHeight,
    );
    final double mergedHeight =
        _preferNativeIme && nativeImeOnly > mergedFromSources
        ? nativeImeOnly
        : mergedFromSources;
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
      if (safeAreaBottom != null && safeAreaBottom != state.safeAreaBottom) {
        state = state.copyWith(safeAreaBottom: safeAreaBottom);
      }
      if (clearUnmeasuredReservation && state.unmeasuredKeyboardReserved) {
        state = state.copyWith(unmeasuredKeyboardReserved: false);
      }
      _applyAnchorSample(anchorSample, nextVisible: nextVisible);
      _syncNativeOnlyHold();
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
    );
    if (nextAnchored != null && nextAnchored != previousAnchored) {
      _schedulePersistAnchor(nextAnchored);
    }
    _syncNativeOnlyHold();
    _syncShortInsetCorrection(nativeImeOnly);
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
    if (!visible || height <= 0) {
      _ignoreNativeUntilHidden = false;
      _nativeKeyboardHeight = 0;
      if (_viewInsetsKeyboardHeight <= 0) {
        _sawViewInsets = false;
      }
      return;
    }
    if (_ignoreNativeUntilHidden) {
      _nativeKeyboardHeight = 0;
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

  void _syncNativeOnlyHold() {
    final bool nativeOnly =
        _sawViewInsets &&
        _viewInsetsKeyboardHeight <= 0 &&
        _nativeKeyboardHeight > 0;
    if (!nativeOnly) {
      _nativeOnlyTimer?.cancel();
      _nativeOnlyTimer = null;
      return;
    }
    _nativeOnlyTimer ??= Timer(kUnmeasuredKeyboardReservationTimeout, () {
      _nativeOnlyTimer = null;
      if (!ref.mounted || _viewInsetsKeyboardHeight > 0) {
        return;
      }
      _ignoreNativeUntilHidden = true;
      _nativeKeyboardHeight = 0;
      _commitMergedHeights();
    });
  }

  void reserveUnmeasuredKeyboard() {
    if (!ref.mounted || state.liveKeyboardHeight > 0) {
      return;
    }
    _ignoreNativeUntilHidden = false;
    if (state.unmeasuredKeyboardReserved) {
      return;
    }
    _hadKeyboardInsetWhileReserved = false;
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
        clearUnmeasuredKeyboardReservation();
      },
    );
  }

  void clearUnmeasuredKeyboardReservation() {
    _unmeasuredReservationTimer?.cancel();
    _unmeasuredReservationTimer = null;
    if (!ref.mounted || !state.unmeasuredKeyboardReserved) {
      return;
    }
    _hadKeyboardInsetWhileReserved = false;
    state = state.copyWith(unmeasuredKeyboardReserved: false);
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
