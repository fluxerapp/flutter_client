import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/settings/providers/webauthn_credentials_view_model.dart';
import 'package:fluxer_dart/export.dart';

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi({this.credentials = const [], this.listError, this.onList});

  List<WebAuthnCredentialResponse> credentials;
  Object? listError;
  Future<List<WebAuthnCredentialResponse>> Function()? onList;

  @override
  Future<List<WebAuthnCredentialResponse>> listWebauthnCredentials() async {
    final onList = this.onList;
    if (onList != null) {
      return onList();
    }
    if (listError != null) {
      // Test fake: re-throw whatever the test supplied (e.g. DioException).
      // ignore: only_throw_errors
      throw listError!;
    }
    return credentials;
  }

  // Other UsersApi methods are not exercised in these tests.
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeClient extends FluxerClient {
  _FakeClient(this._fakeUsers) : super(Dio());

  final UsersApi _fakeUsers;

  @override
  UsersApi get users => _fakeUsers;
}

WebAuthnCredentialResponse _cred({required String id, String name = 'Key'}) {
  return WebAuthnCredentialResponse(
    id: id,
    name: name,
    createdAt: '2026-01-01T00:00:00Z',
    lastUsedAt: null,
  );
}

ProviderContainer _container(UsersApi api) {
  final client = _FakeClient(api);
  return ProviderContainer(
    overrides: [fluxerClientProvider.overrideWithValue(client)],
  );
}

Future<void> _pumpMicrotasks() async {
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);
}

void main() {
  group('WebauthnCredentialsViewModel', () {
    test('build hydrates credentials from REST', () async {
      final api = _FakeUsersApi(
        credentials: [
          _cred(id: 'a'),
          _cred(id: 'b'),
        ],
      );
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(
        webauthnCredentialsViewModelProvider,
        (_, _) {},
      );
      addTearDown(sub.close);
      await _pumpMicrotasks();

      final state = container.read(webauthnCredentialsViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.error, isNull);
      expect(state.credentials.map((c) => c.id), ['a', 'b']);
    });

    test('load sets error on failure', () async {
      final api = _FakeUsersApi(
        listError: DioException(requestOptions: RequestOptions()),
      );
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(
        webauthnCredentialsViewModelProvider,
        (_, _) {},
      );
      addTearDown(sub.close);
      await _pumpMicrotasks();

      final state = container.read(webauthnCredentialsViewModelProvider);
      expect(state.isLoading, isFalse);
      expect(state.error, isNotNull);
      expect(state.credentials, isEmpty);
    });

    test('setCredentials replaces the list and clears loading', () async {
      final api = _FakeUsersApi(credentials: [_cred(id: 'a')]);
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(
        webauthnCredentialsViewModelProvider,
        (_, _) {},
      );
      addTearDown(sub.close);
      await _pumpMicrotasks();

      container
          .read(webauthnCredentialsViewModelProvider.notifier)
          .setCredentials([_cred(id: 'x'), _cred(id: 'y')]);

      final state = container.read(webauthnCredentialsViewModelProvider);
      expect(state.credentials.map((c) => c.id), ['x', 'y']);
      expect(state.isLoading, isFalse);
      expect(state.error, isNull);
    });

    test('setCredentials wins over a slower in-flight load', () async {
      // The build() load awaits this completer, simulating a slow REST round
      // trip that resolves after a gateway push already updated the list.
      final completer = Completer<List<WebAuthnCredentialResponse>>();
      final api = _FakeUsersApi(onList: () => completer.future);
      final container = _container(api);
      addTearDown(container.dispose);

      final sub = container.listen(
        webauthnCredentialsViewModelProvider,
        (_, _) {},
      );
      addTearDown(sub.close);
      // Let build()'s load() start and suspend on the pending completer.
      await Future<void>.delayed(Duration.zero);

      container
          .read(webauthnCredentialsViewModelProvider.notifier)
          .setCredentials([_cred(id: 'gateway')]);

      // The stale REST response must be dropped by the _updateSeq guard.
      completer.complete([_cred(id: 'stale')]);
      await _pumpMicrotasks();

      final state = container.read(webauthnCredentialsViewModelProvider);
      expect(state.credentials.map((c) => c.id), ['gateway']);
      expect(state.isLoading, isFalse);
    });
  });
}
