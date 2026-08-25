import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/data/favorite_media_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/saved_media/saved_media_form_content.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showAddFavoriteMediaSheet({
  required BuildContext context,
  required Message message,
  required MessageMediaFavoriteTarget target,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  if (isMobileLayout(context)) {
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.savedMediaAddTitle,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return _AddFavoriteMediaBody(
          message: message,
          target: target,
          onClose: close,
        );
      },
    );
  }

  return FluxerModal.show<void>(
    context,
    title: l10n.savedMediaAddTitle,
    centered: true,
    useRootNavigator: true,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return _AddFavoriteMediaBody(
        message: message,
        target: target,
        onClose: close,
      );
    },
    actionsBuilder: (void Function([void]) pop) => const <Widget>[],
  );
}

class _AddFavoriteMediaBody extends ConsumerStatefulWidget {
  const _AddFavoriteMediaBody({
    required this.message,
    required this.target,
    required this.onClose,
  });

  final Message message;
  final MessageMediaFavoriteTarget target;
  final VoidCallback onClose;

  @override
  ConsumerState<_AddFavoriteMediaBody> createState() =>
      _AddFavoriteMediaBodyState();
}

class _AddFavoriteMediaBodyState extends ConsumerState<_AddFavoriteMediaBody> {
  String? _errorText;

  Future<void> _save({
    required String name,
    required String altText,
    required List<String> tags,
  }) async {
    final String trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      setState(
        () =>
            _errorText = FluxerLocalizations.of(context).savedMediaNameRequired,
      );
      return;
    }

    setState(() => _errorText = null);
    final FavoriteMediaRepository repository = ref.read(
      favoriteMediaRepositoryProvider,
    );

    try {
      await repository.createFromMessage(
        channelId: widget.message.channelId,
        messageId: widget.message.id,
        name: trimmedName,
        altText: altText,
        tags: tags,
        attachmentId: widget.target.attachmentId,
        embedIndex: widget.target.embedIndex,
      );
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context).favoritesAddedToast,
              variant: FluxerToastVariant.success,
            ),
          );
      widget.onClose();
    } on Object {
      if (mounted) {
        setState(
          () =>
              _errorText = FluxerLocalizations.of(context).savedMediaSaveError,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SavedMediaFormContent(
      initialName: widget.target.defaultName,
      initialAltText: widget.target.defaultAltText ?? '',
      initialTags: const <String>[],
      errorText: _errorText,
      onSave: _save,
    );
  }
}
