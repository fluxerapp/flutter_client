import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_panel.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

class BottomInputSpacer extends ConsumerWidget {
  const BottomInputSpacer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileLayout(context)) {
      return const SizedBox.shrink();
    }

    final bool isPanelOpen = isComposerPanelOpen(
      expressionPanelOpen: ref.watch(expressionPanelProvider),
      attachmentPanelOpen: ref.watch(attachmentPanelProvider),
    );
    final BottomInputSlotState slotState = ref.watch(bottomInputSlotProvider);
    final double slotHeight = slotState.slotHeight;

    if (isPanelOpen) {
      final ({double? anchoredKeyboardHeight, double fallbackKeyboardHeight})
      panelMetrics = ref.watch(
        mobileKeyboardMetricsProvider.select(
          (MobileKeyboardMetricsState metrics) => (
            anchoredKeyboardHeight: metrics.anchoredKeyboardHeight,
            fallbackKeyboardHeight: metrics.fallbackKeyboardHeight,
          ),
        ),
      );
      final double anchorHeight = inlineExpressionPanelAnchorHeight(
        anchoredKeyboardHeight: panelMetrics.anchoredKeyboardHeight,
        fallbackHeight: panelMetrics.fallbackKeyboardHeight,
      );
      final double reservedHeight = resolvePanelReservedLayoutHeight(
        slotHeight: slotHeight,
        netAnchorHeight: anchorHeight,
        grossAnchorHeight: anchorHeight,
        useExactSlotHeight: slotState.slotHeightHeld,
      );
      return _PanelSpacer(height: reservedHeight);
    }

    final ({
      double liveKeyboardHeight,
      bool unmeasuredKeyboardReserved,
      double viewInsetsKeyboardHeight,
    })
    metrics = ref.watch(
      mobileKeyboardMetricsProvider.select(
        (MobileKeyboardMetricsState state) => (
          liveKeyboardHeight: state.liveKeyboardHeight,
          unmeasuredKeyboardReserved: state.unmeasuredKeyboardReserved,
          viewInsetsKeyboardHeight: state.viewInsetsKeyboardHeight,
        ),
      ),
    );
    final bool keyboardLayoutActive =
        metrics.liveKeyboardHeight > 0 ||
        metrics.unmeasuredKeyboardReserved ||
        slotState.transition != BottomInputTransition.idle ||
        slotState.slotHeightHeld;
    final bool slotTracksKeyboard =
        slotState.transition == BottomInputTransition.idle &&
        !slotState.slotHeightHeld;
    final double spacerHeight = _keyboardSpacerHeight(
      context,
      slotHeight,
      keyboardLayoutActive: keyboardLayoutActive,
      syncedViewInsetBottom: slotTracksKeyboard
          ? metrics.viewInsetsKeyboardHeight
          : 0,
      viewInsetOwnsSpacer:
          slotTracksKeyboard &&
          !metrics.unmeasuredKeyboardReserved &&
          defaultTargetPlatform == TargetPlatform.android,
    );
    return KeyboardResizeSpacer(height: math.max(0, spacerHeight));
  }

  double _keyboardSpacerHeight(
    BuildContext context,
    double slotHeight, {
    required bool keyboardLayoutActive,
    required double syncedViewInsetBottom,
    required bool viewInsetOwnsSpacer,
  }) {
    final double inset = resolvedKeyboardInsetBottom(context);
    final double resolved = resolveKeyboardSpacerRawHeight(
      viewInsetBottom: inset,
      slotHeight: slotHeight,
      keyboardLayoutActive: keyboardLayoutActive,
      syncedViewInsetBottom: syncedViewInsetBottom,
      viewInsetOwnsSpacer: viewInsetOwnsSpacer,
    );
    if (resolved <= 0 && !(viewInsetOwnsSpacer && slotHeight > 0)) {
      return 0;
    }
    return bottomInputKeyboardSpacerHeight(
      slotHeight: resolved,
      homeIndicatorInset: MediaQuery.viewPaddingOf(context).bottom,
    );
  }
}

