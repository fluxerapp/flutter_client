import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registration_draft_provider.g.dart';

class RegistrationDraft {
  final String email;
  final String displayName;
  final String username;
  final String password;
  final String confirmPassword;
  final int? birthMonth;
  final int? birthDay;
  final int? birthYear;
  final bool consent;

  const RegistrationDraft({
    this.email = '',
    this.displayName = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.birthMonth,
    this.birthDay,
    this.birthYear,
    this.consent = false,
  });

  bool get isEmpty =>
      email.isEmpty &&
      displayName.isEmpty &&
      username.isEmpty &&
      password.isEmpty &&
      confirmPassword.isEmpty &&
      birthMonth == null &&
      birthDay == null &&
      birthYear == null &&
      !consent;

  RegistrationDraft copyWith({
    String? email,
    String? displayName,
    String? username,
    String? password,
    String? confirmPassword,
    int? Function()? birthMonth,
    int? Function()? birthDay,
    int? Function()? birthYear,
    bool? consent,
  }) {
    return RegistrationDraft(
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      birthMonth: birthMonth != null ? birthMonth() : this.birthMonth,
      birthDay: birthDay != null ? birthDay() : this.birthDay,
      birthYear: birthYear != null ? birthYear() : this.birthYear,
      consent: consent ?? this.consent,
    );
  }
}

@Riverpod(keepAlive: true)
class RegistrationDraftNotifier extends _$RegistrationDraftNotifier {
  @override
  RegistrationDraft build() => const RegistrationDraft();

  // ignore: Riverpod notifier method.
  void update(RegistrationDraft draft) => state = draft;

  void clear() => state = const RegistrationDraft();
}
