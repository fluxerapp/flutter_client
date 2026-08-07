import 'dart:async';
import 'dart:math' as math;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/service/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_waveform.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
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
  static const Duration _kSeekTimeout = Duration(seconds: 8);

  AudioPlayer? _player;
  StreamSubscription<PlayerState>? _playerStateSubscription;
  StreamSubscription<void>? _playerCompleteSubscription;
  StreamSubscription<Duration>? _positionSubscription;
  StreamSubscription<Duration>? _durationSubscription;
  bool _isPlaying = false;
  bool _isLoading = false;
  bool _hasPreparedSource = false;
  bool _hasStarted = false;
  bool _playbackFinished = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  double _prePlaySeconds = 0;
  double? _pendingSeekFraction;
  double _volume = 1;
  bool _isMuted = false;
  double _playbackRate = 1;
  late List<int> _waveformBars = voiceMessagePlayerWaveformBars(
    widget.attachment.waveform,
  );

  @override
  void didUpdateWidget(VoiceMessagePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.attachment.waveform != widget.attachment.waveform) {
      _waveformBars = voiceMessagePlayerWaveformBars(
        widget.attachment.waveform,
      );
    }
  }

  @override
  void dispose() {
    unawaited(_playerStateSubscription?.cancel());
    unawaited(_playerCompleteSubscription?.cancel());
    unawaited(_positionSubscription?.cancel());
    unawaited(_durationSubscription?.cancel());
    unawaited(_player?.dispose());
    super.dispose();
  }

  String get _playbackUrl {
    final String rawUrl = widget.attachment.proxyUrl ?? widget.attachment.url;
    return buildMediaProxyUrl(rawUrl);
  }

  double get _displayDurationSeconds {
    if (_duration > Duration.zero) {
      return _duration.inMilliseconds / 1000;
    }
    final int? attachmentDuration = widget.attachment.duration;
    if (attachmentDuration != null && attachmentDuration > 0) {
      return attachmentDuration.toDouble();
    }
    return 0;
  }

  double get _displayCurrentSeconds {
    if (_hasStarted && _duration > Duration.zero) {
      return _position.inMilliseconds / 1000;
    }
    if (!_hasStarted && _displayDurationSeconds > 0) {
      return _prePlaySeconds;
    }
    return 0;
  }

  double get _displayProgressPercent {
    final double durationSeconds = _displayDurationSeconds;
    if (durationSeconds <= 0) {
      return 0;
    }
    return (_displayCurrentSeconds / durationSeconds * 100).clamp(0, 100);
  }

  bool get _isActive => _isPlaying || (_hasStarted && _isLoading);

  Future<void> _togglePlayback() async {
    if (_isLoading || widget.attachment.url.isEmpty) {
      return;
    }
    if (_isPlaying) {
      await _player?.pause();
      return;
    }
    setState(() {
      _isLoading = true;
      _hasStarted = true;
    });
    try {
      final AudioPlayer player = _ensurePlayer();
      if (_playbackFinished || _isAtEndOfTrack) {
        await _replayFromStart(player);
        return;
      }
      if (!_hasPreparedSource) {
        await player.setSourceUrl(_playbackUrl);
        _hasPreparedSource = true;
        await _applyPendingSeek(player);
      }
      await player.resume();
    } on Object {
      if (!mounted || _hasPreparedSource) {
        return;
      }
      await handleExternalLinkTap(context, _playbackUrl);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  bool get _isAtEndOfTrack =>
      _duration > Duration.zero && _position >= _duration;

  Future<void> _prepareFromStart(AudioPlayer player) async {
    _playbackFinished = false;
    if (!_hasPreparedSource) {
      await player.setSourceUrl(_playbackUrl);
      _hasPreparedSource = true;
    } else {
      final bool seeked = await _safeSeek(player, Duration.zero);
      if (!seeked) {
        await player.setSourceUrl(_playbackUrl);
        _hasPreparedSource = true;
      }
    }
    if (mounted) {
      setState(() {
        _position = Duration.zero;
        _prePlaySeconds = 0;
        _pendingSeekFraction = null;
      });
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

  Future<void> _applyPendingSeek(AudioPlayer player) async {
    final double? fraction = _pendingSeekFraction;
    if (fraction == null) {
      return;
    }
    final double durationSeconds = _displayDurationSeconds;
    if (durationSeconds <= 0) {
      return;
    }
    final int targetMs = (durationSeconds * 1000 * fraction.clamp(0, 1))
        .round();
    final Duration target = Duration(milliseconds: targetMs);
    if (_playbackFinished) {
      await _prepareFromStart(player);
    }
    final bool seeked = await _safeSeek(player, target);
    if (!seeked && _hasPreparedSource) {
      await player.setSourceUrl(_playbackUrl);
      await _safeSeek(player, target);
    }
    if (mounted) {
      setState(() {
        _position = target;
        _prePlaySeconds = target.inMilliseconds / 1000;
        _pendingSeekFraction = null;
        _playbackFinished = false;
      });
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
    });
    _playerCompleteSubscription = player.onPlayerComplete.listen((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isPlaying = false;
        _playbackFinished = true;
        if (_duration > Duration.zero) {
          _position = _duration;
        }
      });
    });
    _positionSubscription = player.onPositionChanged.listen((
      Duration position,
    ) {
      if (!mounted) {
        return;
      }
      setState(() {
        _position = position;
      });
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
      if (_pendingSeekFraction != null) {
        unawaited(_applyPendingSeek(player));
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
  }

  Future<void> _seekToFraction(double fraction) async {
    final double normalized = fraction.clamp(0, 1);
    final double durationSeconds = _displayDurationSeconds;
    if (durationSeconds <= 0) {
      return;
    }
    if (!_hasStarted || _duration <= Duration.zero) {
      setState(() {
        _prePlaySeconds = durationSeconds * normalized;
        _pendingSeekFraction = normalized;
      });
      return;
    }
    final int targetMs = (durationSeconds * 1000 * normalized).round();
    final Duration target = Duration(milliseconds: targetMs);
    final AudioPlayer player = _ensurePlayer();
    if (_playbackFinished) {
      await _prepareFromStart(player);
    }
    if (!_hasPreparedSource) {
      return;
    }
    final bool seeked = await _safeSeek(player, target);
    if (!seeked) {
      await player.setSourceUrl(_playbackUrl);
      _hasPreparedSource = true;
      await _safeSeek(player, target);
    }
    if (mounted) {
      setState(() {
        _position = target;
        _playbackFinished = false;
      });
    }
  }

  KeyEventResult _handleWaveformKey(FocusNode node, KeyEvent event) {
    if (_isLoading || event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }
    const double step = 0.05;
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      unawaited(_seekToFraction((_displayProgressPercent / 100) - step));
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      unawaited(_seekToFraction((_displayProgressPercent / 100) + step));
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final Duration animDuration = reduceMotion
        ? Duration.zero
        : const Duration(milliseconds: 200);
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final Color idleBackground = colors.backgroundSecondary;
    final Color activeBackground = colors.brandPrimary;
    final Color backgroundColor = _isActive ? activeBackground : idleBackground;
    final Color pastBarColor = _isActive
        ? colors.textOnBrandPrimary
        : (isLight ? colors.brandPrimary : colors.brandPrimaryLight);
    final Color defaultBarColor = _isActive
        ? colors.textOnBrandPrimary.withValues(alpha: 0.48)
        : colors.textTertiary;
    final Color timestampColor = _isActive
        ? Color.lerp(colors.textOnBrandPrimary, Colors.transparent, 0.1)!
        : colors.textSecondary;
    final double progressPercent = _displayProgressPercent;
    final String timestampText =
        '${formatVoiceDurationSeconds(_displayCurrentSeconds)} / '
        '${formatVoiceDurationSeconds(_displayDurationSeconds)}';
    final bool showDesktopControls = !isMobileLayout(context);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ConstrainedBox(
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
              isActive: _isActive,
              isLoading: _hasStarted && _isLoading,
              isPlaying: _isPlaying,
              onPressed: _togglePlayback,
              animDuration: animDuration,
              colors: colors,
              playLabel: l10n.voiceMessagePlay,
              pauseLabel: l10n.voiceMessagePause,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Focus(
                onKeyEvent: _handleWaveformKey,
                child: Semantics(
                  slider: true,
                  label: l10n.voiceMessageTitle,
                  value: progressPercent.round().toString(),
                  increasedValue: l10n.voiceMessageSeekForward,
                  decreasedValue: l10n.voiceMessageSeekBackward,
                  child: PlaybackSeekGestureTarget(
                    enabled: !_isLoading,
                    onSeekFraction: (double fraction) {
                      unawaited(_seekToFraction(fraction));
                    },
                    child: SizedBox(
                      height: kVoiceMessagePlayerWaveformHeightPx,
                      child: Row(
                        children: List<Widget>.generate(_waveformBars.length, (
                          int index,
                        ) {
                          final int value = _waveformBars[index];
                          final double heightRatio = math.max(
                            kVoiceMessagePlayerMinBarHeightRatio,
                            value / 255,
                          );
                          final double barProgress =
                              ((index + 0.5) / _waveformBars.length) * 100;
                          final bool isPast = barProgress <= progressPercent;
                          final double barHeight =
                              kVoiceMessagePlayerWaveformHeightPx * heightRatio;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 0 : 0.5,
                                right: index == _waveformBars.length - 1
                                    ? 0
                                    : 0.5,
                              ),
                              child: Align(
                                child: SizedBox(
                                  height: barHeight,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isPast
                                          ? pastBarColor
                                          : defaultBarColor,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              timestampText,
              style: context.textStyles.smallText.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
                color: timestampColor,
              ),
            ),
            if (showDesktopControls) ...<Widget>[
              const SizedBox(width: 4),
              TextButton(
                onPressed: _cyclePlaybackRate,
                style: TextButton.styleFrom(
                  minimumSize: const Size(36, 28),
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  foregroundColor: timestampColor,
                ),
                child: Text(
                  '${_playbackRate}x',
                  style: context.textStyles.smallText.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: timestampColor,
                  ),
                ),
              ),
              VolumePopoutControl(
                volume: _volume,
                isMuted: _isMuted,
                onVolumeChanged: _setVolume,
                onToggleMute: _toggleMute,
                iconSize: 16,
              ),
            ],
          ],
        ),
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
