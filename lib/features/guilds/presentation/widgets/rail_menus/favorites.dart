import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Future<void> showFavoritesButtonMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
}) {
  final bool isMuted = ref.read(favoriteSettingsProvider).value?.muted ?? false;
  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(menuContext);
      return fluxerMenuGroups(<List<Widget>>[
        <Widget>[
          FluxerMenuItem(
            label: isMuted ? l10n.favoritesUnmute : l10n.favoritesMute,
            icon: isMuted
                ? PhosphorIconsFill.bell
                : PhosphorIconsFill.bellSlash,
            onPressed: () {
              close();
              unawaited(
                ref
                    .read(favoriteChannelsRepositoryProvider)
                    .setMuted(value: !isMuted),
              );
            },
          ),
        ],
        <Widget>[
          FluxerMenuItem(
            label: l10n.favoritesHideConfirmTitle,
            icon: PhosphorIconsFill.eyeSlash,
            isDanger: true,
            onPressed: () {
              close();
              if (context.mounted) {
                unawaited(confirmHideFavorites(context, ref));
              }
            },
          ),
        ],
      ]);
    },
  );
}

Future<void> confirmHideFavorites(BuildContext context, WidgetRef ref) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final bool? confirmed = await FluxerConfirmModal.show(
    context,
    title: l10n.favoritesHideConfirmTitle,
    description: l10n.favoritesHideConfirmDescription,
    confirmLabel: l10n.favoritesHideConfirmTitle,
    isDanger: true,
    onConfirm: () {},
  );
  if (confirmed != true) {
    return;
  }
  await ref
      .read(appearancePreferencesProvider.notifier)
      .setShowFavorites(value: false);
}
