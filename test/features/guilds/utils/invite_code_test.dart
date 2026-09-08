import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/invite_code.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('inviteCodeOf', () {
    test('reads group DM invite codes', () {
      final InviteMetadataResponseSchema invite = InviteMetadataResponseSchema1(
        code: 'group-code',
        type: GroupDmInviteMetadataResponseTypeType.value1,
        channel: const ChannelPartialResponse(id: 'group-1', type: 3),
        inviter: null,
        memberCount: 2,
        expiresAt: null,
        temporary: false,
        createdAt: DateTime.utc(2026),
        uses: 0,
        maxUses: 0,
      );

      expect(inviteCodeOf(invite), 'group-code');
    });
  });
}
