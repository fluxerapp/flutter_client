import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/favorites/presentation/sheets/create_favorite_category_sheet.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showFavoritesListMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final bool hideMuted =
      ref.read(favoriteSettingsProvider).value?.hideMuted ?? false;

  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (menuContext, close) => [
      FluxerMenuItem(
        label: l10n.favoritesCreateCategory,
        icon: PhosphorIconsBold.folderPlus,
        onPressed: () {
          close();
          unawaited(showCreateFavoriteCategorySheet(context));
        },
      ),
      FluxerMenuItem(
        label: hideMuted
            ? l10n.favoritesShowMutedChannels
            : l10n.favoritesHideMutedChannels,
        icon: PhosphorIconsBold.eyeSlash,
        onPressed: () async {
          await ref
              .read(favoriteChannelsRepositoryProvider)
              .setHideMuted(value: !hideMuted);
          close();
        },
      ),
    ],
  );
}
