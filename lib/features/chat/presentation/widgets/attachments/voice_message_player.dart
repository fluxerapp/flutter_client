import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_controller.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/services/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_waveform.dart';
import 'package:fluxer_app/features/chat/utils/media/media_proxy_url.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/widgets/playback_seek_gesture_target.dart';
import 'package:fluxer_app/shared/widgets/volume_popout_control.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceMessagePlayer extends StatefulWidget {
  const VoiceMessagePlayer({required this.attachment, super.key});

  final Attachment attachment;

  @override
  State<VoiceMessagePlayer> createState() => _VoiceMessagePlayerState();
}

class _VoiceMessagePlayerState extends State<VoiceMessagePlayer> {
  late ChatAttachmentAudioController _controller;
  late List<int> _waveformBars;
  String _sessionTitle = '';

  String get _playbackUrl =>
      buildMediaProxyUrl(attachmentEffectiveUrl(widget.attachment));

  @override
  void initState() {
    super.initState();
    _waveformBars = voiceMessagePlayerWaveformBars(widget.attachment.waveform);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sessionTitle = FluxerLocalizations.of(context).voiceMessageTitle;
    _controller = _controllerForAttachment();
  }

  @override
  void didUpdateWidget(VoiceMessagePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.attachment.waveform != widget.attachment.waveform) {
      _waveformBars = voiceMessagePlayerWaveformBars(
        widget.attachment.waveform,
      );
    }
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
      title: () =>
          _sessionTitle.isNotEmpty ? _sessionTitle : widget.attachment.filename,
    );
  }

  double get _displayDurationSeconds {
    if (_controller.duration > Duration.zero) {
      return _controller.duration.inMilliseconds / 1000;
    }
    final int? attachmentDuration = widget.attachment.duration;
    if (attachmentDuration != null && attachmentDuration > 0) {
      return attachmentDuration.toDouble();
    }
    return 0;
  }

  Future<void> _togglePlayback() async {
    if (!attachmentHasLoadableUrl(widget.attachment)) {
      return;
    }
    final bool prepared = await _controller.togglePlayback();
    if (prepared || !mounted) {
      return;
    }
    await handleExternalLinkTap(context, _playbackUrl);
  }

  KeyEventResult _handleWaveformKey(FocusNode node, KeyEvent event) {
    if (!_controller.isPlaying ||
        _controller.isLoading ||
        event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }
    const double step = 0.05;
    final double progressFraction =
        voiceMessagePlayerProgressPercent(
          position: _controller.position.value,
          trackDuration: _controller.duration,
          durationSeconds: _displayDurationSeconds,
          hasStarted: _controller.hasStarted,
          prePlaySeconds: 0,
        ) /
        100;
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      unawaited(_controller.seekToRelativePosition(progressFraction - step));
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      unawaited(_controller.seekToRelativePosition(progressFraction + step));
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (BuildContext context, Widget? child) {
        return _VoiceMessagePlayerBody(
          controller: _controller,
          waveformBars: _waveformBars,
          displayDurationSeconds: _displayDurationSeconds,
          onTogglePlayback: _togglePlayback,
          onWaveformKey: _handleWaveformKey,
        );
      },
    );
  }
}

class _VoiceMessagePlayerBody extends StatelessWidget {
  const _VoiceMessagePlayerBody({
    required this.controller,
    required this.waveformBars,
    required this.displayDurationSeconds,
    required this.onTogglePlayback,
    required this.onWaveformKey,
  });

