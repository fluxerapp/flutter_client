import 'dart:async' show Timer, unawaited;
import 'dart:ui' show ImageFilter;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/voice/voice_call_avatar.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_stream_audio_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/voice_stream_audio_utils.dart';
import 'package:fluxer_app/features/voice/utils/voice_video_subscription.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:visibility_detector/visibility_detector.dart';

enum VoiceParticipantTileSource { camera, screenShare }

/// Renders a LiveKit camera/screen-share track, or an avatar fallback.
class VoiceParticipantMediaTile extends StatefulWidget {
  const VoiceParticipantMediaTile({
    required this.room,
    required this.userId,
    required this.currentUserId,
    required this.localConnectionId,
    required this.voice,
    required this.display,
    required this.backgroundColor,
    required this.tileSource,
    required this.isActiveScreenShare,
    required this.streamPreviewUrl,
    required this.authToken,
    this.isTileFocused = true,
    this.pauseOwnScreenSharePreviewOnUnfocus = true,
    this.isFilmstrip = false,
    this.fillContainer = false,
    this.user,
    this.mirrorCamera = false,
    this.omitVideoTrack = false,
    super.key,
  });

  final Room? room;
  final String userId;
  final String? currentUserId;
  final String? localConnectionId;
  final VoiceState voice;
  final String display;
  final Color backgroundColor;
  final VoiceParticipantTileSource tileSource;
  final bool isActiveScreenShare;
  final bool isFilmstrip;
  final bool fillContainer;
  final bool isTileFocused;
  final bool pauseOwnScreenSharePreviewOnUnfocus;
  final String? streamPreviewUrl;
  final String? authToken;
  final database.User? user;
  final bool mirrorCamera;
  final bool omitVideoTrack;

  @override
  State<VoiceParticipantMediaTile> createState() =>
      _VoiceParticipantMediaTileState();
}

class _VoiceParticipantMediaTileState extends State<VoiceParticipantMediaTile> {
  bool _tileVisible = false;
  bool _blurReady = false;
  bool _trackSyncScheduled = false;
  Timer? _unsubscribeGrace;
  String? _lastVideoIntent;
  String? _lastAudioIntent;

  @override
  void initState() {
    super.initState();
    _maybeArmScreenShareBlur();
  }

  @override
  void didUpdateWidget(covariant VoiceParticipantMediaTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _maybeArmScreenShareBlur();
    _scheduleRemoteTrackSync();
  }

  @override
  void dispose() {
    _unsubscribeGrace?.cancel();
    super.dispose();
  }

  Key get _visibilityKey {
    return ValueKey<String>(
      'voice-tile-vis-${widget.userId}-'
      '${widget.voice.connectionId}-${widget.tileSource.name}',
    );
  }

