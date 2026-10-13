import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/guild_acronym.dart';

const int _kMeasuredWidthCacheLimit = 512;

final Map<(String, double, String?), double> _measuredWidths =
    <(String, double, String?), double>{};

double _measureAcronymWidth(String text, TextStyle style) {
  final key = (text, style.fontSize ?? 0, style.fontFamily);
  final double? cached = _measuredWidths[key];
  if (cached != null) {
    return cached;
  }
  final TextPainter painter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
    textScaler: kIconInitialsTextScaler,
    maxLines: 1,
  )..layout();
  final double width = painter.width;
  painter.dispose();
  if (_measuredWidths.length >= _kMeasuredWidthCacheLimit) {
    _measuredWidths.clear();
  }
  _measuredWidths[key] = width;
  return width;
}

class FluxerGuildAcronym extends StatelessWidget {
  const FluxerGuildAcronym({required this.name, this.color, super.key});

  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final String acronym = guildAcronym(name);
    final String text = acronym.isEmpty ? kGuildAcronymFallback : acronym;
    final int length = guildAcronymLength(text);
    final TextStyle style = context.textStyles.smallText.copyWith(
      color: color ?? context.colors.textPrimary,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      height: 1,
      leadingDistribution: TextLeadingDistribution.even,
    );
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double fontSize = fitGuildAcronymFontSize(
            acronymLength: length,
            iconSize: constraints.biggest.shortestSide,
            measureWidth: (double size) =>
                _measureAcronymWidth(text, style.copyWith(fontSize: size)),
          );
          return ClipRect(
            child: OverflowBox(
              minWidth: 0,
              maxWidth: double.infinity,
              minHeight: 0,
              maxHeight: double.infinity,
              child: Text(
                text,
                softWrap: false,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                textScaler: kIconInitialsTextScaler,
                style: style.copyWith(fontSize: fontSize),
              ),
            ),
          );
        },
      ),
    );
  }
}
