import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

/// "You're all caught up" footer shown after the last mention card when no
/// more pages are available.
class MentionsEndFooter extends StatelessWidget {
  const MentionsEndFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.notificationsMentionsEndTitle,
            style: textStyles.channelName.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.notificationsMentionsEndBody,
            style: textStyles.bodyMedium.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
    );
  }
}
