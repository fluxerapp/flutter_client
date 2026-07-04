import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  final FluxerLocalizationsEn l10n = FluxerLocalizationsEn();

  group('canAccessAnyGuildSettings', () {
    test('returns true for manageGuild', () {
      expect(canAccessAnyGuildSettings(Permission.manageGuild.value), isTrue);
    });

    test('returns true for manageRoles', () {
      expect(canAccessAnyGuildSettings(Permission.manageRoles.value), isTrue);
    });

    test('returns true for viewAuditLog', () {
      expect(canAccessAnyGuildSettings(Permission.viewAuditLog.value), isTrue);
    });

    test('returns true for manageWebhooks', () {
      expect(
        canAccessAnyGuildSettings(Permission.manageWebhooks.value),
        isTrue,
      );
    });

    test('returns true for manageExpressions', () {
      expect(
        canAccessAnyGuildSettings(Permission.manageExpressions.value),
        isTrue,
      );
    });

    test('returns true for createExpressions', () {
      expect(
        canAccessAnyGuildSettings(Permission.createExpressions.value),
        isTrue,
      );
    });

    test('returns true for banMembers', () {
      expect(canAccessAnyGuildSettings(Permission.banMembers.value), isTrue);
    });

    test('returns false for viewChannel only', () {
      expect(canAccessAnyGuildSettings(Permission.viewChannel.value), isFalse);
    });
  });

  group('buildGuildMenuGroups', () {
    GuildMenuSubmenu? findCommunitySettingsSubmenu(
      List<GuildMenuGroup> groups,
    ) {
      for (final GuildMenuGroup group in groups) {
        for (final GuildMenuEntry entry in group) {
          if (entry is GuildMenuSubmenu && entry.key == 'communitySettings') {
            return entry;
          }
        }
      }
      return null;
    }

    test(
      'includes community settings submenu when permissions grant access',
      () {
        final List<GuildMenuGroup> groups = buildGuildMenuGroups(
          l10n: l10n,
          hasUnread: false,
          isMuted: false,
          isOwner: false,
          permissions: Permission.manageGuild.value,
          locale: 'en_US',
          use12Hour: true,
        );

        expect(findCommunitySettingsSubmenu(groups), isNotNull);
      },
    );

    test('omits community settings submenu without settings permissions', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: Permission.viewChannel.value,
        locale: 'en_US',
        use12Hour: true,
      );

      expect(findCommunitySettingsSubmenu(groups), isNull);
    });

    test('includes community settings for createExpressions only', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: Permission.createExpressions.value,
        locale: 'en_US',
        use12Hour: true,
      );

      expect(findCommunitySettingsSubmenu(groups), isNotNull);
    });
  });
}
