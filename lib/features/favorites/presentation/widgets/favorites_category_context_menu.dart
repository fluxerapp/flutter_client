import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/favorites/presentation/sheets/create_favorite_category_sheet.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showFavoritesCategoryMenu(
  BuildContext context,
  WidgetRef ref, {
  required String categoryId,
  required String categoryName,
  required bool isCollapsed,
  required VoidCallback onToggleCollapsed,
  required Offset position,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);

  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (menuContext, close) => [
      FluxerMenuItem(
        label: l10n.favoritesRenameCategory,
        icon: PhosphorIconsBold.pencilSimple,
        onPressed: () {
          close();
          unawaited(
            showRenameFavoriteCategorySheet(
              context,
              categoryId: categoryId,
              currentName: categoryName,
            ),
          );
        },
      ),
      FluxerMenuItem(
        label: isCollapsed
            ? l10n.categoryExpandCategory
            : l10n.categoryCollapseCategory,
        icon: isCollapsed
            ? PhosphorIconsBold.caretDown
            : PhosphorIconsBold.caretRight,
        onPressed: () {
          close();
          onToggleCollapsed();
        },
      ),
      FluxerMenuItem(
        label: l10n.channelSettingsDeleteCategory,
        icon: PhosphorIconsFill.trash,
        isDanger: true,
        onPressed: () async {
          await ref
              .read(favoriteChannelsRepositoryProvider)
              .removeCategory(categoryId);
          close();
        },
      ),
    ],
  );
}
