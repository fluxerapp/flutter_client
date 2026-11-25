import 'package:fluxer_app/features/voice/domain/voice_media_participant.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/features/voice/utils/media/stream_info.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceTouchTileAspectHost extends StatefulWidget {
  const VoiceTouchTileAspectHost({
    required this.participant,
    required this.enabled,
    required this.useStreamAspectRatio,
    required this.refreshStats,
    required this.builder,
    super.key,
  });

  final VoiceMediaParticipant? participant;
  final bool enabled;
  final bool useStreamAspectRatio;
  final bool refreshStats;
  final Widget Function(BuildContext context, double? aspectRatio) builder;

  @override
  State<VoiceTouchTileAspectHost> createState() =>
      _VoiceTouchTileAspectHostState();
}

class _VoiceTouchTileAspectHostState extends State<VoiceTouchTileAspectHost> {
  double? _streamAspectRatio;
  late final VoiceStreamStatsSubscription _stats = VoiceStreamStatsSubscription(
    _refresh,
  );
  VideoTrack? _observedTrack;

  bool get _followsStream => widget.enabled && widget.useStreamAspectRatio;

  @override
  void initState() {
    super.initState();
    _observedTrack = widget.participant?.screenShareTrack;
    widget.participant?.addListener(_onParticipantChanged);
    _sync();
  }

  @override
  void didUpdateWidget(VoiceTouchTileAspectHost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.participant != widget.participant) {
      oldWidget.participant?.removeListener(_onParticipantChanged);
      widget.participant?.addListener(_onParticipantChanged);
      _observedTrack = widget.participant?.screenShareTrack;
      _sync();
      return;
    }
    if (oldWidget.enabled != widget.enabled ||
        oldWidget.refreshStats != widget.refreshStats ||
        oldWidget.useStreamAspectRatio != widget.useStreamAspectRatio) {
      _sync();
    }
  }

  @override
  void dispose() {
    _stats.dispose();
    widget.participant?.removeListener(_onParticipantChanged);
    super.dispose();
  }

  void _onParticipantChanged() {
    final VideoTrack? track = widget.participant?.screenShareTrack;
    if (identical(track, _observedTrack)) {
      return;
    }
    _observedTrack = track;
    _sync();
  }

  void _sync() {
    _stats.sync(
      _followsStream && widget.refreshStats
          ? widget.participant?.screenShareTrack
          : null,
    );
    _refresh();
  }

  void _refresh() {
    if (!mounted || !_followsStream) {
      return;
    }
    final double? next = screenShareContentAspectRatioMonitored(
      widget.participant,
    );
    if (next != _streamAspectRatio) {
      setState(() => _streamAspectRatio = next);
    }
  }

  double? get _aspectRatio {
    if (!widget.enabled) {
      return null;
    }
    return widget.useStreamAspectRatio
        ? _streamAspectRatio
        : voiceGridTileAspectRatio;
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _aspectRatio);
}
