import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_upload/upload_media.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_upload/upload_toolbar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_upload/video_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/attachment_edit_modal.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/pending_attachment_actions.dart';
import 'package:fluxer_app/features/chat/utils/attachments/pending_upload_icon.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class PendingUploadCard extends ConsumerWidget {
  const PendingUploadCard({
    required this.channelId,
    required this.attachment,
    super.key,
  });

  static const double _kCardExtent = 200;
  static const double _kCardPadding = 8;
  static const double _kRadius = 4;
  static const double _kFileIconSize = 100;
  static const double _kFilenameGap = 8;
  static const double _kFilenameInset = 4;
  static const double _kFilenameMinHeight = 40;
  static const double _kFilenameFontSize = 13;
  static const double _kDetailsFontSize = 11;
  static const double _kToolbarRoomTop = 12;
  static const double _kToolbarRoomEnd = 24;
  static const Offset _kToolbarShift = Offset(0.25, -0.25);

  static const double slotWidth = _kCardExtent + _kToolbarRoomEnd;
  static const double slotHeight = _kCardExtent + _kToolbarRoomTop;

  final String channelId;
  final PendingAttachment attachment;

  bool get _isImage => isImageAttachment(
    filename: attachment.filename,
    contentType: attachment.contentType,
  );

  bool get _isVideo => isVideoAttachment(
    filename: attachment.filename,
    contentType: attachment.contentType,
  );

  void _open(BuildContext context) {
    final String path = attachment.file.path;
    if (path.isEmpty) {
      return;
    }
    if (_isImage) {
      unawaited(
        showAttachmentMediaViewer(
          context,
          downloadsHidden: true,
          items: <AttachmentMediaViewerItem>[
            AttachmentMediaViewerItem(
              url: Uri.file(path).toString(),
              filename: attachment.filename,
              width: attachment.width,
              height: attachment.height,
              contentType: attachment.contentType,
              description: attachment.description,
              localPath: path,
            ),
          ],
        ),
      );
      return;
    }
    if (_isVideo) {
      unawaited(
        showPendingVideoPreview(
          context,
          path: path,
          width: attachment.width,
          height: attachment.height,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final bool isSpoiler = pendingAttachmentIsSpoiler(attachment);
    final String? byteSize = formatAttachmentByteSize(attachment.size);
    final String? extension = pendingUploadExtension(attachment.filename);
    final bool previewable = _isImage || _isVideo;
    final Widget fileIcon = Center(
      child: Icon(
        _isVideo
            ? PhosphorIconsFill.filmStrip
            : pendingUploadFileIcon(attachment.filename),
        size: _kFileIconSize,
        color: colors.brandPrimaryLight,
      ),
    );
    final Widget media = PendingUploadMedia(
      attachment: attachment,
      fallback: fileIcon,
      borderRadius: _kRadius,
    );
    final Widget card = Container(
      width: _kCardExtent,
      height: _kCardExtent,
      padding: const EdgeInsets.all(_kCardPadding),
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(_kRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: previewable
                ? FluxerTappable(
                    onTap: () => _open(context),
                    semanticLabel: attachment.filename,
                    builder: (_, _) => media,
                  )
                : media,
          ),
          Container(
            margin: const EdgeInsets.only(top: _kFilenameGap),
            padding: const EdgeInsets.symmetric(horizontal: _kFilenameInset),
            constraints: const BoxConstraints(minHeight: _kFilenameMinHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 2,
              children: <Widget>[
                Text(
                  attachment.filename,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.smallText.copyWith(
                    fontSize: _kFilenameFontSize,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    color: colors.textPrimary,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        byteSize ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.smallText.copyWith(
                          fontSize: _kDetailsFontSize,
                          fontWeight: FontWeight.w400,
                          color: colors.textTertiary,
                        ),
                      ),
                    ),
                    if (extension != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 4),
                        child: Text(
                          extension,
                          style: context.textStyles.smallText.copyWith(
                            fontSize: _kDetailsFontSize,
                            fontWeight: FontWeight.w600,
                            color: colors.brandPrimaryLight,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    final bool rtl = Directionality.of(context) == TextDirection.rtl;
    return SizedBox(
      width: slotWidth,
      height: slotHeight,
      child: Stack(
        children: <Widget>[
          PositionedDirectional(start: 0, bottom: 0, child: card),
          PositionedDirectional(
            top: _kToolbarRoomTop,
            end: _kToolbarRoomEnd,
            child: FractionalTranslation(
              translation: rtl
                  ? Offset(-_kToolbarShift.dx, _kToolbarShift.dy)
                  : _kToolbarShift,
              child: PendingUploadToolbar(
                isSpoiler: isSpoiler,
                onToggleSpoiler: () => togglePendingAttachmentSpoiler(
                  ref,
                  channelId: channelId,
                  attachment: attachment,
                ),
                onEdit: () => AttachmentEditModal.show(
                  context,
                  channelId: channelId,
                  attachment: attachment,
                ),
                onRemove: () => unawaited(
                  removePendingAttachment(
                    ref,
                    channelId: channelId,
                    attachment: attachment,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
