import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/guild_acronym.dart';

class FluxerGuildAcronym extends StatelessWidget {
  const FluxerGuildAcronym({required this.name, this.color, super.key});

  final String name;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final String acronym = guildAcronym(name);
    final String text = acronym.isEmpty ? kGuildAcronymFallback : acronym;
    final int length = guildAcronymLength(text);
    final Color textColor = color ?? context.colors.textPrimary;
    final TextStyle baseStyle = context.textStyles.smallText;
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double iconSize = constraints.biggest.shortestSide;
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
                style: baseStyle.copyWith(
                  color: textColor,
                  fontSize: guildAcronymFontSize(length, iconSize),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                  height: 1,
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
