import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/channel_gate_navigator.dart';

import '../../../helpers/open_test_database.dart';

class _FakeSensitive extends SensitiveContent {
  @override
  SensitiveContentState build() => const SensitiveContentState();
}

class _UnloadedAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() => const MatureContentAgreementsState();

  @override
  Future<void> ensureLoaded() async {}
}

class _LoadedAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() =>
      const MatureContentAgreementsState(isLoaded: true);

  @override
  Future<void> ensureLoaded() async {}
}

void main() {
  const ResolvedMatureGateContext warningContext = ResolvedMatureGateContext(
    channelId: 'voice-1',
    categoryId: null,
    guildId: 'guild-1',
    effectiveMatureContent: false,
    matureContentSource: EffectiveMatureSource.channel,
    effectiveWarningLevel: contentWarningLevelContentWarning,
    effectiveWarningText: 'Sensitive',
    warningSource: EffectiveMatureSource.channel,
    scope: MatureContentAgreementScope.channel,
    scopeId: 'voice-1',
  );

  test(
    'blocks a content-warning channel while agreements are still loading',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          sensitiveContentProvider.overrideWith(_FakeSensitive.new),
          matureContentAgreementsProvider.overrideWith(_UnloadedAgreements.new),
          matureGateContextProvider(
            'voice-1',
          ).overrideWith((ref) => warningContext),
        ],
      );
      addTearDown(container.dispose);

      expect(
        await isChannelGateBlocking(container: container, channelId: 'voice-1'),
        isTrue,
      );
    },
  );

  test(
    'blocks from an in-memory channel when gate context is missing',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          sensitiveContentProvider.overrideWith(_FakeSensitive.new),
          matureContentAgreementsProvider.overrideWith(_UnloadedAgreements.new),
          matureGateContextProvider('voice-1').overrideWith((ref) => null),
        ],
      );
      addTearDown(container.dispose);

      expect(
        await isChannelGateBlocking(
          container: container,
          channelId: 'voice-1',
          channel: const Channel(
            id: 'voice-1',
            guildId: 'guild-1',
            name: 'voice',
            type: ChannelType.guildVoice,
            contentWarningLevel: contentWarningLevelContentWarning,
            contentWarningText: 'Sensitive',
          ),
        ),
        isTrue,
      );
    },
  );

  test('completes when the channel is loaded from drift', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final db.FluxerDatabase database = openTestDatabase();
    await database.channelDao.upsertChannel(
      db.ChannelsCompanion.insert(
        id: '100000000000000001',
        guildId: '200000000000000001',
        name: 'general',
        type: const Value<int>(0),
      ),
    );

    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        sensitiveContentProvider.overrideWith(_FakeSensitive.new),
        matureContentAgreementsProvider.overrideWith(_LoadedAgreements.new),
      ],
    );
    addTearDown(container.dispose);

    expect(
      await isChannelGateBlocking(
        container: container,
        channelId: '100000000000000001',
      ).timeout(const Duration(seconds: 3)),
      isFalse,
    );
  });
}
