import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';

const String _userId = 'user-1';
const String _token = 'token-1';

/// Local HTTP server standing in for the Fluxer API. Records every request
/// so tests can assert exactly which probes were sent.
class _FakeApiServer {
  _FakeApiServer._(this._server);

  final HttpServer _server;

  /// Recorded as `'METHOD path'`, in arrival order.
  final List<String> requests = <String>[];

  final List<String?> authHeaders = <String?>[];

  int statusCode = HttpStatus.ok;

  static Future<_FakeApiServer> start() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final fake = _FakeApiServer._(server);
    server.listen((HttpRequest request) {
      fake.requests.add('${request.method} ${request.uri.path}');
      fake.authHeaders.add(
        request.headers.value(HttpHeaders.authorizationHeader),
      );
      request.response.statusCode = fake.statusCode;
      unawaited(request.response.close());
    });
    return fake;
  }

  int get port => _server.port;

  String get baseUrl => 'http://127.0.0.1:${_server.port}';

  Future<void> close() => _server.close(force: true);
}

/// [AccountManager.loadAccounts] only needs [getStoredAccounts]. Everything
/// else throws via [noSuchMethod], so an unexpected repository call fails loud.
class _FakeAuthRepository implements AuthRepository {
  @override
  Future<List<StoredAccount>> getStoredAccounts() async =>
      const <StoredAccount>[];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

({ProviderContainer container, FluxerDatabase db}) _harness({
  required String baseUrl,
}) {
  final db = FluxerDatabase.forTesting(NativeDatabase.memory());
  addTearDown(db.close);
  final container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerBaseUrlProvider.overrideWithValue(baseUrl),
      authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
      syncedPreferencesStoreProvider.overrideWith(SyncedPreferencesStore.new),
    ],
  );
  addTearDown(container.dispose);
  return (container: container, db: db);
}

/// Seeds a valid DB session row and primes the live auth state the way the
/// app does once a session is restored.
Future<void> _signIn(ProviderContainer container, FluxerDatabase db) async {
  await db.authSessionDao.saveSessionMetadata(
    userId: _userId,
    username: 'tester',
  );
  container.read(fluxerAuthTokenProvider.notifier).setToken(_token);
  container.read(authStateProvider.notifier).setAuthenticated(value: true);
  container.read(currentUserIdProvider.notifier).set(_userId);
}

void main() {
  test(
    '401 on /users/@me expires the session and signs the user out',
    () async {
      final server = await _FakeApiServer.start();
      addTearDown(server.close);
      server.statusCode = HttpStatus.unauthorized;
      final (:container, :db) = _harness(baseUrl: server.baseUrl);
      await _signIn(container, db);

      final expired = await container
          .read(accountManagerProvider.notifier)
          .expireSessionIfInvalid();

      expect(expired, isTrue);
      expect(server.requests, ['GET /users/@me']);
      expect(
        server.authHeaders,
        [_token],
        reason: 'the probe must carry the active session token',
      );
      expect(container.read(authStateProvider), isFalse);
      expect(container.read(fluxerAuthTokenProvider), isNull);
      final session = await db.authSessionDao.getSession(_userId);
      expect(
        session,
        isNotNull,
        reason: 'the account stays stored for quick re-login',
      );
      expect(session!.isValid, isFalse);
    },
  );

  test('200 on /users/@me leaves the session untouched', () async {
    final server = await _FakeApiServer.start();
    addTearDown(server.close);
    final (:container, :db) = _harness(baseUrl: server.baseUrl);
    await _signIn(container, db);

    final expired = await container
        .read(accountManagerProvider.notifier)
        .expireSessionIfInvalid();

    expect(expired, isFalse);
    expect(server.requests, ['GET /users/@me']);
    expect(container.read(authStateProvider), isTrue);
    expect(container.read(fluxerAuthTokenProvider), _token);
    final session = await db.authSessionDao.getSession(_userId);
    expect(session!.isValid, isTrue);
  });

  test('network failure is not an auth verdict', () async {
    // Bind to grab a port that is guaranteed unused, then close it so the
    // probe gets connection-refused instead of an HTTP response.
    final server = await _FakeApiServer.start();
    final deadBaseUrl = 'http://127.0.0.1:${server.port}';
    await server.close();
    final (:container, :db) = _harness(baseUrl: deadBaseUrl);
    await _signIn(container, db);

    final expired = await container
        .read(accountManagerProvider.notifier)
        .expireSessionIfInvalid();

    expect(expired, isFalse);
    expect(container.read(authStateProvider), isTrue);
    expect(container.read(fluxerAuthTokenProvider), _token);
    final session = await db.authSessionDao.getSession(_userId);
    expect(session!.isValid, isTrue);
  });

  test('missing token skips the probe entirely', () async {
    for (final String? token in <String?>[null, '']) {
      final server = await _FakeApiServer.start();
      addTearDown(server.close);
      final (:container, :db) = _harness(baseUrl: server.baseUrl);
      await _signIn(container, db);
      container.read(fluxerAuthTokenProvider.notifier).setToken(token);

      final expired = await container
          .read(accountManagerProvider.notifier)
          .expireSessionIfInvalid();

      expect(expired, isFalse, reason: 'token: ${token ?? 'null'}');
      expect(
        server.requests,
        isEmpty,
        reason:
            'no HTTP probe may be sent without a token '
            '(token: ${token ?? 'null'})',
      );
      expect(container.read(authStateProvider), isTrue);
      final session = await db.authSessionDao.getSession(_userId);
      expect(session!.isValid, isTrue);
    }
  });
}
