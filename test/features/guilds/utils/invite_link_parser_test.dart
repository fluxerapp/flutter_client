import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';
import 'package:test/test.dart';

void main() {
  group('parseInviteCode', () {
    test('parses fluxer.gg short links', () {
      expect(parseInviteCode('https://fluxer.gg/abcd'), 'abcd');
      expect(parseInviteCode('https://fluxer.gg/invite/abcd'), 'abcd');
      expect(parseInviteCode('https://web.fluxer.app/invite/abcd'), 'abcd');
      expect(parseInviteCode('abcd'), 'abcd');
    });

    test('returns null for non-invite links', () {
      expect(
        parseInviteCode('https://web.fluxer.app/channels/123/456'),
        isNull,
      );
    });
  });
}
