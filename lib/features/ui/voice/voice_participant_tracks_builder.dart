import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceParticipantTracksBuilder extends StatefulWidget {
  const VoiceParticipantTracksBuilder({
    required this.participant,
    required this.isScreenShare,
    required this.builder,
    super.key,
  });

  final VoiceMediaParticipant participant;
  final bool isScreenShare;
  final Widget Function(
    BuildContext context,
    VideoTrack? track,
    AudioTrack? audioTrack,
  )
  builder;

  @override
  State<VoiceParticipantTracksBuilder> createState() =>
      _VoiceParticipantTracksBuilderState();
}

class _VoiceParticipantTracksBuilderState
    extends State<VoiceParticipantTracksBuilder> {
  VideoTrack? _track;
  AudioTrack? _audioTrack;

  @override
  void initState() {
    super.initState();
    _readTracks();
    widget.participant.addListener(_onParticipantChanged);
  }

  @override
  void didUpdateWidget(covariant VoiceParticipantTracksBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.participant, widget.participant)) {
      oldWidget.participant.removeListener(_onParticipantChanged);
      widget.participant.addListener(_onParticipantChanged);
    }
    _readTracks();
  }

  @override
  void dispose() {
    widget.participant.removeListener(_onParticipantChanged);
    super.dispose();
  }

  void _readTracks() {
    _track = _currentTrack();
    _audioTrack = _currentAudioTrack();
  }

  VideoTrack? _currentTrack() {
    return widget.isScreenShare
        ? widget.participant.screenShareTrack
        : widget.participant.cameraTrack;
  }

  AudioTrack? _currentAudioTrack() {
    return widget.isScreenShare
        ? widget.participant.screenShareAudioTrack
        : null;
  }

  void _onParticipantChanged() {
    if (identical(_currentTrack(), _track) &&
        identical(_currentAudioTrack(), _audioTrack)) {
      return;
    }
    setState(_readTracks);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _track, _audioTrack);
  }
}
