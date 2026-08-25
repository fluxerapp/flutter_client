import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/add_favorite_media_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/favorite_gif_first_time_prompt_sheet.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_favorite_state.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

MediaFavoriteState watchMediaFavoriteState(
  WidgetRef ref, {
  required MessageMediaFavoriteTarget? target,
  bool forMediaViewerToolbar = false,
}) {
  final List<FavoriteMeme> savedMedia =
      ref.watch(favoriteMemesProvider).value ?? const <FavoriteMeme>[];
  final bool saveGifFavoritesAsSavedMedia = ref.watch(
    advancedPreferencesProvider.select(
      (state) => state.saveGifFavoritesAsSavedMedia,
    ),
  );

  return resolveMediaFavoriteState(
    target: target,
    savedMedia: savedMedia,
    urlFavorites: ref.watch(favoriteGifsProvider).entries,
    saveGifFavoritesAsSavedMedia: saveGifFavoritesAsSavedMedia,
    forMediaViewerToolbar: forMediaViewerToolbar,
  );
}

List<FluxerBottomSheetMenuItem> buildMediaFavoriteMenuItems({
  required FluxerLocalizations l10n,
  required MediaFavoriteState state,
  required ValueChanged<MediaFavoriteMenuAction> onAction,
  String? hint,
}) {
  if (!state.canFavorite || state.target == null) {
    return const <FluxerBottomSheetMenuItem>[];
  }

  if (state.isGifFavoriteMedia) {
    return <FluxerBottomSheetMenuItem>[
      _favoriteMenuItem(
        l10n: l10n,
        isFavorite: state.hasUrlOnlyGifFavorite,
        addLabel: l10n.favoritesAddToUrlOnlyGifFavorites,
        removeLabel: l10n.favoritesRemoveFromUrlOnlyGifFavorites,
        hint: hint,
        onAdd: () => onAction(MediaFavoriteMenuAction.addUrlOnlyGifFavorite),
        onRemove: () =>
            onAction(MediaFavoriteMenuAction.removeUrlOnlyGifFavorite),
      ),
      _favoriteMenuItem(
        l10n: l10n,
        isFavorite: state.hasSavedMediaFavorite,
        addLabel: l10n.favoritesAddToSavedMedia,
        removeLabel: l10n.favoritesRemoveFromSavedMedia,
        hint: hint,
        onAdd: () => onAction(MediaFavoriteMenuAction.addSavedMediaFavorite),
        onRemove: () =>
            onAction(MediaFavoriteMenuAction.removeSavedMediaFavorite),
      ),
    ];
  }

  return <FluxerBottomSheetMenuItem>[
    _favoriteMenuItem(
      l10n: l10n,
      isFavorite: state.hasSavedMediaFavorite,
      addLabel: l10n.favoritesAddToFavorites,
      removeLabel: l10n.favoritesRemoveFromFavorites,
      hint: hint,
      onAdd: () => onAction(MediaFavoriteMenuAction.addSavedMediaFavorite),
      onRemove: () =>
          onAction(MediaFavoriteMenuAction.removeSavedMediaFavorite),
    ),
  ];
}

void scheduleMediaFavoriteMenuAction({
  required WidgetRef ref,
  required BuildContext context,
  required Message message,
  required MediaFavoriteState state,
  required MediaFavoriteMenuAction action,
  VoidCallback? beforeAction,
}) {
  beforeAction?.call();
  unawaited(
    handleMediaFavoriteMenuAction(
      ref: ref,
      context: context,
      message: message,
      state: state,
      action: action,
    ),
  );
}

FluxerBottomSheetMenuItem _favoriteMenuItem({
  required FluxerLocalizations l10n,
  required bool isFavorite,
  required String addLabel,
  required String removeLabel,
  required VoidCallback onAdd,
  required VoidCallback onRemove,
  String? hint,
}) {
  return FluxerBottomSheetMenuItem(
    icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
    label: isFavorite ? removeLabel : addLabel,
    hint: hint,
    onTap: isFavorite ? onRemove : onAdd,
  );
}

class SavedMediaFavoriteToolbarButton extends ConsumerWidget {
  const SavedMediaFavoriteToolbarButton({
    required this.message,
    required this.target,
    this.useHudStyle = false,
    this.forMediaViewerToolbar = true,
    super.key,
  });

  final Message message;
  final MessageMediaFavoriteTarget target;
  final bool useHudStyle;
  final bool forMediaViewerToolbar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MediaFavoriteState state = watchMediaFavoriteState(
      ref,
      target: target,
      forMediaViewerToolbar: forMediaViewerToolbar,
    );
    if (!state.canFavorite) {
      return const SizedBox.shrink();
    }

    final IconData icon = state.isToolbarFavorited
        ? PhosphorIconsFill.star
        : PhosphorIconsBold.star;
    final String tooltip = state.isToolbarFavorited
        ? l10n.favoritesRemoveFromFavorites
        : l10n.favoritesAddToFavorites;

    return _FavoriteToolbarButton(
      icon: icon,
      tooltip: tooltip,
      useHudStyle: useHudStyle,
      onPressed: () => unawaited(
        toggleMediaFavoriteToolbar(
          ref: ref,
          context: context,
          message: message,
          state: state,
        ),
      ),
    );
  }
}

class _FavoriteToolbarButton extends StatelessWidget {
  const _FavoriteToolbarButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    required this.useHudStyle,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;
  final bool useHudStyle;

