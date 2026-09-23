import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/invite_code.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('inviteCodeOf', () {
    test('reads group DM invite codes', () {
      final InviteMetadataResponseSchemaGroupDmInviteMetadataResponse group =
          InviteMetadataResponseSchemaGroupDmInviteMetadataResponse(
            code: 'group-code',
            type: 1,
            channel: const ChannelPartialResponse(
              id: 'group-1',
              type: ChannelType.groupDm,
            ),
            memberCount: 2,
            temporary: false,
            createdAt: DateTime.utc(2026),
            uses: 0,
            maxUses: 0,
          );
      final InviteMetadataResponseSchema invite = InviteMetadataResponseSchema(
        group.toJson(),
      );

      expect(inviteCodeOf(invite), 'group-code');
    });
  });
}
