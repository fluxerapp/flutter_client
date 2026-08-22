import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_binding.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_playback.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/widgets/playback_seek_gesture_target.dart';
import 'package:fluxer_app/shared/widgets/volume_popout_control.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AttachmentAudio extends StatefulWidget {
  const AttachmentAudio({required this.attachment, super.key});

  final Attachment attachment;

  @override
  State<AttachmentAudio> createState() => _AttachmentAudioState();
}

class _AttachmentAudioState extends State<AttachmentAudio> {
  static const Duration _kSeekTimeout = Duration(seconds: 8);

  AudioPlayer? _player;
  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<void>? _playerCompleteSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  bool _isPlaying = false;
  bool _isLoading = false;
  bool _hasPreparedSource = false;
  bool _playbackFinished = false;
  final ChatAttachmentAudioPosition _audioPosition =
      ChatAttachmentAudioPosition();
  Duration _duration = Duration.zero;
  double _volume = 1;
  bool _isMuted = false;
  double _playbackRate = 1;
  late final ChatAttachmentAudioBinding _mediaSessionBinding =
      ChatAttachmentAudioBinding(
        hostId: widget.attachment.url,
        pausePlayback: _pauseFromMediaSession,
        resumePlayback: _resumeFromMediaSession,
        seekPlayback: _seekFromMediaSession,
        stopPlayback: _stopFromMediaSession,
      );
  late final ChatAttachmentAudioSessionReporter _sessionReporter =
      ChatAttachmentAudioSessionReporter(
        binding: _mediaSessionBinding,
        attachment: widget.attachment,
        title: () => widget.attachment.filename,
        totalDuration: () => _mediaSessionTotalDuration,
        playbackRate: () => _playbackRate,
        position: _audioPosition,
      );

  Future<void> _pauseFromMediaSession() async {
    await _player?.pause();
  }

  Future<void> _resumeFromMediaSession() async {
    if (_isLoading || widget.attachment.url.isEmpty) {
      return;
    }
    final AudioPlayer player = _ensurePlayer();
    if (_playbackFinished || _isAtEndOfTrack) {
      await _replayFromStart(player);
      return;
    }
    if (!_hasPreparedSource) {
      await player.setSourceUrl(widget.attachment.url);
      _hasPreparedSource = true;
    }
    await player.resume();
  }

  Future<void> _seekFromMediaSession(Duration position) async {
    if (_duration <= Duration.zero) {
      return;
    }
    final double relative = position.inMilliseconds / _duration.inMilliseconds;
    await _seekToRelativePosition(relative);
  }

  Future<void> _stopFromMediaSession() async {
    await _player?.stop();
    if (!mounted) {
      return;
    }
    setState(() {
      _isPlaying = false;
      _playbackFinished = false;
      _hasPreparedSource = false;
    });
    _audioPosition.update(Duration.zero);
  }

  Duration get _mediaSessionTotalDuration {
    if (_duration > Duration.zero) {
      return _duration;
    }
    final int? attachmentDuration = widget.attachment.duration;
    if (attachmentDuration != null && attachmentDuration > 0) {
      return Duration(milliseconds: attachmentDuration);
    }
    return Duration.zero;
  }

  bool get _isAtEndOfTrack =>
      _duration > Duration.zero && _audioPosition.value >= _duration;

  @override
  void dispose() {
    _mediaSessionBinding.release();
    _audioPosition.dispose();
    unawaited(_playerStateSubscription?.cancel());
    unawaited(_playerCompleteSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_player?.dispose());
    super.dispose();
  }

