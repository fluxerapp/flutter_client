import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  test('guild stream updates when the community row appears', () async {
    final FluxerDatabase db = openTestDatabase();
    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    final Completer<String> name = Completer<String>();
    container.listen(guildStreamByIdProvider('guild-1'), (previous, next) {
      final String? guildName = next.asData?.value?.name;
      if (guildName != null && !name.isCompleted) {
        name.complete(guildName);
      }
    });
    await container.read(guildStreamByIdProvider('guild-1').future);

    await db.guildDao.upsertServer(
      ServersCompanion.insert(id: 'guild-1', name: 'Joined'),
    );

    expect(await name.future.timeout(const Duration(seconds: 2)), 'Joined');
  });
}
