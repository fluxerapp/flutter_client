import 'dart:async';

import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_input_slot_provider.g.dart';

class BottomInputSlotState {
  const BottomInputSlotState({
    required this.transition,
    required this.lockedHeight,
    required this.slotHeight,
    required this.slotHeightHeld,
  });

  final BottomInputTransition transition;
  final double lockedHeight;
  final double slotHeight;
  final bool slotHeightHeld;
}

@Riverpod()
class BottomInputSlot extends _$BottomInputSlot {
  Timer? _transitionTimeout;
  double? _heldSlotHeightOverride;

  @override
  BottomInputSlotState build() {
    ref
      ..listen<bool>(expressionPanelProvider, _onComposerPanelChanged)
      ..listen<bool>(attachmentPanelProvider, _onComposerPanelChanged)
      ..listen<MobileKeyboardMetricsState>(
        mobileKeyboardMetricsProvider,
        _onKeyboardMetricsChanged,
      )
      ..listen<double?>(expressionPanelHeightProvider, _onPanelHeightChanged)
      ..onDispose(() => _transitionTimeout?.cancel());
    return _resolveState();
  }

  bool _isComposerPanelOpen() {
    return isComposerPanelOpen(
      expressionPanelOpen: ref.read(expressionPanelProvider),
      attachmentPanelOpen: ref.read(attachmentPanelProvider),
    );
  }

  void _onComposerPanelChanged(bool? previous, bool _) {
    final bool isPanelOpen = _isComposerPanelOpen();
    if (isPanelOpen) {
      if (state.transition == BottomInputTransition.lockingToPanel) {
        return;
      }
      final MobileKeyboardMetricsState metrics = ref.read(
        mobileKeyboardMetricsProvider,
      );
      final double anchorHeight = metrics.resolveAnchorHeight();
      ref.read(expressionPanelHeightProvider.notifier).setHeight(anchorHeight);
      state = _resolveState(panelHeight: anchorHeight);
      return;
    }
    if (state.transition == BottomInputTransition.lockingToKeyboard) {
      return;
    }
    ref.read(expressionPanelHeightProvider.notifier).clear();
    state = _resolveState(panelHeight: 0);
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
      _endTransition();
      return;
    }
    if (state.transition == BottomInputTransition.lockingToKeyboard &&
        hasKeyboardReachedLockedNetHeight(
          liveKeyboardHeight: next.liveKeyboardHeight,
          lockedNetHeight: state.lockedHeight,
          safeAreaBottom: 0,
          isKeyboardVisible: next.isKeyboardVisible,
        )) {
      _endTransition();
      return;
    }
    if (state.transition != BottomInputTransition.idle) {
      return;
    }
    if (_isComposerPanelOpen()) {
      return;
    }
    state = _resolveState(preserveTransition: true);
  }

  void _onPanelHeightChanged(double? previous, double? next) {
    if (next == null || state.transition != BottomInputTransition.idle) {
      return;
    }
    state = _resolveState(panelHeight: next);
  }

  void beginPanelTransition(double lockedHeight) {
    _transitionTimeout?.cancel();
    _transitionTimeout = Timer(const Duration(milliseconds: 400), () {
      if (!ref.mounted) {
        return;
      }
      if (state.transition == BottomInputTransition.lockingToPanel) {
        _endTransition();
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
    ref.read(expressionPanelHeightProvider.notifier).setHeight(grossLock);
    state = _resolveState(
      transition: BottomInputTransition.lockingToPanel,
      lockedHeight: grossLock,
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
        _endTransition();
      }
    });
    final double quantizedLock = quantizeBottomInputHeight(lockedHeight);
    state = _resolveState(
      transition: BottomInputTransition.lockingToKeyboard,
      lockedHeight: quantizedLock,
      panelHeight: quantizedLock,
    );
  }

  void holdSlotHeight(double height) {
    _heldSlotHeightOverride = quantizeBottomInputHeight(height);
    state = _resolveState();
  }

  void clearHeldSlotHeight() {
    if (_heldSlotHeightOverride == null) {
      return;
    }
    _heldSlotHeightOverride = null;
    state = _resolveState();
  }

  void settlePanelHeight(double height) {
    final MobileKeyboardMetricsState metrics = ref.read(
      mobileKeyboardMetricsProvider,
    );
    final double anchorHeight = metrics.resolveAnchorHeight();
    final bool isExpanded = height > anchorHeight + 1;
    if (!isExpanded) {
      ref.read(expressionPanelHeightProvider.notifier).setHeight(height);
    }
    state = _resolveState(panelHeight: anchorHeight);
  }

  void _endTransition() {
    _transitionTimeout?.cancel();
    state = _resolveState(
      transition: BottomInputTransition.idle,
      lockedHeight: 0,
    );
  }

  BottomInputSlotState _resolveState({
    BottomInputTransition? transition,
    double? lockedHeight,
    double? panelHeight,
    bool preserveTransition = false,
  }) {
    final bool isPanelOpen = _isComposerPanelOpen();
    final MobileKeyboardMetricsState metrics = ref.read(
      mobileKeyboardMetricsProvider,
    );
    final double? storedPanelHeight = ref.read(expressionPanelHeightProvider);
    final BottomInputTransition resolvedTransition =
        transition ??
        (preserveTransition ? state.transition : BottomInputTransition.idle);
    final double resolvedLockedHeight =
        lockedHeight ?? (preserveTransition ? state.lockedHeight : 0);
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
      heldSlotHeightOverride: _heldSlotHeightOverride,
      unmeasuredKeyboardReserved: metrics.unmeasuredKeyboardReserved,
    );
    return BottomInputSlotState(
      transition: resolvedTransition,
      lockedHeight: resolvedLockedHeight,
      slotHeight: slotHeight,
      slotHeightHeld: _heldSlotHeightOverride != null,
    );
  }
}