  @override
  Widget build(BuildContext context) {
    if (useHudStyle) {
      return IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: Colors.black.withValues(alpha: 0.5),
          foregroundColor: Colors.white,
        ),
        tooltip: tooltip,
        icon: PhosphorIcon(icon, color: Colors.white, size: 20),
      );
    }

    return Tooltip(
      message: tooltip,
      child: FluxerButton.mediaOverlay(
        onPressed: onPressed,
        icon: icon,
        isSquare: true,
      ),
    );
  }
}

Future<void> toggleMediaFavoriteToolbar({
  required WidgetRef ref,
  required BuildContext context,
  required Message message,
  required MediaFavoriteState state,
}) async {
  if (!state.canFavorite || state.target == null) {
    return;
  }

  if (state.isGifFavoriteMedia && state.gifInfo != null) {
    final bool useUrlFlow =
        state.useUrlOnlyGifFlow || state.hasUrlOnlyGifFavorite;
    if (useUrlFlow) {
      if (state.hasUrlOnlyGifFavorite) {
        await _removeUrlOnlyGifFavorite(
          ref: ref,
          context: context,
          state: state,
        );
      } else {
        await _addUrlOnlyGifFavorite(
          ref: ref,
          context: context,
          state: state,
          showFirstTimePrompt: true,
        );
      }
      return;
    }
  }

  if (state.hasSavedMediaFavorite) {
    await _removeSavedMediaFavorite(
      ref: ref,
      context: context,
      favorite: state.savedMediaFavorite!,
    );
    return;
  }

  await showAddFavoriteMediaSheet(
    context: context,
    message: message,
    target: state.target!,
  );
}

Future<void> handleMediaFavoriteMenuAction({
  required WidgetRef ref,
  required BuildContext context,
  required Message message,
  required MediaFavoriteState state,
  required MediaFavoriteMenuAction action,
}) async {
  if (!state.canFavorite || state.target == null) {
    return;
  }

  switch (action) {
    case MediaFavoriteMenuAction.addUrlOnlyGifFavorite:
      await _addUrlOnlyGifFavorite(ref: ref, context: context, state: state);
    case MediaFavoriteMenuAction.removeUrlOnlyGifFavorite:
      await _removeUrlOnlyGifFavorite(ref: ref, context: context, state: state);
    case MediaFavoriteMenuAction.addSavedMediaFavorite:
      await showAddFavoriteMediaSheet(
        context: context,
        message: message,
        target: state.target!,
      );
    case MediaFavoriteMenuAction.removeSavedMediaFavorite:
      if (state.savedMediaFavorite != null) {
        await _removeSavedMediaFavorite(
          ref: ref,
          context: context,
          favorite: state.savedMediaFavorite!,
        );
      }
  }
}

enum MediaFavoriteMenuAction {
  addUrlOnlyGifFavorite,
  removeUrlOnlyGifFavorite,
  addSavedMediaFavorite,
  removeSavedMediaFavorite,
}

Future<void> _addUrlOnlyGifFavorite({
  required WidgetRef ref,
  required BuildContext context,
  required MediaFavoriteState state,
  bool showFirstTimePrompt = false,
}) async {
  final MessageMediaGifInfo? gifInfo = state.gifInfo;
  if (gifInfo == null) {
    return;
  }

  Future<void> addFavorite() async {
    ref
        .read(favoriteGifsProvider.notifier)
        .addFromMessageMedia(
          url: gifInfo.url,
          proxyUrl: gifInfo.proxyUrl,
          width: gifInfo.width,
          height: gifInfo.height,
        );
    if (!context.mounted) {
      return;
    }
    _showSuccessToast(
      ref,
      context,
      FluxerLocalizations.of(context).favoritesAddedToast,
    );
  }

  final bool seenPrompt = ref.read(favoriteGifsProvider).seenFirstTimePrompt;
  if (showFirstTimePrompt && !seenPrompt && !state.isToolbarFavorited) {
    await showFavoriteGifFirstTimePrompt(
      context: context,
      onConfirm: addFavorite,
    );
    return;
  }

  await addFavorite();
}

Future<void> _removeUrlOnlyGifFavorite({
  required WidgetRef ref,
  required BuildContext context,
  required MediaFavoriteState state,
}) async {
  final String? url = state.gifInfo?.url;
  if (url == null) {
    return;
  }
  ref.read(favoriteGifsProvider.notifier).removeByUrl(url);
  if (!context.mounted) {
    return;
  }
  _showSuccessToast(
    ref,
    context,
    FluxerLocalizations.of(context).favoritesRemovedToast,
  );
}

Future<void> _removeSavedMediaFavorite({
  required WidgetRef ref,
  required BuildContext context,
  required FavoriteMeme favorite,
}) async {
  try {
    await ref
        .read(favoriteMediaRepositoryProvider)
        .deleteFavoriteMeme(favorite);
    if (!context.mounted) {
      return;
    }
    _showSuccessToast(
      ref,
      context,
      FluxerLocalizations.of(context).favoritesRemovedToast,
    );
  } on Object {
    if (!context.mounted) {
      return;
    }
    _showErrorToast(ref, context);
  }
}

void _showSuccessToast(WidgetRef ref, BuildContext context, String message) {
  ref
      .read(toastProvider.notifier)
      .show(FluxerToast(message: message, variant: FluxerToastVariant.success));
}

void _showErrorToast(WidgetRef ref, BuildContext context) {
  ref
      .read(toastProvider.notifier)
      .show(
        FluxerToast(
          message: FluxerLocalizations.of(context).savedMediaSaveError,
          variant: FluxerToastVariant.danger,
        ),
      );
}
