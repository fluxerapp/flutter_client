import 'dart:async' show unawaited;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_stream_audio_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/voice_stream_audio_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:livekit_client/livekit_client.dart';

const double _kAreaAspect = 16 / 9;

enum VoiceParticipantTileSource { camera, screenShare }

/// Fills a 16:9 area with a LiveKit camera track when available, else an
/// avatar, plus optional “video intent” loading when the voice state has video
/// enabled but the track is not ready.
class VoiceParticipantMediaTile extends StatelessWidget {
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
    this.user,
    this.mirrorCamera = false,
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
  final bool isTileFocused;
  final bool pauseOwnScreenSharePreviewOnUnfocus;
  final String? streamPreviewUrl;
  final String? authToken;
  final database.User? user;
  final bool mirrorCamera;

  @override
  Widget build(BuildContext context) {
    final Participant? participant = _resolveParticipant();
    if (participant == null) {
      return _avatarStack(
        context,
        showVideoPending: false,
        backgroundColor: backgroundColor,
      );
    }
    final bool isScreenShareTile =
        tileSource == VoiceParticipantTileSource.screenShare;
    final String? streamKey = isScreenShareTile
        ? buildViewerStreamKey(voice: voice, isScreenShareTile: true)
        : null;
    final bool isOwnScreenShareTile =
        isScreenShareTile &&
        currentUserId != null &&
        userId == currentUserId &&
        localConnectionId != null &&
        voice.connectionId == localConnectionId;
    final bool hasOwnScreenSharePublication =
        isScreenShareTile &&
        _screenShareVideoPublication(participant, false) != null;
    if (isOwnScreenShareTile &&
        hasOwnScreenSharePublication &&
        pauseOwnScreenSharePreviewOnUnfocus &&
        !isTileFocused) {
      return _buildOwnScreenShareBroadcastingTile(context, backgroundColor);
    }
    return ListenableBuilder(
      listenable: participant,
      builder: (BuildContext context, Widget? _) {
        final TrackPublication? publication = isScreenShareTile
            ? _screenShareVideoPublication(participant, false)
            : _cameraPublication(participant);
        final Track? publicationTrack = publication?.track;
        final VideoTrack? track = publicationTrack is VideoTrack
            ? publicationTrack
            : null;
        if (isScreenShareTile && publication is RemoteTrackPublication) {
          if (isActiveScreenShare && !publication.subscribed) {
            unawaited(publication.subscribe());
          }
          if (!isActiveScreenShare && publication.subscribed) {
            unawaited(publication.unsubscribe());
          }
        }
        // Remote cameras are not auto-subscribed (autoSubscribe is off), so
        // subscribe here whenever the tile is displayed.
        if (!isScreenShareTile &&
            publication is RemoteTrackPublication &&
            !publication.subscribed) {
          unawaited(publication.subscribe());
        }
        TrackPublication? audioPublication;
        AudioTrack? audioTrack;
        if (isScreenShareTile) {
          audioPublication = _screenShareAudioPublication(participant, false);
          if (audioPublication is RemoteTrackPublication) {
            if (isActiveScreenShare && !audioPublication.subscribed) {
              unawaited(audioPublication.subscribe());
            }
            if (!isActiveScreenShare && audioPublication.subscribed) {
              unawaited(audioPublication.unsubscribe());
            }
          }
          final Track? audioPublicationTrack = audioPublication?.track;
          audioTrack = audioPublicationTrack is AudioTrack
              ? audioPublicationTrack
              : null;
        }
        if (track != null) {
          final bool isOwnCameraTile =
              tileSource == VoiceParticipantTileSource.camera &&
              currentUserId != null &&
              userId == currentUserId;
          Widget videoChild = VideoTrackRenderer(track);
          if (mirrorCamera && isOwnCameraTile) {
            videoChild = Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(-1, 1, 1),
              child: videoChild,
            );
          }
          final Widget videoWidget = ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ColoredBox(
              color: backgroundColor,
              child: AspectRatio(aspectRatio: _kAreaAspect, child: videoChild),
            ),
          );
          if (isScreenShareTile && !isActiveScreenShare) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                _nonWatchingPreviewLayer(videoWidget),
                Positioned.fill(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: _nonWatchingPreviewLayer(videoWidget),
                  ),
                ),
                const Positioned.fill(
                  child: ColoredBox(color: Color(0x55000000)),
                ),
              ],
            );
          }
          if (!isScreenShareTile) {
            return videoWidget;
          }
          if (!isActiveScreenShare || audioTrack == null) {
            return videoWidget;
          }
          return Stack(
            children: <Widget>[
              videoWidget,
              Positioned.fill(
                child: IgnorePointer(
                  child: _ScreenShareAudioPlayback(
                    streamKey: streamKey,
                    audioTrack: audioTrack,
                    isActiveScreenShare: isActiveScreenShare,
                  ),
                ),
              ),
            ],
          );
        }
        Widget fallbackWidget = _avatarStack(
          context,
          showVideoPending: isScreenShareTile
              ? voice.selfStream
              : voice.selfVideo,
          backgroundColor: backgroundColor,
        );
        // In the filmstrip a not-watched screen-share shows its preview
        // image (falling back to the avatar) instead of a watch button.
        if (isScreenShareTile && !isActiveScreenShare && isFilmstrip) {
          fallbackWidget = _nonWatchingPreviewLayer(fallbackWidget);
        }
        if (!isScreenShareTile || !isActiveScreenShare || audioTrack == null) {
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
                  isActiveScreenShare: isActiveScreenShare,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Participant? _resolveParticipant() {
    return resolveVoiceParticipant(
      room: room,
      voice: voice,
      userId: userId,
      currentUserId: currentUserId,
      localConnectionId: localConnectionId,
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
      child: AspectRatio(
        aspectRatio: _kAreaAspect,
        child: ColoredBox(
          color: backgroundColor,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              if (user != null)
                Center(
                  child: FluxerAvatar.fromUserRow(
                    user!,
                    size: 72,
                    showStatus: false,
                  ),
                )
              else
                Center(child: FluxerAvatar(fallbackText: display, size: 72)),
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
        ),
      ),
    );
  }

  Widget _nonWatchingPreviewLayer(Widget fallbackVideo) {
    final String? previewUrl = streamPreviewUrl;
    final String? token = authToken;
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
      fit: BoxFit.cover,
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
      child: AspectRatio(
        aspectRatio: _kAreaAspect,
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
