import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/well_known_fixture.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(InstanceEndpoints.resetToDefaults);

  test(
    'restoring a session snapshot applies media endpoints without a fetch',
    () async {
      final db = openTestDatabase();
      final InstanceConfigSnapshot snapshot = selfHostedInstanceSnapshot();
      await db.authSessionDao.saveSessionMetadata(
        userId: 'user-1',
        instanceSnapshotJson: snapshot.toJson(),
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          authTokenStorageProvider.overrideWithValue(MapAuthTokenStorage()),
          fluxerDioProvider.overrideWithValue(
            Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
              ..httpClientAdapter = const _RejectAdapter(),
          ),
        ],
      );
      addTearDown(container.dispose);

      await container
          .read(activeInstanceProvider.notifier)
          .restorePersistedSnapshot(
            container
                .read(authRepositoryProvider)
                .resolveActiveInstanceSnapshot(),
          );

      expect(InstanceEndpoints.media, 'https://chat.example/media');
      expect(InstanceEndpoints.staticCdn, 'https://chat.example/static');
      expect(
        container.read(activeInstanceProvider).apiBaseUrl,
        snapshot.apiBaseUrl,
      );

      final wellKnown = await container.read(wellKnownProvider.future);
      expect(wellKnown.endpoints.media, 'https://chat.example/media');
    },
  );
}

class _RejectAdapter implements HttpClientAdapter {
  const _RejectAdapter();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    throw StateError('unexpected request ${options.uri}');
  }

  @override
  void close({bool force = false}) {}
}
