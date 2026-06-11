import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_media_policy_utils.dart';

void main() {
  test('non-mature media always shows without policy', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: false,
      filterLevel: ClientSensitiveMediaFilterLevel.block,
      mediaGateReason: MatureContentGateReason.minorBlocked,
    );
    expect(policy, MatureMediaPolicy.none);
  });

  test('blur filter enables reveal for mature media', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: true,
      filterLevel: ClientSensitiveMediaFilterLevel.blur,
      mediaGateReason: MatureContentGateReason.none,
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
    );
    expect(policy.shouldBlock, isTrue);
    expect(policy.canReveal, isFalse);
  });

  test('minor blocked blurs mature media without reveal', () {
    final MatureMediaPolicy policy = resolveMatureMediaPolicy(
      isMatureMedia: true,
      filterLevel: ClientSensitiveMediaFilterLevel.blur,
      mediaGateReason: MatureContentGateReason.minorBlocked,
    );
    expect(policy.shouldBlur, isTrue);
    expect(policy.canReveal, isFalse);
    expect(policy.gateReason, MatureContentGateReason.minorBlocked);
  });

  test('resolveChannelGateReason blocks minors in mature guild context', () {
    const ResolvedMatureGateContext context = ResolvedMatureGateContext(
      channelId: 'channel-1',
      categoryId: null,
      guildId: 'guild-1',
      effectiveMatureContent: true,
      matureContentSource: EffectiveMatureSource.guild,
      effectiveWarningLevel: contentWarningLevelInherit,
      effectiveWarningText: null,
      warningSource: EffectiveMatureSource.none,
      scope: MatureContentAgreementScope.guild,
      scopeId: 'guild-1',
    );
    expect(
      resolveChannelGateReason(
        context: context,
        nsfwAllowed: false,
        agreements: const MatureContentAgreementsState(isLoaded: true),
      ),
      MatureContentGateReason.minorBlocked,
    );
  });

  test('resolveMediaGateReason blocks minors in mature channels', () {
    expect(
      resolveMediaGateReason(nsfwAllowed: false, effectiveMatureContent: true),
      MatureContentGateReason.minorBlocked,
    );
    expect(
      resolveMediaGateReason(nsfwAllowed: true, effectiveMatureContent: false),
      MatureContentGateReason.none,
    );
  });
}
