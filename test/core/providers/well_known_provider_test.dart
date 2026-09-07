import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/well_known_fixture.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(InstanceEndpoints.resetToDefaults);

  test(
    'stale well-known fetch does not overwrite the active instance media CDN',
    () async {
      const String selfHostedMedia = 'https://chat.example/media';
      final Completer<void> officialStarted = Completer<void>();
      final Completer<void> releaseOfficial = Completer<void>();
      final _HostWellKnownAdapter adapter = _HostWellKnownAdapter(
        official: wellKnownFixture(
          api: 'https://api.fluxer.app/v1',
          gateway: 'wss://gateway.fluxer.app',
          media: InstanceEndpoints.defaultMedia,
          staticCdn: InstanceEndpoints.defaultStaticCdn,
          selfHosted: false,
        ),
        selfHosted: wellKnownFixture(
          media: selfHostedMedia,
          staticCdn: 'https://chat.example/static',
        ),
        officialStarted: officialStarted,
        releaseOfficial: releaseOfficial,
      );

      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          authTokenStorageProvider.overrideWithValue(MapAuthTokenStorage()),
          fluxerDioProvider.overrideWith((Ref ref) {
            return Dio(BaseOptions(baseUrl: ref.watch(fluxerBaseUrlProvider)))
              ..httpClientAdapter = adapter;
          }),
        ],
      );
      addTearDown(container.dispose);

      unawaited(container.read(wellKnownProvider.future));
      await officialStarted.future;

      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(selfHostedInstanceSnapshot(includeWellKnown: false));

      await container.read(wellKnownProvider.future);
      expect(InstanceEndpoints.media, selfHostedMedia);

      releaseOfficial.complete();
      await Future<void>.delayed(Duration.zero);
      expect(InstanceEndpoints.media, selfHostedMedia);
    },
  );
}

class _HostWellKnownAdapter implements HttpClientAdapter {
  _HostWellKnownAdapter({
    required this.official,
    required this.selfHosted,
    required this.officialStarted,
    required this.releaseOfficial,
  });

  final WellKnownFluxerResponse official;
  final WellKnownFluxerResponse selfHosted;
  final Completer<void> officialStarted;
  final Completer<void> releaseOfficial;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final bool isOfficial = options.uri.host.contains('fluxer.app');
    if (isOfficial) {
      if (!officialStarted.isCompleted) {
        officialStarted.complete();
      }
      await releaseOfficial.future;
    }
    return ResponseBody.fromString(
      jsonEncode((isOfficial ? official : selfHosted).toJson()),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
