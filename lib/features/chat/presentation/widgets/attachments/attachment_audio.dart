import 'dart:async';

import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_controller.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/widgets/playback_seek_gesture_target.dart';
import 'package:fluxer_app/shared/widgets/volume_popout_control.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AttachmentAudio extends StatefulWidget {
  const AttachmentAudio({required this.attachment, super.key});

  final Attachment attachment;

  @override
  State<AttachmentAudio> createState() => _AttachmentAudioState();
}

class _AttachmentAudioState extends State<AttachmentAudio> {
  late ChatAttachmentAudioController _controller;

  String get _playbackUrl => attachmentEffectiveUrl(widget.attachment);

  @override
  void initState() {
    super.initState();
    _controller = _controllerForAttachment();
  }

  @override
  void didUpdateWidget(AttachmentAudio oldWidget) {
    super.didUpdateWidget(oldWidget);
    final ChatAttachmentAudioController next = _controllerForAttachment();
    if (identical(next, _controller)) {
      return;
    }
    unawaited(_controller.pause());
    _controller.detach();
    _controller = next;
  }

  @override
  void dispose() {
    _controller.detach();
    super.dispose();
  }

  ChatAttachmentAudioController _controllerForAttachment() {
    return ChatAttachmentAudioController(
      sourceUrl: _playbackUrl,
      attachment: widget.attachment,
      title: () => widget.attachment.filename,
    );
  }

  Future<void> _togglePlayback() async {
    final bool prepared = await _controller.togglePlayback();
    if (prepared || !mounted) {
      return;
    }
    await handleExternalLinkTap(context, _playbackUrl);
  }

  Future<void> _downloadAudio() async {
    final String? downloadUrl = attachmentEffectiveDownloadUrl(
      url: widget.attachment.url,
      isExpired: widget.attachment.expired ?? false,
      proxyUrl: widget.attachment.proxyUrl,
    );
    if (downloadUrl == null || !mounted) {
      return;
    }
    await handleExternalLinkTap(context, downloadUrl);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (BuildContext context, Widget? child) {
        return _AttachmentAudioBody(
          controller: _controller,
          attachment: widget.attachment,
          onTogglePlayback: _togglePlayback,
          onDownload: _downloadAudio,
        );
      },
    );
  }
}

class _AttachmentAudioBody extends StatelessWidget {
  const _AttachmentAudioBody({
    required this.controller,
    required this.attachment,
    required this.onTogglePlayback,
    required this.onDownload,
  });

  final ChatAttachmentAudioController controller;
  final Attachment attachment;
  final VoidCallback onTogglePlayback;
  final VoidCallback onDownload;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (String stem, String extension) =
        splitAttachmentFilenameStemAndExtension(attachment.filename);
    final String metaText = buildAttachmentSizeDurationMetaLine(
      fileSize: attachment.size,
      duration: controller.duration,
    );
    return RepaintBoundary(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.only(right: 12, left: 12, top: 12, bottom: 8),
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          border: Border.all(color: colors.backgroundModifierAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _AudioPlayButton(
                  isLoading: controller.isLoading,
                  isPlaying: controller.isPlaying,
                  onPressed: onTogglePlayback,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: context.textStyles.bodySmall.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(text: stem),
                            TextSpan(
                              text: extension,
                              style: context.textStyles.bodySmall.copyWith(
                                color: colors.textTertiary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (metaText.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          metaText,
                          style: context.textStyles.smallText.copyWith(
                            color: colors.textTertiary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            ValueListenableBuilder<Duration>(
              valueListenable: controller.position.notifier,
              builder:
                  (BuildContext context, Duration position, Widget? child) {
                    final double progress =
                        controller.duration.inMilliseconds <= 0
                        ? 0
                        : (position.inMilliseconds /
                                  controller.duration.inMilliseconds)
                              .clamp(0, 1);
                    final String timeText = formatAttachmentElapsedTotalMmSs(
                      elapsed: position,
                      total: controller.duration,
                    );
                    return Row(
                      children: [
                        Expanded(
                          child: PlaybackSeekGestureTarget(
                            enabled: controller.isPlaying,
                            onSeekFraction: (double fraction) {
                              unawaited(
                                controller.seekToRelativePosition(fraction),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(99),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 4,
                                backgroundColor: colors.textTertiary.withValues(
                                  alpha: 0.35,
                                ),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  colors.brandPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          timeText,
                          style: context.textStyles.smallText.copyWith(
                            color: colors.textTertiary,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    );
                  },
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                VolumePopoutControl(
                  volume: controller.volume,
                  isMuted: controller.isMuted,
                  onVolumeChanged: controller.setVolume,
                  onToggleMute: controller.toggleMute,
                ),
                const Spacer(),
                TextButton(
                  onPressed: controller.cyclePlaybackRate,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(44, 28),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: Text(
                    '${controller.playbackRate}x',
                    style: context.textStyles.smallText.copyWith(
                      color: colors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Tooltip(
                  message: FluxerLocalizations.of(context).uiDownload,
                  child: FluxerButton.circle(
                    onPressed: onDownload,
                    variant: FluxerButtonVariant.ghost,
                    size: FluxerButtonSize.compact,
                    icon: PhosphorIconsBold.downloadSimple,
                    semanticLabel: FluxerLocalizations.of(context).uiDownload,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AudioPlayButton extends StatelessWidget {
  const _AudioPlayButton({
    required this.isLoading,
    required this.isPlaying,
    required this.onPressed,
  });

  final bool isLoading;
  final bool isPlaying;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FluxerButton.circle(
      onPressed: onPressed,
      size: FluxerButtonSize.compact,
      isLoading: isLoading,
      icon: isPlaying ? PhosphorIconsFill.pause : PhosphorIconsFill.play,
      semanticLabel: isPlaying
          ? FluxerLocalizations.of(context).uiPause
          : FluxerLocalizations.of(context).uiPlay,
    );
  }
}
