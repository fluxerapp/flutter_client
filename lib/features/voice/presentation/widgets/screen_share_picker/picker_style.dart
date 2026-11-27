import 'package:fluxer_app/material_ui.dart';

const double kScreenSharePickerMaxWidth = 1180;
const double kScreenSharePickerMaxHeight = 760;
const double kScreenSharePickerNarrowMaxHeight = 720;
const double kScreenSharePickerMinHeight = 520;
const double kScreenSharePickerNarrowMinHeight = 460;
const double kScreenSharePickerMinHeightInset = 16;
const double kScreenSharePickerNarrowBreakpoint = 900;
const double kScreenSharePickerCompactBreakpoint = 520;
const double kScreenSharePickerRadius = 16;
const Color kScreenSharePickerBarrier = Color(0x59000000);
const Duration kScreenSharePickerTransition = Duration(milliseconds: 140);

const double kScreenSharePickerTabsPadding = 4;
const double kScreenSharePickerTabsGap = 4;
const double kScreenSharePickerTabsRadius = 14;
const double kScreenSharePickerTabRadius = 10;
const double kScreenSharePickerTabVerticalPadding = 12;
const double kScreenSharePickerTabIconSize = 18;
const double kScreenSharePickerTabLineHeight = 20;

const double kScreenSharePickerPreviewPadding = 4;
const double kScreenSharePickerPreviewBorderWidth = 2;
const double kScreenSharePickerPreviewRadius = 12;
const double kScreenSharePickerImageRadius = 7;
const double kScreenSharePickerOverlayRadius = 10;
const double kScreenSharePickerPlaceholderIconSize = 42;
const double kScreenSharePickerActionVerticalPadding = 12;
const double kScreenSharePickerActionHorizontalPadding = 24;
const double kScreenSharePickerActionRadius = 10;
const double kScreenSharePickerActionFontSize = 15;
const double kScreenSharePickerActionLineHeight = 20;
const double kScreenSharePickerCardBodyTopPadding = 10;
const double kScreenSharePickerCardBodyHorizontalPadding = 4;
const double kScreenSharePickerCardBodyGap = 8;
const double kScreenSharePickerCardIconSize = 20;
const double kScreenSharePickerCardTitleFontSize = 15;
const double kScreenSharePickerCardTitleLineHeight = 1.3;
const double kScreenSharePickerCardDisabledOpacity = 0.7;
const double kScreenSharePickerCardBodyHeight =
    kScreenSharePickerCardBodyTopPadding + kScreenSharePickerCardIconSize;

const Color kScreenSharePickerCardBackground = Color(0xFF000000);
const Color kScreenSharePickerCardBorder = Color(0x24FFFFFF);
const Color kScreenSharePickerCardBorderHover = Color(0x42FFFFFF);
const Color kScreenSharePickerCardMuted = Color(0xB8F4F6F8);
const Color kScreenSharePickerOverlay = Color(0x85000000);
const Color kScreenSharePickerActionBackground = Color(0xFFFFFFFF);
const Color kScreenSharePickerActionText = Color(0xFF111111);
const BoxShadow kScreenSharePickerActionShadow = BoxShadow(
  color: Color(0x47000000),
  offset: Offset(0, 4),
  blurRadius: 14,
);

const double kScreenSharePickerStatePadding = 32;
const double kScreenSharePickerStateGap = 12;
const double kScreenSharePickerStateIconSize = 42;
const double kScreenSharePickerStateMaxWidth = 512;
const double kScreenSharePickerStateHeadingFontSize = 20;
const double kScreenSharePickerStateHeadingLineHeight = 1.2;
const double kScreenSharePickerStateBodyFontSize = 14;
const double kScreenSharePickerStateBodyLineHeight = 1.45;
const double kScreenSharePickerStateActionsGap = 8;

const double kScreenSharePickerFooterTopPadding = 14;
const double kScreenSharePickerFooterGap = 8;
const double kScreenSharePickerSummaryGap = 3;
const double kScreenSharePickerSummaryTitleFontSize = 15;
const double kScreenSharePickerSummaryTitleLineHeight = 20;
const double kScreenSharePickerSummaryDetailFontSize = 13;
const double kScreenSharePickerSummaryDetailLineHeight = 18;
const double kScreenSharePickerSummarySeparatorGap = 8;
const double kScreenSharePickerSummarySeparatorAlpha = 0.55;

@immutable
class ScreenSharePickerMetrics {
  const ScreenSharePickerMetrics({
    required this.viewportGap,
    required this.padding,
    required this.gap,
    required this.compact,
    required this.narrow,
  });

  factory ScreenSharePickerMetrics.of(Size window) {
    final double width = window.width;
    final bool compact = width <= kScreenSharePickerCompactBreakpoint;
    return ScreenSharePickerMetrics(
      viewportGap: compact ? 16 : (width * 0.04).clamp(32, 64),
      padding: compact ? 12 : (width * 0.016).clamp(10, 20),
      gap: compact ? 8 : (width * 0.014).clamp(8, 18),
      compact: compact,
      narrow: width <= kScreenSharePickerNarrowBreakpoint,
    );
  }

  final double viewportGap;
  final double padding;
  final double gap;
  final bool compact;
  final bool narrow;

  double get tabHorizontalPadding => compact ? 8 : 16;
  double get tabFontSize => compact ? 13 : 15;
  double get tabLabelGap => compact ? 6 : 8;

  Size frameSize(Size window) {
    final double maxHeight = narrow
        ? kScreenSharePickerNarrowMaxHeight
        : kScreenSharePickerMaxHeight;
    final double minHeight = narrow
        ? kScreenSharePickerNarrowMinHeight
        : kScreenSharePickerMinHeight;
    final double height = (window.height - viewportGap).clamp(0, maxHeight);
    final double floor = (window.height - kScreenSharePickerMinHeightInset)
        .clamp(0, minHeight);
    return Size(
      (window.width - viewportGap).clamp(0, kScreenSharePickerMaxWidth),
      height < floor ? floor : height,
    );
  }
}
