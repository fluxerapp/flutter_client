import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/providers/linked_devices_view_model.dart';
import 'package:fluxer_dart/export.dart';

class _FakeAuthApi implements AuthApi {
  _FakeAuthApi({this.sessions = const [], this.listError, this.logoutError});

  List<AuthSessionResponse> sessions;
  Object? listError;
  Object? logoutError;
  List<String>? lastLoggedOutIds;

  @override
  Future<AuthSessionsResponse> listAuthSessions() async {
    if (listError != null) {
      // Test fake: re-throw whatever the test supplied, including non-Error
      // instances like DioException. The VM catches `on Object`.
      // ignore: only_throw_errors
      throw listError!;
    }
    return sessions;
  }

  @override
  Future<void> logoutAllSessions({
    required LogoutAuthSessionsRequest body,
  }) async {
    lastLoggedOutIds = body.sessionIdHashes;
    if (logoutError != null) {
      // Test fake: re-throw whatever the test supplied, including non-Error
      // instances like DioException. The VM catches `on Object`.
      // ignore: only_throw_errors
      throw logoutError!;
    }
  }

  // Other AuthApi methods are not exercised in these tests.
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._fakeAuth) : super(Dio());

  final AuthApi _fakeAuth;

  @override
  AuthApi get auth => _fakeAuth;
}

AuthSessionResponse _session({
  required String id,
  bool current = false,
  String os = 'macOS',
  String platform = 'Fluxer Desktop',
}) {
  return AuthSessionResponse(
    idHash: id,
    maskedIp: null,
    current: current,
    clientInfo: AuthSessionResponseClientInfo(os: os, platform: platform),
    approxLastUsedAt: DateTime.now().subtract(const Duration(hours: 1)),
  );
}

ProviderContainer _container(AuthApi api) {
  final client = _FakeClient(api);
  return ProviderContainer(
    overrides: [fluxerClientProvider.overrideWithValue(client)],
  );
}

void main() {
  group('LinkedDevicesViewModel', () {
    test('load populates sessions on success', () async {
      final api = _FakeAuthApi(
        sessions: [
          _session(id: 'a', current: true),
          _session(id: 'b'),
        ],
      );
      final container = _container(api);
      addTearDown(container.dispose);

      // Listen keeps the auto-disposed provider alive across await gaps.
      final sub = container.listen(linkedDevicesViewModelProvider, (_, _) {});
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      final state = container.read(linkedDevicesViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.error, isNull);
      expect(state.sessions.map((s) => s.idHash), ['a', 'b']);
    });

    test('load sets error on failure', () async {
      final api = _FakeAuthApi(
        listError: DioException(requestOptions: RequestOptions()),
      );
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(linkedDevicesViewModelProvider, (_, _) {});
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      final state = container.read(linkedDevicesViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.error, 'failed');
      expect(state.sessions, isEmpty);
    });

    test('logout removes specified ids on success', () async {
      final api = _FakeAuthApi(
        sessions: [
          _session(id: 'a', current: true),
          _session(id: 'b'),
          _session(id: 'c'),
        ],
      );
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(linkedDevicesViewModelProvider, (_, _) {});
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      await container.read(linkedDevicesViewModelProvider.notifier).logout([
        'b',
      ]);

      final state = container.read(linkedDevicesViewModelProvider);
      expect(state.sessions.map((s) => s.idHash), ['a', 'c']);
      expect(state.revokingIds, isEmpty);
      expect(api.lastLoggedOutIds, ['b']);
    });

    test('logout of all non-current removes all sessions on success', () async {
      final api = _FakeAuthApi(
        sessions: [
          _session(id: 'a', current: true),
          _session(id: 'b'),
          _session(id: 'c'),
        ],
      );
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(linkedDevicesViewModelProvider, (_, _) {});
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      await container.read(linkedDevicesViewModelProvider.notifier).logout([
        'b',
        'c',
      ]);

      final state = container.read(linkedDevicesViewModelProvider);
      expect(state.sessions.map((s) => s.idHash), ['a']);
    });

    test('logout failure rethrows and preserves state', () async {
      final api = _FakeAuthApi(
        sessions: [
          _session(id: 'a', current: true),
          _session(id: 'b'),
        ],
        logoutError: DioException(requestOptions: RequestOptions()),
      );
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(linkedDevicesViewModelProvider, (_, _) {});
      addTearDown(sub.close);
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      await expectLater(
        container.read(linkedDevicesViewModelProvider.notifier).logout(['b']),
        throwsA(isA<DioException>()),
      );

      final state = container.read(linkedDevicesViewModelProvider);
      expect(state.sessions.map((s) => s.idHash), ['a', 'b']);
      expect(state.revokingIds, isEmpty);
    });
  });
}
