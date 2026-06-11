import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
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

      final mfaRepository = AuthRepository(FluxerClient(dio), db, tokenStorage);

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
