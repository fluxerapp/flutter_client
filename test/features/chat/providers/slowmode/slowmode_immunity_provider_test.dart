import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';

import '../../../../helpers/open_test_database.dart';

const String _channelId = 'channel-1';
const String _guildId = 'guild-1';

class _GatedRebuildCache extends ChannelPermissionCache {
  _GatedRebuildCache(this.gate);

  final Completer<void> gate;

  @override
  Future<void> rebuildChannel(String channelId, {bool localOnly = false}) {
    return gate.future;
  }
}

void main() {
  test('an immunity build disposed during its rebuild resolves without a '
      'ref-after-dispose throw', () async {
    final FluxerDatabase database = openTestDatabase();
    await database.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: _channelId,
        guildId: _guildId,
        name: 'general',
      ),
    );

    final Completer<void> gate = Completer<void>();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(database),
        channelPermissionCacheProvider.overrideWith(
          () => _GatedRebuildCache(gate),
        ),
      ],
    );
    addTearDown(container.dispose);

    final Future<bool> immune = container.read(
      isSlowmodeImmuneProvider(_channelId).future,
    );
    await Future<void>.delayed(Duration.zero);

    container.invalidate(isSlowmodeImmuneProvider(_channelId));
    gate.complete();

    await expectLater(immune, completion(isFalse));
  });
}
