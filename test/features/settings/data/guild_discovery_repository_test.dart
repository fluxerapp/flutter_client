import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_application.dart';
import 'package:test/test.dart';

void main() {
  group('GuildDiscoveryApplication.fromJson', () {
    test('parses full application payload', () {
      final GuildDiscoveryApplication application =
          GuildDiscoveryApplication.fromJson(<String, dynamic>{
            'guild_id': '123',
            'status': 'approved',
            'description': 'A gaming community',
            'category_type': 0,
            'primary_language': 'en-US',
            'custom_tags': <String>['gaming', 'fps'],
            'applied_at': '2026-01-01T00:00:00Z',
            'reviewed_at': '2026-01-02T00:00:00Z',
            'review_reason': null,
            'removed_at': null,
            'removal_reason': null,
          });
      expect(application.guildId, '123');
      expect(application.status, 'approved');
      expect(application.primaryLanguage, 'en-US');
      expect(application.customTags, <String>['gaming', 'fps']);
      expect(application.displayReason, isNull);
    });

    test('prefers removal reason over review reason', () {
      final GuildDiscoveryApplication application =
          GuildDiscoveryApplication.fromJson(<String, dynamic>{
            'guild_id': '123',
            'status': 'removed',
            'description': 'A gaming community',
            'category_type': 0,
            'primary_language': 'en-US',
            'custom_tags': <String>[],
            'applied_at': '2026-01-01T00:00:00Z',
            'review_reason': 'old reason',
            'removal_reason': 'policy violation',
          });
      expect(application.displayReason, 'policy violation');
    });
  });

  group('GuildDiscoveryStatus.fromJson', () {
    test('parses status without application', () {
      final GuildDiscoveryStatus status = GuildDiscoveryStatus.fromJson(
        <String, dynamic>{'eligible': false, 'min_member_count': 50},
      );
      expect(status.eligible, isFalse);
      expect(status.minMemberCount, 50);
      expect(status.application, isNull);
    });
  });

  group('GuildDiscoveryApplicationRequest.toJson', () {
    test('encodes snake_case request body', () {
      const GuildDiscoveryApplicationRequest request =
          GuildDiscoveryApplicationRequest(
            description: 'Hello world',
            categoryType: 2,
            primaryLanguage: 'en-US',
            customTags: <String>['gaming'],
          );
      expect(request.toJson(), <String, dynamic>{
        'description': 'Hello world',
        'category_type': 2,
        'primary_language': 'en-US',
        'custom_tags': <String>['gaming'],
      });
    });
  });
}
