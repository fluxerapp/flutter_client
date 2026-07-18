import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_keyboard_insets/smart_keyboard_insets.dart';

part 'mobile_keyboard_metrics_provider.g.dart';

const String _kPortraitAnchorHeightKey =
    'mobile_keyboard_anchor_height_portrait';
const String _kLandscapeAnchorHeightKey =
    'mobile_keyboard_anchor_height_landscape';

class MobileKeyboardMetricsState {
  const MobileKeyboardMetricsState({
    required this.liveKeyboardHeight,
    required this.isKeyboardVisible,
    required this.safeAreaBottom,
    required this.fallbackKeyboardHeight,
    required this.isPortrait,
    this.anchoredKeyboardHeight,
  });

  final double liveKeyboardHeight;
  final bool isKeyboardVisible;
  final double safeAreaBottom;
  final double? anchoredKeyboardHeight;
  final double fallbackKeyboardHeight;
  final bool isPortrait;

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

  @override
  MobileKeyboardMetricsState build() {
    ref.onDispose(_disposeListeners);
    _nativeKeyboardHeight = 0;
    _viewInsetsKeyboardHeight = 0;
    _nativeSafeAreaBottom = 0;
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
    state = state.copyWith(anchoredKeyboardHeight: stored);
  }

  double? _readStoredAnchor(SharedPreferences preferences, bool isPortrait) {
    final String key = isPortrait
        ? _kPortraitAnchorHeightKey
        : _kLandscapeAnchorHeightKey;
    final double stored = preferences.getDouble(key) ?? 0;
    if (stored <= 0) {
      return null;
    }
    return stored;
  }

  void _attachMetricsListener() {
    if (kIsWeb || !(Platform.isIOS || Platform.isAndroid)) {
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
    _nativeKeyboardHeight = metrics.isKeyboardVisible
        ? metrics.keyboardHeight
        : 0;
    // Keep the paired native safeArea for IME normalization; do not write it
    // into state (MediaQuery.padding is the slot-netting source when needed).
    _nativeSafeAreaBottom = metrics.safeAreaBottom;
    _commitMergedHeights();
  }

  void syncViewInsets(double bottomInset, {double? safeAreaBottom}) {
    _viewInsetsKeyboardHeight = bottomInset > 0 ? bottomInset : 0;
    _commitMergedHeights(safeAreaBottom: safeAreaBottom);
  }

  /// Test entry: apply a native-style sample without the platform plugin.
  @visibleForTesting
  void debugApplyNativeMetrics({
    required double keyboardHeight,
    required bool isKeyboardVisible,
    double nativeSafeAreaBottom = 0,
  }) {
    _nativeKeyboardHeight = isKeyboardVisible ? keyboardHeight : 0;
    _nativeSafeAreaBottom = nativeSafeAreaBottom;
    _commitMergedHeights();
  }

  void _commitMergedHeights({double? safeAreaBottom}) {
    if (!ref.mounted) {
      return;
    }
    // Android native height includes systemBars; normalize to IME-only before
    // max-merge with Flutter viewInsets.bottom.
    final double nativeImeOnly = resolveNativeImeOnlyHeight(
      nativeKeyboardHeight: _nativeKeyboardHeight,
      nativeSafeAreaBottom: _nativeSafeAreaBottom,
    );
    final double mergedHeight = resolveDualSourceLiveKeyboardHeight(
      nativeHeight: nativeImeOnly,
      viewInsetsHeight: _viewInsetsKeyboardHeight,
    );
    final bool nextVisible = mergedHeight > 0;
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
      return;
    }
    final double? previousAnchored = state.anchoredKeyboardHeight;
    final double resolvedAnchored = resolveNextAnchoredKeyboardHeight(
      currentAnchored: previousAnchored,
      nextHeight: mergedHeight,
      nextVisible: nextVisible,
    );
    final double? nextAnchored = resolvedAnchored > 0
        ? resolvedAnchored
        : previousAnchored;
    state = state.copyWith(
      liveKeyboardHeight: mergedHeight,
      isKeyboardVisible: nextVisible,
      safeAreaBottom: resolvedSafeAreaBottom,
      anchoredKeyboardHeight: nextAnchored,
    );
    if (nextAnchored != null &&
        (previousAnchored == null || nextAnchored > previousAnchored)) {
      _schedulePersistAnchor(nextAnchored);
    }
  }

  void captureKeyboardAnchor(double height) {
    if (!ref.mounted || height <= 0) {
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
    final double? stored = state.anchoredKeyboardHeight;
    if (!shouldPersistKeyboardAnchor(
      storedHeight: stored ?? 0,
      nextHeight: height,
    )) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String key = state.isPortrait
        ? _kPortraitAnchorHeightKey
        : _kLandscapeAnchorHeightKey;
    await preferences.setDouble(key, height);
    if (!ref.mounted) {
      return;
    }
    state = state.copyWith(anchoredKeyboardHeight: height);
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
    state = state.copyWith(
      fallbackKeyboardHeight: fallback,
      isPortrait: isPortrait,
    );
    if (state.anchoredKeyboardHeight == null) {
      unawaited(_loadPersistedAnchor());
    }
  }
}
