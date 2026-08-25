import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_category_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showCreateFavoriteCategorySheet(BuildContext context) async {
  final l10n = FluxerLocalizations.of(context);
  final controller = TextEditingController();
  await FluxerBottomSheet.show<void>(
    context,
    title: l10n.favoritesCreateCategory,
    builder: (sheetContext, close) => Consumer(
      builder: (context, ref, _) {
        return FluxerBottomSheetContent(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FluxerInput(
                controller: controller,
                label: l10n.favoritesCategoryNameLabel,
              ),
              const SizedBox(height: 16),
              FluxerButton.primary(
                label: l10n.favoritesCreateCategory,
                onPressed: () async {
                  final name = controller.text.trim();
                  if (name.isEmpty) {
                    return;
                  }
                  await ref
                      .read(favoriteChannelsRepositoryProvider)
                      .addCategory(
                        id: generateFavoriteCategoryId(),
                        name: name,
                      );
                  close();
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
