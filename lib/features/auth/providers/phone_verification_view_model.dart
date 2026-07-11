import 'package:dio/dio.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification_failure.dart';
import 'package:fluxer_app/features/auth/providers/phone_verification_providers.dart';
import 'package:fluxer_app/features/auth/utils/country_codes.dart';
import 'package:fluxer_app/features/auth/utils/phone_verification_errors.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_verification_view_model.g.dart';

class PhoneVerificationViewState {
  static const Object _unset = Object();

  const PhoneVerificationViewState({
    required this.step,
    required this.isLoading,
    required this.selectedCountry,
    required this.phoneDigits,
    required this.e164Phone,
    required this.inboundChallenge,
    required this.phoneError,
    required this.codeError,
    required this.generalError,
    required this.requiresInboundPhone,
  });

  final PhoneVerificationStep step;
  final bool isLoading;
  final PhoneCountry selectedCountry;
  final String phoneDigits;
  final String? e164Phone;
  final InboundChallengeState? inboundChallenge;
  final PhoneVerificationFailure? phoneError;
  final PhoneVerificationFailure? codeError;
  final PhoneVerificationFailure? generalError;
  final bool requiresInboundPhone;

  PhoneVerificationViewState copyWith({
    PhoneVerificationStep? step,
    bool? isLoading,
    PhoneCountry? selectedCountry,
    String? phoneDigits,
    Object? e164Phone = _unset,
    Object? inboundChallenge = _unset,
    Object? phoneError = _unset,
    Object? codeError = _unset,
    Object? generalError = _unset,
    bool? requiresInboundPhone,
  }) {
    return PhoneVerificationViewState(
      step: step ?? this.step,
      isLoading: isLoading ?? this.isLoading,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      phoneDigits: phoneDigits ?? this.phoneDigits,
      e164Phone: e164Phone == _unset ? this.e164Phone : e164Phone as String?,
      inboundChallenge: inboundChallenge == _unset
          ? this.inboundChallenge
          : inboundChallenge as InboundChallengeState?,
      phoneError: phoneError == _unset
          ? this.phoneError
          : phoneError as PhoneVerificationFailure?,
      codeError: codeError == _unset
          ? this.codeError
          : codeError as PhoneVerificationFailure?,
      generalError: generalError == _unset
          ? this.generalError
          : generalError as PhoneVerificationFailure?,
      requiresInboundPhone: requiresInboundPhone ?? this.requiresInboundPhone,
    );
  }
}

@riverpod
class PhoneVerificationViewModel extends _$PhoneVerificationViewModel {
  @override
  PhoneVerificationViewState build({bool requiresInboundPhone = false}) {
    return PhoneVerificationViewState(
      step: requiresInboundPhone
          ? PhoneVerificationStep.inboundWaiting
          : PhoneVerificationStep.phone,
      isLoading: false,
      selectedCountry: getDefaultPhoneCountry(),
      phoneDigits: '',
      e164Phone: null,
      inboundChallenge: null,
      phoneError: null,
      codeError: null,
      generalError: null,
      requiresInboundPhone: requiresInboundPhone,
    );
  }

  void reset({bool requiresInboundPhone = false}) {
    state = PhoneVerificationViewState(
      step: requiresInboundPhone
          ? PhoneVerificationStep.inboundWaiting
          : PhoneVerificationStep.phone,
      isLoading: false,
      selectedCountry: getDefaultPhoneCountry(),
      phoneDigits: '',
      e164Phone: null,
      inboundChallenge: null,
      phoneError: null,
      codeError: null,
      generalError: null,
      requiresInboundPhone: requiresInboundPhone,
    );
  }

  void setSelectedCountry(PhoneCountry country) {
    state = state.copyWith(
      selectedCountry: country,
      phoneDigits: '',
      e164Phone: null,
      phoneError: null,
    );
  }

  void setPhoneDigits(String digits) {
    final String normalized = digits.replaceAll(RegExp(r'\D'), '');
    state = state.copyWith(
      phoneDigits: normalized,
      phoneError: null,
      generalError: null,
    );
  }

  void goToPhoneStep() {
    state = state.copyWith(
      step: PhoneVerificationStep.phone,
      codeError: null,
      generalError: null,
    );
  }

  Future<bool> startInboundIfRequired() async {
    if (!state.requiresInboundPhone) {
      return true;
    }
    return refreshInboundChallenge(useAccountEndpoint: true);
  }

