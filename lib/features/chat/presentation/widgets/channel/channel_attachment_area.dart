import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_upload/upload_card.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_upload/upload_media.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/attachment_edit_modal.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/pending_attachment_actions.dart';
import 'package:fluxer_app/features/chat/utils/attachments/pending_upload_icon.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class ChannelAttachmentArea extends ConsumerWidget {
  const ChannelAttachmentArea({
    required this.channelId,
    this.animateSize = true,
    super.key,
  });

  final String channelId;
  final bool animateSize;

  static const Key uploadProgressKey = PendingUploadMedia.progressKey;
  static const Key stripKey = Key('composer-attachment-strip');
  static const double _kAttachmentListHeight = 150;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PendingAttachment> attachments = ref
        .watch(cloudUploadControllerProvider(readAccountUserId(ref), channelId))
        .items;
    final Widget body = attachments.isNotEmpty
        ? _AttachmentAreaBody(channelId: channelId, attachments: attachments)
        : const SizedBox(width: double.infinity, height: 0);
    if (!animateSize) {
      return body;
    }
    return ClipRect(
      child: AnimatedSize(
        duration: context.motion.panel,
        curve: Curves.easeOutCubic,
        alignment: Alignment.bottomCenter,
        child: body,
      ),
    );
  }
}

class _AttachmentAreaBody extends ConsumerWidget {
  const _AttachmentAreaBody({
    required this.channelId,
    required this.attachments,
  });

  static const EdgeInsetsDirectional _kDesktopStripPadding =
      EdgeInsetsDirectional.only(start: 10, top: 8, bottom: 10);

  final String channelId;
  final List<PendingAttachment> attachments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool desktopCards = usesDesktopPointerUi(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          key: ChannelAttachmentArea.stripKey,
          margin: desktopCards
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(vertical: 6),
          height: desktopCards
              ? PendingUploadCard.slotHeight + _kDesktopStripPadding.vertical
              : ChannelAttachmentArea._kAttachmentListHeight,
          child: ReorderableListView.builder(
            scrollDirection: Axis.horizontal,
            padding: desktopCards
                ? _kDesktopStripPadding.resolve(Directionality.of(context))
                : const EdgeInsets.symmetric(horizontal: 8),
            buildDefaultDragHandles: false,
            itemCount: attachments.length,
            onReorderItem: (int oldIndex, int newIndex) {
              ref
                  .read(
                    cloudUploadControllerProvider(
                      readAccountUserId(ref),
                      channelId,
                    ).notifier,
                  )
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
              if (desktopCards) {
                return ReorderableDragStartListener(
                  key: ValueKey<int>(att.id),
                  index: index,
                  child: PendingUploadCard(
                    channelId: channelId,
                    attachment: att,
                  ),
                );
              }
              return ReorderableDelayedDragStartListener(
                key: ValueKey<int>(att.id),
                index: index,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
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
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isVideo = _isVideoFilename(attachment.filename);
    final bool isSpoiler = pendingAttachmentIsSpoiler(attachment);
    final String? byteSizeLabel = formatAttachmentByteSize(attachment.size);
    final Widget fallbackIcon = Center(
      child: Icon(
        isVideo
            ? PhosphorIconsFill.filmStrip
            : pendingUploadFileIcon(attachment.filename),
        size: 44,
        color: colors.textPrimaryMuted,
      ),
    );

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
                child: PendingUploadMedia(
                  attachment: attachment,
                  fallback: fallbackIcon,
                  borderRadius: 6,
                  overlay: PositionedDirectional(
                    top: 4,
                    end: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _RoundIconButton(
                          tooltip: l10n.chatAttachmentSpoilerLabel,
                          icon: isSpoiler
                              ? PhosphorIconsFill.eyeSlash
                              : PhosphorIconsFill.eye,
                          onPressed: () => togglePendingAttachmentSpoiler(
                            ref,
                            channelId: channelId,
                            attachment: attachment,
                          ),
                        ),
                        _RoundIconButton(
                          tooltip: l10n.chatAttachmentEditTitle,
                          icon: PhosphorIconsFill.pencilSimple,
                          onPressed: () => AttachmentEditModal.show(
                            context,
                            channelId: channelId,
                            attachment: attachment,
                          ),
                        ),
                        _RoundIconButton(
                          tooltip: l10n.chatAttachmentRemove,
                          icon: PhosphorIconsFill.trash,
                          onPressed: () => unawaited(
                            removePendingAttachment(
                              ref,
                              channelId: channelId,
                              attachment: attachment,
                            ),
                          ),
                          danger: true,
                        ),
                      ],
                    ),
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
      padding: const EdgeInsetsDirectional.only(start: 4),
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
