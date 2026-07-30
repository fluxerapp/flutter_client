import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_application.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_settings_state.dart';
import 'package:test/test.dart';

void main() {
  group('GuildDiscoverySettingsState', () {
    test('hasActiveApplication is true for pending and approved', () {
      const GuildDiscoverySettingsState pending = GuildDiscoverySettingsState(
        loadStatus: GuildDiscoveryLoadStatus.success,
        eligible: true,
        minMemberCount: 0,
        description: 'desc',
        categoryType: 0,
        primaryLanguage: DiscoveryConstants.defaultLanguage,
        customTags: <String>[],
        application: GuildDiscoveryApplication(
          guildId: '1',
          status: DiscoveryApplicationStatus.pending,
          description: 'desc',
          categoryType: 0,
          primaryLanguage: 'en-US',
          customTags: <String>[],
          appliedAt: '2026-01-01T00:00:00Z',
        ),
      );
      const GuildDiscoverySettingsState rejected = GuildDiscoverySettingsState(
        loadStatus: GuildDiscoveryLoadStatus.success,
        eligible: true,
        minMemberCount: 0,
        description: '',
        categoryType: 0,
        primaryLanguage: DiscoveryConstants.defaultLanguage,
        customTags: <String>[],
        application: GuildDiscoveryApplication(
          guildId: '1',
          status: DiscoveryApplicationStatus.rejected,
          description: 'desc',
          categoryType: 0,
          primaryLanguage: 'en-US',
          customTags: <String>[],
          appliedAt: '2026-01-01T00:00:00Z',
          reviewReason: 'no',
        ),
      );
      expect(pending.hasActiveApplication, isTrue);
      expect(rejected.hasActiveApplication, isFalse);
      expect(rejected.canApply, isTrue);
    });

    test('isFormDisabled only when ineligible and applying', () {
      const GuildDiscoverySettingsState ineligibleApply =
          GuildDiscoverySettingsState(
            loadStatus: GuildDiscoveryLoadStatus.success,
            eligible: false,
            minMemberCount: 50,
            description: '',
            categoryType: 0,
            primaryLanguage: DiscoveryConstants.defaultLanguage,
            customTags: <String>[],
          );
      const GuildDiscoverySettingsState pendingWhileIneligible =
          GuildDiscoverySettingsState(
            loadStatus: GuildDiscoveryLoadStatus.success,
            eligible: false,
            minMemberCount: 50,
            description: 'listed',
            categoryType: 0,
            primaryLanguage: DiscoveryConstants.defaultLanguage,
            customTags: <String>[],
            application: GuildDiscoveryApplication(
              guildId: '1',
              status: DiscoveryApplicationStatus.pending,
              description: 'listed',
              categoryType: 0,
              primaryLanguage: 'en-US',
              customTags: <String>[],
              appliedAt: '2026-01-01T00:00:00Z',
            ),
          );
      expect(ineligibleApply.isFormDisabled, isTrue);
      expect(pendingWhileIneligible.isFormDisabled, isFalse);
    });

    test('fromStatus hydrates active application fields', () {
      final GuildDiscoverySettingsState state =
          GuildDiscoverySettingsState.fromStatus(
            const GuildDiscoveryStatus(
              eligible: true,
              minMemberCount: 10,
              application: GuildDiscoveryApplication(
                guildId: '1',
                status: DiscoveryApplicationStatus.approved,
                description: 'Listed community',
                categoryType: 4,
                primaryLanguage: 'de',
                customTags: <String>['science'],
                appliedAt: '2026-01-01T00:00:00Z',
              ),
            ),
          );
      expect(state.description, 'Listed community');
      expect(state.categoryType, 4);
      expect(state.primaryLanguage, 'de');
      expect(state.customTags, <String>['science']);
    });
  });
}
