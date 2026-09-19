import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/bookmarks/data/saved_messages_repository.dart';
import 'package:fluxer_app/features/bookmarks/providers/saved_messages_sync_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<void> toggleSavedMessageBookmark({
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required String channelId,
  required String messageId,
}) async {
  final SavedMessagesRepository repository = ref.read(
    savedMessagesRepositoryProvider,
  );
  if (await ref
      .read(fluxerDatabaseProvider)
      .savedMessageDao
      .isSaved(messageId)) {
    await repository.unsaveMessage(messageId);
    _showBookmarkToast(ref, l10n, added: false);
    return;
  }
  await repository.saveMessage(channelId: channelId, messageId: messageId);
  _showBookmarkToast(ref, l10n, added: true);
}

Future<void> unsaveMessageBookmark({
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required String messageId,
}) async {
  await ref.read(savedMessagesRepositoryProvider).unsaveMessage(messageId);
  _showBookmarkToast(ref, l10n, added: false);
}

void _showBookmarkToast(
  WidgetRef ref,
  FluxerLocalizations l10n, {
  required bool added,
}) {
  ref
      .read(toastProvider.notifier)
      .show(
        FluxerToast(
          message: added
              ? l10n.savedMessagesAddedToast
              : l10n.savedMessagesRemovedToast,
          variant: FluxerToastVariant.success,
        ),
      );
}
