import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/shared/gestures/expandable_sheet_gestures.dart';

class BottomInputSpacer extends ConsumerWidget {
  const BottomInputSpacer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isMobileLayout(context)) {
      return const SizedBox.shrink();
    }
    final bool isPanelOpen = ref.watch(expressionPanelProvider);
    final double slotHeight = ref.watch(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.slotHeight,
      ),
    );
    if (slotHeight <= 0 && !isPanelOpen) {
      return const SizedBox.shrink();
    }
    if (isPanelOpen) {
      final MobileKeyboardMetricsState metrics = ref.watch(
        mobileKeyboardMetricsProvider,
      );
      final double panelAnchorHeight = bottomInputSlotAnchorHeight(
        anchoredKeyboardHeight: metrics.anchoredKeyboardHeight,
        fallbackHeight: metrics.fallbackKeyboardHeight,
        safeAreaBottom: metrics.safeAreaBottom,
      );
      final double reservedHeight = resolvePanelReservedLayoutHeight(
        slotHeight: slotHeight,
        netAnchorHeight: panelAnchorHeight,
        grossAnchorHeight: metrics.resolveAnchorHeight(),
      );
      if (reservedHeight <= 0) {
        return const SizedBox.shrink();
      }
      return _animatedSpacer(context, reservedHeight);
    }
    if (slotHeight <= 0) {
      return const SizedBox.shrink();
    }
    return _animatedSpacer(context, slotHeight);
  }

  Widget _animatedSpacer(BuildContext context, double height) {
    return expandableSheetAnimatedSize(
      context: context,
      isDragging: false,
      height: height,
      child: const SizedBox.shrink(),
    );
  }
}
