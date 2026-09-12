import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('gateway identify properties serialises mobile', () {
    const properties = GatewayIdentifyProperties(
      os: 'ios',
      browser: 'fluxer_app',
      device: 'ios',
      mobile: true,
    );

    expect(properties.toJson(), containsPair('mobile', true));
  });

  test('restoreIdentifyInitialGuildId uses persisted guild path', () async {
    final db = openTestDatabase();
    persistAppLocation(db, '/channels/guild-99/chan-1');
    await Future<void>.delayed(Duration.zero);

    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    await restoreIdentifyInitialGuildId(
      container.read(identifyInitialGuildIdProvider.notifier),
      db,
    );
    expect(container.read(identifyInitialGuildIdProvider), 'guild-99');
  });

  test('restoreIdentifyInitialGuildId ignores @me paths', () async {
    final db = openTestDatabase();
    persistAppLocation(db, '/channels/@me/dm-1');
    await Future<void>.delayed(Duration.zero);

    final ProviderContainer container = ProviderContainer(
      overrides: [fluxerDatabaseProvider.overrideWithValue(db)],
    );
    addTearDown(container.dispose);

    await restoreIdentifyInitialGuildId(
      container.read(identifyInitialGuildIdProvider.notifier),
      db,
    );
    expect(container.read(identifyInitialGuildIdProvider), isNull);
  });
}
