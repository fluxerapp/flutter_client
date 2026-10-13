import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';

import '../../../helpers/open_test_database.dart';

const String _userId = 'user-1';
const String _token = 'token-1';

class _FakeApiServer {
  _FakeApiServer._(this._server);

  final HttpServer _server;

  final List<String> requests = <String>[];

  final List<String?> authHeaders = <String?>[];

  int statusCode = HttpStatus.ok;

  Completer<void>? hold;

  static Future<_FakeApiServer> start() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final fake = _FakeApiServer._(server);
    server.listen((HttpRequest request) async {
      fake.requests.add('${request.method} ${request.uri.path}');
      fake.authHeaders.add(
        request.headers.value(HttpHeaders.authorizationHeader),
      );
      await fake.hold?.future;
      request.response.statusCode = fake.statusCode;
      unawaited(request.response.close());
    });
    return fake;
  }

  int get port => _server.port;

  String get baseUrl => 'http://127.0.0.1:${_server.port}';

  Future<void> close() => _server.close(force: true);
}

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository({this.targetBaseUrl = ''});

  final String targetBaseUrl;

  @override
  Future<List<StoredAccount>> getStoredAccounts() async =>
      const <StoredAccount>[];

  @override
  Future<AuthSession?> getSession(String userId) async =>
      AuthSession(token: 'token-$userId', userId: userId);

  @override
  Future<InstanceConfigSnapshot> resolveInstanceSnapshotForUser(
    String userId,
  ) async => InstanceConfigSnapshot(
    apiBaseUrl: targetBaseUrl,
    gatewayUrl: '',
    displayDomain: '127.0.0.1',
  );

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

({ProviderContainer container, FluxerDatabase db}) _harness({
  required String baseUrl,
}) {
  final db = openTestDatabase();
  final container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerBaseUrlProvider.overrideWithValue(baseUrl),
      authRepositoryProvider.overrideWithValue(
        _FakeAuthRepository(targetBaseUrl: baseUrl),
      ),
      syncedPreferencesStoreProvider.overrideWith(SyncedPreferencesStore.new),
    ],
  );
  addTearDown(container.dispose);
  return (container: container, db: db);
}

Future<void> _signIn(ProviderContainer container, FluxerDatabase db) async {
  await db.authSessionDao.saveSessionMetadata(
    userId: _userId,
    username: 'tester',
  );
  container.read(fluxerAuthTokenProvider.notifier).setToken(_token);
  container.read(authStateProvider.notifier).setAuthenticated(value: true);
  container.read(currentUserIdProvider.notifier).set(_userId);
}

Future<
  ({
    _FakeApiServer server,
    ProviderContainer container,
    AccountManager manager,
    Future<void> first,
  })
>
_heldSwitchToUser2() async {
  final server = await _FakeApiServer.start();
  addTearDown(server.close);
  server
    ..statusCode = HttpStatus.unauthorized
    ..hold = Completer<void>();
  final (:container, :db) = _harness(baseUrl: server.baseUrl);
  await _signIn(container, db);
  for (final String userId in <String>['user-2', 'user-3', 'user-4']) {
    await db.authSessionDao.saveSessionMetadata(userId: userId);
  }
  await db.authSessionDao.touchSession(_userId);
  final AccountManager manager = container.read(
    accountManagerProvider.notifier,
  );
  final Future<void> first = manager.switchToAccount(
    'user-2',
    ignoreIfPending: true,
  );
  unawaited(first.then((_) {}, onError: (Object _) {}));
  while (server.requests.isEmpty) {
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
  expect(container.read(accountManagerProvider).isSwitchPending, isTrue);
  return (server: server, container: container, manager: manager, first: first);
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
      expect(server.authHeaders, [
        _token,
      ], reason: 'the probe must carry the active session token');
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

  test('an expired target account never leaves the current UI', () async {
    final server = await _FakeApiServer.start();
    addTearDown(server.close);
    server.statusCode = HttpStatus.unauthorized;
    final (:container, :db) = _harness(baseUrl: server.baseUrl);
    await _signIn(container, db);
    await db.authSessionDao.saveSessionMetadata(userId: 'user-2');
    await db.authSessionDao.touchSession(_userId);
    final List<bool> switching = <bool>[];
    container.listen<bool>(
      accountManagerProvider.select(
        (AccountManagerState state) => state.isSwitching,
      ),
      (bool? previous, bool next) => switching.add(next),
    );

    await expectLater(
      container.read(accountManagerProvider.notifier).switchToAccount('user-2'),
      throwsA(isA<SessionExpiredFailure>()),
    );

    expect(server.requests, ['GET /users/@me']);
    expect(switching, isNot(contains(true)));
    expect(container.read(currentUserIdProvider), _userId);
    expect((await db.authSessionDao.getSession('user-2'))!.isValid, isFalse);
  });

  test('a second tap is ignored while the token check runs', () async {
    final pending = await _heldSwitchToUser2();

    await pending.manager.switchToAccount('user-3', ignoreIfPending: true);
    pending.server.hold!.complete();
    await expectLater(pending.first, throwsA(isA<SessionExpiredFailure>()));

    expect(pending.server.authHeaders, ['token-user-2']);
    expect(
      pending.container.read(accountManagerProvider).isSwitchPending,
      isFalse,
    );
  });

  test('a programmatic switch waits for the pending one, then runs', () async {
    final pending = await _heldSwitchToUser2();

    final Future<void> second = pending.manager.switchToAccount('user-3');
    await pumpEventQueue();
    expect(pending.server.requests, hasLength(1));
    pending.server.hold!.complete();

    await expectLater(pending.first, throwsA(isA<SessionExpiredFailure>()));
    await expectLater(second, throwsA(isA<SessionExpiredFailure>()));
    expect(pending.server.authHeaders, ['token-user-2', 'token-user-3']);
  });

  test('a programmatic switch to the pending target awaits it', () async {
    final pending = await _heldSwitchToUser2();

    final Future<void> second = pending.manager.switchToAccount('user-2');
    pending.server.hold!.complete();

    await expectLater(pending.first, throwsA(isA<SessionExpiredFailure>()));
    await expectLater(second, throwsA(isA<SessionExpiredFailure>()));
    expect(pending.server.authHeaders, ['token-user-2']);
  });

  test('the latest programmatic switch wins over earlier waiters', () async {
    final pending = await _heldSwitchToUser2();

    final Future<void> superseded = pending.manager.switchToAccount('user-3');
    final Future<void> latest = pending.manager.switchToAccount('user-4');
    pending.server.hold!.complete();

    await expectLater(pending.first, throwsA(isA<SessionExpiredFailure>()));
    await expectLater(
      superseded,
      throwsA(isA<AccountSwitchSupersededFailure>()),
    );
    await expectLater(latest, throwsA(isA<SessionExpiredFailure>()));
    expect(pending.server.authHeaders, ['token-user-2', 'token-user-4']);
  });

  for (final String? token in <String?>[null, '']) {
    final String label = token == null ? 'null' : 'empty';
    test('missing token skips the probe entirely ($label)', () async {
      final server = await _FakeApiServer.start();
      addTearDown(server.close);
      final (:container, :db) = _harness(baseUrl: server.baseUrl);
      await _signIn(container, db);
      container.read(fluxerAuthTokenProvider.notifier).setToken(token);

      final expired = await container
          .read(accountManagerProvider.notifier)
          .expireSessionIfInvalid();

      expect(expired, isFalse);
      expect(server.requests, isEmpty);
      expect(container.read(authStateProvider), isTrue);
      final session = await db.authSessionDao.getSession(_userId);
      expect(session!.isValid, isTrue);
    });
  }
}
