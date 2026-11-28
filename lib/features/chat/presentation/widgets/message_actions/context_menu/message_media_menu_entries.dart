import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/attachment_request_auth.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_media_kind.dart';
import 'package:fluxer_app/features/chat/domain/message_media_menu_target.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_download_service.dart';
import 'package:fluxer_app/features/chat/utils/media/favorite_media_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_favorite_state.dart';
import 'package:fluxer_app/features/chat/utils/media/save_message_media_favorite.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/forum/providers/media_download_policy_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

typedef MessageMenuHostTask =
    Future<void> Function(BuildContext hostContext, WidgetRef hostRef);

typedef MessageMenuHostAction = void Function(MessageMenuHostTask task);

class MessageMediaMenuEntry {
  const MessageMediaMenuEntry({
    required this.label,
    required this.icon,
    required this.task,
    this.isDanger = false,
  });

  final String label;
  final IconData icon;
  final MessageMenuHostTask task;
  final bool isDanger;
}

class MessageMediaMenuEntries {
  const MessageMediaMenuEntries({
    required this.primary,
    required this.links,
    required this.favorites,
    required this.manage,
    required this.danger,
    required this.reverseImageEngines,
    this.reverseImageQuery,
  });

  final List<MessageMediaMenuEntry> primary;
  final List<MessageMediaMenuEntry> links;
  final List<MessageMediaMenuEntry> favorites;
  final List<MessageMediaMenuEntry> manage;
  final List<MessageMediaMenuEntry> danger;
  final SearchProviderCategoryState reverseImageEngines;
  final String? reverseImageQuery;
}

MessageMediaMenuEntries watchMessageMediaMenuEntries({
  required WidgetRef ref,
  required FluxerLocalizations l10n,
  required MessageMediaMenuTarget target,
  required Message message,
  required MessageActionPermissions permissions,
  required MessageActionCallbacks callbacks,
}) {
  final String kind = target.kind.name;
  final bool matureHidden = watchMatureMediaHidden(
    ref,
    channelId: message.channelId,
    isMatureMedia: target.isMatureMedia,
  );
  final bool downloadsHidden =
      matureHidden || ref.watch(mediaDownloadHiddenProvider(message.channelId));
  final String url = target.url.trim();
  final String downloadUrl = target.downloadUrl?.trim() ?? '';
  final Attachment? attachment = target.attachment;

  final MessageMediaFavoriteTarget? favoriteTarget = matureHidden
      ? null
      : favoriteTargetForMessageMedia(
          actionScope: MessageMediaActionScope(
            message: message,
            permissions: permissions,
            callbacks: callbacks,
          ),
          attachmentId: attachment?.id,
          embedIndex: target.embedIndex,
          filename: target.filename,
          fallbackContentHash: target.contentHash,
          attachment: attachment,
        );
  final MediaFavoriteState favoriteState = watchMediaFavoriteState(
    ref,
    target: favoriteTarget,
  );
  final bool showMediaDeleteButton = ref.watch(
    appearancePreferencesProvider.select(
      (AppearancePreferencesState s) => s.showMediaDeleteButton,
    ),
  );
  final SearchProviderCategoryState reverseImage = ref.watch(
    advancedPreferencesProvider.select((s) => s.searchEngines.reverseImage),
  );
  final bool canReverseSearch =
      target.supportsReverseImageSearch &&
      !matureHidden &&
      url.isNotEmpty &&
      !AttachmentRequestAuth.isApiAttachmentUrl(url);

  return MessageMediaMenuEntries(
    primary: <MessageMediaMenuEntry>[
      if (!downloadsHidden)
        MessageMediaMenuEntry(
          label: l10n.chatMediaCopy(kind),
          icon: PhosphorIconsFill.copy,
          task: (BuildContext host, WidgetRef _) => copyToClipboard(
            context: host,
            value: url,
            message: target.kind == MessageMediaKind.file
                ? null
                : FluxerLocalizations.of(host).chatMediaUrlCopied,
          ),
        ),
      if (!downloadsHidden && downloadUrl.isNotEmpty)
        MessageMediaMenuEntry(
          label: l10n.chatMediaDownload(kind),
          icon: PhosphorIconsFill.downloadSimple,
          task: (BuildContext host, WidgetRef hostRef) =>
              downloadChatAttachmentMedia(
                context: host,
                ref: hostRef,
                url: downloadUrl,
                filename: target.filename,
              ),
        ),
    ],
    links: <MessageMediaMenuEntry>[
      if (!downloadsHidden && target.kind != MessageMediaKind.file)
        MessageMediaMenuEntry(
          label: l10n.chatMediaCopyLink(kind),
          icon: PhosphorIconsBold.link,
          task: (BuildContext host, WidgetRef _) =>
              copyToClipboard(context: host, value: url),
        ),
      if (!downloadsHidden)
        MessageMediaMenuEntry(
          label: l10n.chatMediaOpenLink(kind),
          icon: PhosphorIconsFill.arrowSquareOut,
          task: (BuildContext host, WidgetRef _) =>
              openAttachmentInBrowser(host, url),
        ),
    ],
    favorites: _favoriteEntries(
      l10n: l10n,
      message: message,
      state: favoriteState,
    ),
    manage: <MessageMediaMenuEntry>[
      if (attachment != null &&
          callbacks.onEditAttachmentAltText != null &&
          canEditAttachmentAltText(
            message: message,
            isOwnMessage: permissions.isOwnMessage,
            attachment: attachment,
            canManageMessages: permissions.canManageMessages,
            isDmChannel: permissions.isDmChannel,
          ))
        MessageMediaMenuEntry(
          label: l10n.chatMessageEditAttachmentAltText,
          icon: PhosphorIconsFill.pencilSimple,
          task: (BuildContext _, WidgetRef _) async =>
              callbacks.onEditAttachmentAltText?.call(attachment),
        ),
      if (attachment != null)
        MessageMediaMenuEntry(
          label: l10n.chatMediaCopyAttachmentId,
          icon: PhosphorIconsRegular.snowflake,
          task: (BuildContext host, WidgetRef _) =>
              copyToClipboard(context: host, value: attachment.id),
        ),
    ],
    danger: <MessageMediaMenuEntry>[
      if (attachment != null &&
          showMediaDeleteButton &&
          callbacks.onDeleteAttachment != null &&
          canDeleteAttachmentOnMessage(
            message: message,
            isOwnMessage: permissions.isOwnMessage,
            isSendDisabled: permissions.isSendDisabled,
          ))
        MessageMediaMenuEntry(
          label: l10n.chatMessageDeleteAttachment,
          icon: PhosphorIconsFill.trash,
          isDanger: true,
          task: (BuildContext _, WidgetRef _) async =>
              callbacks.onDeleteAttachment?.call(attachment),
        ),
    ],
    reverseImageEngines: reverseImage,
    reverseImageQuery: canReverseSearch ? url : null,
  );
}

