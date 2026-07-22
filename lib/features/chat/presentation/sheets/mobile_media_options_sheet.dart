import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/forward_message_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
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
    maxHeight: 0.8,
    initialChildSize: 0.4,
    minChildSize: 0.25,
    maxChildSize: 0.8,
    builder:
        (
          BuildContext sheetContext,
          ScrollController scrollController,
          VoidCallback close,
        ) {
          return _MobileMediaOptionsSheetBody(
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
    required this.launchContext,
    required this.scrollController,
    required this.onCloseSheet,
    this.onCloseViewer,
  });

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
    final List<Widget> mediaItems = <Widget>[
      if (linkUrl.isNotEmpty)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsRegular.link,
          label: l10n.mediaViewerCopyLink,
          onTap: () => unawaited(_copyLink(context, linkUrl)),
        ),
      if (linkUrl.isNotEmpty)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.arrowSquareOut,
          label: l10n.mediaViewerOpenInBrowser,
          onTap: () => unawaited(_openLink(context, linkUrl)),
        ),
      if (downloadUrl != null)
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.downloadSimple,
          label: l10n.chatAttachmentDownload,
          onTap: () => unawaited(_download(context, downloadUrl)),
        ),
      if (_canForwardMedia())
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.arrowBendUpRight,
          label: l10n.mediaViewerForward,
          onTap: () => unawaited(_forward(context)),
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
          onAction: (MessageAction action) => unawaited(
            _handleMessageAction(context, ref, actionScope, action),
          ),
        ),
      );
    }
    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
      child: FluxerBottomSheetGroupColumn(children: groups),
    );
  }

  Future<void> _copyLink(BuildContext context, String linkUrl) async {
    onCloseSheet();
    await copyToClipboard(context: context, value: linkUrl);
  }

  Future<void> _openLink(BuildContext context, String linkUrl) async {
    onCloseSheet();
    if (!context.mounted) {
      return;
    }
    await handleExternalLinkTap(context, linkUrl);
  }

  Future<void> _download(BuildContext context, String downloadUrl) async {
    onCloseSheet();
    if (!context.mounted) {
      return;
    }
    await handleExternalLinkTap(context, downloadUrl);
  }

  Future<void> _forward(BuildContext context) async {
    onCloseSheet();
    onCloseViewer?.call();
    if (!context.mounted) {
      return;
    }
    final MessageMediaActionScope? actionScope = launchContext.actionScope;
    if (actionScope == null) {
      return;
    }
    final Message message = actionScope.message;
    final String? attachmentId = launchContext.attachmentId;
    final int? embedIndex = launchContext.embedIndex;
    if (attachmentId != null && attachmentId.isNotEmpty) {
      await showForwardMediaSheet(
        context,
        sourceChannelId: message.channelId,
        sourceMessageId: message.id,
        attachmentIds: <String>[attachmentId],
      );
      return;
    }
    if (embedIndex != null) {
      await showForwardMediaSheet(
        context,
        sourceChannelId: message.channelId,
        sourceMessageId: message.id,
        embedIndices: <int>[embedIndex],
      );
    }
  }

  Future<void> _handleMessageAction(
    BuildContext context,
    WidgetRef ref,
    MessageMediaActionScope actionScope,
    MessageAction action,
  ) async {
    onCloseSheet();
    if (shouldCloseMediaViewerForMessageAction(action)) {
      onCloseViewer?.call();
    }
    if (!context.mounted) {
      return;
    }
    await dispatchMessageAction(
      ref: ref,
      context: context,
      message: actionScope.message,
      action: action,
      callbacks: actionScope.callbacks,
      previewRoleGuildId: actionScope.previewRoleGuildId,
    );
  }

  String? _downloadUrl() {
    final String? attachmentId = launchContext.attachmentId;
    if (attachmentId != null && attachmentId.isNotEmpty) {
      return attachmentEffectiveDownloadUrl(
        url: launchContext.fallbackUrl,
        isExpired: launchContext.isExpired,
        proxyUrl: launchContext.proxyUrl,
      );
    }
    final String fallbackUrl = launchContext.fallbackUrl.trim();
    if (fallbackUrl.isEmpty) {
      return null;
    }
    return fallbackUrl;
  }

  bool _canForwardMedia() {
    if (launchContext.actionScope == null) {
      return false;
    }
    final String? attachmentId = launchContext.attachmentId;
    if (attachmentId != null && attachmentId.isNotEmpty) {
      return true;
    }
    return launchContext.embedIndex != null;
  }
}
