import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/app_attest_age_service.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/age/play_integrity_age_service.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_geo_provider.dart';
import 'package:fluxer_app/features/mature_content/utils/mature_access_utils.dart';
import 'package:fluxer_dart/export.dart';

const Map<String, Object> _adult = <String, Object>{
  'status': 'sharing',
  'lowerBound': 18,
  'ageRangeSource': 'tier_a',
};
const Map<String, Object> _minor = <String, Object>{
  'status': 'sharing',
  'lowerBound': 16,
  'upperBound': 17,
  'ageRangeSource': 'tier_a',
};

class _UsersApi implements UsersApi {
  final List<String> calls = <String>[];
  final List<Map<String, Object?>> sentClientData = <Map<String, Object?>>[];
  DioException? playSubmitError;
  DioException? appAttestSubmitError;

  @override
  Future<AppAttestChallengeResponse> createAppAttestChallenge({
    required AppAttestChallengeRequest body,
  }) async {
    calls.add('appAttestChallenge');
    return AppAttestChallengeResponse(
      challenge: 'challenge',
      expiresAt: DateTime.utc(2030),
    );
  }

  @override
  Future<void> registerAppAttestKey({
    required AppAttestKeyRegisterRequest body,
  }) async {
    calls.add('registerKey');
  }

  @override
  Future<AgeRangeSubmitResponse> submitAgeRange({
    required AgeRangeSubmitRequest body,
  }) async {
    calls.add('submitAppAttest');
    sentClientData.add(_decode(body.clientData));
    final DioException? error = appAttestSubmitError;
    if (error != null) {
      throw error;
    }
    return const AgeRangeSubmitResponse(ageFloor: 'adult');
  }

  @override
  Future<AppAttestChallengeResponse> createPlayIntegrityChallenge() async {
    calls.add('playChallenge');
    return AppAttestChallengeResponse(
      challenge: 'challenge',
      expiresAt: DateTime.utc(2030),
    );
  }

  @override
  Future<AgeRangeSubmitResponse> submitPlayIntegrityAgeRange({
    required PlayIntegrityAgeSubmitRequest body,
  }) async {
    calls.add('submitPlay');
    sentClientData.add(_decode(body.clientData));
    final DioException? error = playSubmitError;
    if (error != null) {
      throw error;
    }
    return const AgeRangeSubmitResponse(ageFloor: 'adult');
  }

