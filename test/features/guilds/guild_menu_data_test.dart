import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_menu_data.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import '../../helpers/test_l10n.dart';

void main() {
  final FluxerLocalizations l10n = testL10n;

  group('canOpenGuildSettings', () {
    test('returns true for manageGuild on non-touch', () {
      expect(
        canOpenGuildSettings(
          permissions: Permission.manageGuild.value,
          guild: null,
          isTouchPrimary: false,
        ),
        isTrue,
      );
    });

    test('returns false for manageChannels only on non-touch', () {
      expect(
        canOpenGuildSettings(
          permissions: Permission.manageChannels.value,
          guild: null,
          isTouchPrimary: false,
        ),
        isFalse,
      );
    });

    test('returns true for manageChannels on touch', () {
      expect(
        canOpenGuildSettings(
          permissions: Permission.manageChannels.value,
          guild: null,
          isTouchPrimary: true,
        ),
        isTrue,
      );
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

    test('omits community settings for manageChannels only on non-touch', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: Permission.manageChannels.value,
        locale: 'en_US',
        use12Hour: true,
      );

      expect(findCommunitySettingsSubmenu(groups), isNull);
    });

    test('includes community settings for manageChannels on touch', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: Permission.manageChannels.value,
        locale: 'en_US',
        use12Hour: true,
        isTouchPrimary: true,
      );

      expect(findCommunitySettingsSubmenu(groups), isNotNull);
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

    test('hides invite when canInvite is false', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: Permission.createInstantInvite.value,
        canInvite: false,
        locale: 'en_US',
        use12Hour: true,
      );
      expect(
        groups
            .expand((GuildMenuGroup group) => group)
            .whereType<GuildMenuAction>()
            .any(
              (GuildMenuAction action) =>
                  action.action == GuildAction.inviteMembers,
            ),
        isFalse,
      );
    });

    test('shows invite when canInvite is true without guild invite bits', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: Permission.viewChannel.value,
        canInvite: true,
        locale: 'en_US',
        use12Hour: true,
      );
      expect(
        groups
            .expand((GuildMenuGroup group) => group)
            .whereType<GuildMenuAction>()
            .any(
              (GuildMenuAction action) =>
                  action.action == GuildAction.inviteMembers,
            ),
        isTrue,
      );
    });
  });

  group('guild menu parity rules', () {
    List<GuildAction> actionsOf(List<GuildMenuGroup> groups) => <GuildAction>[
      for (final GuildMenuGroup group in groups)
        for (final GuildMenuEntry entry in group)
          switch (entry) {
            GuildMenuAction(:final action) => action,
            GuildMenuCheckbox(:final action) => action,
            GuildMenuSubmenu(:final triggerAction) =>
              triggerAction ?? GuildAction.copyGuildId,
          },
    ];

    test('owners keep delete my messages but not leave or report', () {
      final List<GuildAction> actions = actionsOf(
        buildGuildMenuGroups(
          l10n: l10n,
          hasUnread: false,
          isMuted: false,
          isOwner: true,
          permissions: 0,
          locale: 'en_US',
          use12Hour: true,
        ),
      );
      expect(actions, contains(GuildAction.deleteMyMessages));
      expect(actions, isNot(contains(GuildAction.leaveGuild)));
      expect(actions, isNot(contains(GuildAction.reportGuild)));
    });

    test('mute sits alone in the last group for the context menu', () {
      final List<GuildMenuGroup> groups = buildGuildMenuGroups(
        l10n: l10n,
        hasUnread: false,
        isMuted: false,
        isOwner: false,
        permissions: 0,
        locale: 'en_US',
        use12Hour: true,
        muteInLastGroup: true,
      );
      expect(groups.last, hasLength(1));
      expect(groups.last.single, isA<GuildMenuSubmenu>());
      expect((groups.last.single as GuildMenuSubmenu).key, 'mute');
    });

    test('privacy settings hide when direct messages are disabled', () {
      final List<GuildAction> actions = actionsOf(
        buildGuildMenuGroups(
          l10n: l10n,
          hasUnread: false,
          isMuted: false,
          isOwner: false,
          permissions: 0,
          locale: 'en_US',
          use12Hour: true,
          directMessagesDisabled: true,
        ),
      );
      expect(actions, isNot(contains(GuildAction.privacySettings)));
    });

    test('header list is the short web list', () {
      final List<GuildAction> actions = actionsOf(
        buildGuildHeaderMenuGroups(
          l10n: l10n,
          isOwner: false,
          permissions: Permission.manageChannels.value,
          canInvite: true,
        ),
      );
      expect(actions, <GuildAction>[
        GuildAction.inviteMembers,
        GuildAction.createChannel,
        GuildAction.createCategory,
        GuildAction.notificationSettings,
        GuildAction.privacySettings,
        GuildAction.editCommunityProfile,
        GuildAction.hideMutedChannels,
        GuildAction.deleteMyMessages,
        GuildAction.leaveGuild,
      ]);
    });
  });
}
