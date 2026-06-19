import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/push_account_lifecycle.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/ban_view.dart';
import 'package:fluxer_app/features/auth/domain/ip_authorization_challenge.dart';
import 'package:fluxer_app/features/auth/domain/login_result.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/ban_view_provider.dart';
import 'package:fluxer_app/features/auth/providers/pending_invite_code_provider.dart';
import 'package:fluxer_app/features/auth/providers/registration_draft_provider.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

const Duration _kPostAuthStartupTimeout = Duration(seconds: 20);

enum LoginError {
  invalidEmail,
  invalidCredentials,
  unableToCreateAccount,
  unableToSignIn,
  unableToSendResetLink,
  unableToResetPassword,
  passkeyNoCredentials,
  passkeyDeviceNotSupported,
  passkeyDomainNotAssociated,
  passkeyTimeout,
  passkeyFailed,
}

class LoginViewState {
  static const _unset = Object();

  final String email;
  final String password;
  final bool isPasswordVisible;
  final String? errorMessage;
  final LoginError? errorType;
  final Map<String, String> fieldErrors;
  final bool isLoggingIn;
  final IpAuthorizationChallenge? ipAuthChallenge;
  final MfaChallenge? mfaChallenge;
  final BanViewInfo? banViewInfo;
  final bool showAccountSelector;
  final bool showForgotPassword;
  final bool forgotPasswordEmailSent;
  final String? resetToken;
  final bool showRegister;
  final List<String> usernameSuggestions;

  const LoginViewState({
    required this.email,
    required this.password,
    required this.isPasswordVisible,
    required this.errorMessage,
    required this.errorType,
    required this.fieldErrors,
    required this.isLoggingIn,
    required this.ipAuthChallenge,
    required this.mfaChallenge,
    required this.banViewInfo,
    required this.showAccountSelector,
    required this.showForgotPassword,
    required this.forgotPasswordEmailSent,
    required this.resetToken,
    required this.showRegister,
    this.usernameSuggestions = const [],
  });

  bool get canLogin =>
      !isLoggingIn && email.trim().isNotEmpty && password.isNotEmpty;

  bool get hasError =>
      errorMessage != null && errorMessage!.isNotEmpty || errorType != null;

