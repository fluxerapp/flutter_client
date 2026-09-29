import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/captcha_interceptor.dart';

class _CaptchaAdapter implements HttpClientAdapter {
  _CaptchaAdapter({required this.challengeBody}) : token = 'solved-token';

  final Map<String, dynamic> challengeBody;
  final String token;

  final List<RequestOptions> requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);

    if (requests.length == 1) {
      return ResponseBody.fromString(
        jsonEncode(challengeBody),
        400,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
        },
      );
    }

    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{'ok': true}),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _challengeResponse() {
  return <String, dynamic>{
    'code': 'CAPTCHA_REQUIRED',
    'captcha_provider': 'altcha',
    'altcha_challenge': <String, dynamic>{
      'signature': 'test-signature',
      'parameters': <String, dynamic>{
        'algorithm': 'PBKDF2/SHA-256',
        'cost': 1000,
        'keyLength': 32,
        'nonce': '0a1b',
        'salt': 'c2d3',
        'keyPrefix': '00',
      },
    },
  };
}

void main() {
  test(
    'passes through when captcha is required without a valid ALTCHA body',
    () async {
      final adapter = _CaptchaAdapter(
        challengeBody: <String, dynamic>{
          'code': 'CAPTCHA_REQUIRED',
          'message': 'Verification required.',
        },
      );
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = adapter;
      dio.interceptors.add(
        CaptchaInterceptor(dio: dio, showSlowSolveHint: () => () {}),
      );

      await expectLater(
        dio.post<dynamic>('/auth/login'),
        throwsA(
          isA<DioException>().having(
            (DioException e) => e.response?.statusCode,
            'statusCode',
            400,
          ),
        ),
      );
      expect(adapter.requests, hasLength(1));
    },
  );

  test('retries with captcha headers after a successful solve', () async {
    final adapter = _CaptchaAdapter(challengeBody: _challengeResponse());
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      CaptchaInterceptor(
        dio: dio,
        showSlowSolveHint: () => () {},
        solveChallenge: (_) async => adapter.token,
      ),
    );

    final Response<dynamic> response = await dio.post<dynamic>('/auth/login');
    expect(response.statusCode, 200);
    expect(adapter.requests, hasLength(2));
    expect(adapter.requests.last.headers['X-Captcha-Token'], adapter.token);
    expect(adapter.requests.last.headers['X-Captcha-Type'], 'altcha');
  });
}
