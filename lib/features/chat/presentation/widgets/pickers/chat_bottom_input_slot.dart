import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/attachment_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/bottom_input_slot_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_panel_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/chat/utils/composer_panel.dart';
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
    final double slotHeight = ref.watch(
      bottomInputSlotProvider.select(
        (BottomInputSlotState state) => state.slotHeight,
      ),
    );

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
      );
      if (reservedHeight <= 0) {
        return const SizedBox.shrink();
      }
      return _animatedSpacer(context, reservedHeight);
    }

    final double spacerHeight = _keyboardSpacerHeight(context, slotHeight);
    if (spacerHeight <= 0) {
      return const SizedBox.shrink();
    }
    return _coloredSpacer(context, spacerHeight);
  }

  double _keyboardSpacerHeight(BuildContext context, double slotHeight) {
    if (slotHeight <= 0) {
      return 0;
    }
    final double homeInset = MediaQuery.viewPaddingOf(context).bottom;
    if (slotHeight >= homeInset) {
      return slotHeight;
    }
    return homeInset > 0 ? homeInset : slotHeight;
  }

  Widget _animatedSpacer(BuildContext context, double height) {
    return expandableSheetAnimatedSize(
      context: context,
      isDragging: false,
      height: height,
      decoration: BoxDecoration(color: context.colors.chatInputBackground),
      child: const SizedBox.shrink(),
    );
  }

  Widget _coloredSpacer(BuildContext context, double height) {
    return ColoredBox(
      color: context.colors.chatInputBackground,
      child: SizedBox(height: height),
    );
  }
}
