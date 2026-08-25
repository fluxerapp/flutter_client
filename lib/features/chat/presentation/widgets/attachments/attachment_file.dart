import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AttachmentFile extends StatelessWidget {
  const AttachmentFile({required this.attachment, super.key});

  final Attachment attachment;

  @override
  Widget build(BuildContext context) {
    if (shouldPreviewAttachment(attachment)) {
      return TextualAttachmentPreview(attachment: attachment);
    }
    return _AttachmentFileChip(attachment: attachment);
  }
}

class _AttachmentFileChip extends StatelessWidget {
  const _AttachmentFileChip({required this.attachment});

  final Attachment attachment;

  static const double _downloadButtonSize = 40;
  static const double _iconTileSize = 48;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String displayName = attachment.title ?? attachment.filename;
    final (String stem, String extension) =
        splitAttachmentFilenameStemAndExtension(displayName);
    final String? sizeLabel = formatAttachmentByteSize(attachment.size);
    final bool isExpired = attachment.expired ?? false;
    final String? downloadUrl = attachmentEffectiveDownloadUrl(
      url: attachment.url,
      isExpired: isExpired,
      proxyUrl: attachment.proxyUrl,
    );
    final IconData fileIconData = phosphorFillIconForChatAttachmentFilename(
      displayName,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border.all(color: colors.backgroundModifierAccent),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.backgroundTertiary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: _iconTileSize,
              height: _iconTileSize,
              child: Center(
                child: PhosphorIcon(
                  fileIconData,
                  size: 32,
                  color: colors.textTertiary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: stem,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (extension.isNotEmpty)
                        TextSpan(
                          text: extension,
                          style: context.textStyles.bodySmall.copyWith(
                            color: colors.textTertiary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
                ),
                if (sizeLabel != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    sizeLabel,
                    style: context.textStyles.smallText.copyWith(
                      color: colors.textTertiary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 12),
          if (isExpired)
            Tooltip(
              message: l10n.chatAttachmentExpiredTooltip,
              child: Opacity(
                opacity: 0.4,
                child: Semantics(
                  label: l10n.chatAttachmentExpiredTooltip,
                  child: Container(
                    width: _downloadButtonSize,
                    height: _downloadButtonSize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colors.brandPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: PhosphorIcon(
                      PhosphorIconsBold.warningCircle,
                      size: 20,
                      color: colors.textOnBrandPrimary,
                    ),
                  ),
                ),
              ),
            )
          else
            SizedBox(
              width: _downloadButtonSize,
              height: _downloadButtonSize,
              child: IconButton(
                tooltip: l10n.chatAttachmentDownload,
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: colors.brandPrimary,
                  foregroundColor: colors.textOnBrandPrimary,
                  disabledForegroundColor: colors.textOnBrandPrimary.withValues(
                    alpha: 0.4,
                  ),
                  disabledBackgroundColor: colors.brandPrimary.withValues(
                    alpha: 0.4,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: downloadUrl == null
                    ? null
                    : () {
                        unawaited(handleExternalLinkTap(context, downloadUrl));
                      },
                icon: PhosphorIcon(
                  PhosphorIconsBold.downloadSimple,
                  size: 20,
                  color: downloadUrl == null
                      ? colors.textOnBrandPrimary.withValues(alpha: 0.4)
                      : colors.textOnBrandPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
