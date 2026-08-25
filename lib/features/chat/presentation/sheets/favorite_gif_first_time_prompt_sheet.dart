import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showFavoriteGifFirstTimePrompt({
  required BuildContext context,
  required Future<void> Function() onConfirm,
}) {
  if (isMobileLayout(context)) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).gifFavoriteFirstTimeTitle,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return _FavoriteGifFirstTimePromptBody(
          onClose: close,
          onConfirm: onConfirm,
        );
      },
    );
  }

  return FluxerModal.show<void>(
    context,
    title: FluxerLocalizations.of(context).gifFavoriteFirstTimeTitle,
    centered: true,
    useRootNavigator: true,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return _FavoriteGifFirstTimePromptBody(
        onClose: close,
        onConfirm: onConfirm,
      );
    },
    actionsBuilder: (void Function([void]) pop) => const <Widget>[],
  );
}

class _FavoriteGifFirstTimePromptBody extends ConsumerWidget {
  const _FavoriteGifFirstTimePromptBody({
    required this.onClose,
    required this.onConfirm,
  });

  final VoidCallback onClose;
  final Future<void> Function() onConfirm;

  Future<void> _chooseUrlOnly(WidgetRef ref) async {
    await ref
        .read(advancedPreferencesProvider.notifier)
        .setSaveGifFavoritesAsSavedMedia(value: false);
    ref.read(favoriteGifsProvider.notifier).markFirstTimePromptSeen();
    onClose();
    await onConfirm();
  }

  Future<void> _chooseSavedMedia(WidgetRef ref) async {
    await ref
        .read(advancedPreferencesProvider.notifier)
        .setSaveGifFavoritesAsSavedMedia(value: true);
    ref.read(favoriteGifsProvider.notifier).markFirstTimePromptSeen();
    onClose();
    await onConfirm();
  }

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;

    return FluxerBottomSheetContent(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            l10n.gifFavoriteFirstTimeDescription,
            style: context.textStyles.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.gifFavoriteFirstTimeUrlOnlyDetails,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s2),
          Text(
            l10n.gifFavoriteFirstTimeSavedMediaDetails,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.gifFavoriteFirstTimeHint,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            label: l10n.gifFavoriteFirstTimeUseUrlOnly,
            onPressedAsync: () => _chooseUrlOnly(widgetRef),
          ),
          SizedBox(height: layout.s2),
          FluxerButton.secondary(
            label: l10n.gifFavoriteFirstTimeUseSavedMedia,
            onPressedAsync: () => _chooseSavedMedia(widgetRef),
          ),
        ],
      ),
    );
  }
}
