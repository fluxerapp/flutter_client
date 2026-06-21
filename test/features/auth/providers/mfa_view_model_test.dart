import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/data/auth_repository.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/mfa_view_model.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';

class _FailingAuthRepository implements AuthRepository {
  const _FailingAuthRepository(this.failure);

  final AuthFailure failure;

  @override
  Future<AuthSession> verifyMfaTotp({
    required String ticket,
    required String code,
  }) {
    return Future<AuthSession>.error(failure);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test(
    'submitCode shows the code field error instead of generic form error',
    () async {
      final error = await _submitWithFailure(
        const AuthFailure(
          'Invalid form body.',
          fieldErrors: {'code': 'Invalid code.'},
        ),
      );

      expect(error, 'Invalid code.');
    },
  );

  test('submitCode remaps web session timeout copy for mobile', () async {
    final error = await _submitWithFailure(
      const AuthFailure(
        'Invalid form body.',
        fieldErrors: {
          'code': 'Session timed out. Refresh the page and log in again.',
        },
      ),
    );

    expect(error, 'Session timed out. Go back and log in again.');
  });

  test(
    'startWebauthn surfaces a passkey error instead of swallowing it',
    () async {
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(
            _WebauthnFailingAuthRepository(NoCredentialsAvailableException()),
          ),
          passkeyAuthenticatorProvider.overrideWithValue(_NoopAuthenticator()),
        ],
      );
      addTearDown(container.dispose);

      const challenge = MfaChallenge(
        ticket: 'mfa-ticket',
        totp: false,
        sms: false,
        webauthn: true,
      );
      final provider = mfaViewModelProvider(challenge);

      await container.read(provider.notifier).startWebauthn();

      final state = container.read(provider);
      expect(state.errorType, LoginError.passkeyNoCredentials);
      expect(state.webauthnLoading, isFalse);
    },
  );
}

class _WebauthnFailingAuthRepository implements AuthRepository {
  _WebauthnFailingAuthRepository(this.error);

  final Object error;

  @override
  Future<dynamic> getMfaWebauthnOptions({required String ticket}) {
    return Future<dynamic>.error(error);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _NoopAuthenticator implements PasskeyAuthenticator {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<String?> _submitWithFailure(AuthFailure failure) async {
  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(_FailingAuthRepository(failure)),
    ],
  );
  addTearDown(container.dispose);

  const challenge = MfaChallenge(
    ticket: 'mfa-ticket',
    totp: true,
    sms: false,
    webauthn: false,
  );
  final provider = mfaViewModelProvider(challenge);
  final notifier = container.read(provider.notifier)..updateCode('366117');

  await notifier.submitCode();

  return container.read(provider).error;
}
