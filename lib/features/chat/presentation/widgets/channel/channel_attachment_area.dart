import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/attachment_edit_modal.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelAttachmentArea extends ConsumerWidget {
  const ChannelAttachmentArea({
    required this.channelId,
    this.wideComposerAction = false,
    super.key,
  });

  final String channelId;
  final bool wideComposerAction;

  static const double _kAttachmentListHeight = 150;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PendingAttachment> attachments = ref
        .watch(cloudUploadControllerProvider(channelId))
        .items;
    final bool hasAttachments = attachments.isNotEmpty;
    return ClipRect(
      child: AnimatedSize(
        duration: context.motion.panel,
        curve: Curves.easeOutCubic,
        alignment: Alignment.bottomCenter,
        child: hasAttachments
            ? _AttachmentAreaBody(
                channelId: channelId,
                attachments: attachments,
                wideComposerAction: wideComposerAction,
              )
            : const SizedBox(width: double.infinity, height: 0),
      ),
    );
  }
}

class _AttachmentAreaBody extends ConsumerWidget {
  const _AttachmentAreaBody({
    required this.channelId,
    required this.attachments,
    required this.wideComposerAction,
  });

  final String channelId;
  final List<PendingAttachment> attachments;
  final bool wideComposerAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (!wideComposerAction) const Divider(),
        Container(
          margin: wideComposerAction
              ? const EdgeInsets.only(bottom: 6, top: 6)
              : const EdgeInsets.only(bottom: 6, top: 8),
          height: ChannelAttachmentArea._kAttachmentListHeight,
          child: ReorderableListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            buildDefaultDragHandles: false,
            itemCount: attachments.length,
            onReorderItem: (int oldIndex, int newIndex) {
              ref
                  .read(cloudUploadControllerProvider(channelId).notifier)
                  .reorderAttachments(oldIndex, newIndex);
            },
            proxyDecorator:
                (Widget child, int index, Animation<double> animation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext _, Widget? c) {
                      final double t = Curves.easeInOut.transform(
                        animation.value,
                      );
                      return Transform.scale(
                        scale: 1.0 + t * 0.02,
                        child: Opacity(opacity: 1.0 - t * 0.15, child: c),
                      );
                    },
                    child: child,
                  );
                },
            itemBuilder: (BuildContext context, int index) {
              final PendingAttachment att = attachments[index];
              return ReorderableDragStartListener(
                key: ValueKey<int>(att.id),
                index: index,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _AttachmentChip(channelId: channelId, attachment: att),
                ),
              );
            },
          ),
        ),
        Divider(height: 1, color: context.colors.userAreaDividerColor),
      ],
    );
  }
}

class _AttachmentChip extends ConsumerWidget {
  const _AttachmentChip({required this.channelId, required this.attachment});

  final String channelId;
  final PendingAttachment attachment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final String path = attachment.file.path;
    final bool hasImagePreview =
        path.isNotEmpty &&
        isImageAttachment(
          filename: attachment.filename,
          contentType: attachment.contentType,
        );
    final bool isVideo = _isVideoFilename(attachment.filename);
    final bool isSpoiler = (attachment.flags & attachmentFlagIsSpoiler) != 0;
    final String? byteSizeLabel = formatAttachmentByteSize(attachment.size);

    return SizedBox(
      width: 150,
      height: 150,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ColoredBox(color: colors.backgroundTertiary),
                      if (hasImagePreview && !isSpoiler)
                        Image.file(File(path), fit: BoxFit.cover)
                      else
                        Center(
                          child: Icon(
                            isVideo
                                ? PhosphorIconsFill.filmStrip
                                : _fileIcon(attachment.filename),
                            size: 44,
                            color: colors.textPrimaryMuted,
                          ),
                        ),
                      if (isSpoiler)
                        ColoredBox(
                          color: colors.backgroundPrimary.withValues(
                            alpha: 0.72,
                          ),
                          child: Center(
                            child: Text(
                              FluxerLocalizations.of(
                                context,
                              ).chatAttachmentSpoiler,
                              style: context.textStyles.smallText.copyWith(
                                color: colors.textPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _RoundIconButton(
                              tooltip: FluxerLocalizations.of(
                                context,
                              ).chatAttachmentSpoilerLabel,
                              icon: isSpoiler
                                  ? PhosphorIconsFill.eyeSlash
                                  : PhosphorIconsFill.eye,
                              onPressed: () {
                                final int next = isSpoiler
                                    ? attachment.flags &
                                          ~attachmentFlagIsSpoiler
                                    : attachment.flags |
                                          attachmentFlagIsSpoiler;
                                ref
                                    .read(
                                      cloudUploadControllerProvider(
                                        channelId,
                                      ).notifier,
                                    )
                                    .updateAttachment(
                                      attachment.id,
                                      filename: attachment.filename,
                                      description: attachment.description,
                                      flags: next,
                                    );
                              },
                            ),
                            _RoundIconButton(
                              tooltip: FluxerLocalizations.of(
                                context,
                              ).chatAttachmentEditTitle,
                              icon: PhosphorIconsFill.pencilSimple,
                              onPressed: () => AttachmentEditModal.show(
                                context,
                                channelId: channelId,
                                attachment: attachment,
                              ),
                            ),
                            _RoundIconButton(
                              tooltip: FluxerLocalizations.of(
                                context,
                              ).chatAttachmentRemove,
                              icon: PhosphorIconsFill.trash,
                              onPressed: () => ref
                                  .read(
                                    cloudUploadControllerProvider(
                                      channelId,
                                    ).notifier,
                                  )
                                  .removeAttachment(attachment.id),
                              danger: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                attachment.filename,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.smallText.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (byteSizeLabel != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    byteSizeLabel,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.smallText.copyWith(
                      color: colors.textTertiary,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static IconData _fileIcon(String filename) {
    final String lower = filename.toLowerCase();
    if (lower.endsWith('.pdf')) {
      return PhosphorIconsFill.filePdf;
    }
    if (lower.endsWith('.zip') ||
        lower.endsWith('.rar') ||
        lower.endsWith('.7z')) {
      return PhosphorIconsFill.fileZip;
    }
    final RegExp audio = RegExp(r'\.(mp3|wav|ogg|m4a|flac)$');
    if (audio.hasMatch(lower)) {
      return PhosphorIconsFill.fileAudio;
    }
    final RegExp code = RegExp(
      r'\.(js|ts|tsx|jsx|dart|py|rs|go|html|css|json|md)$',
    );
    if (code.hasMatch(lower)) {
      return PhosphorIconsFill.fileCode;
    }
    return PhosphorIconsFill.file;
  }

  static bool _isVideoFilename(String name) {
    final String lower = name.toLowerCase();
    return lower.endsWith('.mp4') ||
        lower.endsWith('.webm') ||
        lower.endsWith('.mov') ||
        lower.endsWith('.mkv');
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.danger = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Semantics(
        button: true,
        label: tooltip,
        child: Tooltip(
          message: tooltip,
          child: Material(
            color: colors.backgroundPrimary.withValues(alpha: 0.75),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: ExcludeSemantics(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    icon,
                    size: 18,
                    color: danger ? colors.statusDanger : colors.textPrimary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
