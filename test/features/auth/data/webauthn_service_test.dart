import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';

void main() {
  group('WebAuthnService.authenticate', () {
    test('lets the user pick passkeys that are not on this device', () async {
      final authenticator = _RecordingAuthenticator();

      await WebAuthnService(authenticator).authenticate(<String, dynamic>{
        'challenge': 'Y2hhbGxlbmdl',
        'rpId': 'fluxer.app',
        'userVerification': 'required',
      });

      expect(
        authenticator.request!.preferImmediatelyAvailableCredentials,
        isFalse,
      );
      expect(authenticator.request!.relyingPartyId, 'fluxer.app');
    });

    test('accepts allowed credentials without transports', () async {
      final authenticator = _RecordingAuthenticator();

      await WebAuthnService(authenticator).authenticate(<String, dynamic>{
        'challenge': 'Y2hhbGxlbmdl',
        'rpId': 'fluxer.app',
        'allowCredentials': <dynamic>[
          <String, dynamic>{'id': 'Y3JlZA', 'type': 'public-key'},
          <String, dynamic>{
            'id': 'b3RoZXI',
            'type': 'public-key',
            'transports': <dynamic>['internal'],
          },
        ],
      });

      final credentials = authenticator.request!.allowCredentials!;
      expect(credentials.map((c) => c.id), <String>['Y3JlZA', 'b3RoZXI']);
      expect(credentials.first.transports, isEmpty);
      expect(credentials.last.transports, <String>['internal']);
    });
  });
}

class _RecordingAuthenticator extends PasskeyAuthenticator {
  AuthenticateRequestType? request;

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) async {
    this.request = request;
    return const AuthenticateResponseType(
      id: 'Y3JlZA',
      rawId: 'Y3JlZA',
      clientDataJSON: 'e30',
      authenticatorData: 'YXV0aA',
      signature: 'c2ln',
      userHandle: '',
    );
  }
}
