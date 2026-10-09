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
}

@Riverpod(keepAlive: true)
class RegistrationDraftNotifier extends _$RegistrationDraftNotifier {
  @override
  RegistrationDraft build() => const RegistrationDraft();

  void update(RegistrationDraft draft) {
    if (state == draft) {
      return;
    }
    state = draft;
  }

  void clear() => state = const RegistrationDraft();
}
