import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';

class _SudoAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final builder = BytesBuilder();
    if (requestStream != null) {
      await for (final chunk in requestStream) {
        builder.add(chunk);
      }
    }
    final body = builder.isEmpty
        ? null
        : jsonDecode(utf8.decode(builder.takeBytes()));
    requests.add(options.copyWith(data: body));

    if (requests.length == 1) {
      return ResponseBody.fromString(
        jsonEncode(<String, Object?>{
          'code': 'SUDO_MODE_REQUIRED',
          'message': 'Sudo mode required.',
          'has_mfa': true,
          'methods': <String, Object?>{
            'totp': false,
            'webauthn': true,
            'backup_codes': true,
          },
        }),
        403,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
        },
      );
    }
    if (requests.length == 2) {
      return ResponseBody.fromString(
        jsonEncode(<String, Object?>{'code': 'INVALID_FORM_BODY'}),
        400,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
          kSudoTokenHeader: <String>['sudo-from-error'],
        },
      );
    }
    return ResponseBody.fromString(
      '{}',
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
  test('merges sudo credentials into Map<String, Object?> bodies', () async {
    final adapter = _SudoAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async => <String, dynamic>{
          'mfa_method': 'totp',
          'mfa_code': '654321',
        },
      ),
    );

    await expectLater(
      dio.post<dynamic>(
        '/users/@me/mfa/totp/disable',
        data: <String, Object?>{'code': '123456'},
      ),
      throwsA(isA<DioException>()),
    );

    expect(adapter.requests, hasLength(2));
    expect(adapter.requests[1].data, <String, Object?>{
      'code': '123456',
      'mfa_method': 'totp',
      'mfa_code': '654321',
    });

    await dio.post<dynamic>(
      '/users/@me/profile',
      data: <String, Object?>{'bio': 'hi'},
    );
    expect(adapter.requests.last.headers[kSudoTokenHeader], 'sudo-from-error');
  });

  test('hands the methods of the 403 challenge to the sheet', () async {
    final adapter = _SudoAdapter();
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final List<SudoChallenge> challenges = <SudoChallenge>[];
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async {
          challenges.add(challenge);
          return null;
        },
      ),
    );

    await expectLater(
      dio.post<dynamic>('/users/@me/disable', data: <String, Object?>{}),
      throwsA(isA<DioException>()),
    );

    expect(challenges, hasLength(1));
    expect(challenges.single.hasMfa, isTrue);
    expect(challenges.single.totp, isFalse);
    expect(challenges.single.webauthn, isTrue);
    expect(challenges.single.backupCodes, isTrue);
  });
}
