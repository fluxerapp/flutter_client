import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';

List<Map<String, Object?>> buildChannelMoveRequestBody(
  ChannelMoveOperation operation,
) {
  return <Map<String, Object?>>[
    <String, Object?>{
      'id': operation.channelId,
      'parent_id': operation.newParentId,
      'preceding_sibling_id': operation.precedingSiblingId,
      'position': operation.position,
      'lock_permissions': false,
    },
  ];
}
