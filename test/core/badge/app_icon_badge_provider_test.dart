import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/open_test_database.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';

void main() {
  test(
    'badge does not re-emit on an unrelated (non-DM) read-state change',
    () async {
      final db = openTestDatabase();
      await db.dmChannelDao.upsertDmChannels([
        DmChannelsCompanion.insert(
          id: 'dm-1',
          recipientId: 'other',
          unreadCount: const Value(0),
        ),
      ]);
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('dm-1'),
          mentionCount: Value(1),
        ),
      );
      final container = ProviderContainer(
        overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);
      container.read(gatewayReadyProvider.notifier).setReady();

      var emissions = 0;
      final subscription = container.listen(
        appIconBadgeProvider,
        (_, _) => emissions++,
      );
      addTearDown(subscription.close);

      await pumpEventQueue();
      final settledEmissions = emissions;
      // A single DM mention settles the badge to a count of 1.
      expect(container.read(appIconBadgeProvider).count, 1);

      // A read state for a non-DM channel with no seeded guild leaves the badge
      // value unchanged: the DM mention sum stays 1 and guildReadState stays
      // empty, so the value guard must suppress the redundant emit.
      await db.readStateDao.upsertReadState(
        const ReadStatesCompanion(
          channelId: Value('guild-chan-1'),
          mentionCount: Value(5),
        ),
      );
      await pumpEventQueue();

      expect(emissions, settledEmissions);
    },
  );
}