  Future<void> _togglePlayback() async {
    if (_isLoading || widget.attachment.url.isEmpty) {
      return;
    }
    if (_isPlaying) {
      await _player?.pause();
      _sessionReporter.sync(playing: false);
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final AudioPlayer player = _ensurePlayer();
      if (_playbackFinished || _isAtEndOfTrack) {
        await _replayFromStart(player);
        _sessionReporter.sync(playing: true);
        return;
      }
      if (!_hasPreparedSource) {
        _sessionReporter.sync(playing: false, loading: true);
        await player.setSourceUrl(widget.attachment.url);
        _hasPreparedSource = true;
      }
      await player.resume();
      _sessionReporter.sync(playing: true);
    } on Object {
      if (!mounted || _hasPreparedSource) {
        return;
      }
      await handleExternalLinkTap(context, widget.attachment.url);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _prepareFromStart(AudioPlayer player) async {
    _playbackFinished = false;
    if (!_hasPreparedSource) {
      await player.setSourceUrl(widget.attachment.url);
      _hasPreparedSource = true;
    } else {
      final bool seeked = await _safeSeek(player, Duration.zero);
      if (!seeked) {
        await player.setSourceUrl(widget.attachment.url);
        _hasPreparedSource = true;
      }
    }
    if (mounted) {
      _audioPosition.update(Duration.zero);
    }
  }

  Future<void> _replayFromStart(AudioPlayer player) async {
    await _prepareFromStart(player);
    await player.resume();
  }

  Future<bool> _safeSeek(AudioPlayer player, Duration target) async {
    try {
      await player.seek(target).timeout(_kSeekTimeout);
      return true;
    } on Object {
      return false;
    }
  }

  AudioPlayer _ensurePlayer() {
    final AudioPlayer? existingPlayer = _player;
    if (existingPlayer != null) {
      return existingPlayer;
    }
    final AudioPlayer player = AudioPlayer();
    _player = player;
    unawaited(player.setReleaseMode(ReleaseMode.stop));
    unawaited(player.setVolume(_isMuted ? 0 : _volume));
    unawaited(player.setPlaybackRate(_playbackRate));
    _playerStateSubscription = player.onPlayerStateChanged.listen((
      PlayerState playerState,
    ) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isPlaying = playerState == PlayerState.playing;
      });
      _sessionReporter.sync(playing: playerState == PlayerState.playing);
    });
    _playerCompleteSubscription = player.onPlayerComplete.listen((_) {
      if (!mounted) {
        return;
      }
      final Duration endPosition = _duration > Duration.zero
          ? _duration
          : Duration.zero;
      setState(() {
        _isPlaying = false;
        _playbackFinished = true;
      });
      if (endPosition > Duration.zero) {
        _audioPosition.update(endPosition);
      }
      _sessionReporter.sync(playing: false, completed: true);
    });
    _positionSubscription = player.onPositionChanged.listen((
      Duration position,
    ) {
      if (!mounted) {
        return;
      }
      _audioPosition.update(position);
      if (_isPlaying) {
        _sessionReporter.syncPositionIfDue(playing: true);
      }
    });
    _durationSubscription = player.onDurationChanged.listen((
      Duration duration,
    ) {
      if (!mounted) {
        return;
      }
      setState(() {
        _duration = duration;
      });
      if (_mediaSessionBinding.isActive) {
        _sessionReporter.sync(playing: _isPlaying);
      }
    });
    return player;
  }

  Future<void> _setVolume(double value) async {
    final double clamped = value.clamp(0, 1);
    setState(() {
      _volume = clamped;
      if (clamped > 0) {
        _isMuted = false;
      }
    });
    await _player?.setVolume(_isMuted ? 0 : clamped);
  }

  Future<void> _toggleMute() async {
    setState(() {
      _isMuted = !_isMuted;
    });
    await _player?.setVolume(_isMuted ? 0 : _volume);
  }

  Future<void> _cyclePlaybackRate() async {
    const List<double> rates = <double>[1, 1.25, 1.5, 2];
    final int index = rates.indexOf(_playbackRate);
    final int nextIndex = index < 0 || index == rates.length - 1
        ? 0
        : index + 1;
    final double nextRate = rates[nextIndex];
    setState(() {
      _playbackRate = nextRate;
    });
    await _player?.setPlaybackRate(nextRate);
    if (_mediaSessionBinding.isActive) {
      _sessionReporter.sync(playing: _isPlaying);
    }
  }

  Future<void> _downloadAudio() async {
    if (widget.attachment.url.isEmpty || !mounted) {
      return;
    }
    await handleExternalLinkTap(context, widget.attachment.url);
  }

  Future<void> _seekToRelativePosition(double relative) async {
    if (_duration <= Duration.zero) {
      return;
    }
    final double normalized = relative.clamp(0, 1);
    final int targetMilliseconds = (_duration.inMilliseconds * normalized)
        .round();
    final Duration target = Duration(milliseconds: targetMilliseconds);
    final AudioPlayer player = _ensurePlayer();
    if (_playbackFinished) {
      await _prepareFromStart(player);
    }
    if (!_hasPreparedSource) {
      return;
    }
    final bool seeked = await _safeSeek(player, target);
    if (!seeked) {
      await player.setSourceUrl(widget.attachment.url);
      _hasPreparedSource = true;
      await _safeSeek(player, target);
    }
    if (mounted) {
      _audioPosition.update(target);
      setState(() {
        _playbackFinished = false;
      });
      _sessionReporter.sync(playing: _isPlaying);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final (String stem, String extension) =
        splitAttachmentFilenameStemAndExtension(widget.attachment.filename);
    final String metaText = buildAttachmentSizeDurationMetaLine(
      fileSize: widget.attachment.size,
      duration: _duration,
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
                  isLoading: _isLoading,
                  isPlaying: _isPlaying,
                  onPressed: _togglePlayback,
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
              valueListenable: _audioPosition.notifier,
              builder:
                  (BuildContext context, Duration position, Widget? child) {
                    final double progress = _duration.inMilliseconds <= 0
                        ? 0
                        : (position.inMilliseconds / _duration.inMilliseconds)
                              .clamp(0, 1);
                    final String timeText = formatAttachmentElapsedTotalMmSs(
                      elapsed: position,
                      total: _duration,
                    );
                    return Row(
                      children: [
                        Expanded(
                          child: PlaybackSeekGestureTarget(
                            onSeekFraction: (double fraction) {
                              unawaited(_seekToRelativePosition(fraction));
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
                  volume: _volume,
                  isMuted: _isMuted,
                  onVolumeChanged: _setVolume,
                  onToggleMute: _toggleMute,
                ),
                const Spacer(),
                TextButton(
                  onPressed: _cyclePlaybackRate,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(44, 28),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                  child: Text(
                    '${_playbackRate}x',
                    style: context.textStyles.smallText.copyWith(
                      color: colors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Tooltip(
                  message: 'Download',
                  child: FluxerButton.circle(
                    onPressed: _downloadAudio,
                    variant: FluxerButtonVariant.ghost,
                    size: FluxerButtonSize.compact,
                    icon: PhosphorIconsBold.downloadSimple,
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
    );
  }
}
