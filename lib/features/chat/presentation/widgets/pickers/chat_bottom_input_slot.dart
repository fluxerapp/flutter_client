import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    );
    if (spacerHeight <= 0) {
      return const SizedBox.shrink();
    }
    return SizedBox(height: spacerHeight);
  }

  double _keyboardSpacerHeight(
    BuildContext context,
    double slotHeight, {
    required bool keyboardLayoutActive,
    required double syncedViewInsetBottom,
  }) {
    final double inset = resolvedKeyboardInsetBottom(context);
    final double resolved = resolveKeyboardSpacerRawHeight(
      viewInsetBottom: inset,
      slotHeight: slotHeight,
      keyboardLayoutActive: keyboardLayoutActive,
      syncedViewInsetBottom: syncedViewInsetBottom,
    );
    if (resolved <= 0) {
      return 0;
    }
    return bottomInputKeyboardSpacerHeight(
      slotHeight: resolved,
      homeIndicatorInset: MediaQuery.viewPaddingOf(context).bottom,
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
