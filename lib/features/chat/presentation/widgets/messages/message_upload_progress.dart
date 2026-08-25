import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MessageUploadProgress extends ConsumerWidget {
  static const Key indeterminateProgressKey = Key(
    'message-upload-indeterminate',
  );
  static const Key determinateProgressKey = Key('message-upload-determinate');
  static const Key cancelButtonKey = Key('message-upload-cancel');

  const MessageUploadProgress({
    required this.attachment,
    required this.messageId,
    required this.messageNonce,
    required this.channelId,
    super.key,
  });

  final Attachment attachment;
  final String messageId;
  final String messageNonce;
  final String channelId;

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
                    PhosphorIconsFill.file,
                    size: 32,
                    color: colors.textTertiary,
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
                  if (sizeLabel != null)
                    Text(
                      sizeLabel,
                      style: context.textStyles.smallText.copyWith(
                        color: colors.textTertiary,
                        fontSize: 12,
                      ),
                    ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      key: isIndeterminate
                          ? indeterminateProgressKey
                          : determinateProgressKey,
                      minHeight: _progressHeight,
                      value: isIndeterminate ? null : progressValue.clamp(0, 1),
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
            Material(
              key: cancelButtonKey,
              color: colors.backgroundTertiary,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => ref
                    .read(chatViewModelProvider.notifier)
                    .cancelSendingMessage(messageId),
                child: SizedBox(
                  width: _cancelButtonSize,
                  height: _cancelButtonSize,
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIconsBold.x,
                      size: 20,
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
