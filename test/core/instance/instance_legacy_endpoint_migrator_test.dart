import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_legacy_endpoint_migrator.dart';

void main() {
  const InstanceLegacyEndpointMigrator migrator =
      InstanceLegacyEndpointMigrator();

  group('migrateOfficialSnapshotIfNeeded', () {
    test('rewrites legacy api subdomain snapshot for production', () {
      const InstanceConfigSnapshot legacy = InstanceConfigSnapshot(
        apiBaseUrl: 'https://api.fluxer.app/v1',
        gatewayUrl: 'wss://gateway.fluxer.app',
        displayDomain: 'fluxer.app',
      );
      final InstanceConfigSnapshot? migrated = migrator
          .migrateOfficialSnapshotIfNeeded(legacy);
      expect(migrated, isNotNull);
      expect(migrated!.apiBaseUrl, InstanceConstants.defaultApiBaseUrl);
      expect(migrated.gatewayUrl, InstanceConstants.defaultGatewayUrl);
      expect(migrated.displayDomain, InstanceConstants.defaultInstanceInputUrl);
      expect(migrated.wellKnown, isNull);
    });

    test('rewrites canary legacy api subdomain snapshot', () {
      const InstanceConfigSnapshot legacy = InstanceConfigSnapshot(
        apiBaseUrl: 'https://api.canary.fluxer.app/v1',
        gatewayUrl: 'wss://gateway.canary.fluxer.app',
        displayDomain: 'canary.fluxer.app',
      );
      final InstanceConfigSnapshot? migrated = migrator
          .migrateOfficialSnapshotIfNeeded(legacy);
      expect(migrated, isNotNull);
      expect(migrated!.apiBaseUrl, InstanceConstants.canaryApiBaseUrl);
      expect(migrated.gatewayUrl, InstanceConstants.defaultGatewayUrl);
      expect(migrated.displayDomain, InstanceConstants.canaryInstanceInputUrl);
    });

    test(
      'rewrites legacy api host even when display domain is not official',
      () {
        const InstanceConfigSnapshot legacy = InstanceConfigSnapshot(
          apiBaseUrl: 'https://api.fluxer.app/v1',
          gatewayUrl: '',
          displayDomain: 'api.fluxer.app',
        );
        final InstanceConfigSnapshot? migrated = migrator
            .migrateOfficialSnapshotIfNeeded(legacy);
        expect(migrated, isNotNull);
        expect(migrated!.apiBaseUrl, InstanceConstants.defaultApiBaseUrl);
      },
    );

    test('leaves self-hosted snapshots unchanged', () {
      const InstanceConfigSnapshot selfHosted = InstanceConfigSnapshot(
        apiBaseUrl: 'https://chat.example.com/v1',
        gatewayUrl: 'wss://chat.example.com/gateway',
        displayDomain: 'chat.example.com',
      );
      expect(migrator.migrateOfficialSnapshotIfNeeded(selfHosted), isNull);
    });

    test('leaves already-migrated official snapshot unchanged', () {
      final InstanceConfigSnapshot current =
          InstanceConfigSnapshot.officialDefault();
      expect(migrator.migrateOfficialSnapshotIfNeeded(current), isNull);
    });
  });

  group('migrateOfficialApiBaseUrlIfNeeded', () {
    test('rewrites legacy secure-storage api base url', () {
      expect(
        migrator.migrateOfficialApiBaseUrlIfNeeded('https://api.fluxer.app/v1'),
        InstanceConstants.defaultApiBaseUrl,
      );
    });

    test('ignores current api base url', () {
      expect(
        migrator.migrateOfficialApiBaseUrlIfNeeded(
          InstanceConstants.defaultApiBaseUrl,
        ),
        isNull,
      );
    });
  });

  group('migrateOfficialRecentDomainIfNeeded', () {
    test('maps fluxer.app to fluxer.com', () {
      expect(
        migrator.migrateOfficialRecentDomainIfNeeded('fluxer.app'),
        InstanceConstants.defaultInstanceInputUrl,
      );
    });

    test('ignores self-hosted domains', () {
      expect(
        migrator.migrateOfficialRecentDomainIfNeeded('chat.example.com'),
        isNull,
      );
    });
  });
}
