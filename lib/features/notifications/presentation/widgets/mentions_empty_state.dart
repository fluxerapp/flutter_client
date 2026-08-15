import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Centered empty-state for the mentions feed: at-icon, title, and body copy.
class MentionsEmptyState extends StatelessWidget {
  const MentionsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              PhosphorIconsBold.at,
              size: 80,
              color: colors.textPrimaryMuted,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.notificationsNoMentionsTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.notificationsNoMentionsBody,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: colors.textPrimaryMuted),
            ),
          ],
        ),
      ),
    );
  }
}
