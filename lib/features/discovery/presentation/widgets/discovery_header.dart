import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class DiscoveryHeader extends StatelessWidget {
  const DiscoveryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border(bottom: BorderSide(color: colors.userAreaDividerColor)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text(
              l10n.discoveryExplore,
              style: textStyles.heading.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 28 / 20,
                color: colors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