List<MessageMediaMenuEntry> _favoriteEntries({
  required FluxerLocalizations l10n,
  required Message message,
  required MediaFavoriteState state,
}) {
  if (!state.canFavorite || state.target == null) {
    return const <MessageMediaMenuEntry>[];
  }
  MessageMediaMenuEntry entry({
    required bool active,
    required String addLabel,
    required String removeLabel,
    required MediaFavoriteMenuAction add,
    required MediaFavoriteMenuAction remove,
  }) {
    return MessageMediaMenuEntry(
      label: active ? removeLabel : addLabel,
      icon: active ? PhosphorIconsFill.star : PhosphorIconsBold.star,
      task: (BuildContext host, WidgetRef hostRef) =>
          handleMediaFavoriteMenuAction(
            ref: hostRef,
            context: host,
            message: message,
            state: state,
            action: active ? remove : add,
          ),
    );
  }

  if (state.isGifFavoriteMedia) {
    return <MessageMediaMenuEntry>[
      entry(
        active: state.hasUrlOnlyGifFavorite,
        addLabel: l10n.favoritesAddToUrlOnlyGifFavorites,
        removeLabel: l10n.favoritesRemoveFromUrlOnlyGifFavorites,
        add: MediaFavoriteMenuAction.addUrlOnlyGifFavorite,
        remove: MediaFavoriteMenuAction.removeUrlOnlyGifFavorite,
      ),
      entry(
        active: state.hasSavedMediaFavorite,
        addLabel: l10n.favoritesAddToSavedMedia,
        removeLabel: l10n.favoritesRemoveFromSavedMedia,
        add: MediaFavoriteMenuAction.addSavedMediaFavorite,
        remove: MediaFavoriteMenuAction.removeSavedMediaFavorite,
      ),
    ];
  }
  return <MessageMediaMenuEntry>[
    entry(
      active: state.hasSavedMediaFavorite,
      addLabel: l10n.favoritesAddToFavorites,
      removeLabel: l10n.favoritesRemoveFromFavorites,
      add: MediaFavoriteMenuAction.addSavedMediaFavorite,
      remove: MediaFavoriteMenuAction.removeSavedMediaFavorite,
    ),
  ];
}
