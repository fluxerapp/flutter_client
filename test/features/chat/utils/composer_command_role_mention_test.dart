import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/chat/utils/composer_command.dart';

void main() {
  group('largestLargeRoleMentionImpact', () {
    test('returns the largest mentionable role above the threshold', () {
      final Map<String, db.Role> roleById = <String, db.Role>{
        'guild-1': const db.Role(
          id: 'guild-1',
          guildId: 'guild-1',
          name: 'everyone',
          color: 0,
          position: 0,
          hoist: false,
          mentionable: false,
          permissions: '0',
        ),
        '100': const db.Role(
          id: '100',
          guildId: 'guild-1',
          name: 'Moderators',
          color: 0,
          position: 5,
          hoist: false,
          mentionable: true,
          permissions: '0',
        ),
        '200': const db.Role(
          id: '200',
          guildId: 'guild-1',
          name: 'Developers',
          color: 0,
          position: 10,
          hoist: false,
          mentionable: true,
          permissions: '0',
        ),
      };
      final List<db.Member> members = List<db.Member>.generate(
        70,
        (int index) => db.Member(
          userId: 'user-$index',
          guildId: 'guild-1',
          roleIdsJson: index < 55 ? '["100"]' : '["200"]',
        ),
      );

      final LargeRoleMentionImpact? impact = largestLargeRoleMentionImpact(
        members: members,
        roleById: roleById,
        guildId: 'guild-1',
        content: 'hello <@&100> and <@&200>',
        canMentionEveryone: false,
      );

      expect(impact?.roleName, 'Moderators');
      expect(impact?.memberCount, 55);
    });
  });
}
