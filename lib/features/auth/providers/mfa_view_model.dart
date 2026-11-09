import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/data/browser_sign_in_service.dart';
import 'package:fluxer_app/features/auth/data/passkey_relying_party.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/auth/providers/passkey_error.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:passkeys/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mfa_view_model.g.dart';

enum MfaMethod { totp, webauthn }

class MfaViewState {
  static const _unset = Object();

  final MfaMethod? selectedMethod;
  final String code;
  final bool isSubmitting;
  final String? error;
  final LoginError? errorType;
  final bool webauthnLoading;
  final bool browserSignInLoading;
  final AuthSession? completedSession;

  const MfaViewState({
    required this.selectedMethod,
    required this.code,
    required this.isSubmitting,
    required this.error,
    required this.errorType,
    required this.webauthnLoading,
    required this.browserSignInLoading,
    required this.completedSession,
  });

  MfaViewState copyWith({
    Object? selectedMethod = _unset,
    String? code,
    bool? isSubmitting,
    Object? error = _unset,
    Object? errorType = _unset,
    bool? webauthnLoading,
    bool? browserSignInLoading,
    Object? completedSession = _unset,
  }) {
    return MfaViewState(
      selectedMethod: selectedMethod == _unset
          ? this.selectedMethod
          : selectedMethod as MfaMethod?,
      code: code ?? this.code,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error == _unset ? this.error : error as String?,
      errorType: errorType == _unset
          ? this.errorType
          : errorType as LoginError?,
      webauthnLoading: webauthnLoading ?? this.webauthnLoading,
      browserSignInLoading: browserSignInLoading ?? this.browserSignInLoading,
      completedSession: completedSession == _unset
          ? this.completedSession
          : completedSession as AuthSession?,
    );
  }

  bool get canSubmitCode =>
      !isSubmitting && code.replaceAll(' ', '').isNotEmpty;
}

@riverpod
class MfaViewModel extends _$MfaViewModel {
  late MfaChallenge _challenge;

  @override
  MfaViewState build(MfaChallenge challenge) {
    _challenge = challenge;

    MfaMethod? initialMethod;
    if (challenge.totp &&
        (!challenge.webauthn ||
            !ref.read(authInstanceSupportsPasskeysProvider))) {
      initialMethod = MfaMethod.totp;
    }

    return MfaViewState(
      selectedMethod: initialMethod,
      code: '',
      isSubmitting: false,
      error: challenge.methodCount == 0
          ? 'This sign-in challenge requires an unsupported MFA method.'
          : null,
      errorType: null,
      webauthnLoading: false,
      browserSignInLoading: false,
      completedSession: null,
    );
  }

  void selectMethod(MfaMethod method) {
    state = state.copyWith(
      selectedMethod: method,
      code: '',
      error: null,
      errorType: null,
    );
  }

  void clearMethod() {
    state = state.copyWith(
      selectedMethod: null,
      code: '',
      error: null,
      errorType: null,
    );
  }

  void updateCode(String value) {
    state = state.copyWith(code: value, error: null, errorType: null);
  }

