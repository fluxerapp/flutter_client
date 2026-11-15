import 'package:flutter/foundation.dart';
import 'package:passkeys_android/messages.g.dart';
import 'package:passkeys_platform_interface/passkeys_platform_interface.dart';
import 'package:passkeys_platform_interface/types/types.dart';

/// The Android implementation of [PasskeysPlatform].
class PasskeysAndroid extends PasskeysPlatform {
  /// The method channel used to interact with the native platform.
  PasskeysAndroid({
    @visibleForTesting PasskeysApi? api,
  }) : _api = api ?? PasskeysApi();

  /// Registers this class as the default instance of [PasskeysPlatform]
  static void registerWith() => PasskeysPlatform.instance = PasskeysAndroid();

  final PasskeysApi _api;

  @override
  Future<AuthenticateResponseType> authenticate(
    AuthenticateRequestType request,
  ) async {
    final r = await _api.authenticate(
      request.relyingPartyId,
      request.challenge,
      request.timeout,
      request.userVerification,
      _allowCredentials(request),
      request.preferImmediatelyAvailableCredentials,
      request.prf,
    );

    return _authenticateResponse(r);
  }

  @override
  Future<bool> canAuthenticate() async {
    try {
      final r = await _api.canAuthenticate();
      return r;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<RegisterResponseType> register(RegisterRequestType request) async {
    final r = await _api.register(
      request.challenge,
      _relyingParty(request),
      _user(request),
      _authenticatorSelection(request),
      _pubKeyCredParams(request),
      request.timeout,
      request.attestation,
      _excludeCredentials(request),
      request.prf,
    );

    return _registerResponse(r);
  }

  //
  @override
  Future<void> cancelCurrentAuthenticatorOperation() async {
    return _api.cancelCurrentAuthenticatorOperation();
  }

  @override
  Future<void> signalUnknownCredential(
    SignalUnknownCredentialRequestType request,
  ) {
    return _api.signalUnknownCredential(
      request.relyingPartyId,
      request.credentialId,
    );
  }

  @override
  Future<void> signalAllAcceptedCredentials(
    SignalAllAcceptedCredentialsRequestType request,
  ) {
    return _api.signalAllAcceptedCredentials(
      request.relyingPartyId,
      request.userId,
      request.allAcceptedCredentialIds,
    );
  }

  @override
  Future<RegisterResponseType> createRestoreCredential(
    RegisterRequestType request, {
    bool isCloudBackupEnabled = true,
  }) async {
    final r = await _api.createRestoreCredential(
      request.challenge,
      _relyingParty(request),
      _user(request),
      _authenticatorSelection(request),
      _pubKeyCredParams(request),
      request.timeout,
      request.attestation,
      _excludeCredentials(request),
      isCloudBackupEnabled,
    );

    return _registerResponse(r);
  }

  @override
  Future<AuthenticateResponseType> getRestoreCredential(
    AuthenticateRequestType request,
  ) async {
    final r = await _api.getRestoreCredential(
      request.relyingPartyId,
      request.challenge,
      request.timeout,
      request.userVerification,
      _allowCredentials(request),
    );

    return _authenticateResponse(r);
  }

  @override
  Future<void> clearRestoreCredential() {
    return _api.clearRestoreCredential();
  }

  // In case of android we link passkey support to the availability of the
  // biometric authentication
  @override
  Future<AvailabilityTypeAndroid> getAvailability() async {
    final isUserVerifyingPlatformAuthenticatorAvailable =
        await canAuthenticate();

    final hasPasskeySupport = await _api.hasPasskeySupport();

    return AvailabilityTypeAndroid(
      hasPasskeySupport: hasPasskeySupport,
      isUserVerifyingPlatformAuthenticatorAvailable:
          isUserVerifyingPlatformAuthenticatorAvailable,
      isNative: true,
    );
  }

  RelyingParty _relyingParty(RegisterRequestType request) {
    return RelyingParty(
      name: request.relyingParty.name,
      id: request.relyingParty.id,
    );
  }

  User _user(RegisterRequestType request) {
    return User(
      displayName: request.user.displayName,
      name: request.user.name,
      id: request.user.id,
    );
  }

  AuthenticatorSelection? _authenticatorSelection(RegisterRequestType request) {
    final a = request.authSelectionType;
    if (a == null) {
      return null;
    }
    return AuthenticatorSelection(
      authenticatorAttachment: a.authenticatorAttachment,
      requireResidentKey: a.requireResidentKey,
      residentKey: a.residentKey,
      userVerification: a.userVerification,
    );
  }

  List<PubKeyCredParam>? _pubKeyCredParams(RegisterRequestType request) {
    return request.pubKeyCredParams
        ?.map((e) => PubKeyCredParam(alg: e.alg, type: e.type))
        .toList();
  }

  List<ExcludeCredential> _excludeCredentials(RegisterRequestType request) {
    return request.excludeCredentials
        .map((e) => ExcludeCredential(id: e.id, type: e.type))
        .toList();
  }

  List<AllowCredential>? _allowCredentials(AuthenticateRequestType request) {
    return request.allowCredentials?.map((e) {
      return AllowCredential(
        id: e.id,
        type: e.type,
        transports: e.transports,
      );
    }).toList();
  }

  RegisterResponseType _registerResponse(RegisterResponse r) {
    return RegisterResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
      transports: r.transports.whereType<String>().toList(),
      clientExtensionResults: r.clientExtensionResults,
    );
  }

  AuthenticateResponseType _authenticateResponse(AuthenticateResponse r) {
    return AuthenticateResponseType(
      id: r.id,
      rawId: r.rawId,
      clientDataJSON: r.clientDataJSON,
      authenticatorData: r.authenticatorData,
      signature: r.signature,
      userHandle: r.userHandle,
      clientExtensionResults: r.clientExtensionResults,
    );
  }
}
