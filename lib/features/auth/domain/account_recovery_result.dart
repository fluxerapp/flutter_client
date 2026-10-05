import 'package:fluxer_app/features/auth/domain/login_result.dart';

class AccountRecoveryResult {
  const AccountRecoveryResult({
    required this.login,
    required this.recoveryKey,
    required this.recoveryKitCreatedAt,
    this.username,
    this.discriminator,
  });

  final LoginResult login;
  final String recoveryKey;
  final DateTime recoveryKitCreatedAt;
  final String? username;
  final String? discriminator;
}
