import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/gateway/gateway_identify_client_properties.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../helpers/open_test_database.dart';

void main() {
  test('buildGatewayIdentifyProperties mirrors API user agent', () {
    const properties = FluxerClientProperties(
      schemaVersion: 1,
      clientPlatform: 'ios',
      clientRuntime: 'flutter',
      os: 'ios',
      browser: 'fluxer',
      device: 'mobile',
      locale: 'en-US',
      systemLocale: 'en_US',
      userAgent: 'Fluxer iOS/1.2.3 (beta)',
      clientVersion: '1.2.3',
      releaseChannel: 'beta',
      browserVersion: '1.2.3',
    );

    final GatewayIdentifyProperties gateway = buildGatewayIdentifyProperties(
      properties,
    );

    expect(gateway.userAgent, 'Fluxer iOS/1.2.3 (beta)');
    expect(
      gateway.toJson(),
      containsPair('user_agent', 'Fluxer iOS/1.2.3 (beta)'),
    );
    expect(gateway.toJson(), containsPair('browser', 'fluxer'));
    expect(gateway.toJson(), containsPair('device', 'mobile'));
  });

  test('gateway identify properties serialises mobile', () {
    const properties = GatewayIdentifyProperties(
      os: 'ios',
      browser: 'fluxer',
      device: 'mobile',
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
