import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/guilds/utils/guild_invite_action_state.dart';

void main() {
  group('resolveGuildInviteActionState', () {
    test('lets non-members join when invites are open', () {
      final GuildInviteActionState state = resolveGuildInviteActionState(
        features: const <String>[],
        isMember: false,
      );
      expect(state.primaryAction, GuildInvitePrimaryAction.joinCommunity);
      expect(state.isActionDisabled, isFalse);
      expect(
        state.primaryActionLabel(
          joinLabel: 'join',
          goToLabel: 'go',
          disabledLabel: 'disabled',
        ),
        'join',
      );
      expect(
        state.pausedStatusMessage(paused: 'paused', raidPaused: 'raid'),
        isNull,
      );
    });

    test('disables join when invites are paused for non-members', () {
      final GuildInviteActionState state = resolveGuildInviteActionState(
        features: const <String>[GuildFeatures.invitesDisabled],
        isMember: false,
      );
      expect(state.primaryAction, GuildInvitePrimaryAction.invitesDisabled);
      expect(state.isActionDisabled, isTrue);
      expect(state.isRaidDetected, isFalse);
      expect(
        state.primaryActionLabel(
          joinLabel: 'join',
          goToLabel: 'go',
          disabledLabel: 'disabled',
        ),
        'disabled',
      );
      expect(
        state.pausedStatusMessage(paused: 'paused', raidPaused: 'raid'),
        'paused',
      );
    });

    test('marks raid detection when that feature is present', () {
      final GuildInviteActionState state = resolveGuildInviteActionState(
        features: const <String>[
          GuildFeatures.invitesDisabled,
          GuildFeatures.raidDetected,
        ],
        isMember: false,
      );
      expect(state.primaryAction, GuildInvitePrimaryAction.invitesDisabled);
      expect(state.isRaidDetected, isTrue);
      expect(
        state.pausedStatusMessage(paused: 'paused', raidPaused: 'raid'),
        'raid',
      );
    });

    test('lets members go to the community while invites are paused', () {
      final GuildInviteActionState state = resolveGuildInviteActionState(
        features: const <String>[GuildFeatures.invitesDisabled],
        isMember: true,
      );
      expect(state.primaryAction, GuildInvitePrimaryAction.goToCommunity);
      expect(state.isActionDisabled, isFalse);
      expect(
        state.primaryActionLabel(
          joinLabel: 'join',
          goToLabel: 'go',
          disabledLabel: 'disabled',
        ),
        'go',
      );
    });
  });
}
