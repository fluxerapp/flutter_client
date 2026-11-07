import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_connection_provider.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';

const InstanceConfigSnapshot _originalInstance = InstanceConfigSnapshot(
  apiBaseUrl: 'https://a.example/api',
  gatewayUrl: 'wss://a.example/gateway',
  displayDomain: 'a.example',
);

const InstanceConfigSnapshot _pendingInstance = InstanceConfigSnapshot(
  apiBaseUrl: 'https://b.example/api',
  gatewayUrl: 'wss://b.example/gateway',
  displayDomain: 'b.example',
);

final InstanceConfigSnapshot _officialPendingInstance =
    InstanceConfigSnapshot.officialDefault();

class _PendingInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return const InstanceSelectorState(
      instanceUrl: 'https://b.example/api',
      status: InstanceDiscoveryStatus.success,
      recentInstances: <RecentInstance>[],
      requiresDiscovery: false,
      pendingSnapshot: _pendingInstance,
    );
  }
}

class _OfficialPendingInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return InstanceSelectorState(
      instanceUrl: 'fluxer.app',
      status: InstanceDiscoveryStatus.success,
      recentInstances: const <RecentInstance>[],
      requiresDiscovery: false,
      pendingSnapshot: _officialPendingInstance,
    );
  }
}

class _RecordingAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{'available': true}),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('session token stays bound to the instance that issued it', () async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        userSettingsStatusProvider.overrideWithValue(null),
        fluxerClientPropertiesProvider.overrideWithValue(
          buildFluxerClientProperties(),
        ),
      ],
    );
    addTearDown(container.dispose);
    container
        .read(activeInstanceProvider.notifier)
        .applySnapshot(_originalInstance);
    container.read(fluxerAuthTokenProvider.notifier).setToken('secret');
    expect(container.read(gatewayHasAuthTokenProvider), isTrue);

    container
        .read(activeInstanceProvider.notifier)
        .applySnapshot(_pendingInstance);
    final _RecordingAdapter adapter = _RecordingAdapter();
    final Dio dio = container.read(fluxerDioProvider)
      ..httpClientAdapter = adapter;
    await dio.get<dynamic>('/users/@me');
    await dio.get<dynamic>('/.well-known/fluxer');

    expect(adapter.requests, hasLength(2));
    for (final RequestOptions request in adapter.requests) {
      expect(request.uri.host, 'b.example');
      expect(request.headers.containsKey('Authorization'), isFalse);
    }
    expect(container.read(gatewayHasAuthTokenProvider), isFalse);

    container.read(fluxerAuthTokenProvider.notifier).setToken('secret');
    await dio.get<dynamic>('/users/@me');

    expect(adapter.requests.last.headers['Authorization'], isNotNull);
    expect(container.read(gatewayHasAuthTokenProvider), isTrue);
  });

  test(
    'session token is not sent to the pending add-account instance',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          userSettingsStatusProvider.overrideWithValue(null),
          fluxerClientPropertiesProvider.overrideWithValue(
            buildFluxerClientProperties(),
          ),
          instanceSelectorProvider.overrideWith(_PendingInstanceSelector.new),
        ],
      );
      addTearDown(container.dispose);
      await container.read(instanceSelectorProvider.future);
      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(_originalInstance);
      container
          .read(addAccountInstanceGuardProvider.notifier)
          .arm(_originalInstance);
      container.read(fluxerAuthTokenProvider.notifier).setToken('secret');

      final _RecordingAdapter authAdapter = _RecordingAdapter();
      final Dio authDio = container.read(authFluxerDioProvider)
        ..httpClientAdapter = authAdapter;
      final _RecordingAdapter mainAdapter = _RecordingAdapter();
      final Dio mainDio = container.read(fluxerDioProvider)
        ..httpClientAdapter = mainAdapter;

      for (final String path in <String>[
        '/auth/username-availability',
        '/auth/recover',
        '/users/@me',
      ]) {
        await authDio.get<dynamic>(path);
      }
      await mainDio.get<dynamic>('/users/@me');

      expect(authAdapter.requests, hasLength(3));
      for (final RequestOptions request in authAdapter.requests) {
        expect(request.uri.host, 'b.example');
        expect(request.headers.containsKey('Authorization'), isFalse);
      }
      expect(mainAdapter.requests.single.uri.host, 'a.example');
      expect(mainAdapter.requests.single.headers['Authorization'], isNotNull);
    },
  );

  test(
    'auth client targets pending instance while add-account guard is armed',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          instanceSelectorProvider.overrideWith(_PendingInstanceSelector.new),
        ],
      );
      addTearDown(container.dispose);
      await container.read(instanceSelectorProvider.future);
      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(_originalInstance);
      container
          .read(addAccountInstanceGuardProvider.notifier)
          .arm(_originalInstance);
      expect(
        container.read(fluxerBaseUrlProvider),
        _originalInstance.apiBaseUrl,
      );
      expect(
        container.read(authFluxerBaseUrlProvider),
        _pendingInstance.apiBaseUrl,
      );
      expect(
        container.read(authFluxerDioProvider).options.baseUrl,
        _pendingInstance.apiBaseUrl,
      );
    },
  );

  test(
    'auth client targets official pending instance while add-account guard is armed',
    () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          instanceSelectorProvider.overrideWith(
            _OfficialPendingInstanceSelector.new,
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(instanceSelectorProvider.future);
      container
          .read(activeInstanceProvider.notifier)
          .applySnapshot(_originalInstance);
      container
          .read(addAccountInstanceGuardProvider.notifier)
          .arm(_originalInstance);
      expect(
        container.read(authFluxerBaseUrlProvider),
        _officialPendingInstance.apiBaseUrl,
      );
      expect(
        container.read(authFluxerDioProvider).options.baseUrl,
        _officialPendingInstance.apiBaseUrl,
      );
    },
  );
}
