import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/auth/domain/auth_failure.dart';
import 'package:fluxer_app/features/auth/domain/auth_session.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mfa_view_model.g.dart';

enum MfaMethod { totp, sms, webauthn }

class MfaViewState {
  static const _unset = Object();

  final MfaMethod? selectedMethod;
  final String code;
  final bool isSubmitting;
  final String? error;
  final bool smsSent;
  final bool webauthnLoading;
  final AuthSession? completedSession;

  const MfaViewState({
    required this.selectedMethod,
    required this.code,
    required this.isSubmitting,
    required this.error,
    required this.smsSent,
    required this.webauthnLoading,
    required this.completedSession,
  });

  MfaViewState copyWith({
    Object? selectedMethod = _unset,
    String? code,
    bool? isSubmitting,
    Object? error = _unset,
    bool? smsSent,
    bool? webauthnLoading,
    Object? completedSession = _unset,
  }) {
    return MfaViewState(
      selectedMethod: selectedMethod == _unset
          ? this.selectedMethod
          : selectedMethod as MfaMethod?,
      code: code ?? this.code,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: error == _unset ? this.error : error as String?,
      smsSent: smsSent ?? this.smsSent,
      webauthnLoading: webauthnLoading ?? this.webauthnLoading,
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

    // Auto-select code-based method if only one available.
    // WebAuthn requires user interaction so it stays on the selector.
    MfaMethod? initialMethod;
    if (!challenge.hasMultipleMethods) {
      if (challenge.totp) {
        initialMethod = MfaMethod.totp;
      } else if (challenge.sms) {
        initialMethod = MfaMethod.sms;
      }
    }

    return MfaViewState(
      selectedMethod: initialMethod,
      code: '',
      isSubmitting: false,
      error: null,
      smsSent: false,
      webauthnLoading: false,
      completedSession: null,
    );
  }

  void selectMethod(MfaMethod method) {
    state = state.copyWith(
      selectedMethod: method,
      code: '',
      error: null,
      smsSent: false,
    );
  }

  void clearMethod() {
    state = state.copyWith(selectedMethod: null, code: '', error: null);
  }

  void updateCode(String value) {
    state = state.copyWith(code: value, error: null);
  }

  Future<void> submitCode() async {
    if (!state.canSubmitCode) {
      return;
    }

    final code = state.code.replaceAll(' ', '');
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      final repo = ref.read(authRepositoryProvider);
      final AuthSession session;

      switch (state.selectedMethod!) {
        case MfaMethod.totp:
          session = await repo.verifyMfaTotp(
            ticket: _challenge.ticket,
            code: code,
          );
        case MfaMethod.sms:
          session = await repo.verifyMfaSms(
            ticket: _challenge.ticket,
            code: code,
          );
        case MfaMethod.webauthn:
          // WebAuthn doesn't use code submission.
          return;
      }

      state = state.copyWith(isSubmitting: false, completedSession: session);
    } on AuthFailure catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        error: _failureMessage(e, preferredField: 'code'),
      );
    } on Exception catch (e) {
      talker.error('[MfaViewModel] Unexpected error: $e');
      state = state.copyWith(
        isSubmitting: false,
        error: 'Verification failed. Please try again.',
      );
    }
  }

  String _failureMessage(AuthFailure failure, {String? preferredField}) {
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

  Future<void> sendSms() async {
    state = state.copyWith(isSubmitting: true, error: null);

    try {
      await ref
          .read(authRepositoryProvider)
          .sendMfaSms(ticket: _challenge.ticket);
      state = state.copyWith(isSubmitting: false, smsSent: true);
    } on AuthFailure catch (e) {
      state = state.copyWith(isSubmitting: false, error: _failureMessage(e));
    } on Exception catch (e) {
      talker.error('[MfaViewModel] SMS send error: $e');
      state = state.copyWith(
        isSubmitting: false,
        error: 'Failed to send code. Please try again.',
      );
    }
  }

  Future<void> startWebauthn() async {
    state = state.copyWith(webauthnLoading: true, error: null);

    try {
      final repo = ref.read(authRepositoryProvider);
      final authenticator = ref.read(passkeyAuthenticatorProvider);
      final webauthnService = WebAuthnService(authenticator);

      // 1. Get WebAuthn options from server.
      final options = await repo.getMfaWebauthnOptions(
        ticket: _challenge.ticket,
      );

      // 2. Trigger platform authenticator.
      final authResponse = await webauthnService.authenticate(
        options as Map<String, dynamic>,
      );

      // 3. Verify with server.
      final session = await repo.verifyMfaWebauthn(
        ticket: _challenge.ticket,
        response: authResponse,
        challenge: options['challenge'] as String,
      );

      state = state.copyWith(webauthnLoading: false, completedSession: session);
    } on AuthFailure catch (e) {
      state = state.copyWith(webauthnLoading: false, error: _failureMessage(e));
    } on Exception catch (e) {
      talker.error('[MfaViewModel] WebAuthn error: $e');
      state = state.copyWith(webauthnLoading: false);
    }
  }
}