  LoginViewState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    Object? errorMessage = _unset,
    Object? errorType = _unset,
    Map<String, String>? fieldErrors,
    bool? isLoggingIn,
    Object? ipAuthChallenge = _unset,
    Object? mfaChallenge = _unset,
    Object? banViewInfo = _unset,
    bool? showAccountSelector,
    bool? showForgotPassword,
    bool? forgotPasswordEmailSent,
    Object? resetToken = _unset,
    bool? showRegister,
    List<String>? usernameSuggestions,
  }) {
    return LoginViewState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage == _unset
          ? this.errorMessage
          : errorMessage as String?,
      errorType: errorType == _unset
          ? this.errorType
          : errorType as LoginError?,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      isLoggingIn: isLoggingIn ?? this.isLoggingIn,
      ipAuthChallenge: ipAuthChallenge == _unset
          ? this.ipAuthChallenge
          : ipAuthChallenge as IpAuthorizationChallenge?,
      mfaChallenge: mfaChallenge == _unset
          ? this.mfaChallenge
          : mfaChallenge as MfaChallenge?,
      banViewInfo: banViewInfo == _unset
          ? this.banViewInfo
          : banViewInfo as BanViewInfo?,
      showAccountSelector: showAccountSelector ?? this.showAccountSelector,
      showForgotPassword: showForgotPassword ?? this.showForgotPassword,
      forgotPasswordEmailSent:
          forgotPasswordEmailSent ?? this.forgotPasswordEmailSent,
      resetToken: resetToken == _unset
          ? this.resetToken
          : resetToken as String?,
      showRegister: showRegister ?? this.showRegister,
      usernameSuggestions: usernameSuggestions ?? this.usernameSuggestions,
    );
  }
}

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  Timer? _suggestionTimer;

  @override
  LoginViewState build() {
    ref.onDispose(() => _suggestionTimer?.cancel());
    return const LoginViewState(
      email: '',
      password: '',
      isPasswordVisible: false,
      errorMessage: null,
      errorType: null,
      fieldErrors: {},
      isLoggingIn: false,
      ipAuthChallenge: null,
      mfaChallenge: null,
      banViewInfo: null,
      showAccountSelector: true,
      showForgotPassword: false,
      forgotPasswordEmailSent: false,
      resetToken: null,
      showRegister: false,
    );
  }

  void updateEmail(String value) {
    state = state.copyWith(
      email: value,
      fieldErrors: state.fieldErrors.containsKey('email')
          ? const {}
          : state.fieldErrors,
    );
  }

  void updatePassword(String value) {
    state = state.copyWith(password: value);
  }

  void togglePassword() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void clearIpAuthChallenge() {
    state = state.copyWith(ipAuthChallenge: null);
  }

  void clearMfaChallenge() {
    state = state.copyWith(mfaChallenge: null);
  }

  void clearBanView() {
    ref.read(banViewProvider.notifier).clear();
    state = state.copyWith(banViewInfo: null);
  }

  void setError(String message) {
    state = state.copyWith(errorMessage: message, errorType: null);
  }

  void setErrorType(LoginError type) {
    state = state.copyWith(errorType: type, errorMessage: null);
  }

  void showRegisterScreen() {
    state = state.copyWith(
      showRegister: true,
      showForgotPassword: false,
      forgotPasswordEmailSent: false,
      resetToken: null,
      errorMessage: null,
      fieldErrors: const {},
    );
  }

  void backFromRegister() {
    state = state.copyWith(
      showRegister: false,
      errorMessage: null,
      fieldErrors: const {},
      usernameSuggestions: const [],
    );
  }

  void fetchUsernameSuggestions(String displayName) {
    _suggestionTimer?.cancel();
    final trimmed = displayName.trim();

    if (trimmed.isEmpty) {
      state = state.copyWith(usernameSuggestions: const []);
      return;
    }

    _suggestionTimer = Timer(const Duration(milliseconds: 500), () {
      unawaited(_loadSuggestions(trimmed));
    });
  }

  Future<void> _loadSuggestions(String globalName) async {
    try {
      final suggestions = await ref
          .read(authRepositoryProvider)
          .getUsernameSuggestions(globalName: globalName);
      state = state.copyWith(usernameSuggestions: suggestions);
    } on Exception catch (e) {
      talker.warning('[LoginViewModel] Username suggestions failed: $e');
    }
  }

  Future<void> submitRegister({
    required String email,
    required String password,
    required String dateOfBirth,
    String? username,
    String? displayName,
  }) async {
    state = state.copyWith(
      isLoggingIn: true,
      errorMessage: null,
      errorType: null,
      fieldErrors: const {},
    );

    try {
      final inviteCode = ref.read(pendingInviteCodeProvider.notifier).consume();
      final session = await ref
          .read(authRepositoryProvider)
          .register(
            email: email,
            password: password,
            dateOfBirth: dateOfBirth,
            username: username,
            displayName: displayName,
            inviteCode: inviteCode,
          );

      ref.read(registrationDraftProvider.notifier).clear();
      ref.read(fluxerAuthTokenProvider.notifier).setToken(session.token);
      final restored = await _restoreAuthenticatedSession();
      if (!restored) {
        state = state.copyWith(
          errorType: LoginError.unableToCreateAccount,
          isLoggingIn: false,
        );
        return;
      }
      state = state.copyWith(showRegister: false, isLoggingIn: false);
    } on AuthFailure catch (error) {
      state = state.copyWith(
        errorMessage: error.fieldErrors.isEmpty ? error.message : null,
        fieldErrors: error.fieldErrors,
        isLoggingIn: false,
      );
    } on Exception catch (e) {
      talker.error('[LoginViewModel] Register error: $e');
      state = state.copyWith(
        errorType: LoginError.unableToCreateAccount,
        isLoggingIn: false,
      );
    }
  }

  void hideAccountSelector() {
    state = state.copyWith(showAccountSelector: false);
  }

  void showAccountSelectorAgain() {
    state = state.copyWith(showAccountSelector: true);
  }

  Future<void> completeMfa() async {
    await _finalizeSavedSession(clearMfaChallenge: true);
  }

  Future<void> completeIpAuth() async {
    await _finalizeSavedSession(clearIpAuthChallenge: true);
  }

  Future<void> _finalizeSavedSession({
    bool clearMfaChallenge = false,
    bool clearIpAuthChallenge = false,
  }) async {
    final session = await ref.read(authRepositoryProvider).getActiveSession();
    if (session != null) {
      ref.read(fluxerAuthTokenProvider.notifier).setToken(session.token);
    }
    final restored = await _restoreAuthenticatedSession();
    if (!restored) {
      state = state.copyWith(
        errorType: LoginError.unableToSignIn,
        isLoggingIn: false,
      );
      return;
    }
    state = state.copyWith(
      email: '',
      password: '',
      mfaChallenge: clearMfaChallenge ? null : state.mfaChallenge,
      ipAuthChallenge: clearIpAuthChallenge ? null : state.ipAuthChallenge,
      isLoggingIn: false,
    );
  }

  void showForgotPasswordScreen() {
    state = state.copyWith(
      showForgotPassword: true,
      showRegister: false,
      forgotPasswordEmailSent: false,
      resetToken: null,
      errorMessage: null,
      fieldErrors: const {},
    );
  }

  void backFromForgotPassword() {
    state = state.copyWith(
      showForgotPassword: false,
      forgotPasswordEmailSent: false,
      errorMessage: null,
      fieldErrors: const {},
    );
  }

  void setResetToken(String token) {
    state = state.copyWith(
      resetToken: token,
      showForgotPassword: false,
      showRegister: false,
      forgotPasswordEmailSent: false,
      errorMessage: null,
      fieldErrors: const {},
    );
  }

  void clearResetToken() {
    state = state.copyWith(
      resetToken: null,
      errorMessage: null,
      fieldErrors: const {},
    );
  }

  Future<void> submitForgotPassword(String email) async {
    if (!_emailRegex.hasMatch(email.trim())) {
      state = state.copyWith(
        errorType: LoginError.invalidEmail,
        fieldErrors: const {},
      );
      return;
    }

    state = state.copyWith(
      isLoggingIn: true,
      errorMessage: null,
      errorType: null,
      fieldErrors: const {},
    );

    try {
      await ref.read(authRepositoryProvider).forgotPassword(email: email);
      state = state.copyWith(forgotPasswordEmailSent: true, isLoggingIn: false);
    } on AuthFailure catch (error) {
      state = state.copyWith(
        errorMessage: error.fieldErrors.isEmpty ? error.message : null,
        fieldErrors: error.fieldErrors,
        isLoggingIn: false,
      );
    } on Exception catch (e) {
      talker.error('[LoginViewModel] Forgot password error: $e');
      state = state.copyWith(
        errorType: LoginError.unableToSendResetLink,
        isLoggingIn: false,
      );
    }
  }

  Future<void> submitResetPassword({
    required String token,
    required String password,
  }) async {
    state = state.copyWith(
      isLoggingIn: true,
      errorMessage: null,
      errorType: null,
      fieldErrors: const {},
    );

    try {
      final result = await ref
          .read(authRepositoryProvider)
          .resetPassword(token: token, password: password);

      switch (result) {
        case LoginSuccess(:final session):
          final restored = await _completeLoginSuccess(session);
          if (!restored) {
            return;
          }
          state = state.copyWith(
            email: '',
            password: '',
            resetToken: null,
            isLoggingIn: false,
          );
        case LoginMfaRequired(:final challenge):
          state = state.copyWith(
            mfaChallenge: challenge,
            resetToken: null,
            isLoggingIn: false,
          );
        case LoginIpAuthRequired() || LoginSuspended():
          // Unreachable — password reset only returns success or MFA.
          state = state.copyWith(resetToken: null, isLoggingIn: false);
      }
    } on AuthFailure catch (error) {
      state = state.copyWith(
        errorMessage: error.fieldErrors.isEmpty ? error.message : null,
        fieldErrors: error.fieldErrors,
        isLoggingIn: false,
      );
    } on Exception catch (e) {
      talker.error('[LoginViewModel] Reset password error: $e');
      state = state.copyWith(
        errorType: LoginError.unableToResetPassword,
        isLoggingIn: false,
      );
    }
  }

  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  Future<bool> login() async {
    if (!state.canLogin) {
      return false;
    }

    if (!_emailRegex.hasMatch(state.email.trim())) {
      state = state.copyWith(
        errorType: LoginError.invalidEmail,
        fieldErrors: const {},
      );
      return false;
    }

    state = state.copyWith(
      errorMessage: null,
      errorType: null,
      fieldErrors: const {},
      isLoggingIn: true,
    );

    try {
      final inviteCode = ref.read(pendingInviteCodeProvider.notifier).consume();
      final result = await ref
          .read(authRepositoryProvider)
          .login(
            email: state.email,
            password: state.password,
            inviteCode: inviteCode,
          );

      switch (result) {
        case LoginSuccess(:final session):
          final restored = await _completeLoginSuccess(session);
          if (!restored) {
            return false;
          }
          state = state.copyWith(email: '', password: '', isLoggingIn: false);
          return true;
        case LoginIpAuthRequired(:final challenge):
          state = state.copyWith(
            ipAuthChallenge: challenge,
            isLoggingIn: false,
          );
          return false;
        case LoginMfaRequired(:final challenge):
          state = state.copyWith(mfaChallenge: challenge, isLoggingIn: false);
          return false;
        case LoginSuspended(:final banViewInfo):
          unawaited(ref.read(banViewProvider.notifier).initialize(banViewInfo));
          state = state.copyWith(banViewInfo: banViewInfo, isLoggingIn: false);
          return false;
      }
    } on AuthFailure catch (error) {
      if (error.kind == AuthFailureKind.invalidCredentials) {
        state = state.copyWith(
          errorType: LoginError.invalidCredentials,
          fieldErrors: const {},
          isLoggingIn: false,
        );
        return false;
      }
      state = state.copyWith(
        errorMessage: error.fieldErrors.isEmpty ? error.message : null,
        fieldErrors: error.fieldErrors,
        isLoggingIn: false,
      );
      return false;
    } on Exception catch (e) {
      talker.error('[LoginViewModel] Unexpected error: $e');
      state = state.copyWith(
        errorType: LoginError.unableToSignIn,
        isLoggingIn: false,
      );
      return false;
    }
  }

  Future<bool> _completeLoginSuccess(AuthSession session) async {
    final String? previousUserId = ref.read(currentUserIdProvider);
    if (previousUserId != null &&
        previousUserId != session.userId &&
        ref.read(authStateProvider)) {
      await PushAccountLifecycle.leaveActiveAccount(
        ref,
        mode: LeavePushAccountMode.switchAccount,
      );
    }
    ref.read(fluxerAuthTokenProvider.notifier).setToken(session.token);
    final restored = await _restoreAuthenticatedSession();
    if (!restored) {
      state = state.copyWith(
        errorType: LoginError.unableToSignIn,
        isLoggingIn: false,
      );
    }
    return restored;
  }

  Future<bool> _restoreAuthenticatedSession() async {
    ref.invalidate(appStartupProvider);
    try {
      await ref
          .read(appStartupProvider.future)
          .timeout(_kPostAuthStartupTimeout);
    } on Exception catch (e) {
      talker.error('[LoginViewModel] Post-auth startup failed: $e');
      return false;
    }
    final session = await ref
        .read(fluxerDatabaseProvider)
        .authSessionDao
        .getActiveSession();
    return session != null && session.isValid;
  }

  Future<void> loginWithPasskey() async {
    state = state.copyWith(
      errorMessage: null,
      errorType: null,
      fieldErrors: const {},
      isLoggingIn: true,
    );

    try {
      final repo = ref.read(authRepositoryProvider);
      final webauthnService = WebAuthnService(PasskeyAuthenticator());

      final options = await repo.getPasskeyLoginOptions();
      final authResponse = await webauthnService.authenticate(
        options as Map<String, dynamic>,
      );
      final result = await repo.loginWithPasskey(
        response: authResponse,
        challenge: options['challenge'] as String,
      );

      switch (result) {
        case LoginSuccess(:final session):
          final restored = await _completeLoginSuccess(session);
          if (restored) {
            state = state.copyWith(email: '', password: '', isLoggingIn: false);
          }
        case LoginIpAuthRequired(:final challenge):
          state = state.copyWith(
            ipAuthChallenge: challenge,
            isLoggingIn: false,
          );
        case LoginMfaRequired() || LoginSuspended():
          state = state.copyWith(isLoggingIn: false);
      }
    } on AuthFailure catch (error) {
      state = state.copyWith(errorMessage: error.message, isLoggingIn: false);
    } on PasskeyAuthCancelledException {
      state = state.copyWith(isLoggingIn: false);
    } on AuthenticatorException catch (e) {
      talker.error('[LoginViewModel] Passkey error: $e');
      final (errorType, errorMessage) = _passkeyError(e);
      state = state.copyWith(
        errorType: errorType,
        errorMessage: errorMessage,
        isLoggingIn: false,
      );
    } on Exception catch (e) {
      talker.error('[LoginViewModel] Passkey error: $e');
      state = state.copyWith(isLoggingIn: false);
    }
  }

  static (LoginError?, String?) _passkeyError(AuthenticatorException e) {
    return switch (e) {
      NoCredentialsAvailableException() => (
        LoginError.passkeyNoCredentials,
        null,
      ),
      DeviceNotSupportedException() => (
        LoginError.passkeyDeviceNotSupported,
        null,
      ),
      DomainNotAssociatedException() => (
        LoginError.passkeyDomainNotAssociated,
        null,
      ),
      TimeoutException() => (LoginError.passkeyTimeout, null),
      // TYPE_UNKNOWN includes OS-localized messages (e.g. verification
      // failure, domain mismatch). Pass the message through directly
      // since it's already in the user's language.
      UnhandledAuthenticatorException(:final message) when message != null => (
        null,
        message,
      ),
      _ => (LoginError.passkeyFailed, null),
    };
  }
}