  @override
  Future<UserPrivateResponse> getCurrentUser() {
    calls.add('getCurrentUser');
    return Future<UserPrivateResponse>.error(StateError('not needed'));
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Map<String, Object?> _decode(String clientData) {
  return jsonDecode(utf8.decode(base64Decode(clientData)))
      as Map<String, Object?>;
}

class _Client extends FluxerClient {
  _Client(this.api) : super(Dio());

  final _UsersApi api;

  @override
  UsersApi get users => api;
}

class _Harness {
  _Harness({
    required TargetPlatform platform,
    bool official = true,
    MatureGeoStatus geo = MatureGeoStatus.restricted,
    bool appleRequired = false,
    Map<String, Object>? payload = _adult,
  }) {
    debugDefaultTargetPlatformOverride = platform;
    final TestDefaultBinaryMessenger messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          ..setMockMethodCallHandler(declaredAgeRangeChannel, (
            MethodCall call,
          ) async {
            nativeCalls.add('age:${call.method}');
            return switch (call.method) {
              'requirement' => <String, Object>{
                'available': true,
                'required': appleRequired,
              },
              _ => payload,
            };
          })
          ..setMockMethodCallHandler(appAttestChannel, (MethodCall call) async {
            nativeCalls.add('attest:${call.method}');
            return switch (call.method) {
              'isSupported' => true,
              'generateKey' => 'key-1',
              _ => Uint8List.fromList(<int>[1, 2, 3]),
            };
          })
          ..setMockMethodCallHandler(playIntegrityChannel, (
            MethodCall call,
          ) async {
            nativeCalls.add('play:${call.method}');
            return call.method == 'requestToken' ? 'token' : null;
          });
    container = ProviderContainer(
      overrides: <Override>[
        if (platform == TargetPlatform.android)
          declaredAgeReportingSupportedProvider.overrideWithValue(official)
        else
          isActiveInstanceOfficialProvider.overrideWithValue(official),
        fluxerBaseUrlProvider.overrideWithValue('https://api.test'),
        fluxerClientProvider.overrideWithValue(_Client(api)),
        matureGeoStatusProvider.overrideWith(
          (Ref ref) => Future<MatureGeoStatus>.value(geo),
        ),
        appRuntimeInfoProvider.overrideWith(
          (Ref ref) => Future<AppRuntimeInfo>.value(
            const AppRuntimeInfo(
              packageName: 'com.fluxer',
              version: '1.0.0',
              buildNumber: '1',
              environment: AppBuildEnvironment.stable,
              pushProvider: PushProviderKind.firebaseMessaging,
              buildTimestamp: '',
            ),
          ),
        ),
        playIntegrityCloudProjectNumberProvider.overrideWithValue('12345'),
      ],
    );
    container.read(currentUserIdProvider.notifier).set('user-1');
    addTearDown(() {
      container.dispose();
      debugDefaultTargetPlatformOverride = null;
      for (final MethodChannel channel in <MethodChannel>[
        declaredAgeRangeChannel,
        appAttestChannel,
        playIntegrityChannel,
      ]) {
        messenger.setMockMethodCallHandler(channel, null);
      }
    });
  }

  final _UsersApi api = _UsersApi();
  final List<String> nativeCalls = <String>[];
  late final ProviderContainer container;

  Future<DeclaredAgeFloor> settle() async {
    container
      ..listen(declaredAgeFloorProvider, (_, _) {})
      ..listen(declaredAgeUnlockProvider, (_, _) {});
    await container.read(matureGeoStatusProvider.future);
    await container.read(declaredAgeRequiredPayloadProvider.future);
    return container.read(declaredAgeFloorProvider);
  }

  Future<bool> unlock() async {
    await settle();
    return container.read(declaredAgeUnlockProvider.notifier).unlock();
  }

  DeclaredAgeUnlockOutcome? get outcome =>
      container.read(declaredAgeUnlockProvider)?.outcome;

  List<String> get sends =>
      api.calls.where((String call) => call.startsWith('submit')).toList();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('maps the shared age range to a floor', () {
    DeclaredAgeFloor declaredAgeFloorFromPayload(Map<Object?, Object?>? p) {
      return declaredAgeFloorFromReport(declaredAgeReportFromPayload(p));
    }

    expect(declaredAgeFloorFromPayload(null), DeclaredAgeFloor.none);
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{'status': 'declined'}),
      DeclaredAgeFloor.none,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 18,
      }),
      DeclaredAgeFloor.none,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 16,
        'upperBound': 17,
      }),
      DeclaredAgeFloor.minor,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 13,
        'upperBound': 15,
      }),
      DeclaredAgeFloor.minor,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'upperBound': 12,
      }),
      DeclaredAgeFloor.underMinimum,
    );
    expect(
      declaredAgeFloorFromPayload(<Object?, Object?>{
        'status': 'sharing',
        'lowerBound': 0,
        'upperBound': 14,
      }),
      DeclaredAgeFloor.underMinimum,
    );
  });

  test('statuses without an age range produce no report', () {
    for (final String status in <String>[
      'declined',
      'play_store_action_required',
      'not_installed_from_play',
      'unavailable',
    ]) {
      expect(
        declaredAgeReportFromPayload(<Object?, Object?>{'status': status}),
        isNull,
      );
    }
  });

  test('Play age bands map to the same reports as the server floors', () {
    Map<Object?, Object?> sharing(int lower, [int? upper]) {
      return <Object?, Object?>{
        'status': 'sharing',
        'lowerBound': lower,
        'upperBound': ?upper,
        'ageRangeSource': 'tier_a',
      };
    }

    expect(
      declaredAgeReportFromPayload(sharing(0, 12)),
      DeclaredAgeReport.underMinimum,
    );
    expect(
      declaredAgeReportFromPayload(sharing(13, 15)),
      DeclaredAgeReport.minor,
    );
    expect(
      declaredAgeReportFromPayload(sharing(16, 17)),
      DeclaredAgeReport.minor,
    );
    expect(declaredAgeReportFromPayload(sharing(18)), DeclaredAgeReport.adult);
    expect(
      declaredAgeReportFromPayload(sharing(0, 14)),
      DeclaredAgeReport.underMinimum,
    );
  });

  test('reporting runs on iOS and FCM Android only', () {
    bool supported(
      TargetPlatform platform, {
      bool isWeb = false,
      bool isFirebaseMessaging = false,
      bool officialInstance = true,
      bool selfHosted = false,
    }) {
      return declaredAgeReportingSupported(
        isWeb: isWeb,
        platform: platform,
        isFirebaseMessaging: isFirebaseMessaging,
        officialInstance: officialInstance,
        selfHosted: selfHosted,
      );
    }

    expect(supported(TargetPlatform.iOS), isTrue);
    expect(
      supported(TargetPlatform.android, isFirebaseMessaging: true),
      isTrue,
    );
    expect(supported(TargetPlatform.android), isFalse);
    expect(supported(TargetPlatform.macOS), isFalse);
    expect(
      supported(TargetPlatform.android, isWeb: true, isFirebaseMessaging: true),
      isFalse,
    );
    expect(supported(TargetPlatform.iOS, isWeb: true), isFalse);
    expect(supported(TargetPlatform.iOS, officialInstance: false), isFalse);
    expect(supported(TargetPlatform.iOS, selfHosted: true), isFalse);
    expect(
      supported(
        TargetPlatform.android,
        isFirebaseMessaging: true,
        officialInstance: false,
      ),
      isFalse,
    );
  });

  test('a self-hosted instance never asks Apple or sends anything', () async {
    final _Harness harness = _Harness(
      platform: TargetPlatform.iOS,
      official: false,
      appleRequired: true,
      payload: _minor,
    );

    expect(await harness.unlock(), isFalse);
    expect(
      harness.container.read(declaredAgeFloorProvider),
      DeclaredAgeFloor.none,
    );
    expect(harness.container.read(declaredAgeReportProvider), isNull);
    expect(
      (await harness.container.read(
        declaredAgeRequirementProvider.future,
      )).available,
      isFalse,
    );
    expect(harness.nativeCalls, isEmpty);
    expect(harness.api.calls, isEmpty);
  });

  test('a self-hosted instance never asks Google or sends anything', () async {
    final _Harness harness = _Harness(
      platform: TargetPlatform.android,
      official: false,
    );

    expect(await harness.unlock(), isFalse);
    expect(harness.nativeCalls, isEmpty);
    expect(harness.api.calls, isEmpty);
  });

  test('the button does nothing outside a restricted region', () async {
    final _Harness harness = _Harness(
      platform: TargetPlatform.iOS,
      geo: MatureGeoStatus.none,
    );

    expect(await harness.unlock(), isFalse);
    expect(harness.nativeCalls, <String>['age:requirement']);
    expect(harness.api.calls, isEmpty);
  });

  test('when Apple needs the age range, it stays on the device', () async {
    final _Harness harness = _Harness(
      platform: TargetPlatform.iOS,
      appleRequired: true,
      payload: _minor,
    );

    expect(await harness.settle(), DeclaredAgeFloor.minor);
    expect(harness.nativeCalls, <String>['age:requirement', 'age:request']);
    expect(harness.api.calls, isEmpty);
  });

  test('Apple is not asked on its own unless it needs the age range', () async {
    final _Harness harness = _Harness(platform: TargetPlatform.iOS);

    expect(await harness.settle(), DeclaredAgeFloor.none);
    expect(harness.nativeCalls, <String>['age:requirement']);
  });

  test('one press on iOS sends one adult result', () async {
    final _Harness harness = _Harness(platform: TargetPlatform.iOS);

    expect(await harness.unlock(), isTrue);
    expect(harness.outcome, DeclaredAgeUnlockOutcome.sent);
    expect(harness.sends, <String>['submitAppAttest']);
    expect(harness.api.sentClientData.single['age_floor'], 'adult');
    expect(
      harness.nativeCalls.where((String call) => call == 'age:request'),
      hasLength(1),
    );
    expect(harness.api.calls.last, 'getCurrentUser');
  });

  test('one press on Android sends one adult result', () async {
    final _Harness harness = _Harness(platform: TargetPlatform.android);

    expect(await harness.unlock(), isTrue);
    expect(harness.sends, <String>['submitPlay']);
    expect(harness.api.sentClientData.single['age_lower'], 18);
  });

  for (final TargetPlatform platform in <TargetPlatform>[
    TargetPlatform.iOS,
    TargetPlatform.android,
  ]) {
    test('an age range under 18 is never sent on ${platform.name}', () async {
      final _Harness harness = _Harness(platform: platform, payload: _minor);

      expect(await harness.unlock(), isFalse);
      expect(harness.outcome, DeclaredAgeUnlockOutcome.underAdult);
      expect(
        harness.container.read(declaredAgeFloorProvider),
        DeclaredAgeFloor.minor,
      );
      expect(harness.api.calls, isEmpty);
      expect(
        harness.nativeCalls.where((String call) => !call.startsWith('age:')),
        isEmpty,
      );
    });
  }

  test('Google Play statuses without an age range send nothing', () async {
    for (final (String status, DeclaredAgeUnlockOutcome outcome)
        in <(String, DeclaredAgeUnlockOutcome)>[
          (
            'play_store_action_required',
            DeclaredAgeUnlockOutcome.playStoreActionRequired,
          ),
          (
            'not_installed_from_play',
            DeclaredAgeUnlockOutcome.notInstalledFromPlay,
          ),
          ('declined', DeclaredAgeUnlockOutcome.declined),
        ]) {
      final _Harness harness = _Harness(
        platform: TargetPlatform.android,
        payload: <String, Object>{'status': status},
      );

      expect(await harness.unlock(), isFalse);
      expect(harness.outcome, outcome);
      expect(harness.api.calls, isEmpty);
    }
  });

  test('a copy not from Google Play is told so after the send', () async {
    final _Harness harness = _Harness(platform: TargetPlatform.android);
    harness.api.playSubmitError = _refusal(
      ApiErrorCode.playIntegrityAppNotRecognized.toJson(),
    );

    expect(await harness.unlock(), isFalse);
    expect(harness.outcome, DeclaredAgeUnlockOutcome.notInstalledFromPlay);
    expect(harness.sends, <String>['submitPlay']);
  });

  test('server refusals end quietly or with a plain message', () async {
    for (final (String code, DeclaredAgeUnlockOutcome outcome)
        in <(String, DeclaredAgeUnlockOutcome)>[
          (
            'DATE_OF_BIRTH_REQUIRED',
            DeclaredAgeUnlockOutcome.dateOfBirthRequired,
          ),
          ('AGE_RANGE_NOT_NEEDED', DeclaredAgeUnlockOutcome.refused),
          ('AGE_RANGE_NOT_ADULT', DeclaredAgeUnlockOutcome.refused),
          (
            'FEATURE_NOT_AVAILABLE_SELF_HOSTED',
            DeclaredAgeUnlockOutcome.refused,
          ),
        ]) {
      final _Harness harness = _Harness(platform: TargetPlatform.iOS);
      harness.api.appAttestSubmitError = _refusal(code, status: 403);

      expect(await harness.unlock(), isFalse);
      expect(harness.outcome, outcome);
    }
  });
}

DioException _refusal(String code, {int status = 400}) {
  final RequestOptions options = RequestOptions(path: '/');
  return DioException(
    requestOptions: options,
    response: Response<Map<String, dynamic>>(
      requestOptions: options,
      statusCode: status,
      data: <String, dynamic>{'code': code},
    ),
  );
}
