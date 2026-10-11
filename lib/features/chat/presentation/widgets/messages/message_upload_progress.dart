import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_attachment_preview.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MessageUploadProgress extends ConsumerWidget {
  static const Key indeterminateProgressKey = Key(
    'message-upload-indeterminate',
  );
  static const Key determinateProgressKey = Key('message-upload-determinate');
  static const Key cancelButtonKey = Key('message-upload-cancel');
  static const Key retryButtonKey = Key('message-upload-retry');

  const MessageUploadProgress({
    required this.attachment,
    required this.messageId,
    required this.messageNonce,
    this.failed = false,
    super.key,
  });

  final Attachment attachment;
  final String messageId;
  final String messageNonce;
  final bool failed;

  static const double _maxWidth = 400;
  static const double _iconTileSize = 48;
  static const double _cancelButtonSize = 40;
  static const double _progressHeight = 4;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final bool isMobile = isMobileLayout(context);
    final session = ref.watch(messageUploadSessionProvider(messageNonce));
    final double? progressPercent = session == null
        ? null
        : computeMessageUploadSendingProgress(session);
    final bool hasFailed = session?.hasFailedUploads ?? false;
    final bool isIndeterminate = progressPercent == null;
    final double progressValue = (progressPercent ?? 0) / 100;
    final String? sizeLabel = formatAttachmentByteSize(attachment.size);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PendingAttachment? previewAttachment =
        session == null || session.attachments.isEmpty
        ? null
        : session.attachments.first;
    final Widget fileIcon = Center(
      child: PhosphorIcon(
        PhosphorIconsFill.file,
        size: 32,
        color: colors.textTertiary,
      ),
    );
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile ? double.infinity : _maxWidth,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          border: Border.all(color: colors.backgroundModifierAccent),
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColoredBox(
                color: colors.backgroundTertiary,
                child: SizedBox(
                  width: _iconTileSize,
                  height: _iconTileSize,
                  child: previewAttachment == null
                      ? fileIcon
                      : PendingAttachmentPreview(
                          attachment: previewAttachment,
                          fallback: fileIcon,
                        ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    attachment.filename,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (failed)
                    Text(
                      l10n.chatMessageFailedToSend,
                      style: context.textStyles.smallText.copyWith(
                        color: colors.textDanger,
                        fontSize: 12,
                      ),
                    )
                  else if (sizeLabel != null)
                    Text(
                      sizeLabel,
                      style: context.textStyles.smallText.copyWith(
                        color: colors.textTertiary,
                        fontSize: 12,
                      ),
                    ),
                  const SizedBox(height: 6),
                  if (!failed)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        key: isIndeterminate
                            ? indeterminateProgressKey
                            : determinateProgressKey,
                        minHeight: _progressHeight,
                        value: isIndeterminate
                            ? null
                            : progressValue.clamp(0, 1),
                        backgroundColor: colors.backgroundTertiary,
                        color: hasFailed
                            ? colors.statusDanger
                            : colors.brandPrimary,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (failed) ...[
              _UploadCardButton(
                key: retryButtonKey,
                icon: PhosphorIconsBold.arrowClockwise,
                semanticLabel: l10n.retry,
                onTap: () => ref
                    .read(chatViewModelProvider.notifier)
                    .retryMessageSend(messageId),
              ),
              const SizedBox(width: 8),
            ],
            _UploadCardButton(
              key: cancelButtonKey,
              icon: PhosphorIconsBold.x,
              semanticLabel: l10n.cancel,
              onTap: () => ref
                  .read(chatViewModelProvider.notifier)
                  .cancelSendingMessage(messageId),
            ),
          ],
        ),
      ),
    );
  }
}

class _UploadCardButton extends StatelessWidget {
  const _UploadCardButton({
    required this.icon,
    required this.semanticLabel,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String semanticLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      button: true,
      label: semanticLabel,
      excludeSemantics: true,
      child: Material(
        color: colors.backgroundTertiary,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: SizedBox(
            width: MessageUploadProgress._cancelButtonSize,
            height: MessageUploadProgress._cancelButtonSize,
            child: Center(
              child: PhosphorIcon(icon, size: 20, color: colors.textTertiary),
            ),
          ),
        ),
      ),
    );
  }
}