const double kKeyboardResizeJumpThreshold = 24;
const Duration kKeyboardResizeSettleTime = Duration(milliseconds: 100);
const Duration kKeyboardResizeDuration = Duration(milliseconds: 300);
const Duration kKeyboardResizeGrowDelay = Duration(milliseconds: 60);
const Curve kKeyboardResizeCurve = FluxerSpringCurve(
  stiffness: 784,
  damping: 56,
  duration: kKeyboardResizeDuration,
);
final Duration _kKeyboardResizeGrowDuration =
    kKeyboardResizeDuration + kKeyboardResizeGrowDelay;
final Curve _kKeyboardResizeGrowCurve = Interval(
  kKeyboardResizeGrowDelay.inMicroseconds /
      _kKeyboardResizeGrowDuration.inMicroseconds,
  1,
  curve: kKeyboardResizeCurve,
);

class KeyboardResizeSpacer extends StatefulWidget {
  const KeyboardResizeSpacer({required this.height, super.key});

  final double height;

  @override
  State<KeyboardResizeSpacer> createState() => _KeyboardResizeSpacerState();
}

class _KeyboardResizeSpacerState extends State<KeyboardResizeSpacer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: kKeyboardResizeDuration,
    value: 1,
  );
  late double _from = widget.height;
  late double _to = widget.height;
  Curve _curve = kKeyboardResizeCurve;
  final Stopwatch _sinceChange = Stopwatch()..start();

  double get _current =>
      _from + (_to - _from) * _curve.transform(_controller.value);

  @override
  void didUpdateWidget(KeyboardResizeSpacer oldWidget) {
    super.didUpdateWidget(oldWidget);
    final double next = widget.height;
    if (next == _to) {
      return;
    }
    final double shown = _current;
    final bool settled = _sinceChange.elapsed >= kKeyboardResizeSettleTime;
    _sinceChange.reset();
    if (_controller.isAnimating) {
      _to = next;
      return;
    }
    final bool swap =
        settled &&
        shown > 0 &&
        next > 0 &&
        (next - shown).abs() >= kKeyboardResizeJumpThreshold &&
        !MediaQuery.disableAnimationsOf(context);
    _from = swap ? shown : next;
    _to = next;
    if (swap) {
      final bool grows = next > shown;
      _curve = grows ? _kKeyboardResizeGrowCurve : kKeyboardResizeCurve;
      _controller
        ..duration = grows
            ? _kKeyboardResizeGrowDuration
            : kKeyboardResizeDuration
        ..forward(from: 0);
    } else {
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? _) => SizedBox(height: _current),
    );
  }
}

class _PanelSpacer extends ConsumerStatefulWidget {
  const _PanelSpacer({required this.height});

  final double height;

  @override
  ConsumerState<_PanelSpacer> createState() => _PanelSpacerState();
}

class _PanelSpacerState extends ConsumerState<_PanelSpacer> {
  bool _growing = false;

  @override
  void initState() {
    super.initState();
    final bool keyboardVisible = ref.read(
      mobileKeyboardMetricsProvider.select(
        (MobileKeyboardMetricsState metrics) => metrics.isKeyboardVisible,
      ),
    );
    final BottomInputTransition transition = ref.read(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.transition,
      ),
    );
    if (keyboardVisible || transition != BottomInputTransition.idle) {
      return;
    }
    _growing = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() => _growing = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return expandableSheetAnimatedSize(
      context: context,
      isDragging: false,
      composerPanelMotion: true,
      height: _growing
          ? math.min(
              widget.height,
              bottomInputKeyboardSpacerHeight(
                slotHeight: 0,
                homeIndicatorInset: bottomInputHomeIndicatorInset(
                  MediaQuery.of(context),
                ),
              ),
            )
          : widget.height,
      child: const SizedBox.shrink(),
    );
  }
}
