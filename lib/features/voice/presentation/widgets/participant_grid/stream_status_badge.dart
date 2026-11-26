import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/media/stream_info.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceStreamStatusBadge extends StatefulWidget {
  const VoiceStreamStatusBadge({
    required this.participant,
    required this.collectQuality,
    this.pollStats = true,
    super.key,
  });

  final VoiceMediaParticipant? participant;
  final bool collectQuality;
  final bool pollStats;

  @override
  State<VoiceStreamStatusBadge> createState() => _VoiceStreamStatusBadgeState();
}

class _VoiceStreamStatusBadgeState extends State<VoiceStreamStatusBadge> {
  static const double _kPadding = 6;
  static const double _kGap = 4;
  static const TextStyle _kTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  VoiceStreamQuality _quality = kEmptyVoiceStreamQuality;
  late final VoiceStreamStatsSubscription _stats = VoiceStreamStatsSubscription(
    _refresh,
  );
  VideoTrack? _observedTrack;
  bool _observedHasScreenShare = false;

  @override
  void initState() {
    super.initState();
    _observeParticipant();
    widget.participant?.addListener(_onParticipantChanged);
    _syncStatsListener();
    _refresh();
  }

  @override
  void didUpdateWidget(VoiceStreamStatusBadge oldWidget) {
    super.didUpdateWidget(oldWidget);
    final bool participantChanged = oldWidget.participant != widget.participant;
    if (participantChanged) {
      oldWidget.participant?.removeListener(_onParticipantChanged);
      widget.participant?.addListener(_onParticipantChanged);
      _observeParticipant();
    }
    final bool collectChanged =
        oldWidget.collectQuality != widget.collectQuality;
    final bool pollChanged = oldWidget.pollStats != widget.pollStats;
    if (participantChanged || collectChanged || pollChanged) {
      _syncStatsListener();
    }
    if (participantChanged ||
        collectChanged ||
        (pollChanged && widget.pollStats)) {
      _refresh();
    }
  }

  @override
  void dispose() {
    _stats.dispose();
    widget.participant?.removeListener(_onParticipantChanged);
    super.dispose();
  }

  void _observeParticipant() {
    _observedTrack = widget.participant?.screenShareTrack;
    _observedHasScreenShare = widget.participant?.hasScreenShare ?? false;
  }

  void _syncStatsListener() {
    _stats.sync(
      widget.collectQuality && widget.pollStats
          ? widget.participant?.screenShareTrack
          : null,
    );
  }

  void _onParticipantChanged() {
    final VideoTrack? track = widget.participant?.screenShareTrack;
    final bool hasScreenShare = widget.participant?.hasScreenShare ?? false;
    if (identical(track, _observedTrack) &&
        hasScreenShare == _observedHasScreenShare) {
      return;
    }
    _observeParticipant();
    _syncStatsListener();
    _refresh();
  }

  void _refresh() {
    if (!mounted) {
      return;
    }
    final VoiceStreamQuality quality = widget.collectQuality
        ? voiceStreamQuality(widget.participant)
        : kEmptyVoiceStreamQuality;
    if (quality != _quality) {
      setState(() => _quality = quality);
    }
  }

  @override
  Widget build(BuildContext context) {
    const Widget liveBadge = FluxerLiveBadge(
      tone: FluxerLiveBadgeTone.voiceTile,
    );
    if (_quality.height <= 0) {
      return liveBadge;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: _kGap,
      children: <Widget>[
        DecoratedBox(
          decoration: voiceTileHudChipDecoration(color: Colors.black),
          child: SizedBox(
            height: kVoiceTileHudChipHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: _kPadding),
              child: Center(
                child: Text(
                  voiceStreamQualityLabel(
                    height: _quality.height,
                    fps: _quality.fps,
                  ),
                  style: _kTextStyle,
                ),
              ),
            ),
          ),
        ),
        liveBadge,
      ],
    );
  }
}
