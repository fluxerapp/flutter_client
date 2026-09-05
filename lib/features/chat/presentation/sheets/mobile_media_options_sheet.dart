import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/attachment_alt_text_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachment_download_service.dart';
import 'package:fluxer_app/features/chat/utils/favorite_media_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_favorite_state.dart';
import 'package:fluxer_app/features/chat/utils/save_message_media_favorite.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showMobileMediaOptionsSheet({
  required BuildContext context,
  required WidgetRef ref,
  required MediaOptionsLaunchContext launchContext,
  VoidCallback? onCloseViewer,
}) async {
  if (!launchContext.hasOptionsMenu) {
    return;
  }
  await FluxerBottomSheet.showScrollable<void>(
    context,
    useRootNavigator: true,
    minChildSize: 0.25,
    builder:
        (
          BuildContext sheetContext,
          ScrollController scrollController,
          VoidCallback close,
        ) {
          return _MobileMediaOptionsSheetBody(
            hostContext: context,
            hostRef: ref,
            launchContext: launchContext,
            scrollController: scrollController,
            onCloseViewer: onCloseViewer,
            onCloseSheet: close,
          );
        },
  );
}

class _MobileMediaOptionsSheetBody extends ConsumerWidget {
  const _MobileMediaOptionsSheetBody({
    required this.hostContext,
    required this.hostRef,
    required this.launchContext,
    required this.scrollController,
    required this.onCloseSheet,
    this.onCloseViewer,
  });

  final BuildContext hostContext;
  final WidgetRef hostRef;
  final MediaOptionsLaunchContext launchContext;
  final ScrollController scrollController;
  final VoidCallback onCloseSheet;
  final VoidCallback? onCloseViewer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String linkUrl = launchContext.fallbackUrl.trim();
    final String? downloadUrl = _downloadUrl();
    final MessageMediaActionScope? actionScope = launchContext.actionScope;
    final Attachment? attachment = actionScope == null
        ? null
        : resolveMessageAttachment(
            actionScope.message,
            launchContext.attachmentId,
          );
    final MessageMediaFavoriteTarget? favoriteTarget =
        favoriteTargetForMessageMedia(
          actionScope: actionScope,
          attachmentId: launchContext.attachmentId,
          embedIndex: launchContext.embedIndex,
          filename: launchContext.filename,
          fallbackContentHash: launchContext.contentHash,
          attachment: attachment,
        );
    final MediaFavoriteState favoriteState = watchMediaFavoriteState(
      ref,
      target: favoriteTarget,
    );
    final List<Widget> mediaItems = <Widget>[
      ...buildMediaFavoriteMenuItems(
        l10n: l10n,
        state: favoriteState,
        hint: launchContext.filename,
        onAction: (MediaFavoriteMenuAction action) => unawaited(
          _handleFavoriteAction(
            actionScope: actionScope,
            favoriteState: favoriteState,
            action: action,
          ),
        ),
      ),
      if (linkUrl.isNotEmpty)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsBold.link,
          label: l10n.mediaViewerCopyLink,
          onTap: () => unawaited(_copyLink(linkUrl)),
        ),
      if (linkUrl.isNotEmpty)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.arrowSquareOut,
          label: l10n.mediaViewerOpenInBrowser,
          onTap: () => unawaited(_openLink(linkUrl)),
        ),
      if (downloadUrl != null)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.downloadSimple,
          label: l10n.chatAttachmentDownload,
          onTap: () => unawaited(_download(downloadUrl)),
        ),
    ];
    final List<Widget> groups = <Widget>[
      if (mediaItems.isNotEmpty) FluxerMenuGroup(children: mediaItems),
    ];
    if (actionScope != null) {
      groups.addAll(
        buildMessageActionMenuGroups(
          context: context,
          ref: ref,
          message: actionScope.message,
          permissions: actionScope.permissions,
          onAction: (MessageAction action) =>
              unawaited(_handleMessageAction(actionScope, action)),
          attachmentCallbacks: MessageActionCallbacks(
            onDeleteAttachment: (Attachment attachment) {
              actionScope.callbacks.onDeleteAttachment?.call(attachment);
              onCloseViewer?.call();
            },
            onEditAttachmentAltText: (Attachment attachment) {
              unawaited(_editAttachmentAltText(actionScope, attachment));
            },
          ),
          attachmentIdFilter: launchContext.attachmentId,
          includeAttachmentFavoriteActions: false,
          onCloseMenu: onCloseSheet,
        ),
      );
    }
    return SingleChildScrollView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
      ),
      child: FluxerBottomSheetGroupColumn(children: groups),
    );
  }

  Future<void> _handleFavoriteAction({
    required MessageMediaActionScope? actionScope,
    required MediaFavoriteState favoriteState,
    required MediaFavoriteMenuAction action,
  }) async {
    onCloseSheet();
    if (!hostContext.mounted || actionScope == null) {
      return;
    }
    await handleMediaFavoriteMenuAction(
      ref: hostRef,
      context: hostContext,
      message: actionScope.message,
      state: favoriteState,
      action: action,
    );
  }

  Future<void> _copyLink(String linkUrl) async {
    onCloseSheet();
    if (!hostContext.mounted) {
      return;
    }
    await copyToClipboard(context: hostContext, value: linkUrl);
  }

  Future<void> _openLink(String linkUrl) async {
    onCloseSheet();
    if (!hostContext.mounted) {
      return;
    }
    await handleExternalLinkTap(hostContext, linkUrl, useRootNavigator: true);
  }

  Future<void> _download(String downloadUrl) async {
    onCloseSheet();
    if (!hostContext.mounted) {
      return;
    }
    await downloadChatAttachmentMedia(
      context: hostContext,
      ref: hostRef,
      url: downloadUrl,
      filename: launchContext.filename,
    );
  }

  Future<void> _editAttachmentAltText(
    MessageMediaActionScope actionScope,
    Attachment attachment,
  ) async {
    if (!hostContext.mounted) {
      return;
    }
    final Attachment resolved =
        resolveMessageAttachment(
          actionScope.message,
          launchContext.attachmentId,
        ) ??
        attachment;
    await editMessageAttachmentAltText(
      hostContext,
      hostRef,
      messageId: actionScope.message.id,
      attachment: resolved,
    );
  }

  Future<void> _handleMessageAction(
    MessageMediaActionScope actionScope,
    MessageAction action,
  ) async {
    onCloseSheet();
    if (!hostContext.mounted) {
      return;
    }
    await dispatchMessageAction(
      ref: hostRef,
      context: hostContext,
      message: actionScope.message,
      action: action,
      callbacks: actionScope.callbacks,
      previewRoleGuildId: actionScope.previewRoleGuildId,
    );
    if (shouldCloseMediaViewerForMessageAction(action)) {
      onCloseViewer?.call();
    }
  }

  String? _downloadUrl() {
    final String? attachmentId = launchContext.attachmentId;
    if (attachmentId == null || attachmentId.isEmpty) {
      return null;
    }
    return attachmentEffectiveDownloadUrl(
      url: launchContext.fallbackUrl,
      isExpired: launchContext.isExpired,
      proxyUrl: launchContext.proxyUrl,
    );
  }
}