  Future<bool> sendVerification() async {
    final String? e164 = getE164PhoneNumber(
      state.phoneDigits,
      state.selectedCountry,
    );
    if (state.phoneDigits.isEmpty) {
      state = state.copyWith(
        phoneError: const PhoneVerificationFailure(
          kind: PhoneVerificationErrorKind.invalidPhoneFormat,
          field: PhoneVerificationErrorField.phone,
        ),
      );
      return false;
    }
    if (e164 == null) {
      state = state.copyWith(
        phoneError: const PhoneVerificationFailure(
          kind: PhoneVerificationErrorKind.invalidPhoneFormat,
          field: PhoneVerificationErrorField.phone,
        ),
      );
      return false;
    }
    state = state.copyWith(
      isLoading: true,
      phoneError: null,
      generalError: null,
      e164Phone: e164,
    );
    try {
      final PhoneSendVerificationResponse response = await ref
          .read(phoneVerificationRepositoryProvider)
          .sendVerification(phone: e164);
      if (response is PhoneSendVerificationResponseInboundChallenge) {
        _setInboundChallenge(response);
        state = state.copyWith(
          isLoading: false,
          step: PhoneVerificationStep.inboundWaiting,
        );
        return true;
      }
      state = state.copyWith(
        isLoading: false,
        step: PhoneVerificationStep.code,
      );
      return true;
    } on DioException catch (error) {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        error,
        context: PhoneVerificationErrorContext.phoneNumber,
      );
      state = state.copyWith(
        isLoading: false,
        phoneError: failure.field == PhoneVerificationErrorField.phone
            ? failure
            : null,
        generalError: failure.field == PhoneVerificationErrorField.general
            ? failure
            : null,
      );
      return false;
    }
  }

  Future<bool> verifyCode(String code) async {
    final String? e164 =
        state.e164Phone ??
        getE164PhoneNumber(state.phoneDigits, state.selectedCountry);
    if (e164 == null) {
      state = state.copyWith(
        step: PhoneVerificationStep.phone,
        phoneError: const PhoneVerificationFailure(
          kind: PhoneVerificationErrorKind.invalidPhoneFormat,
          field: PhoneVerificationErrorField.phone,
        ),
      );
      return false;
    }
    if (normalizeVerificationCode(code).isEmpty) {
      return false;
    }
    state = state.copyWith(
      isLoading: true,
      codeError: null,
      generalError: null,
      e164Phone: e164,
    );
    try {
      await ref
          .read(phoneVerificationRepositoryProvider)
          .verifyCode(phone: e164, code: code);
      await ref.read(userSettingsViewModelProvider.notifier).loadProfile();
      state = state.copyWith(isLoading: false);
      return true;
    } on DioException catch (error) {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        error,
        context: PhoneVerificationErrorContext.phoneCode,
      );
      state = state.copyWith(
        isLoading: false,
        codeError: failure.field == PhoneVerificationErrorField.code
            ? failure
            : null,
        generalError: failure.field == PhoneVerificationErrorField.general
            ? failure
            : null,
      );
      return false;
    }
  }

  Future<bool> refreshInboundChallenge({
    bool useAccountEndpoint = false,
  }) async {
    state = state.copyWith(isLoading: true, generalError: null);
    try {
      if (useAccountEndpoint) {
        final InboundSmsChallengeStartResponse response = await ref
            .read(phoneVerificationRepositoryProvider)
            .startInboundChallenge();
        state = state.copyWith(
          isLoading: false,
          inboundChallenge: InboundChallengeState(
            challengeCode: response.challengeCode,
            ourNumber: response.ourNumber,
            expiresAt: DateTime.tryParse(response.expiresAt) ?? DateTime.now(),
          ),
          step: PhoneVerificationStep.inboundWaiting,
        );
        return true;
      }
      final String? e164 =
          state.e164Phone ??
          getE164PhoneNumber(state.phoneDigits, state.selectedCountry);
      if (e164 == null) {
        state = state.copyWith(
          isLoading: false,
          step: PhoneVerificationStep.phone,
          phoneError: const PhoneVerificationFailure(
            kind: PhoneVerificationErrorKind.invalidPhoneFormat,
            field: PhoneVerificationErrorField.phone,
          ),
        );
        return false;
      }
      final PhoneSendVerificationResponse response = await ref
          .read(phoneVerificationRepositoryProvider)
          .sendVerification(phone: e164);
      if (response is PhoneSendVerificationResponseInboundChallenge) {
        _setInboundChallenge(response);
        state = state.copyWith(
          isLoading: false,
          step: PhoneVerificationStep.inboundWaiting,
        );
        return true;
      }
      state = state.copyWith(
        isLoading: false,
        step: PhoneVerificationStep.code,
      );
      return true;
    } on DioException catch (error) {
      final PhoneVerificationFailure failure = phoneVerificationFailureFromDio(
        error,
      );
      state = state.copyWith(isLoading: false, generalError: failure);
      return false;
    }
  }

  void _setInboundChallenge(
    PhoneSendVerificationResponseInboundChallenge response,
  ) {
    state = state.copyWith(
      inboundChallenge: InboundChallengeState(
        challengeCode: response.challengeCode,
        ourNumber: response.ourNumber,
        expiresAt: response.expiresAt,
        reason: response.reason.json,
      ),
      e164Phone: state.e164Phone,
    );
  }
}
