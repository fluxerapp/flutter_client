import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showHideFavoritesSheet(
  BuildContext context, {
  required VoidCallback onConfirmed,
}) async {
  final l10n = FluxerLocalizations.of(context);
  await FluxerBottomSheet.show<void>(
    context,
    title: l10n.favoritesHideConfirmTitle,
    builder: (sheetContext, close) => Consumer(
      builder: (context, ref, _) {
        return FluxerBottomSheetContent(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.favoritesHideConfirmDescription),
              const SizedBox(height: 16),
              FluxerButton.dangerPrimary(
                label: l10n.favoritesHideConfirmTitle,
                onPressed: () async {
                  await ref
                      .read(appearancePreferencesProvider.notifier)
                      .setShowFavorites(value: false);
                  close();
                  onConfirmed();
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
