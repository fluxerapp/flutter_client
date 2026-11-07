import 'dart:convert';

import 'package:cryptography/cryptography.dart' show Sha256;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';

const MethodChannel appAttestChannel = MethodChannel('fluxer_app/app_attest');

class AgeRangeAccountChanged implements Exception {
  const AgeRangeAccountChanged();
}

List<int> appAttestAdultClientData(String challenge) {
  return utf8.encode(
    jsonEncode(<String, String>{'challenge': challenge, 'age_floor': 'adult'}),
  );
}

Future<void> sendAppAttestAdultAge(
  Ref ref, {
  required bool Function() stillCurrent,
}) async {
  if (await appAttestChannel.invokeMethod<bool>('isSupported') != true) {
    throw PlatformException(code: 'unsupported');
  }
  final String keyId = await _platform<String>(
    () => appAttestChannel.invokeMethod<String>('generateKey'),
  );
  final String attestChallenge = await _challenge(
    ref,
    stillCurrent,
    AppAttestChallengeRequestPurposePurpose.attest,
  );
  final Uint8List attestation = await _platform<Uint8List>(() async {
    return appAttestChannel
        .invokeMethod<Uint8List>('attestKey', <String, Object>{
          'keyId': keyId,
          'clientDataHash': await _sha256(utf8.encode(attestChallenge)),
        });
  });
  _ensureCurrent(stillCurrent);
  await ref
      .read(fluxerClientProvider)
      .users
      .registerAppAttestKey(
        body: AppAttestKeyRegisterRequest(
          keyId: keyId,
          attestation: base64Encode(attestation),
          challenge: attestChallenge,
        ),
      );
  final List<int> clientData = appAttestAdultClientData(
    await _challenge(
      ref,
      stillCurrent,
      AppAttestChallengeRequestPurposePurpose.valueAssert,
    ),
  );
  final Uint8List assertion = await _platform<Uint8List>(() async {
    return appAttestChannel.invokeMethod<Uint8List>(
      'generateAssertion',
      <String, Object>{
        'keyId': keyId,
        'clientDataHash': await _sha256(clientData),
      },
    );
  });
  _ensureCurrent(stillCurrent);
  await ref
      .read(fluxerClientProvider)
      .users
      .submitAgeRange(
        body: AgeRangeSubmitRequest(
          keyId: keyId,
          assertion: base64Encode(assertion),
          clientData: base64Encode(clientData),
        ),
      );
}

Future<String> _challenge(
  Ref ref,
  bool Function() stillCurrent,
  AppAttestChallengeRequestPurposePurpose purpose,
) async {
  _ensureCurrent(stillCurrent);
  final AppAttestChallengeResponse response = await ref
      .read(fluxerClientProvider)
      .users
      .createAppAttestChallenge(
        body: AppAttestChallengeRequest(purpose: purpose),
      );
  return response.challenge;
}

void _ensureCurrent(bool Function() stillCurrent) {
  if (!stillCurrent()) {
    throw const AgeRangeAccountChanged();
  }
}

Future<T> _platform<T>(Future<T?> Function() call) async {
  final T? value = await call();
  if (value == null) {
    throw PlatformException(code: 'unknownSystemFailure');
  }
  return value;
}

Future<Uint8List> _sha256(List<int> bytes) async {
  return Uint8List.fromList((await Sha256().hash(bytes)).bytes);
}
