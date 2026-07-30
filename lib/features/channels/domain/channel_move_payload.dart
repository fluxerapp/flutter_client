import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';

/// Builds the PATCH /guilds/{guild_id}/channels body manually.
///
/// The generated SDK model omits null fields from JSON (`includeIfNull: false`),
/// but the API distinguishes omitted `parent_id` (keep current parent) from
/// explicit `null` (remove from category). That cannot be expressed in the
/// OpenAPI spec without breaking position only updates, so channel moves bypass
/// SDK serialization. Checkout the convo here: https://web.fluxer.app/channels/1489322182823577203/1489325511700064237/1530677610378440704
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
