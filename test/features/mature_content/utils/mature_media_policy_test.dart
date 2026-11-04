import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_media_policy_utils.dart';

void main() {
  test('non-mature media always shows without policy', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: false,
      filterLevel: ClientSensitiveMediaFilterLevel.block,
      mediaGateReason: MatureContentGateReason.minorBlocked,
      showLocked: false,
    );
    expect(policy, MatureMediaPolicy.none);
  });

  test('blur filter enables reveal for mature media', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: true,
      filterLevel: ClientSensitiveMediaFilterLevel.blur,
      mediaGateReason: MatureContentGateReason.none,
      showLocked: false,
    );
    expect(policy.shouldBlur, isTrue);
    expect(policy.shouldBlock, isFalse);
    expect(policy.canReveal, isTrue);
  });

  test('block filter hides mature media', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: true,
      filterLevel: ClientSensitiveMediaFilterLevel.block,
      mediaGateReason: MatureContentGateReason.none,
      showLocked: false,
    );
    expect(policy.shouldBlock, isTrue);
    expect(policy.canReveal, isFalse);
  });

  test('minor blocked blurs mature media without reveal', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: true,
      filterLevel: ClientSensitiveMediaFilterLevel.blur,
      mediaGateReason: MatureContentGateReason.minorBlocked,
      showLocked: false,
    );
    expect(policy.shouldBlur, isTrue);
    expect(policy.canReveal, isFalse);
  });

  test('resolveChannelGateReason blocks minors in mature guild context', () {
    const ResolvedMatureGateContext context = ResolvedMatureGateContext(
      channelId: 'channel-1',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: true,
      effectiveWarningLevel: contentWarningLevelInherit,
      effectiveWarningText: null,
      scope: MatureContentAgreementScope.guild,
      scopeId: 'guild-1',
    );
    expect(
      resolveChannelGateReason(
        context: context,
        access: MatureAccess.minor,
        agreements: const MatureContentAgreementsState(isLoaded: true),
      ),
      MatureContentGateReason.minorBlocked,
    );
  });

  test('resolveMediaGateReason blocks minors in mature channels', () {
    expect(
      resolveMediaGateReason(
        access: MatureAccess.minor,
        effectiveMatureContent: true,
      ),
      MatureContentGateReason.minorBlocked,
    );
    expect(
      resolveMediaGateReason(
        access: MatureAccess.allowed,
        effectiveMatureContent: false,
      ),
      MatureContentGateReason.none,
    );
  });

  test('app locked mature channel stays locked after agreeing', () {
    const ResolvedMatureGateContext context = ResolvedMatureGateContext(
      channelId: 'channel-1',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: true,
      effectiveWarningLevel: contentWarningLevelInherit,
      effectiveWarningText: null,
      scope: MatureContentAgreementScope.channel,
      scopeId: 'channel-1',
    );
    expect(
      resolveChannelGateReason(
        context: context,
        access: MatureAccess.appLocked,
        agreements: const MatureContentAgreementsState(
          isLoaded: true,
          agreedChannelIds: {'channel-1'},
        ),
      ),
      MatureContentGateReason.appLocked,
    );
  });

  test('app locked content warning channel still asks for consent', () {
    const ResolvedMatureGateContext context = ResolvedMatureGateContext(
      channelId: 'channel-2',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: false,
      effectiveWarningLevel: contentWarningLevelContentWarning,
      effectiveWarningText: null,
      scope: MatureContentAgreementScope.channel,
      scopeId: 'channel-2',
    );
    expect(
      resolveChannelGateReason(
        context: context,
        access: MatureAccess.appLocked,
        agreements: const MatureContentAgreementsState(isLoaded: true),
      ),
      MatureContentGateReason.consentRequired,
    );
  });

  test('show locked media is blurred and cannot be revealed', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: true,
      filterLevel: ClientSensitiveMediaFilterLevel.blur,
      mediaGateReason: MatureContentGateReason.none,
      showLocked: true,
    );
    expect(policy.shouldBlur, isTrue);
    expect(policy.canReveal, isFalse);
    expect(policy.appLocked, isTrue);
  });
}