  void _maybeArmScreenShareBlur() {
    if (_blurReady) {
      return;
    }
    if (widget.tileSource != VoiceParticipantTileSource.screenShare ||
        widget.isActiveScreenShare) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _blurReady) {
        return;
      }
      setState(() => _blurReady = true);
    });
  }

  void _scheduleRemoteTrackSync() {
    if (_trackSyncScheduled) {
      return;
    }
    _trackSyncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _trackSyncScheduled = false;
      if (!mounted) {
        return;
      }
      _applyRemoteTrackSync();
    });
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) {
      return;
    }
    final bool visible = info.visibleFraction > 0;
    if (visible == _tileVisible && _unsubscribeGrace == null) {
      return;
    }
    _unsubscribeGrace?.cancel();
    if (visible) {
      _unsubscribeGrace = null;
      if (!_tileVisible) {
        setState(() => _tileVisible = true);
      }
      _scheduleRemoteTrackSync();
      return;
    }
    _unsubscribeGrace = Timer(kVoiceVideoUnsubscribeGrace, () {
      if (!mounted) {
        return;
      }
      setState(() => _tileVisible = false);
      _scheduleRemoteTrackSync();
    });
  }

  void _applyRemoteTrackSync() {
    final Participant? participant = _resolveParticipant();
    if (participant == null) {
      return;
    }
    final bool isScreenShareTile =
        widget.tileSource == VoiceParticipantTileSource.screenShare;
    _syncRemoteVideo(
      publication: isScreenShareTile
          ? _screenShareVideoPublication(participant, false)
          : _cameraPublication(participant),
      isScreenShareTile: isScreenShareTile,
    );
    if (isScreenShareTile) {
      _syncRemoteScreenShareAudio(
        publication: _screenShareAudioPublication(participant, false),
      );
    }
  }

  void _syncRemoteVideo({
    required TrackPublication? publication,
    required bool isScreenShareTile,
  }) {
    if (publication is! RemoteTrackPublication) {
      return;
    }
    final bool shouldSubscribe = isScreenShareTile
        ? shouldSubscribeRemoteScreenShare(
            isActiveScreenShare: widget.isActiveScreenShare,
          )
        : shouldSubscribeRemoteCamera(
            tileVisible: _tileVisible,
            omitVideoTrack: widget.omitVideoTrack,
          );
    final String intent = '${publication.sid}:$shouldSubscribe';
    if (intent == _lastVideoIntent) {
      return;
    }
    _lastVideoIntent = intent;
    unawaited(
      syncRemoteVideoSubscription(
        publication: publication,
        shouldSubscribe: shouldSubscribe,
      ),
    );
  }

  void _syncRemoteScreenShareAudio({required TrackPublication? publication}) {
    if (publication is! RemoteTrackPublication) {
      return;
    }
    final bool shouldSubscribe = widget.isActiveScreenShare;
    if (shouldSubscribe) {
      if (!publication.subscribed) {
        unawaited(publication.subscribe());
      }
      _lastAudioIntent = null;
      return;
    }
    final String intent = '${publication.sid}:false';
    if (intent == _lastAudioIntent) {
      return;
    }
    _lastAudioIntent = intent;
    if (publication.subscribed) {
      unawaited(publication.unsubscribe());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Participant? participant = _resolveParticipant();
    if (participant == null) {
      return VisibilityDetector(
        key: _visibilityKey,
        onVisibilityChanged: _onVisibilityChanged,
        child: _avatarStack(
          context,
          showVideoPending: false,
          backgroundColor: widget.backgroundColor,
        ),
      );
    }
    final bool isScreenShareTile =
        widget.tileSource == VoiceParticipantTileSource.screenShare;
    final String? streamKey = isScreenShareTile
        ? buildViewerStreamKey(voice: widget.voice, isScreenShareTile: true)
        : null;
    final bool isOwnScreenShareTile =
        isScreenShareTile &&
        widget.currentUserId != null &&
        widget.userId == widget.currentUserId &&
        widget.localConnectionId != null &&
        widget.voice.connectionId == widget.localConnectionId;
    final bool hasOwnScreenSharePublication =
        isScreenShareTile &&
        _screenShareVideoPublication(participant, false) != null;
    if (isOwnScreenShareTile &&
        hasOwnScreenSharePublication &&
        widget.pauseOwnScreenSharePreviewOnUnfocus &&
        !widget.isTileFocused) {
      return _buildOwnScreenShareBroadcastingTile(
        context,
        widget.backgroundColor,
      );
    }
    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: ListenableBuilder(
        listenable: participant,
        builder: (BuildContext context, Widget? _) {
          _scheduleRemoteTrackSync();
          final TrackPublication? publication = isScreenShareTile
              ? _screenShareVideoPublication(participant, false)
              : _cameraPublication(participant);
          final Track? publicationTrack = publication?.track;
          final VideoTrack? track = publicationTrack is VideoTrack
              ? publicationTrack
              : null;
          AudioTrack? audioTrack;
          if (isScreenShareTile) {
            final Track? audioPublicationTrack = _screenShareAudioPublication(
              participant,
              false,
            )?.track;
            audioTrack = audioPublicationTrack is AudioTrack
                ? audioPublicationTrack
                : null;
          }
          if (track != null) {
            if (widget.omitVideoTrack) {
              Widget hole = ColoredBox(color: widget.backgroundColor);
              if (isScreenShareTile &&
                  widget.isActiveScreenShare &&
                  audioTrack != null) {
                hole = Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    hole,
                    Positioned.fill(
                      child: IgnorePointer(
                        child: _ScreenShareAudioPlayback(
                          streamKey: streamKey,
                          audioTrack: audioTrack,
                          isActiveScreenShare: widget.isActiveScreenShare,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return hole;
            }
            final bool isOwnCameraTile =
                widget.tileSource == VoiceParticipantTileSource.camera &&
                widget.currentUserId != null &&
                widget.userId == widget.currentUserId;
            final VideoViewFit fit = isScreenShareTile || widget.fillContainer
                ? VideoViewFit.contain
                : VideoViewFit.cover;
            final VideoViewMirrorMode mirrorMode;
            if (!isOwnCameraTile || isScreenShareTile) {
              mirrorMode = VideoViewMirrorMode.off;
            } else if (widget.mirrorCamera) {
              mirrorMode = VideoViewMirrorMode.mirror;
            } else {
              mirrorMode = VideoViewMirrorMode.off;
            }
            final Widget videoChild = VideoTrackRenderer(
              track,
              fit: fit,
              mirrorMode: mirrorMode,
            );
            final Widget videoWidget = ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ColoredBox(
                color: widget.backgroundColor,
                child: SizedBox.expand(child: videoChild),
              ),
            );
            if (isScreenShareTile && !widget.isActiveScreenShare) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned.fill(child: _nonWatchingPreviewLayer(videoWidget)),
                  const Positioned.fill(
                    child: ColoredBox(color: Color(0x55000000)),
                  ),
                  if (_blurReady)
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: const ColoredBox(color: Color(0x22000000)),
                      ),
                    ),
                ],
              );
            }
            if (!isScreenShareTile) {
              return videoWidget;
            }
            if (!widget.isActiveScreenShare || audioTrack == null) {
              return videoWidget;
            }
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                videoWidget,
                Positioned.fill(
                  child: IgnorePointer(
                    child: _ScreenShareAudioPlayback(
                      streamKey: streamKey,
                      audioTrack: audioTrack,
                      isActiveScreenShare: widget.isActiveScreenShare,
                    ),
                  ),
                ),
              ],
            );
          }
          Widget fallbackWidget = _avatarStack(
            context,
            showVideoPending: isScreenShareTile
                ? widget.voice.selfStream
                : widget.voice.selfVideo,
            backgroundColor: widget.backgroundColor,
          );
          if (isScreenShareTile &&
              !widget.isActiveScreenShare &&
              widget.isFilmstrip) {
            fallbackWidget = _nonWatchingPreviewLayer(fallbackWidget);
          }
          if (!isScreenShareTile ||
              !widget.isActiveScreenShare ||
              audioTrack == null) {
            return fallbackWidget;
          }
          return Stack(
            children: <Widget>[
              fallbackWidget,
              Positioned.fill(
                child: IgnorePointer(
                  child: _ScreenShareAudioPlayback(
                    streamKey: streamKey,
                    audioTrack: audioTrack,
                    isActiveScreenShare: widget.isActiveScreenShare,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Participant? _resolveParticipant() {
    return resolveVoiceParticipant(
      room: widget.room,
      voice: widget.voice,
      userId: widget.userId,
      currentUserId: widget.currentUserId,
      localConnectionId: widget.localConnectionId,
    );
  }

  static TrackPublication? _cameraPublication(Participant participant) {
    return resolveCameraPublicationAllowingNoTrack(participant);
  }

  static TrackPublication? _screenShareVideoPublication(
    Participant participant,
    bool requireTrack,
  ) {
    return resolveScreenShareVideoPublication(
      participant: participant,
      requireTrack: requireTrack,
    );
  }

  static TrackPublication? _screenShareAudioPublication(
    Participant participant,
    bool requireTrack,
  ) {
    return resolveScreenShareAudioPublication(
      participant: participant,
      requireTrack: requireTrack,
    );
  }

  Widget _avatarStack(
    BuildContext context, {
    required bool showVideoPending,
    required Color backgroundColor,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          VoiceCallAvatar(
            background: backgroundColor,
            userId: widget.userId,
            user: widget.user,
            fallbackText: widget.display,
          ),
          if (showVideoPending)
            const Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: FluxerLoadingSpinner(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _nonWatchingPreviewLayer(Widget fallbackVideo) {
    final String? previewUrl = widget.streamPreviewUrl;
    final String? token = widget.authToken;
    if (previewUrl == null || previewUrl.isEmpty) {
      return fallbackVideo;
    }
    final Map<String, String>? headers = token == null || token.isEmpty
        ? null
        : <String, String>{
            'Authorization': formatSessionAuthorizationHeader(token),
          };
    return Image.network(
      previewUrl,
      fit: BoxFit.contain,
      headers: headers,
      errorBuilder: (BuildContext _, Object _, StackTrace? _) {
        return fallbackVideo;
      },
      loadingBuilder:
          (BuildContext _, Widget child, ImageChunkEvent? progress) {
            if (progress == null) {
              return child;
            }
            return fallbackVideo;
          },
    );
  }

  Widget _buildOwnScreenShareBroadcastingTile(
    BuildContext context,
    Color backgroundColor,
  ) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.88),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(
                  Icons.screen_share_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 30,
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.voiceOwnScreenShareTitle,
                  textAlign: TextAlign.center,
                  style: context.textStyles.channelName.copyWith(
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.voiceOwnScreenShareSubtitle,
                  textAlign: TextAlign.center,
                  style: context.textStyles.timestamp.copyWith(
                    color: const Color(0xCCFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ScreenShareAudioPlayback extends ConsumerStatefulWidget {
  const _ScreenShareAudioPlayback({
    required this.streamKey,
    required this.audioTrack,
    required this.isActiveScreenShare,
  });

  final String? streamKey;
  final AudioTrack audioTrack;
  final bool isActiveScreenShare;

  @override
  ConsumerState<_ScreenShareAudioPlayback> createState() =>
      _ScreenShareAudioPlaybackState();
}

class _ScreenShareAudioPlaybackState
    extends ConsumerState<_ScreenShareAudioPlayback> {
  AudioTrack? _currentTrack;
  var _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _syncPlayback();
  }

  @override
  void didUpdateWidget(covariant _ScreenShareAudioPlayback oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.audioTrack != widget.audioTrack ||
        oldWidget.isActiveScreenShare != widget.isActiveScreenShare ||
        oldWidget.streamKey != widget.streamKey) {
      _syncPlayback();
      return;
    }
    unawaited(_applyVolume());
  }

  @override
  void dispose() {
    _stopTrack();
    super.dispose();
  }

  VoiceStreamAudioPrefsState get _streamPrefs =>
      ref.read(voiceStreamAudioProvider);

  bool get _isPlaybackEnabled {
    if (!widget.isActiveScreenShare) {
      return false;
    }
    final String? streamKey = widget.streamKey;
    if (streamKey == null) {
      return true;
    }
    return !_streamPrefs.isMuted(streamKey);
  }

  void _syncPlayback() {
    if (_isPlaybackEnabled) {
      _startTrack(widget.audioTrack);
      return;
    }
    _stopTrack();
  }

  Future<void> _applyVolume() async {
    final AudioTrack? track = _currentTrack;
    if (track == null || !_isPlaying) {
      return;
    }
    final String? streamKey = widget.streamKey;
    final int outputVolume = ref.read(voiceSettingsProvider).outputVolume;
    final int streamVolume = streamKey == null
        ? kDefaultVoiceVolumePercent
        : _streamPrefs.volumeFor(streamKey);
    await applyStreamVolumeToTrack(
      track: track,
      streamVolumePercent: streamVolume,
      outputVolumePercent: outputVolume,
    );
  }

  void _startTrack(AudioTrack track) {
    if (_currentTrack == track && _isPlaying) {
      unawaited(_applyVolume());
      return;
    }
    _stopTrack();
    _currentTrack = track;
    _isPlaying = true;
    unawaited(() async {
      await track.start();
      if (!mounted || _currentTrack != track) {
        return;
      }
      await _applyVolume();
    }());
  }

  void _stopTrack() {
    final AudioTrack? track = _currentTrack;
    if (track == null) {
      return;
    }
    _currentTrack = null;
    _isPlaying = false;
    unawaited(track.stop());
  }

  void _onStreamPrefsChanged() {
    _syncPlayback();
    unawaited(_applyVolume());
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..listen<VoiceStreamAudioPrefsState>(
        voiceStreamAudioProvider,
        (_, _) => _onStreamPrefsChanged(),
      )
      ..listen<VoiceSettingsState>(
        voiceSettingsProvider,
        (_, _) => unawaited(_applyVolume()),
      );
    return const SizedBox.shrink();
  }
}
