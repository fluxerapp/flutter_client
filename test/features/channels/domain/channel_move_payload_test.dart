import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_payload.dart';

void main() {
  test('buildChannelMoveRequestBody includes explicit null parent_id', () {
    const ChannelMoveOperation operation = ChannelMoveOperation(
      channelId: 'text-1',
      newParentId: null,
      precedingSiblingId: 'cat-1',
      position: 1,
    );

    final List<Map<String, Object?>> body = buildChannelMoveRequestBody(
      operation,
    );

    expect(body, <Map<String, Object?>>[
      <String, Object?>{
        'id': 'text-1',
        'parent_id': null,
        'preceding_sibling_id': 'cat-1',
        'position': 1,
        'lock_permissions': false,
      },
    ]);
  });
}
