import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';

class _FakeSensitive extends SensitiveContent {
  @override
  SensitiveContentState build() => const SensitiveContentState();
}

class _FakeAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() =>
      const MatureContentAgreementsState(isLoaded: true);

  void agreeGuild(String guildId) {
    state = state.copyWith(
      agreedGuildIds: <String>{...state.agreedGuildIds, guildId},
    );
  }
}

void main() {
  const ResolvedMatureGateContext guildContext = ResolvedMatureGateContext(
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

  ProviderContainer makeContainer(ResolvedMatureGateContext? gate) {
    return ProviderContainer(
      overrides: [
        sensitiveContentProvider.overrideWith(_FakeSensitive.new),
        matureContentAgreementsProvider.overrideWith(_FakeAgreements.new),
        matureGateContextProvider('channel-1').overrideWith((ref) => gate),
      ],
    );
  }

  // The gate reason watches sensitive-content and agreement state. Those
  // watches must run synchronously before awaiting the gate context (otherwise
  // a rebuild mid-await touches a disposed ref); these tests pin the resulting
  // behavior and reactivity.

  test(
    'resolves consent-required when the guild is mature and unagreed',
    () async {
      final ProviderContainer container = makeContainer(guildContext);
      addTearDown(container.dispose);

      final MatureContentGateReason reason = await container.read(
        matureContentGateReasonProvider('channel-1').future,
      );

      expect(reason, MatureContentGateReason.consentRequired);
    },
  );

  test('resolves none when there is no gate context', () async {
    final ProviderContainer container = makeContainer(null);
    addTearDown(container.dispose);

    final MatureContentGateReason reason = await container.read(
      matureContentGateReasonProvider('channel-1').future,
    );

    expect(reason, MatureContentGateReason.none);
  });

  test('recomputes to none after the guild agreement is recorded', () async {
    final ProviderContainer container = makeContainer(guildContext);
    addTearDown(container.dispose);
    final ProviderSubscription<AsyncValue<MatureContentGateReason>> sub =
        container.listen(
          matureContentGateReasonProvider('channel-1'),
          (_, _) {},
        );
    addTearDown(sub.close);

    expect(
      await container.read(matureContentGateReasonProvider('channel-1').future),
      MatureContentGateReason.consentRequired,
    );

    (container.read(matureContentAgreementsProvider.notifier)
            as _FakeAgreements)
        .agreeGuild('guild-1');
    await Future<void>.delayed(Duration.zero);

    expect(
      await container.read(matureContentGateReasonProvider('channel-1').future),
      MatureContentGateReason.none,
    );
  });
}
