import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/domain/login_error.dart';
import 'package:fluxer_app/features/auth/providers/passkey_error.dart';
// Prefixed to avoid the TimeoutException clash with dart:async (pulled in
// transitively by flutter_test).
import 'package:passkeys/exceptions.dart' as pk;

void main() {
  group('mapPasskeyAuthError', () {
    test('maps no-credentials to passkeyNoCredentials', () {
      final (type, message) = mapPasskeyAuthError(
        pk.NoCredentialsAvailableException(),
      );
      expect(type, LoginError.passkeyNoCredentials);
      expect(message, isNull);
    });

    test('maps device-not-supported to passkeyDeviceNotSupported', () {
      final (type, _) = mapPasskeyAuthError(pk.DeviceNotSupportedException());
      expect(type, LoginError.passkeyDeviceNotSupported);
    });

    test('maps domain-not-associated to passkeyDomainNotAssociated', () {
      final (type, _) = mapPasskeyAuthError(
        pk.DomainNotAssociatedException(null),
      );
      expect(type, LoginError.passkeyDomainNotAssociated);
    });

    test('maps timeout to passkeyTimeout', () {
      final (type, _) = mapPasskeyAuthError(pk.TimeoutException(null));
      expect(type, LoginError.passkeyTimeout);
    });

    test('passes an unhandled native message through unchanged', () {
      final (type, message) = mapPasskeyAuthError(
        pk.UnhandledAuthenticatorException(
          'CODE',
          'Native localized error',
          null,
        ),
      );
      expect(type, isNull);
      expect(message, 'Native localized error');
    });

    test('falls back to passkeyFailed for unmapped exceptions', () {
      final (type, _) = mapPasskeyAuthError(pk.MissingGoogleSignInException());
      expect(type, LoginError.passkeyFailed);
    });
  });
}
