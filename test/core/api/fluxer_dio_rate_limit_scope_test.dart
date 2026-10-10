import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';

class _CountingAdapter implements HttpClientAdapter {
  int fetches = 0;
  int statusCode = 429;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    fetches++;
    return ResponseBody.fromString(
      statusCode == 429
          ? '{"code":"RATE_LIMITED","message":"You are being rate limited.","retry_after":60,"global":false}'
          : '{}',
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
        if (statusCode == 429) 'retry-after': <String>['60'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _IdleInstanceSelector extends InstanceSelector {
  @override
  Future<InstanceSelectorState> build() async {
    return const InstanceSelectorState(
      instanceUrl: 'fluxer.app',
      status: InstanceDiscoveryStatus.success,
      recentInstances: <RecentInstance>[],
      requiresDiscovery: false,
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a token change clears rate limit pacing on the api client', () async {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(fluxerAuthTokenProvider.notifier).setToken('token-a');
    final _CountingAdapter adapter = _CountingAdapter();
    final Dio dio = container.read(fluxerDioProvider)
      ..httpClientAdapter = adapter;

    await expectLater(
      dio.get<dynamic>('/users/@me/relationships'),
      throwsA(isA<DioException>()),
    );
    adapter.statusCode = 200;
    await expectLater(
      dio.get<dynamic>('/users/@me/relationships'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.fetches, 1);

    container.read(fluxerAuthTokenProvider.notifier).setToken('token-b');
    await dio.get<dynamic>('/users/@me/relationships');
    expect(adapter.fetches, 2);
  });

  test('the auth client does not share pacing with the api client', () async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        instanceSelectorProvider.overrideWith(_IdleInstanceSelector.new),
      ],
    );
    addTearDown(container.dispose);
    await container.read(instanceSelectorProvider.future);
    final _CountingAdapter adapter = _CountingAdapter();
    final Dio dio = container.read(fluxerDioProvider)
      ..httpClientAdapter = adapter;
    final Dio authDio = container.read(authFluxerDioProvider)
      ..httpClientAdapter = adapter;

    await expectLater(
      dio.post<dynamic>('/auth/login', data: <String, dynamic>{}),
      throwsA(isA<DioException>()),
    );
    adapter.statusCode = 200;
    await authDio.post<dynamic>('/auth/login', data: <String, dynamic>{});
    expect(adapter.fetches, 2);
  });
}