  Future<void> submitCode() async {
    if (!state.canSubmitCode) {
      return;
    }

    final code = state.code.replaceAll(' ', '');
    state = state.copyWith(isSubmitting: true, error: null, errorType: null);

    try {
      final repo = ref.read(authRepositoryProvider);
      final AuthSession session;

      switch (state.selectedMethod!) {
        case MfaMethod.totp:
          session = await repo.verifyMfaTotp(
            ticket: _challenge.ticket,
            code: code,
          );
        case MfaMethod.webauthn:
          return;
      }

      state = state.copyWith(isSubmitting: false, completedSession: session);
    } on AuthFailure catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: _failureMessage(e, preferredField: 'code'),
        errorType: null,
      );
    } on Exception catch (e) {
      talker.error('[MfaViewModel] Unexpected error: $e');
      state = state.copyWith(
        isSubmitting: false,
        error: 'Verification failed. Please try again.',
        errorType: null,
      );
    }
  }

  String _failureMessage(AuthFailure failure, {String? preferredField}) {
    if (failure.kind == AuthFailureKind.verificationFailed) {
      return ref.read(appLocalizationsProvider).authVerificationFailed;
    }
    final preferredMessage = preferredField == null
        ? null
        : failure.fieldErrors[preferredField];
    if (preferredMessage != null && preferredMessage.isNotEmpty) {
      return _remapFailureMessage(preferredMessage);
    }
    if (failure.fieldErrors.isNotEmpty) {
      return _remapFailureMessage(failure.fieldErrors.values.first);
    }
    return _remapFailureMessage(failure.message);
  }

  String _remapFailureMessage(String message) {
    return switch (message) {
      'Session timed out. Refresh the page and log in again.' =>
        'Session timed out. Go back and log in again.',
      _ => message,
    };
  }

  Future<void> signInWithBrowser() async {
    if (state.browserSignInLoading) {
      return;
    }
    state = state.copyWith(
      browserSignInLoading: true,
      error: null,
      errorType: null,
    );
    try {
      final AuthSession session = await ref
          .read(browserSignInServiceProvider)
          .signIn(
            instance: ref.read(authInstanceSnapshotProvider),
            identifier: ref.read(loginViewModelProvider).email,
            usernameSignIn: ref
                .read(authInstanceRuntimeConfigProvider)
                .usernameSignIn,
          );
      state = state.copyWith(
        browserSignInLoading: false,
        completedSession: session,
      );
    } on BrowserSignInCancelledException {
      state = state.copyWith(browserSignInLoading: false);
    } on AuthFailure catch (e) {
      state = state.copyWith(
        browserSignInLoading: false,
        error: _failureMessage(e),
      );
    } on Object catch (e) {
      talker.error('[MfaViewModel] Browser sign-in error: $e');
      state = state.copyWith(
        browserSignInLoading: false,
        error: ref.read(appLocalizationsProvider).browserSignInFailed,
      );
    }
  }

  Future<void> startWebauthn() async {
    state = state.copyWith(webauthnLoading: true, error: null, errorType: null);

    try {
      final repo = ref.read(authRepositoryProvider);
      final authenticator = ref.read(passkeyAuthenticatorProvider);
      final webauthnService = WebAuthnService(authenticator);

      final (options, authResponse) = await withPasskeyRelyingParty(
        apiBaseUrl: ref.read(authFluxerBaseUrlProvider),
        attempt: (rpId) async {
          final options = await repo.getMfaWebauthnOptions(
            ticket: _challenge.ticket,
            rpId: rpId,
          );
          return (options, await webauthnService.authenticate(options));
        },
      );

      final session = await repo.verifyMfaWebauthn(
        ticket: _challenge.ticket,
        response: authResponse,
        challenge: options['challenge'] as String,
      );

      state = state.copyWith(webauthnLoading: false, completedSession: session);
    } on AuthFailure catch (e) {
      state = state.copyWith(
        webauthnLoading: false,
        error: _failureMessage(e),
        errorType: null,
      );
    } on PasskeyAuthCancelledException {
      state = state.copyWith(webauthnLoading: false);
    } on AuthenticatorException catch (e) {
      talker.error('[MfaViewModel] Passkey error: $e');
      final (errorType, errorMessage) = mapPasskeyAuthError(e);
      state = state.copyWith(
        webauthnLoading: false,
        errorType: errorType == LoginError.passkeyNoCredentials
            ? LoginError.passkeyNoCredentialsForAccount
            : errorType,
        error: errorMessage,
      );
    } on Object catch (e) {
      talker.error('[MfaViewModel] WebAuthn error: $e');
      state = state.copyWith(
        webauthnLoading: false,
        errorType: LoginError.passkeyFailed,
        error: null,
      );
    }
  }
}
