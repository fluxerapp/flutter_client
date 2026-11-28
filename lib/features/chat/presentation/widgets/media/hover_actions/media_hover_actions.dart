import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/menu_target/message_media_menu_region.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_action_bar.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_download_service.dart';
import 'package:fluxer_app/features/chat/utils/media/favorite_media_utils.dart';
import 'package:fluxer_app/features/chat/utils/media/media_favorite_state.dart';
import 'package:fluxer_app/features/chat/utils/media/save_message_media_favorite.dart';
import 'package:fluxer_app/features/forum/providers/media_download_policy_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double _kOverlayEdgeInset = 8;
const double _kOverlayMinWidth = 110;
const double _kOverlayMinHeight = 50;

class MediaHoverActions extends ConsumerStatefulWidget {
  const MediaHoverActions({
    required this.child,
    required this.size,
    required this.filename,
    this.actionScope,
    this.attachment,
    this.embedIndex,
    this.downloadUrl,
    this.contentHash,
    this.isMatureMedia = false,
    super.key,
  });

  final Widget child;
  final Size size;
  final String filename;
  final MessageMediaActionScope? actionScope;
  final Attachment? attachment;
  final int? embedIndex;
  final String? downloadUrl;
  final String? contentHash;
  final bool isMatureMedia;

  @override
  ConsumerState<MediaHoverActions> createState() => _MediaHoverActionsState();
}

class _MediaHoverActionsState extends ConsumerState<MediaHoverActions> {
  bool _hovered = false;

  void _setHovered(bool value) {
    if (_hovered != value) {
      setState(() => _hovered = value);
    }
  }

  bool get _fits =>
      widget.size.width >= _kOverlayMinWidth &&
      widget.size.height >= _kOverlayMinHeight;

  @override
  Widget build(BuildContext context) {
    final Attachment? attachment = widget.attachment;
    return MessageMediaMenuRegion(
      target: attachment == null
          ? null
          : messageMediaMenuTargetForAttachment(attachment),
      child: _buildHoverActions(context),
    );
  }

  Widget _buildHoverActions(BuildContext context) {
    final MessageMediaActionScope? scope = widget.actionScope;
    if (scope == null || !usesDesktopPointerUi(context) || !_fits) {
      return widget.child;
    }
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: Stack(
        children: <Widget>[
          widget.child,
          if (_hovered)
            PositionedDirectional(
              top: _kOverlayEdgeInset,
              end: _kOverlayEdgeInset,
              child: _MediaHoverToolbar(
                scope: scope,
                filename: widget.filename,
                attachment: widget.attachment,
                embedIndex: widget.embedIndex,
                downloadUrl: widget.downloadUrl,
                contentHash: widget.contentHash,
                isMatureMedia: widget.isMatureMedia,
              ),
            ),
        ],
      ),
    );
  }
}

class _MediaHoverToolbar extends ConsumerWidget {
  const _MediaHoverToolbar({
    required this.scope,
    required this.filename,
    required this.isMatureMedia,
    this.attachment,
    this.embedIndex,
    this.downloadUrl,
    this.contentHash,
  });

  final MessageMediaActionScope scope;
  final String filename;
  final Attachment? attachment;
  final int? embedIndex;
  final String? downloadUrl;
  final String? contentHash;
  final bool isMatureMedia;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Message message = scope.message;
    final (bool showDelete, bool showDownload, bool showFavorite) = ref.watch(
      appearancePreferencesProvider.select(
        (AppearancePreferencesState s) => (
          s.showMediaDeleteButton,
          s.showMediaDownloadButton,
          s.showMediaFavoriteButton,
        ),
      ),
    );
    final bool matureHidden = watchMatureMediaHidden(
      ref,
      channelId: message.channelId,
      isMatureMedia: isMatureMedia,
    );
    final bool downloadsHidden =
        matureHidden ||
        ref.watch(mediaDownloadHiddenProvider(message.channelId));
    final Attachment? attachment = this.attachment;
    final bool canDelete =
        showDelete && attachment != null && scope.canDeleteAttachments;
    final String? downloadUrl = this.downloadUrl;
    final bool canDownload =
        showDownload &&
        !downloadsHidden &&
        downloadUrl != null &&
        downloadUrl.trim().isNotEmpty;
    final MessageMediaFavoriteTarget? favoriteTarget =
        showFavorite && !matureHidden
        ? favoriteTargetForMessageMedia(
            actionScope: scope,
            attachmentId: attachment?.id,
            embedIndex: embedIndex,
            filename: filename,
            fallbackContentHash: contentHash,
            attachment: attachment,
            forMediaViewerToolbar: true,
          )
        : null;
    final MediaFavoriteState favoriteState = watchMediaFavoriteState(
      ref,
      target: favoriteTarget,
      forMediaViewerToolbar: true,
    );
    final bool canFavorite =
        favoriteTarget != null && favoriteState.canFavorite;
    if (!canDelete && !canDownload && !canFavorite) {
      return const SizedBox.shrink();
    }
    return MessageActionBar(
      children: <Widget>[
        if (canDelete)
          MessageActionBarButton(
            label: l10n.chatMessageDeleteAttachment,
            danger: true,
            onTap: () => scope.callbacks.onDeleteAttachment?.call(attachment),
            child: const PhosphorIcon(PhosphorIconsBold.trash),
          ),
        if (canDownload)
          MessageActionBarButton(
            label: l10n.mediaViewerDownload,
            onTap: () => unawaited(
              downloadChatAttachmentMedia(
                context: context,
                ref: ref,
                url: downloadUrl,
                filename: filename,
              ),
            ),
            child: const PhosphorIcon(PhosphorIconsBold.downloadSimple),
          ),
        if (canFavorite)
          MessageActionBarButton(
            label: favoriteState.isToolbarFavorited
                ? l10n.favoritesRemoveFromFavorites
                : l10n.favoritesAddToFavorites,
            active: favoriteState.isToolbarFavorited,
            onTap: () => unawaited(
              toggleMediaFavoriteToolbar(
                ref: ref,
                context: context,
                message: message,
                state: favoriteState,
              ),
            ),
            child: PhosphorIcon(
              favoriteState.isToolbarFavorited
                  ? PhosphorIconsFill.star
                  : PhosphorIconsBold.star,
            ),
          ),
      ],
    );
  }
}
