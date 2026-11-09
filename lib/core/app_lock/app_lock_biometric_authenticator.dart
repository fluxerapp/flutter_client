import 'package:local_auth/local_auth.dart';

enum AppLockBiometricKind { face, fingerprint, generic }

abstract interface class AppLockBiometricAuthenticator {
  Future<List<AppLockBiometricKind>> availableKinds();

  Future<bool> authenticate({required String reason});
}

class LocalAuthBiometricAuthenticator implements AppLockBiometricAuthenticator {
  LocalAuthBiometricAuthenticator({LocalAuthentication? auth})
    : _auth = auth ?? LocalAuthentication();

  final LocalAuthentication _auth;

  @override
  Future<List<AppLockBiometricKind>> availableKinds() async {
    try {
      if (!await _auth.canCheckBiometrics) {
        return const <AppLockBiometricKind>[];
      }
      final List<BiometricType> types = await _auth.getAvailableBiometrics();
      final List<AppLockBiometricKind> kinds = <AppLockBiometricKind>[];
      if (types.contains(BiometricType.face)) {
        kinds.add(AppLockBiometricKind.face);
      }
      if (types.contains(BiometricType.fingerprint)) {
        kinds.add(AppLockBiometricKind.fingerprint);
      }
      if (kinds.isEmpty && types.isNotEmpty) {
        kinds.add(AppLockBiometricKind.generic);
      }
      return kinds;
    } on Exception {
      return const <AppLockBiometricKind>[];
    }
  }

  @override
  Future<bool> authenticate({required String reason}) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        biometricOnly: true,
      );
    } on Exception {
      return false;
    }
  }
}
