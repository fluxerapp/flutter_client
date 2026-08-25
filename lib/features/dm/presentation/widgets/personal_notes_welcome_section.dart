import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PersonalNotesWelcomeSection extends ConsumerWidget {
  const PersonalNotesWelcomeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FluxerAvatar.user(
              userId: userId,
              fallbackText: l10n.personalNotesTitle,
              size: 80,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.personalNotesTitle,
              style: context.textStyles.channelName.copyWith(
                fontSize: 24,
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            PhosphorIcon(
              PhosphorIconsFill.notePencil,
              size: 20,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.personalNotesSubtitle,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
