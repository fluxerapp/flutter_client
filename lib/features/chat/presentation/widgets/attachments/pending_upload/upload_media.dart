import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_attachment_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/alt_text_badge.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_alt_text.dart';
import 'package:fluxer_app/features/chat/utils/attachments/pending_attachment_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class PendingUploadMedia extends StatelessWidget {
  const PendingUploadMedia({
    required this.attachment,
    required this.fallback,
    required this.borderRadius,
    this.overlay,
    super.key,
  });

  static const Key progressKey = Key('composer-attachment-progress');

  final PendingAttachment attachment;
  final Widget fallback;
  final double borderRadius;
  final Widget? overlay;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool isSpoiler = pendingAttachmentIsSpoiler(attachment);
    final String? altText = resolvedMediaAltText(attachment.description);
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          ColoredBox(color: colors.backgroundTertiary),
          if (isSpoiler)
            fallback
          else
            PendingAttachmentPreview(
              attachment: attachment,
              fallback: fallback,
            ),
          if (isSpoiler)
            ColoredBox(
              color: colors.backgroundPrimary.withValues(alpha: 0.72),
              child: Center(
                child: Text(
                  FluxerLocalizations.of(context).chatAttachmentSpoiler,
                  style: context.textStyles.smallText.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          if (altText != null && !isSpoiler)
            PositionedDirectional(
              end: 6,
              bottom: 6,
              child: IgnorePointer(child: AltTextBadge(altText: altText)),
            ),
          if (attachment.status == PendingAttachmentStatus.uploading)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: LinearProgressIndicator(
                key: progressKey,
                minHeight: 3,
                value: attachment.uploadProgress.clamp(0, 1),
                backgroundColor: colors.backgroundTertiary,
                color: colors.brandPrimary,
              ),
            ),
          if (attachment.status == PendingAttachmentStatus.failed)
            ColoredBox(
              color: colors.statusDanger.withValues(alpha: 0.35),
              child: Center(
                child: Icon(
                  PhosphorIconsFill.warningCircle,
                  color: colors.statusDanger,
                  size: 40,
                ),
              ),
            ),
          ?overlay,
        ],
      ),
    );
  }
}
