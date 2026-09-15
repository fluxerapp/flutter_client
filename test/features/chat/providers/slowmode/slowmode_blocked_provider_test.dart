import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart' as domain;
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_blocked_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';

import '../../../../helpers/open_test_database.dart';

void main() {
  test(
    'disposing slowmode check while channel is loading does not throw',
    () async {
      final db = openTestDatabase();
      final errors = <Object>[];
      final channelController = StreamController<domain.Channel?>.broadcast();
      addTearDown(channelController.close);

      await runZonedGuarded(() async {
        final container = ProviderContainer(
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            channelByIdProvider(
              'channel-1',
            ).overrideWith((ref) => channelController.stream),
          ],
        );
        container
            .listen(
              isSlowmodeBlockedProvider('channel-1'),
              (_, _) {},
              fireImmediately: true,
            )
            .close();
        container.dispose();
        await Future<void>.delayed(Duration.zero);
      }, (error, _) => errors.add(error));

      expect(errors, isEmpty);
    },
  );

  test(
    'blocked stream does not re-emit true while cooldown is running',
    () async {
      final FluxerDatabase db = openTestDatabase();
      await db.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: 'channel-1',
          guildId: 'guild-1',
          name: 'general',
          rateLimitPerUser: const Value(5),
        ),
      );
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          isSlowmodeImmuneProvider(
            'channel-1',
          ).overrideWith((ref) => Future<bool>.value(false)),
        ],
      );
      addTearDown(container.dispose);
      container.read(slowmodeTrackerProvider.notifier).recordSend('channel-1');

      final List<bool> values = <bool>[];
      container.listen(isSlowmodeBlockedProvider('channel-1'), (_, next) {
        final bool? value = next.value;
        if (value != null) {
          values.add(value);
        }
      }, fireImmediately: true);

      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(values, <bool>[true]);
      await Future<void>.delayed(const Duration(milliseconds: 80));
      expect(values, <bool>[true]);
    },
  );
}
