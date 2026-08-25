import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/favorites/domain/resolved_favorite_entry.dart';
import 'package:fluxer_app/features/favorites/presentation/sheets/set_favorite_nickname_sheet.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showFavoritesChannelMenu(
  BuildContext context,
  WidgetRef ref, {
  required ResolvedFavoriteEntry entry,
  required Offset position,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final List<db.FavoriteCategory> categories =
      ref.read(favoriteCategoriesProvider).value ?? const [];

  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (menuContext, close) => [
      if (entry.channel != null || entry.dm != null)
        FluxerMenuItem(
          label: l10n.favoritesSetNickname,
          icon: PhosphorIconsBold.pencilSimple,
          onPressed: () {
            close();
            unawaited(
              showSetFavoriteNicknameSheet(
                context,
                channelId: entry.channelId,
                currentNickname: entry.favorite.nickname,
              ),
            );
          },
        ),
      if (categories.isNotEmpty)
        FluxerMenuItem(
          label: l10n.favoritesMoveToCategory,
          icon: PhosphorIconsBold.folder,
          onPressed: () {
            close();
            unawaited(
              showFavoriteMoveToCategoryMenu(
                context,
                ref,
                entry: entry,
                categories: categories,
              ),
            );
          },
        ),
      FluxerMenuItem(
        label: l10n.favoritesRemoveFromFavorites,
        icon: PhosphorIconsFill.star,
        isDanger: true,
        onPressed: () async {
          await ref
              .read(favoriteChannelsRepositoryProvider)
              .removeChannel(entry.channelId);
          close();
          if (context.mounted) {
            ref
                .read(toastProvider.notifier)
                .show(
                  FluxerToast(
                    message: l10n.favoritesRemovedToast,
                    variant: FluxerToastVariant.success,
                  ),
                );
          }
        },
      ),
    ],
  );
}

Future<void> showFavoriteMoveToCategoryMenu(
  BuildContext context,
  WidgetRef ref, {
  required ResolvedFavoriteEntry entry,
  required List<db.FavoriteCategory> categories,
  Offset position = Offset.zero,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);

  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (menuContext, close) => [
      FluxerMenuItem(
        label: l10n.favoritesUncategorized,
        icon: PhosphorIconsBold.star,
        onPressed: () async {
          await ref
              .read(favoriteChannelsRepositoryProvider)
              .moveChannel(channelId: entry.channelId, position: 0);
          close();
        },
      ),
      for (final category in categories)
        FluxerMenuItem(
          label: category.name,
          icon: PhosphorIconsBold.folder,
          onPressed: () async {
            await ref
                .read(favoriteChannelsRepositoryProvider)
                .moveChannel(
                  channelId: entry.channelId,
                  position: 0,
                  parentId: category.id,
                );
            close();
          },
        ),
    ],
  );
}
