import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class FluxerTruncatedTooltipText extends StatefulWidget {
  const FluxerTruncatedTooltipText(
    this.text, {
    required this.style,
    this.tooltipPosition = FluxerTooltipPosition.above,
    super.key,
  });

  final String text;
  final TextStyle style;
  final FluxerTooltipPosition tooltipPosition;

  @override
  State<FluxerTruncatedTooltipText> createState() =>
      _FluxerTruncatedTooltipTextState();
}

class _FluxerTruncatedTooltipTextState
    extends State<FluxerTruncatedTooltipText> {
  Object? _measuredKey;
  bool _overflowing = false;

  bool _isOverflowing(BuildContext context, double maxWidth) {
    final TextStyle style = DefaultTextStyle.of(
      context,
    ).style.merge(widget.style).copyWith(color: const Color(0x00000000));
    final TextScaler textScaler = MediaQuery.textScalerOf(context);
    final TextDirection direction = Directionality.of(context);
    final Object key = Object.hash(
      widget.text,
      style,
      textScaler,
      direction,
      maxWidth,
    );
    if (key == _measuredKey) {
      return _overflowing;
    }
    final TextPainter painter = TextPainter(
      text: TextSpan(text: widget.text, style: style),
      maxLines: 1,
      textDirection: direction,
      textScaler: textScaler,
    )..layout(maxWidth: maxWidth);
    _overflowing = painter.didExceedMaxLines;
    painter.dispose();
    _measuredKey = key;
    return _overflowing;
  }

  @override
  Widget build(BuildContext context) {
    final Widget label = Text(
      widget.text,
      style: widget.style,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    );
    if (!usesDesktopPointerUi(context)) {
      return label;
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (!_isOverflowing(context, constraints.maxWidth)) {
          return label;
        }
        return FluxerTooltip(
          message: widget.text,
          position: widget.tooltipPosition,
          child: label,
        );
      },
    );
  }
}
