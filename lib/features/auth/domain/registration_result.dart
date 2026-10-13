import 'package:fluxer_app/features/auth/domain/auth_session.dart';

sealed class RegistrationResult {
  const RegistrationResult();
}

class RegistrationSuccess extends RegistrationResult {
  final AuthSession session;
  const RegistrationSuccess(this.session);
}

class RegistrationPendingApproval extends RegistrationResult {
  final String userId;
  const RegistrationPendingApproval(this.userId);
}
