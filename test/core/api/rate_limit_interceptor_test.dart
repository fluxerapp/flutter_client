import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/rate_limit_interceptor.dart';

class _CountingAdapter implements HttpClientAdapter {
  int fetches = 0;
  int statusCode = 200;
  Map<String, List<String>> responseHeaders = <String, List<String>>{};
  String body = '{}';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    fetches++;
    return ResponseBody.fromString(
      body,
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
        ...responseHeaders,
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late DateTime now;
  late RateLimitPacer pacer;
  late _CountingAdapter adapter;
  late Dio dio;

  setUp(() {
    now = DateTime.utc(2026, 9, 5, 18);
    pacer = RateLimitPacer(now: () => now);
    adapter = _CountingAdapter();
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    dio.httpClientAdapter = adapter;
    dio.interceptors.add(RateLimitInterceptor(pacer: pacer));
  });

  Future<void> getPath(String path) => dio.get<dynamic>(path);

  test('records 429 and blocks the same path without another fetch', () async {
    adapter
      ..statusCode = 429
      ..responseHeaders = <String, List<String>>{
        'retry-after': <String>['5'],
      }
      ..body = '{"message":"slow down","retry_after":5,"global":false}';

    await expectLater(getPath('/users/@me'), throwsA(isA<DioException>()));
    expect(adapter.fetches, 1);

    adapter.statusCode = 200;
    await expectLater(getPath('/users/@me'), throwsA(isA<DioException>()));
    expect(adapter.fetches, 1);

    now = now.add(const Duration(seconds: 5));
    adapter.statusCode = 200;
    await getPath('/users/@me');
    expect(adapter.fetches, 2);
  });

  test('global 429 blocks a different path', () async {
    adapter
      ..statusCode = 429
      ..responseHeaders = <String, List<String>>{
        'retry-after': <String>['2'],
        'x-ratelimit-global': <String>['true'],
      }
      ..body = '{"retry_after":2,"global":true}';

    await expectLater(getPath('/users/@me'), throwsA(isA<DioException>()));
    expect(adapter.fetches, 1);

    adapter.statusCode = 200;
    await expectLater(
      getPath('/channels/1/messages'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.fetches, 1);
  });

  test('route 429 does not block a different path', () async {
    adapter
      ..statusCode = 429
      ..responseHeaders = <String, List<String>>{
        'retry-after': <String>['5'],
      }
      ..body = '{"retry_after":5,"global":false}';

    await expectLater(getPath('/users/@me'), throwsA(isA<DioException>()));
    adapter.statusCode = 200;
    await getPath('/channels/1/messages');
    expect(adapter.fetches, 2);
  });

  test('path pacing is per origin', () async {
    adapter
      ..statusCode = 429
      ..responseHeaders = <String, List<String>>{
        'retry-after': <String>['5'],
      }
      ..body = '{"retry_after":5,"global":false}';

    await expectLater(getPath('/users/@me'), throwsA(isA<DioException>()));

    final Dio other = Dio(BaseOptions(baseUrl: 'https://other.example.com'))
      ..httpClientAdapter = adapter;
    other.interceptors.add(RateLimitInterceptor(pacer: pacer));
    adapter.statusCode = 200;
    await other.get<dynamic>('/users/@me');
    expect(adapter.fetches, 2);
  });
}
