import 'dart:async';

import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_input_slot_provider.g.dart';

class BottomInputSlotState {
  const BottomInputSlotState({
    required this.mode,
    required this.transition,
    required this.lockedHeight,
    required this.panelHeight,
    required this.slotHeight,
  });

  final BottomInputMode mode;
  final BottomInputTransition transition;
  final double lockedHeight;
  final double panelHeight;
  final double slotHeight;
}

@Riverpod()
class BottomInputSlot extends _$BottomInputSlot {
  Timer? _transitionTimeout;

  @override
  BottomInputSlotState build() {
    ref
      ..listen<bool>(expressionPanelProvider, _onExpressionPanelChanged)
      ..listen<MobileKeyboardMetricsState>(
        mobileKeyboardMetricsProvider,
        _onKeyboardMetricsChanged,
      )
      ..listen<double?>(expressionPanelHeightProvider, _onPanelHeightChanged)
      ..onDispose(() => _transitionTimeout?.cancel());
    return _resolveState();
  }

  void _onExpressionPanelChanged(bool? previous, bool isPanelOpen) {
    if (isPanelOpen) {
      if (state.transition == BottomInputTransition.lockingToPanel) {
        return;
      }
      final MobileKeyboardMetricsState metrics = ref.read(
        mobileKeyboardMetricsProvider,
      );
      final double anchorHeight = metrics.resolveAnchorHeight();
      ref.read(expressionPanelHeightProvider.notifier).height = anchorHeight;
      state = _resolveState(
        mode: BottomInputMode.panelAnchored,
        panelHeight: anchorHeight,
      );
      return;
    }
    if (state.transition == BottomInputTransition.lockingToKeyboard) {
      return;
    }
    ref.read(expressionPanelHeightProvider.notifier).clear();
    state = _resolveState(mode: BottomInputMode.none, panelHeight: 0);
  }

