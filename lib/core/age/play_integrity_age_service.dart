import 'dart:convert';

import 'package:cryptography/cryptography.dart' show Sha256;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/age/app_attest_age_service.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_dart/export.dart';

const MethodChannel playIntegrityChannel = MethodChannel(
  'fluxer_app/play_integrity',
);

class PlayAgeRange {
  const PlayAgeRange({
    required this.lower,
    required this.upper,
    required this.source,
  });

  final int lower;
  final int? upper;
  final String source;

  static PlayAgeRange? fromPayload(Map<Object?, Object?>? payload) {
    if (payload == null || payload['status'] != 'sharing') {
      return null;
    }
    final Object? lower = payload['lowerBound'];
    final Object? upper = payload['upperBound'];
    final Object? source = payload['ageRangeSource'];
    if (lower is! int || source is! String || source.isEmpty) {
      return null;
    }
    return PlayAgeRange(
      lower: lower,
      upper: upper is int ? upper : null,
      source: source,
    );
  }
}

class PlayAppNotRecognized implements Exception {
  const PlayAppNotRecognized();
}

List<int> playIntegrityAgeClientData({
  required String challenge,
  required PlayAgeRange range,
}) {
  return utf8.encode(
    jsonEncode(<String, Object?>{
      'challenge': challenge,
      'age_lower': range.lower,
      'age_upper': range.upper,
      'age_range_source': range.source,
    }),
  );
}

Future<String> playIntegrityRequestHash(List<int> clientData) async {
  final List<int> digest = (await Sha256().hash(clientData)).bytes;
  return base64UrlEncode(digest).replaceAll('=', '');
}

final playIntegrityCloudProjectNumberProvider = Provider<String>((Ref ref) {
  return AppBuildConfig.playIntegrityCloudProjectNumber;
});

Future<void> sendPlayIntegrityAdultAge(
  Ref ref, {
  required PlayAgeRange range,
  required bool Function() stillCurrent,
}) async {
  if (range.lower < 18) {
    throw ArgumentError.value(range.lower, 'range', 'is under 18');
  }
  final String projectNumber = ref.read(
    playIntegrityCloudProjectNumberProvider,
  );
  if (projectNumber.isEmpty) {
    throw PlatformException(code: 'unavailable');
  }
  final String packageName = (await ref.read(
    appRuntimeInfoProvider.future,
  )).packageName;
  await playIntegrityChannel.invokeMethod<void>('prepare', <String, String>{
    'cloudProjectNumber': projectNumber,
  });
  if (!stillCurrent()) {
    throw const AgeRangeAccountChanged();
  }
  final AppAttestChallengeResponse challenge = await ref
      .read(fluxerClientProvider)
      .users
      .createPlayIntegrityChallenge();
  final List<int> clientData = playIntegrityAgeClientData(
    challenge: challenge.challenge,
    range: range,
  );
  final String? token = await playIntegrityChannel.invokeMethod<String>(
    'requestToken',
    <String, String>{'requestHash': await playIntegrityRequestHash(clientData)},
  );
  if (token == null) {
    throw PlatformException(code: 'unavailable');
  }
  if (!stillCurrent()) {
    throw const AgeRangeAccountChanged();
  }
  try {
    await ref
        .read(fluxerClientProvider)
        .users
        .submitPlayIntegrityAgeRange(
          body: PlayIntegrityAgeSubmitRequest(
            packageName: packageName,
            integrityToken: token,
            clientData: base64Encode(clientData),
          ),
        );
  } on DioException catch (e) {
    final String? code = apiErrorCodeFromDioException(e);
    if (code != null &&
        ApiErrorCode.fromJson(code) ==
            ApiErrorCode.playIntegrityAppNotRecognized) {
      throw const PlayAppNotRecognized();
    }
    rethrow;
  }
}
