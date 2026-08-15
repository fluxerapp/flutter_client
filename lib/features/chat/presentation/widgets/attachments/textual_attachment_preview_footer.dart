import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_surface.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum TextualPreviewCountKind { line, row }

class TextualAttachmentPreviewFooter extends StatelessWidget {
  const TextualAttachmentPreviewFooter({
    required this.attachment,
    required this.canExpand,
    required this.isExpanded,
    required this.itemCount,
    required this.onToggleExpanded,
    required this.onSelectLanguage,
    required this.onMoreOptions,
    this.onOpenFullscreen,
    this.countKind = TextualPreviewCountKind.line,
    this.showLanguageButton = true,
    this.showFullscreenButton = true,
    this.constrainWidth = true,
    super.key,
  });

  final Attachment attachment;
  final bool canExpand;
  final bool isExpanded;
  final int itemCount;
  final VoidCallback onToggleExpanded;
  final VoidCallback? onOpenFullscreen;
  final VoidCallback onSelectLanguage;
  final VoidCallback onMoreOptions;
  final TextualPreviewCountKind countKind;
  final bool showLanguageButton;
  final bool showFullscreenButton;
  final bool constrainWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String fileName = attachmentPreviewFileName(attachment);
    final (String stem, String extension) =
        splitAttachmentFilenameStemAndExtension(fileName);
    final String? sizeLabel = formatAttachmentByteSize(attachment.size);
    final bool showFullscreen =
        showFullscreenButton && onOpenFullscreen != null;

    final String expandLabel;
    if (countKind == TextualPreviewCountKind.row) {
      expandLabel = isExpanded
          ? l10n.chatTextualPreviewCollapseRows(itemCount)
          : l10n.chatTextualPreviewExpandRows(itemCount);
    } else {
      expandLabel = isExpanded
          ? l10n.chatTextualPreviewCollapseLines(itemCount)
          : l10n.chatTextualPreviewExpandLines(itemCount);
    }

    return Container(
      constraints: constrainWidth
          ? const BoxConstraints(maxWidth: kTextualPreviewMaxWidth)
          : const BoxConstraints(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border(top: BorderSide(color: colors.backgroundModifierAccent)),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: stem,
                            style: context.textStyles.smallText.copyWith(
                              color: colors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (extension.isNotEmpty)
                            TextSpan(
                              text: extension,
                              style: context.textStyles.smallText.copyWith(
                                color: colors.textTertiary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (sizeLabel != null)
                      Text(
                        sizeLabel,
                        style: context.textStyles.smallText.copyWith(
                          color: colors.textTertiary,
                          fontSize: 11,
                        ),
                      ),
                  ],
                ),
              ),
              if (showLanguageButton)
                IconButton(
                  tooltip: l10n.chatTextualPreviewChangeLanguage,
                  visualDensity: VisualDensity.compact,
                  onPressed: onSelectLanguage,
                  icon: PhosphorIcon(
                    PhosphorIconsBold.code,
                    size: 16,
                    color: colors.textSecondary,
                  ),
                ),
              if (showFullscreen)
                IconButton(
                  tooltip: l10n.chatTextualPreviewViewWholeFile,
                  visualDensity: VisualDensity.compact,
                  onPressed: onOpenFullscreen,
                  icon: PhosphorIcon(
                    PhosphorIconsBold.arrowsOut,
                    size: 16,
                    color: colors.textSecondary,
                  ),
                ),
              IconButton(
                tooltip: l10n.chatTextualPreviewMoreOptions,
                visualDensity: VisualDensity.compact,
                onPressed: onMoreOptions,
                icon: PhosphorIcon(
                  PhosphorIconsBold.dotsThree,
                  size: 16,
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
          if (canExpand)
            TextButton(
              onPressed: onToggleExpanded,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: colors.textLink,
              ),
              child: Text(
                expandLabel,
                style: context.textStyles.smallText.copyWith(
                  color: colors.textLink,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