  void _onKeyboardMetricsChanged(
    MobileKeyboardMetricsState? previous,
    MobileKeyboardMetricsState next,
  ) {
    if (state.transition == BottomInputTransition.lockingToPanel &&
        hasKeyboardFullyDismissed(
          liveKeyboardHeight: next.liveKeyboardHeight,
          isKeyboardVisible: next.isKeyboardVisible,
        )) {
      _endTransition(BottomInputMode.panelAnchored);
      return;
    }
    if (state.transition == BottomInputTransition.lockingToKeyboard &&
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: next.liveKeyboardHeight,
          lockedNetHeight: state.lockedHeight,
          safeAreaBottom: 0,
          isKeyboardVisible: next.isKeyboardVisible,
        )) {
      _endTransition(BottomInputMode.keyboard);
      return;
    }
    if (state.transition != BottomInputTransition.idle) {
      return;
    }
    if (ref.read(expressionPanelProvider)) {
      return;
    }
    state = _resolveState(preserveTransition: true);
  }

  void _onPanelHeightChanged(double? previous, double? next) {
    if (next == null || state.transition != BottomInputTransition.idle) {
      return;
    }
    final double anchorHeight = ref
        .read(mobileKeyboardMetricsProvider)
        .resolveAnchorHeight();
    final BottomInputMode mode = next > anchorHeight + 1
        ? BottomInputMode.panelExpanded
        : BottomInputMode.panelAnchored;
    state = _resolveState(mode: mode, panelHeight: next);
  }

  void beginPanelTransition(double lockedHeight) {
    _transitionTimeout?.cancel();
    _transitionTimeout = Timer(const Duration(milliseconds: 400), () {
      if (!ref.mounted) {
        return;
      }
      if (state.transition == BottomInputTransition.lockingToPanel) {
        _endTransition(BottomInputMode.panelAnchored);
      }
    });
    final MobileKeyboardMetricsState metrics = ref.read(
      mobileKeyboardMetricsProvider,
    );
    final double grossLock = quantizeBottomInputHeight(
      resolveTransitionLockHeight(
        liveKeyboardHeight: lockedHeight,
        anchorHeight: metrics.resolveAnchorHeight(),
      ),
    );
    ref
        .read(mobileKeyboardMetricsProvider.notifier)
        .captureKeyboardAnchor(grossLock);
    ref.read(expressionPanelHeightProvider.notifier).height = grossLock;
    state = _resolveState(
      transition: BottomInputTransition.lockingToPanel,
      lockedHeight: grossLock,
      mode: BottomInputMode.panelAnchored,
      panelHeight: grossLock,
    );
  }

  void beginKeyboardTransition(double lockedHeight) {
    _transitionTimeout?.cancel();
    _transitionTimeout = Timer(const Duration(milliseconds: 400), () {
      if (!ref.mounted) {
        return;
      }
      if (state.transition == BottomInputTransition.lockingToKeyboard) {
        _endTransition(BottomInputMode.keyboard);
      }
    });
    final double quantizedLock = quantizeBottomInputHeight(lockedHeight);
    state = _resolveState(
      transition: BottomInputTransition.lockingToKeyboard,
      lockedHeight: quantizedLock,
      panelHeight: quantizedLock,
    );
  }

  void settlePanelHeight(double height) {
    final MobileKeyboardMetricsState metrics = ref.read(
      mobileKeyboardMetricsProvider,
    );
    final double anchorHeight = metrics.resolveAnchorHeight();
    final bool isExpanded = height > anchorHeight + 1;
    if (!isExpanded) {
      ref.read(expressionPanelHeightProvider.notifier).height = height;
    }
    final BottomInputMode mode = isExpanded
        ? BottomInputMode.panelExpanded
        : BottomInputMode.panelAnchored;
    state = _resolveState(mode: mode, panelHeight: anchorHeight);
  }

  void _endTransition(BottomInputMode mode) {
    _transitionTimeout?.cancel();
    state = _resolveState(
      transition: BottomInputTransition.idle,
      mode: mode,
      lockedHeight: 0,
    );
  }

  BottomInputSlotState _resolveState({
    BottomInputMode? mode,
    BottomInputTransition? transition,
    double? lockedHeight,
    double? panelHeight,
    bool preserveTransition = false,
  }) {
    final bool isPanelOpen = ref.read(expressionPanelProvider);
    final MobileKeyboardMetricsState metrics = ref.read(
      mobileKeyboardMetricsProvider,
    );
    final double? storedPanelHeight = ref.read(expressionPanelHeightProvider);
    final BottomInputTransition resolvedTransition =
        transition ??
        (preserveTransition ? state.transition : BottomInputTransition.idle);
    final double resolvedLockedHeight =
        lockedHeight ?? (preserveTransition ? state.lockedHeight : 0);
    final BottomInputMode resolvedMode =
        mode ??
        (isPanelOpen
            ? BottomInputMode.panelAnchored
            : (metrics.isKeyboardVisible
                  ? BottomInputMode.keyboard
                  : BottomInputMode.none));
    final double resolvedPanelHeight =
        panelHeight ??
        storedPanelHeight ??
        (isPanelOpen ? metrics.resolveAnchorHeight() : 0);
    final double slotHeight = resolveBottomInputSlotHeight(
      isPanelOpen: isPanelOpen,
      transition: resolvedTransition,
      lockedHeight: resolvedLockedHeight,
      anchorHeight: metrics.resolveAnchorHeight(),
      panelHeight: resolvedPanelHeight,
      liveKeyboardHeight: metrics.liveKeyboardHeight,
      isKeyboardVisible: metrics.isKeyboardVisible,
      safeAreaBottom: metrics.safeAreaBottom,
    );
    return BottomInputSlotState(
      mode: resolvedMode,
      transition: resolvedTransition,
      lockedHeight: resolvedLockedHeight,
      panelHeight: resolvedPanelHeight,
      slotHeight: slotHeight,
    );
  }
}
