import 'package:fluxer_app/features/guilds/domain/guild_collapsed_categories.dart';
import 'package:test/test.dart';

void main() {
  group('parseCollapsedCategoryIdsFromGuildSettingsJson', () {
    test('returns empty set when overrides are absent', () {
      final data = <String, dynamic>{
        'guild_id': 'guild-1',
        'message_notifications': 3,
        'muted': false,
        'mobile_push': true,
        'suppress_everyone': false,
        'suppress_roles': false,
        'hide_muted_channels': false,
        'version': 1,
      };

      expect(parseCollapsedCategoryIdsFromGuildSettingsJson(data), isEmpty);
    });

    test('returns category ids where collapsed is true', () {
      final data = <String, dynamic>{
        'guild_id': 'guild-1',
        'message_notifications': 3,
        'muted': false,
        'mobile_push': true,
        'suppress_everyone': false,
        'suppress_roles': false,
        'hide_muted_channels': false,
        'channel_overrides': <String, dynamic>{
          'cat-open': <String, dynamic>{
            'collapsed': false,
            'message_notifications': 3,
            'muted': false,
          },
          'cat-collapsed': <String, dynamic>{
            'collapsed': true,
            'message_notifications': 3,
            'muted': false,
          },
        },
        'version': 1,
      };

      expect(parseCollapsedCategoryIdsFromGuildSettingsJson(data), {
        'cat-collapsed',
      });
    });
  });
}
