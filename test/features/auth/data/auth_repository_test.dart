import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/ip_auth_poll_result.dart';
import 'package:fluxer_app/features/auth/domain/login_result.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('AuthRepository', () {
    late FluxerDatabase db;
    late MapAuthTokenStorage tokenStorage;
    late AuthRepository repository;

    setUp(() {
      db = FluxerDatabase.forTesting(NativeDatabase.memory());
      tokenStorage = MapAuthTokenStorage();
      repository = AuthRepository(
        FluxerClient(Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );
    });

    tearDown(() async {
      await db.close();
    });

    test('login returns an MFA challenge for MFA-required responses', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          responseJson: <String, Object?>{
            'mfa': true,
            'ticket': 'mfa-ticket',
            'allowed_methods': <String>['totp'],
            'totp': true,
            'webauthn': false,
          },
        );

      final mfaRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        mfaRepository.login(email: ' user@example.com ', password: 'password'),
        completion(
          isA<LoginMfaRequired>()
              .having(
                (LoginMfaRequired result) => result.challenge.ticket,
                'ticket',
                'mfa-ticket',
              )
              .having(
                (LoginMfaRequired result) => result.challenge.totp,
                'totp',
                isTrue,
              )
              .having(
                (LoginMfaRequired result) => result.challenge.sms,
                'sms',
                isFalse,
              )
              .having(
                (LoginMfaRequired result) => result.challenge.webauthn,
                'webauthn',
                isFalse,
              ),
        ),
      );
    });

    test(
      'verifyMfaTotp exposes session timeout as a code field error',
      () async {
        final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
          ..httpClientAdapter = const _JsonResponseAdapter(
            expectedPath: '/v1/auth/login/mfa/totp',
            statusCode: 400,
            statusMessage: 'Bad Request',
            responseJson: <String, Object?>{
              'code': 'INVALID_FORM_BODY',
              'message': 'Invalid form body.',
              'errors': <Map<String, Object?>>[
                <String, Object?>{
                  'field': 'code',
                  'message':
                      'Session timed out. Refresh the page and log in again.',
                  'code': 'SESSION_TIMEOUT',
                },
              ],
            },
          );

        final mfaRepository = AuthRepository(
          FluxerClient(dio),
          db,
          tokenStorage,
          readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
        );

        await expectLater(
          mfaRepository.verifyMfaTotp(ticket: 'mfa-ticket', code: '366117'),
          throwsA(
            isA<AuthFailure>()
                .having(
                  (AuthFailure error) => error.message,
                  'message',
                  'Invalid form body.',
                )
                .having(
                  (AuthFailure error) => error.fieldErrors['code'],
                  'code field error',
                  'Session timed out. Refresh the page and log in again.',
                ),
          ),
        );
      },
    );

    test('stores tokens in secure storage instead of SQLite', () async {
      await repository.migrateLegacyTokens();
      await db.authSessionDao.saveSessionMetadata(
        userId: 'user-1',
        username: 'alice',
      );
      await tokenStorage.saveToken(userId: 'user-1', token: 'secret-token');

      final session = await repository.getSession('user-1');

      expect(session, isNotNull);
      expect(session!.token, 'secret-token');
      expect(tokenStorage.tokens['user-1'], 'secret-token');
    });

    test(
      'migrateLegacyTokens moves plaintext tokens into secure storage',
      () async {
        await db.customStatement(
          "ALTER TABLE auth_sessions ADD COLUMN token TEXT NOT NULL DEFAULT ''",
        );
        await db.customStatement('''
        INSERT INTO auth_sessions (user_id, token, username)
        VALUES ('legacy-user', 'legacy-token', 'legacy')
        ''');

        await repository.migrateLegacyTokens();

        expect(await tokenStorage.readToken('legacy-user'), 'legacy-token');
        expect(await db.authSessionDao.getLegacyTokens(), isEmpty);
      },
    );

    test('removeStoredAccount deletes the secure-storage token', () async {
      await repository.migrateLegacyTokens();
      await db.authSessionDao.saveSessionMetadata(userId: 'user-1');
      await tokenStorage.saveToken(userId: 'user-1', token: 'token-1');

      await repository.removeStoredAccount('user-1');

      expect(await db.authSessionDao.getSession('user-1'), isNull);
      expect(await tokenStorage.readToken('user-1'), isNull);
    });

    test('supports independent tokens for multiple accounts', () async {
      await repository.migrateLegacyTokens();
      await db.authSessionDao.saveSessionMetadata(userId: 'user-1');
      await db.authSessionDao.saveSessionMetadata(userId: 'user-2');
      await tokenStorage.saveToken(userId: 'user-1', token: 'token-1');
      await tokenStorage.saveToken(userId: 'user-2', token: 'token-2');

      final sessionOne = await repository.getSession('user-1');
      final sessionTwo = await repository.getSession('user-2');

      expect(sessionOne?.token, 'token-1');
      expect(sessionTwo?.token, 'token-2');
    });

    test('login surfaces an IP authorization challenge', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 403,
          statusMessage: 'Forbidden',
          responseJson: <String, Object?>{
            'code': 'IP_AUTHORIZATION_REQUIRED',
            'message': 'IP_AUTHORIZATION_REQUIRED',
            'ip_authorization_required': true,
            'ticket': 'ip-ticket',
            'email': 'user@example.com',
            'resend_available_in': 30,
          },
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        ipRepository.login(email: 'user@example.com', password: 'password'),
        completion(
          isA<LoginIpAuthRequired>()
              .having(
                (LoginIpAuthRequired result) => result.challenge.ticket,
                'ticket',
                'ip-ticket',
              )
              .having(
                (LoginIpAuthRequired result) => result.challenge.email,
                'email',
                'user@example.com',
              )
              .having(
                (LoginIpAuthRequired result) =>
                    result.challenge.resendAvailableIn,
                'resendAvailableIn',
                30,
              ),
        ),
      );
    });

    test('login defaults resendAvailableIn to 30 when omitted', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 403,
          statusMessage: 'Forbidden',
          responseJson: <String, Object?>{
            'code': 'IP_AUTHORIZATION_REQUIRED',
            'ticket': 'ip-ticket',
            'email': 'user@example.com',
          },
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      final result = await ipRepository.login(
        email: 'user@example.com',
        password: 'password',
      );

      expect((result as LoginIpAuthRequired).challenge.resendAvailableIn, 30);
    });

    test('login coerces a non-integer resend_available_in', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 403,
          statusMessage: 'Forbidden',
          responseJson: <String, Object?>{
            'code': 'IP_AUTHORIZATION_REQUIRED',
            'ticket': 'ip-ticket',
            'email': 'user@example.com',
            'resend_available_in': 30.0,
          },
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      final result = await ipRepository.login(
        email: 'user@example.com',
        password: 'password',
      );

      expect((result as LoginIpAuthRequired).challenge.resendAvailableIn, 30);
    });

    test('pollIpAuthorization completes and stores the session', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _GetResponseAdapter(
          expectedPath: '/v1/auth/ip-authorization/poll',
          responseJson: <String, Object?>{
            'completed': true,
            'token': 'session-token',
            'user_id': '123',
          },
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      final result = await ipRepository.pollIpAuthorization('ip-ticket');

      expect(result, isA<IpAuthCompleted>());
      expect((result as IpAuthCompleted).session.token, 'session-token');
      expect(await tokenStorage.readToken('123'), 'session-token');
    });

    test('pollIpAuthorization stays pending while not completed', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _GetResponseAdapter(
          expectedPath: '/v1/auth/ip-authorization/poll',
          responseJson: <String, Object?>{'completed': false},
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      expect(
        await ipRepository.pollIpAuthorization('ip-ticket'),
        isA<IpAuthPending>(),
      );
    });

    test('pollIpAuthorization maps a 400 to expired', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _GetResponseAdapter(
          expectedPath: '/v1/auth/ip-authorization/poll',
          statusCode: 400,
          statusMessage: 'Bad Request',
          responseJson: <String, Object?>{'code': 'INVALID_FORM_BODY'},
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      expect(
        await ipRepository.pollIpAuthorization('ip-ticket'),
        isA<IpAuthExpired>(),
      );
    });

    test('pollIpAuthorization rethrows non-400 errors', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _GetResponseAdapter(
          expectedPath: '/v1/auth/ip-authorization/poll',
          statusCode: 500,
          statusMessage: 'Server Error',
          responseJson: <String, Object?>{'code': 'INTERNAL'},
        );

      final ipRepository = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        ipRepository.pollIpAuthorization('ip-ticket'),
        throwsA(isA<DioException>()),
      );
    });

    test('login collapses a credential error into a single failure', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 400,
          statusMessage: 'Bad Request',
          responseJson: <String, Object?>{
            'code': 'INVALID_FORM_BODY',
            'message': 'Invalid form body.',
            'errors': <Map<String, Object?>>[
              <String, Object?>{
                'field': 'email',
                'message': 'Invalid email or password.',
                'code': 'INVALID_EMAIL_OR_PASSWORD',
              },
              <String, Object?>{
                'field': 'password',
                'message': 'Invalid email or password.',
                'code': 'INVALID_EMAIL_OR_PASSWORD',
              },
            ],
          },
        );

      final repo = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        repo.login(email: 'user@example.com', password: 'wrong'),
        throwsA(
          isA<AuthFailure>()
              .having(
                (AuthFailure e) => e.kind,
                'kind',
                AuthFailureKind.invalidCredentials,
              )
              .having((AuthFailure e) => e.fieldErrors, 'fieldErrors', isEmpty),
        ),
      );
    });

    test('login keeps field errors for non-credential validation', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 400,
          statusMessage: 'Bad Request',
          responseJson: <String, Object?>{
            'code': 'INVALID_FORM_BODY',
            'message': 'Invalid form body.',
            'errors': <Map<String, Object?>>[
              <String, Object?>{
                'field': 'email',
                'message': 'Enter a valid email.',
                'code': 'EMAIL_INVALID',
              },
            ],
          },
        );

      final repo = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        repo.login(email: 'bad', password: 'pw'),
        throwsA(
          isA<AuthFailure>()
              .having((AuthFailure e) => e.kind, 'kind', isNull)
              .having(
                (AuthFailure e) => e.fieldErrors['email'],
                'email field error',
                'Enter a valid email.',
              ),
        ),
      );
    });

    test('login parses the live `path` credential error shape', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 400,
          statusMessage: 'Bad Request',
          responseJson: <String, Object?>{
            'code': 'INVALID_FORM_BODY',
            'message': 'Invalid form body.',
            'errors': <Map<String, Object?>>[
              <String, Object?>{
                'path': 'email',
                'message': 'Invalid email or password.',
                'code': 'INVALID_EMAIL_OR_PASSWORD',
              },
              <String, Object?>{
                'path': 'password',
                'message': 'Invalid email or password.',
                'code': 'INVALID_EMAIL_OR_PASSWORD',
              },
            ],
          },
        );

      final repo = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        repo.login(email: 'user@example.com', password: 'wrong'),
        throwsA(
          isA<AuthFailure>()
              .having(
                (AuthFailure e) => e.kind,
                'kind',
                AuthFailureKind.invalidCredentials,
              )
              .having((AuthFailure e) => e.fieldErrors, 'fieldErrors', isEmpty),
        ),
      );
    });

    test('login parses live `path` field validation errors', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _JsonResponseAdapter(
          expectedPath: '/v1/auth/login',
          statusCode: 400,
          statusMessage: 'Bad Request',
          responseJson: <String, Object?>{
            'code': 'INVALID_FORM_BODY',
            'message': 'Invalid form body.',
            'errors': <Map<String, Object?>>[
              <String, Object?>{
                'path': 'email',
                'message': 'Enter a valid email.',
                'code': 'EMAIL_INVALID',
              },
            ],
          },
        );

      final repo = AuthRepository(
        FluxerClient(dio),
        db,
        tokenStorage,
        readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
      );

      await expectLater(
        repo.login(email: 'bad', password: 'pw'),
        throwsA(
          isA<AuthFailure>()
              .having((AuthFailure e) => e.kind, 'kind', isNull)
              .having(
                (AuthFailure e) => e.fieldErrors['email'],
                'email field error',
                'Enter a valid email.',
              ),
        ),
      );
    });
  });
}

class _JsonResponseAdapter implements HttpClientAdapter {
  const _JsonResponseAdapter({
    required this.expectedPath,
    required this.responseJson,
    this.statusCode = 200,
    this.statusMessage = 'OK',
  });

  final String expectedPath;
  final Map<String, Object?> responseJson;
  final int statusCode;
  final String statusMessage;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'POST');
    expect(options.uri.path, expectedPath);

    return ResponseBody.fromString(
      jsonEncode(responseJson),
      statusCode,
      statusMessage: statusMessage,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _GetResponseAdapter implements HttpClientAdapter {
  const _GetResponseAdapter({
    required this.expectedPath,
    required this.responseJson,
    this.statusCode = 200,
    this.statusMessage = 'OK',
  });

  final String expectedPath;
  final Map<String, Object?> responseJson;
  final int statusCode;
  final String statusMessage;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'GET');
    expect(options.uri.path, expectedPath);

    return ResponseBody.fromString(
      jsonEncode(responseJson),
      statusCode,
      statusMessage: statusMessage,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
