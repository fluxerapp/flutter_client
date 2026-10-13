import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'webauthn_service.g.dart';

@riverpod
PasskeyAuthenticator passkeyAuthenticator(Ref ref) {
  return PasskeyAuthenticator();
}

class WebAuthnService {
  final PasskeyAuthenticator _authenticator;

  const WebAuthnService(this._authenticator);

  Future<Map<String, dynamic>> authenticate(
    Map<String, dynamic> options,
  ) async {
    final request = AuthenticateRequestType.fromJson(
      _withCredentialTransports(options),
      preferImmediatelyAvailableCredentials: false,
    );
    final response = await _authenticator.authenticate(request);
    return response.toJson();
  }

  Map<String, dynamic> _withCredentialTransports(Map<String, dynamic> options) {
    final allowCredentials = options['allowCredentials'];
    if (allowCredentials is! List) {
      return options;
    }
    return {
      ...options,
      'allowCredentials': [
        for (final credential in allowCredentials)
          if (credential is Map<String, dynamic>)
            {
              ...credential,
              'transports': credential['transports'] ?? <dynamic>[],
            }
          else
            credential,
      ],
    };
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> options) async {
    final request = RegisterRequestType.fromJson(options);
    final response = await _authenticator.register(request);
    return response.toJson();
  }
}
