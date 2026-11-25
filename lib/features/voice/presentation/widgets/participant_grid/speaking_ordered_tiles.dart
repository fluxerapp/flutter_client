import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_memo.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_speaking_order.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/material_ui.dart';

typedef _OrderKey = (
  List<VoiceGridTile> tiles,
  Object? media,
  String? currentUserId,
  String? localConnectionId,
  Set<String> speakingKeys,
  Set<String> recentlySpokeKeys,
);

typedef _Order = ({List<VoiceGridTile> tiles, String signature});

class VoiceSpeakingOrderedTiles extends ConsumerStatefulWidget {
  const VoiceSpeakingOrderedTiles({
    required this.prioritizeSpeakingParticipants,
    required this.tiles,
    required this.call,
    required this.builder,
    super.key,
  });

  final bool prioritizeSpeakingParticipants;
  final List<VoiceGridTile> tiles;
  final VoiceGridCallData call;
  final Widget Function(BuildContext context, List<VoiceGridTile> tiles)
  builder;

  @override
  ConsumerState<VoiceSpeakingOrderedTiles> createState() =>
      _VoiceSpeakingOrderedTilesState();
}

class _VoiceSpeakingOrderedTilesState
    extends ConsumerState<VoiceSpeakingOrderedTiles> {
  final VoiceGridLayoutMemo<_OrderKey, _Order> _memo =
      VoiceGridLayoutMemo<_OrderKey, _Order>();

  _Order _order(VoiceActiveSpeakersState speakers) {
    final VoiceGridCallData call = widget.call;
    return _memo.resolve(
      (
        widget.tiles,
        call.media,
        call.currentUserId,
        call.localConnectionId,
        speakers.speakingKeys,
        speakers.recentlySpokeKeys,
      ),
      () {
        final List<VoiceGridTile> tiles = orderVoiceGridTilesBySpeaking(
          tiles: widget.tiles,
          speakers: speakers,
          participantOf: call.participantOf,
        );
        return (
          tiles: tiles,
          signature: voiceGridOrderSignature(
            tiles.map((VoiceGridTile tile) => tile.tileId),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(
      voiceActiveSpeakersProvider.select(
        (VoiceActiveSpeakersState speakers) =>
            widget.prioritizeSpeakingParticipants
            ? _order(speakers).signature
            : '',
      ),
    );
    return widget.builder(
      context,
      voiceGridTilesForDisplay(
        prioritizeSpeakingParticipants: widget.prioritizeSpeakingParticipants,
        tiles: widget.tiles,
        orderBySpeaking: (List<VoiceGridTile> _) =>
            _order(ref.read(voiceActiveSpeakersProvider)).tiles,
      ),
    );
  }
}
