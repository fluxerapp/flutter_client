import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/favorites/presentation/sheets/hide_favorites_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FavoritesWelcome extends ConsumerWidget {
  const FavoritesWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);

    return ColoredBox(
      color: context.colors.chatBackground,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: EdgeInsets.all(context.layout.s6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: context.colors.backgroundTertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIconsFill.star,
                      size: 36,
                      color: context.colors.interactiveNormal,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.favoritesWelcomeTitle,
                  style: context.textStyles.channelName.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.favoritesWelcomeDescription,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.favoritesWelcomeTip,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FluxerButton.secondary(
                  label: l10n.favoritesDisableButton,
                  onPressed: () => unawaited(
                    showHideFavoritesSheet(
                      context,
                      onConfirmed: () {
                        if (context.mounted) {
                          context.go(RoutePaths.me);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
