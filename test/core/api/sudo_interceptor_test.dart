import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';

class _Reply {
  const _Reply(this.statusCode, this.body, {this.sudoToken});

  final int statusCode;
  final Map<String, Object?> body;
  final String? sudoToken;
}

const _Reply _sudoRequired = _Reply(403, <String, Object?>{
  'code': 'SUDO_MODE_REQUIRED',
  'message': 'Sudo mode required.',
  'has_mfa': true,
  'methods': <String, Object?>{
    'totp': false,
    'webauthn': true,
    'backup_codes': true,
  },
});

const _Reply _invalidMfaCode = _Reply(400, <String, Object?>{
  'code': 'INVALID_FORM_BODY',
  'message': 'Invalid form body.',
  'errors': <Map<String, Object?>>[
    <String, Object?>{
      'path': 'mfa_code',
      'message': 'Invalid MFA code.',
      'code': 'INVALID_MFA_CODE',
    },
  ],
});

const _Reply _ok = _Reply(200, <String, Object?>{}, sudoToken: 'sudo-token');

class _SudoAdapter implements HttpClientAdapter {
  _SudoAdapter(this.replies);

  final List<_Reply> replies;
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

    final _Reply reply = requests.length <= replies.length
        ? replies[requests.length - 1]
        : _ok;
    return ResponseBody.fromString(
      jsonEncode(reply.body),
      reply.statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
        if (reply.sudoToken != null)
          kSudoTokenHeader: <String>[reply.sudoToken!],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test('merges sudo credentials into Map<String, Object?> bodies', () async {
    final adapter = _SudoAdapter(<_Reply>[_sudoRequired]);
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

    await dio.post<dynamic>(
      '/users/@me/mfa/totp/disable',
      data: <String, Object?>{'code': '123456'},
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
    expect(adapter.requests.last.headers[kSudoTokenHeader], 'sudo-token');
  });

  test('hands the methods of the 403 challenge to the sheet', () async {
    final adapter = _SudoAdapter(<_Reply>[_sudoRequired]);
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
    expect(challenges.single.error, isNull);
  });

  test('re-prompts with the server message after a wrong sudo code', () async {
    final adapter = _SudoAdapter(<_Reply>[_sudoRequired, _invalidMfaCode]);
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    final List<SudoChallenge> challenges = <SudoChallenge>[];
    final List<Map<String, dynamic>> answers = <Map<String, dynamic>>[
      <String, dynamic>{'mfa_method': 'totp', 'mfa_code': 'wrong-code'},
      <String, dynamic>{'password': 'unused'},
    ];
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async {
          challenges.add(challenge);
          return answers[challenges.length - 1];
        },
      ),
    );

    final Response<dynamic> response = await dio.post<dynamic>(
      '/users/@me/delete',
      data: <String, Object?>{'reason': 'bye'},
    );

    expect(response.statusCode, 200);
    expect(challenges, hasLength(2));
    expect(challenges[1].error, 'Invalid MFA code.');
    expect(challenges[1].backupCodes, isTrue);
    expect(adapter.requests, hasLength(3));
    expect(adapter.requests[2].data, <String, Object?>{
      'reason': 'bye',
      'password': 'unused',
    });
  });

  test('a non-sudo form error on the retry goes to the caller', () async {
    const _Reply invalidReason = _Reply(400, <String, Object?>{
      'code': 'INVALID_FORM_BODY',
      'message': 'Invalid form body.',
      'errors': <Map<String, Object?>>[
        <String, Object?>{
          'path': 'reason',
          'message': 'Invalid value.',
          'code': 'INVALID_VALUE',
        },
      ],
    });
    final adapter = _SudoAdapter(<_Reply>[_sudoRequired, invalidReason]);
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    int prompts = 0;
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async {
          prompts++;
          return <String, dynamic>{'password': 'hunter2'};
        },
      ),
    );

    await expectLater(
      dio.post<dynamic>('/users/@me/delete', data: <String, Object?>{}),
      throwsA(
        isA<DioException>().having(
          (DioException e) => e.response?.statusCode,
          'status',
          400,
        ),
      ),
    );
    expect(prompts, 1);
    expect(adapter.requests, hasLength(2));
  });

  test('a repeated sudo challenge re-prompts once, then fails', () async {
    final adapter = _SudoAdapter(<_Reply>[
      _sudoRequired,
      _sudoRequired,
      _sudoRequired,
    ]);
    final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = adapter;
    int prompts = 0;
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async {
          prompts++;
          return <String, dynamic>{'password': 'hunter2'};
        },
      ),
    );

    await expectLater(
      dio.post<dynamic>('/users/@me/delete', data: <String, Object?>{}),
      throwsA(
        isA<DioException>().having(
          (DioException e) => e.response?.statusCode,
          'status',
          403,
        ),
      ),
    );
    expect(prompts, 2);
    expect(adapter.requests, hasLength(3));
  });
}
