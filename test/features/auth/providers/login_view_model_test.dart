import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/data/sso_auth_service.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:fluxer_app/features/auth/domain/login_result.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/auth/providers/registration_draft_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

const InstanceConfigSnapshot _originalInstance = InstanceConfigSnapshot(
  apiBaseUrl: 'https://a.example/api',
  gatewayUrl: 'wss://a.example/gateway',
  displayDomain: 'a.example',
);

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository({this.failure});

  final AuthFailure? failure;

  @override
  Future<LoginResult> login({
    required String email,
    required String password,
    String? inviteCode,
  }) {
    return Future<LoginResult>.error(
      failure ??
          const AuthFailure(
            'Invalid email or password.',
            kind: AuthFailureKind.invalidCredentials,
          ),
    );
  }

  @override
  Future<SsoStartResponse> startSso({String? redirectTo, String? redirectUri}) {
    return Future<SsoStartResponse>.value(
      const SsoStartResponse(
        authorizationUrl: 'https://example.com/sso',
        state: 'state',
        redirectUri: 'fluxer://auth/sso/callback',
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _PendingApprovalAdapter implements HttpClientAdapter {
  const _PendingApprovalAdapter();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.uri.path, '/v1/auth/register');
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{
        'registration_pending_approval': true,
        'user_id': '900000000000000001',
      }),
      200,
      statusMessage: 'OK',
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _CancellingSsoAuthService extends SsoAuthService {
  @override
  Future<Uri> authenticate({required String authorizationUrl}) {
    throw const SsoAuthCancelledException();
  }
}

ProviderContainer _containerFor(AuthFailure failure) {
  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(
        _FakeAuthRepository(failure: failure),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

ProviderContainer _container() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container;
}

void main() {
  test('ensure login screen transitions are mutually exclusive', () {
    final container = _container();
    final notifier = container.read(loginViewModelProvider.notifier);
    final transitions =
        <
          ({
            String name,
            void Function() enter,
            bool forgot,
            bool register,
            bool reset,
          })
        >[
          (
            name: 'forgot password',
            enter: notifier.showForgotPasswordScreen,
            forgot: true,
            register: false,
            reset: false,
          ),
          (
            name: 'register',
            enter: notifier.showRegisterScreen,
            forgot: false,
            register: true,
            reset: false,
          ),
          (
            name: 'reset password',
            enter: () => notifier.setResetToken('reset-token'),
            forgot: false,
            register: false,
            reset: true,
          ),
        ];

    for (final seed in transitions) {
      for (final target in transitions) {
        seed.enter();
        target.enter();

        final state = container.read(loginViewModelProvider);
        expect(state.showForgotPassword, target.forgot, reason: target.name);
        expect(state.showRegister, target.register, reason: target.name);
        expect(state.resetToken != null, target.reset, reason: target.name);
      }
    }
  });

  test('an invalid-credentials failure shows a single general error', () async {
    final container = _containerFor(
      const AuthFailure(
        'Invalid email or password.',
        kind: AuthFailureKind.invalidCredentials,
      ),
    );
    container.read(loginViewModelProvider.notifier)
      ..updateEmail('user@example.com')
      ..updatePassword('wrong-password');

    await container.read(loginViewModelProvider.notifier).login();

    final state = container.read(loginViewModelProvider);
    expect(state.errorType, LoginError.invalidCredentials);
    expect(state.fieldErrors, isEmpty);
    expect(state.errorMessage, isNull);
  });

  test('a field validation failure keeps per-field errors', () async {
    final container = _containerFor(
      const AuthFailure(
        'Invalid form body.',
        fieldErrors: {'email': 'Enter a valid email.'},
      ),
    );
    container.read(loginViewModelProvider.notifier)
      ..updateEmail('user@example.com')
      ..updatePassword('whatever');

    await container.read(loginViewModelProvider.notifier).login();

    final state = container.read(loginViewModelProvider);
    expect(state.fieldErrors['email'], 'Enter a valid email.');
    expect(state.errorType, isNull);
    expect(state.errorMessage, isNull);
  });

  test('SSO cancel during add-account restores the active instance', () async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
        ssoAuthServiceProvider.overrideWithValue(_CancellingSsoAuthService()),
      ],
    );
    addTearDown(container.dispose);
    const InstanceConfigSnapshot alteredInstance = InstanceConfigSnapshot(
      apiBaseUrl: 'https://b.example/api',
      gatewayUrl: 'wss://b.example/gateway',
      displayDomain: 'b.example',
    );
    container
        .read(activeInstanceProvider.notifier)
        .applySnapshot(alteredInstance);
    container
        .read(addAccountInstanceGuardProvider.notifier)
        .arm(_originalInstance);
    await container.read(loginViewModelProvider.notifier).startSsoLogin();
    final LoginViewState state = container.read(loginViewModelProvider);
    expect(state.isStartingSso, isFalse);
    expect(state.errorType, LoginError.ssoCancelled);
    expect(container.read(activeInstanceProvider), _originalInstance);
  });

  test('approval-mode registration is not reported as a failure', () async {
    final ProviderContainer container = _approvalModeContainer();
    container.read(loginViewModelProvider.notifier).showRegisterScreen();

    await _submitApprovalRegistration(container);

    final LoginViewState state = container.read(loginViewModelProvider);
    expect(state.errorType, isNull);
    expect(state.errorMessage, isNull);
    expect(state.pendingApprovalUserId, '900000000000000001');
    expect(state.isLoggingIn, isFalse);
    expect(state.showRegister, isTrue);
  });

  test('approval-mode registration clears the registration draft', () async {
    final ProviderContainer container = _approvalModeContainer();
    container
        .read(registrationDraftProvider.notifier)
        .update(
          const RegistrationDraft(
            email: 'user@example.com',
            password: 'hunter2hunter2',
            confirmPassword: 'hunter2hunter2',
            birthMonth: 1,
            birthDay: 2,
            birthYear: 1990,
            consent: true,
          ),
        );

    await _submitApprovalRegistration(container);

    expect(container.read(registrationDraftProvider).isEmpty, isTrue);
  });
}

ProviderContainer _approvalModeContainer() {
  final FluxerDatabase db = openTestDatabase();
  addTearDown(db.close);
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = const _PendingApprovalAdapter();
  final ProviderContainer container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(
        AuthRepository(
          FluxerClient(dio),
          db,
          MapAuthTokenStorage(),
          readInstanceSnapshot: InstanceConfigSnapshot.officialDefault,
        ),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

Future<void> _submitApprovalRegistration(ProviderContainer container) {
  return container
      .read(loginViewModelProvider.notifier)
      .submitRegister(
        email: 'user@example.com',
        password: 'hunter2hunter2',
        dateOfBirth: '1990-01-02',
      );
}
