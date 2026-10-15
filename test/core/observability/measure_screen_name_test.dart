import 'package:fluxer_app/core/observability/measure_screen_name.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:test/test.dart';

void main() {
  group('normalizeMeasureScreenName', () {
    test('keeps named routes unchanged', () {
      expect(
        normalizeMeasureScreenName(RouteNames.channel),
        RouteNames.channel,
      );
      expect(normalizeMeasureScreenName(RouteNames.dms), RouteNames.dms);
    });

    test('collapses channel paths with snowflake ids', () {
      const guildId = '123456789012345678';
      const channelId = '987654321098765432';
      const messageId = '111222333444555666';

      expect(normalizeMeasureScreenName('/channels/@me'), RouteNames.dms);
      expect(
        normalizeMeasureScreenName('/channels/@me/$channelId'),
        RouteNames.dmChannel,
      );
      expect(
        normalizeMeasureScreenName('/channels/@me/$channelId/$messageId'),
        RouteNames.dmMessage,
      );
      expect(
        normalizeMeasureScreenName('/channels/$guildId'),
        RouteNames.guild,
      );
      expect(
        normalizeMeasureScreenName('/channels/$guildId/$channelId'),
        RouteNames.channel,
      );
      expect(
        normalizeMeasureScreenName('/channels/$guildId/$channelId/$messageId'),
        RouteNames.message,
      );
      expect(
        normalizeMeasureScreenName('/channels/$guildId/members'),
        RouteNames.guildMembers,
      );
    });

    test('collapses settings paths with snowflake ids', () {
      const guildId = '123456789012345678';
      const channelId = '987654321098765432';

      expect(
        normalizeMeasureScreenName('/settings/guild/$guildId'),
        RouteNames.guildSettings,
      );
      expect(
        normalizeMeasureScreenName('/settings/guild/$guildId/roles'),
        RouteNames.guildSettingsRoles,
      );
      expect(
        normalizeMeasureScreenName('/settings/channel/$channelId'),
        RouteNames.channelSettings,
      );
      expect(
        normalizeMeasureScreenName('/settings/channel/$channelId/permissions'),
        RouteNames.channelSettingsPermissions,
      );
    });

    test('collapses invite and gift codes', () {
      expect(normalizeMeasureScreenName('/invite/abc123'), RouteNames.invite);
      expect(normalizeMeasureScreenName('/gift/xyz'), RouteNames.gift);
    });

    test('scrubs ids and values from unmatched paths', () {
      expect(
        normalizeMeasureScreenName(
          '/unknown/1558633981610557440/AbCd3fG?ref=chat.example.org',
        ),
        '/unknown/:id/:value',
      );
    });
  });
}
