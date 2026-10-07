import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';

class GuildChannelDropSession {
  bool _dropHandled = false;

  void reset() {
    _dropHandled = false;
  }

  ChannelMoveComputation? tryComplete({
    required List<Channel> channels,
    required ChannelReorderDragItem dragItem,
    required ChannelReorderDropResult dropResult,
  }) {
    if (_dropHandled) {
      return null;
    }
    final ChannelMoveComputation? computation = computeChannelMove(
      channels: channels,
      dragItem: dragItem,
      dropResult: dropResult,
    );
    if (computation != null) {
      _dropHandled = true;
    }
    return computation;
  }
}