  final ChatAttachmentAudioController controller;
  final List<int> waveformBars;
  final double displayDurationSeconds;
  final VoidCallback onTogglePlayback;
  final KeyEventResult Function(FocusNode node, KeyEvent event) onWaveformKey;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final Duration animDuration = context.motion.panel;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final bool isActive = controller.isPlaying || controller.isLoading;
    final Color idleBackground = colors.backgroundSecondary;
    final Color activeBackground = colors.brandPrimary;
    final Color backgroundColor = isActive ? activeBackground : idleBackground;
    final Color pastBarColor = isActive
        ? colors.textOnBrandPrimary
        : (isLight ? colors.brandPrimary : colors.brandPrimaryLight);
    final Color defaultBarColor = isActive
        ? colors.textOnBrandPrimary.withValues(alpha: 0.48)
        : colors.textTertiary;
    final Color timestampColor = isActive
        ? Color.lerp(colors.textOnBrandPrimary, Colors.transparent, 0.1)!
        : colors.textSecondary;
    final bool showDesktopControls = !isMobileLayout(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return RepaintBoundary(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 200, maxWidth: 300),
        child: AnimatedContainer(
          duration: animDuration,
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: colors.backgroundModifierAccent),
          ),
          child: Row(
            children: [
              _VoicePlayButton(
                isActive: isActive,
                isLoading: controller.isLoading,
                isPlaying: controller.isPlaying,
                onPressed: onTogglePlayback,
                animDuration: animDuration,
                colors: colors,
                playLabel: l10n.voiceMessagePlay,
                pauseLabel: l10n.voiceMessagePause,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ValueListenableBuilder<Duration>(
                  valueListenable: controller.position.notifier,
                  builder:
                      (BuildContext context, Duration position, Widget? child) {
                        final double progressPercent =
                            voiceMessagePlayerProgressPercent(
                              position: position,
                              trackDuration: controller.duration,
                              durationSeconds: displayDurationSeconds,
                              hasStarted: controller.hasStarted,
                              prePlaySeconds: 0,
                            );
                        return Focus(
                          onKeyEvent: onWaveformKey,
                          child: Semantics(
                            slider: true,
                            label: l10n.voiceMessageTitle,
                            value: progressPercent.round().toString(),
                            increasedValue: l10n.voiceMessageSeekForward,
                            decreasedValue: l10n.voiceMessageSeekBackward,
                            child: PlaybackSeekGestureTarget(
                              enabled: controller.isPlaying,
                              onSeekFraction: (double fraction) {
                                unawaited(
                                  controller.seekToRelativePosition(fraction),
                                );
                              },
                              child: _VoiceMessageWaveform(
                                waveformBars: waveformBars,
                                progressPercent: progressPercent,
                                pastBarColor: pastBarColor,
                                defaultBarColor: defaultBarColor,
                              ),
                            ),
                          ),
                        );
                      },
                ),
              ),
              const SizedBox(width: 8),
              ValueListenableBuilder<Duration>(
                valueListenable: controller.position.notifier,
                builder: (BuildContext context, Duration position, Widget? child) {
                  final String timestampText =
                      '${formatVoiceDurationSeconds(voiceMessagePlayerCurrentSeconds(position: position, trackDuration: controller.duration, durationSeconds: displayDurationSeconds, hasStarted: controller.hasStarted, prePlaySeconds: 0))} / '
                      '${formatVoiceDurationSeconds(displayDurationSeconds)}';
                  return Text(
                    timestampText,
                    style: context.textStyles.smallText.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      fontFeatures: const <FontFeature>[
                        FontFeature.tabularFigures(),
                      ],
                      color: timestampColor,
                    ),
                  );
                },
              ),
              if (showDesktopControls) ...<Widget>[
                const SizedBox(width: 4),
                TextButton(
                  onPressed: controller.cyclePlaybackRate,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(36, 28),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    foregroundColor: timestampColor,
                  ),
                  child: Text(
                    '${controller.playbackRate}x',
                    style: context.textStyles.smallText.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: timestampColor,
                    ),
                  ),
                ),
                VolumePopoutControl(
                  volume: controller.volume,
                  isMuted: controller.isMuted,
                  onVolumeChanged: controller.setVolume,
                  onToggleMute: controller.toggleMute,
                  iconSize: 16,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _VoiceMessageWaveform extends StatelessWidget {
  const _VoiceMessageWaveform({
    required this.waveformBars,
    required this.progressPercent,
    required this.pastBarColor,
    required this.defaultBarColor,
  });

  final List<int> waveformBars;
  final double progressPercent;
  final Color pastBarColor;
  final Color defaultBarColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kVoiceMessagePlayerWaveformHeightPx,
      child: Row(
        children: List<Widget>.generate(waveformBars.length, (int index) {
          final int value = waveformBars[index];
          final double heightRatio = math.max(
            kVoiceMessagePlayerMinBarHeightRatio,
            value / 255,
          );
          final double barProgress =
              ((index + 0.5) / waveformBars.length) * 100;
          final bool isPast = barProgress <= progressPercent;
          final double barHeight =
              kVoiceMessagePlayerWaveformHeightPx * heightRatio;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 0.5,
                right: index == waveformBars.length - 1 ? 0 : 0.5,
              ),
              child: Align(
                child: SizedBox(
                  height: barHeight,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isPast ? pastBarColor : defaultBarColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _VoicePlayButton extends StatelessWidget {
  const _VoicePlayButton({
    required this.isActive,
    required this.isLoading,
    required this.isPlaying,
    required this.onPressed,
    required this.animDuration,
    required this.colors,
    required this.playLabel,
    required this.pauseLabel,
  });

  final bool isActive;
  final bool isLoading;
  final bool isPlaying;
  final VoidCallback onPressed;
  final Duration animDuration;
  final FluxerColorTheme colors;
  final String playLabel;
  final String pauseLabel;

  @override
  Widget build(BuildContext context) {
    final Color idleFill = colors.brandPrimary;
    final Color idleIcon = colors.textOnBrandPrimary;
    final Color activeFill = colors.textOnBrandPrimary;
    final Color activeIcon = colors.brandPrimary;
    final Color fillColor = isActive ? activeFill : idleFill;
    final Color iconColor = isActive ? activeIcon : idleIcon;
    return Semantics(
      button: true,
      label: isPlaying ? pauseLabel : playLabel,
      child: SizedBox(
        width: 30,
        height: 30,
        child: AnimatedContainer(
          duration: animDuration,
          curve: Curves.easeOut,
          decoration: BoxDecoration(color: fillColor, shape: BoxShape.circle),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onPressed,
              child: ExcludeSemantics(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (isLoading)
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: iconColor,
                          ),
                        ),
                      ),
                    Icon(
                      isPlaying
                          ? PhosphorIconsFill.pause
                          : PhosphorIconsFill.play,
                      size: 16,
                      color: iconColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
