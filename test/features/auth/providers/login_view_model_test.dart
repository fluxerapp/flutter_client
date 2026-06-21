import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:fluxer_app/features/auth/domain/login_result.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';

class _FakeAuthRepository implements AuthRepository {
  _FakeAuthRepository(this.failure);

  final AuthFailure failure;

  @override
  Future<LoginResult> login({
    required String email,
    required String password,
    String? inviteCode,
  }) {
    return Future<LoginResult>.error(failure);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

ProviderContainer _containerFor(AuthFailure failure) {
  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(_FakeAuthRepository(failure)),
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
}
