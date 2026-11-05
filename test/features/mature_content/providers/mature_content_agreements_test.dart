import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_media_policy_utils.dart';

void main() {
  const ResolvedMatureGateContext guildContext = ResolvedMatureGateContext(
    channelId: 'channel-1',
    categoryId: null,
    guildId: 'guild-1',
    effectiveMatureContent: true,
    effectiveWarningLevel: contentWarningLevelInherit,
    effectiveWarningText: null,
    scope: MatureContentAgreementScope.guild,
    scopeId: 'guild-1',
  );

  test('requires web opt-in on iOS instead of in-app consent', () {
    const MatureContentAgreementsState emptyAgreements =
        MatureContentAgreementsState(isLoaded: true);
    expect(
      resolveChannelGateReason(
        context: guildContext,
        access: MatureAccess.allowed,
        agreements: emptyAgreements,
        allowInAppConsent: false,
      ),
      MatureContentGateReason.webOptInRequired,
    );
  });

  test('requires consent until guild agreement is recorded', () {
    const MatureContentAgreementsState emptyAgreements =
        MatureContentAgreementsState(isLoaded: true);
    expect(
      resolveChannelGateReason(
        context: guildContext,
        access: MatureAccess.allowed,
        agreements: emptyAgreements,
      ),
      MatureContentGateReason.consentRequired,
    );
    const MatureContentAgreementsState agreed = MatureContentAgreementsState(
      isLoaded: true,
      agreedGuildIds: {'guild-1'},
    );
    expect(
      resolveChannelGateReason(
        context: guildContext,
        access: MatureAccess.allowed,
        agreements: agreed,
      ),
      MatureContentGateReason.none,
    );
  });

  test('requires consent while agreements are still loading', () {
    expect(
      resolveChannelGateReason(
        context: guildContext,
        access: MatureAccess.allowed,
        agreements: const MatureContentAgreementsState(),
      ),
      MatureContentGateReason.consentRequired,
    );
  });

  test('requires consent for a content warning while agreements load', () {
    const ResolvedMatureGateContext warningContext = ResolvedMatureGateContext(
      channelId: 'channel-9',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: false,
      effectiveWarningLevel: contentWarningLevelContentWarning,
      effectiveWarningText: 'Sensitive',
      scope: MatureContentAgreementScope.channel,
      scopeId: 'channel-9',
    );
    expect(
      resolveChannelGateReason(
        context: warningContext,
        access: MatureAccess.allowed,
        agreements: const MatureContentAgreementsState(),
      ),
      MatureContentGateReason.consentRequired,
    );
  });

  test('returns none for ungated channels while agreements load', () {
    const ResolvedMatureGateContext ungated = ResolvedMatureGateContext(
      channelId: 'channel-2',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: false,
      effectiveWarningLevel: contentWarningLevelInherit,
      effectiveWarningText: null,
      scope: MatureContentAgreementScope.channel,
      scopeId: 'channel-2',
    );
    expect(
      resolveChannelGateReason(
        context: ungated,
        access: MatureAccess.allowed,
        agreements: const MatureContentAgreementsState(),
      ),
      MatureContentGateReason.none,
    );
  });

  test('hasMatureContentAgreement matches channel scope', () {
    const ResolvedMatureGateContext channelContext = ResolvedMatureGateContext(
      channelId: 'channel-9',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: false,
      effectiveWarningLevel: contentWarningLevelContentWarning,
      effectiveWarningText: 'Sensitive',
      scope: MatureContentAgreementScope.channel,
      scopeId: 'channel-9',
    );
    expect(
      hasMatureContentAgreement(
        agreements: const MatureContentAgreementsState(isLoaded: true),
        context: channelContext,
      ),
      isFalse,
    );
    expect(
      hasMatureContentAgreement(
        agreements: const MatureContentAgreementsState(
          isLoaded: true,
          agreedChannelIds: {'channel-9'},
        ),
        context: channelContext,
      ),
      isTrue,
    );
  });
}
