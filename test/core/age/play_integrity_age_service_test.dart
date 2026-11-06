import 'dart:convert';

import 'package:cryptography/cryptography.dart' show Sha256;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/age/play_integrity_age_service.dart';
import 'package:fluxer_app/core/age/play_integrity_age_store.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_environment.dart';
import 'package:fluxer_app/core/build/push_provider_kind.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_dart/export.dart';

const String _userId = 'user-1';
const String _packageName = 'com.fluxer';
const String _baseUrl = 'https://api.example.test';
const Map<Object?, Object?> _adultPayload = <Object?, Object?>{
  'status': 'sharing',
  'lowerBound': 18,
  'ageRangeSource': 'tier_c',
};

const AppRuntimeInfo _runtimeInfo = AppRuntimeInfo(
  packageName: _packageName,
  version: '1.0.0',
  buildNumber: '1',
  environment: AppBuildEnvironment.stable,
  pushProvider: PushProviderKind.firebaseMessaging,
  buildTimestamp: '',
);

DioException _rejected(int? status, [String? code]) {
  final RequestOptions options = RequestOptions(path: '/');
  return DioException(
    requestOptions: options,
    response: status == null
        ? null
        : Response<Map<String, dynamic>>(
            requestOptions: options,
            statusCode: status,
            data: code == null ? null : <String, dynamic>{'code': code},
          ),
  );
}

class _FakeUsersApi implements UsersApi {
  _FakeUsersApi(this.calls);

  final List<String> calls;
  final List<PlayIntegrityAgeSubmitRequest> submissions =
      <PlayIntegrityAgeSubmitRequest>[];
  DioException? submitError;

  @override
  Future<AppAttestChallengeResponse> createPlayIntegrityChallenge() async {
    calls.add('challenge');
    return AppAttestChallengeResponse(
      challenge: 'challenge-1',
      expiresAt: DateTime.utc(2026, 11, 6, 0, 5),
    );
  }

  @override
  Future<AgeAssuranceSubmitResponse> submitPlayIntegrityAgeAssurance({
    required PlayIntegrityAgeSubmitRequest body,
  }) async {
    calls.add('submit');
    submissions.add(body);
    final DioException? error = submitError;
    if (error != null) {
      throw error;
    }
    return const AgeAssuranceSubmitResponse(
      ageFloor: AttestedAgeFloorSchema.adult,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _FakeFluxerClient extends FluxerClient {
  _FakeFluxerClient(this.fakeUsers) : super(Dio());

  final _FakeUsersApi fakeUsers;

  @override
  UsersApi get users => fakeUsers;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<String> calls;
  late List<String> requestHashes;
  late _FakeUsersApi api;
  PlatformException? nativeError;

  setUp(() {
    FlutterSecureStorage.setMockInitialValues(<String, String>{});
    calls = <String>[];
    requestHashes = <String>[];
    api = _FakeUsersApi(calls);
    nativeError = null;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(playIntegrityChannel, (
          MethodCall call,
        ) async {
          calls.add(call.method);
          final PlatformException? error = nativeError;
          if (error != null) {
            throw error;
          }
          if (call.method == 'requestToken') {
            requestHashes.add(
              (call.arguments as Map<Object?, Object?>)['requestHash']!
                  as String,
            );
            return 'integrity-token';
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(playIntegrityChannel, null);
  });

  Future<ProviderContainer> start({
    Map<Object?, Object?>? payload = _adultPayload,
    bool supported = true,
    String projectNumber = '12345',
  }) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        playAgeAssuranceSupportedProvider.overrideWithValue(supported),
        playIntegrityCloudProjectNumberProvider.overrideWithValue(
          projectNumber,
        ),
        declaredAgePayloadProvider.overrideWith((Ref ref) => payload),
        fluxerClientProvider.overrideWithValue(_FakeFluxerClient(api)),
        fluxerBaseUrlProvider.overrideWithValue(_baseUrl),
        currentUserIdProvider.overrideWithValue(_userId),
        appRuntimeInfoProvider.overrideWith((Ref ref) => _runtimeInfo),
      ],
    );
    addTearDown(container.dispose);
    container.read(authStateProvider.notifier).setAuthenticated(value: true);
    await container.read(declaredAgePayloadProvider.future);
    return container;
  }

  Future<void> sync(ProviderContainer container) {
    return container.read(playIntegrityAgeServiceProvider.notifier).sync();
  }

  int countOf(String call) => calls.where((String c) => c == call).length;

  group('request building', () {
    test(
      'prepares before the challenge and hashes the signed bytes unpadded',
      () async {
        await sync(await start());

        expect(calls, <String>[
          'prepare',
          'challenge',
          'requestToken',
          'submit',
        ]);
        final PlayIntegrityAgeSubmitRequest body = api.submissions.single;
        expect(body.packageName, _packageName);
        expect(body.integrityToken, 'integrity-token');
        final List<int> clientData = base64Decode(body.clientData);
        final List<int> digest = (await Sha256().hash(clientData)).bytes;
        final String hash = requestHashes.single;
        expect(hash, base64UrlEncode(digest).replaceAll('=', ''));
        expect(hash, isNot(contains('=')));
      },
    );

    test('client data holds exactly the expected keys', () {
      final Object? decoded = jsonDecode(
        utf8.decode(
          playIntegrityAgeClientData(
            challenge: 'c',
            range: const PlayAgeRange(lower: 18, upper: null, source: 'tier_c'),
          ),
        ),
      );
      expect(decoded, <String, Object?>{
        'challenge': 'c',
        'age_lower': 18,
        'age_upper': null,
        'age_range_source': 'tier_c',
      });
    });

    test('a range without a source is not submitted', () async {
      await sync(
        await start(
          payload: <Object?, Object?>{'status': 'sharing', 'lowerBound': 18},
        ),
      );
      expect(calls, isEmpty);
    });

    test('non sharing statuses are not submitted', () async {
      await sync(
        await start(payload: <Object?, Object?>{'status': 'declined'}),
      );
      expect(calls, isEmpty);
    });

    test('nothing runs without a project number', () async {
      await sync(await start(projectNumber: ''));
      expect(calls, isEmpty);
    });

    test('nothing runs on unsupported builds', () async {
      await sync(await start(supported: false));
      expect(calls, isEmpty);
    });
  });

  group('freshness', () {
    Future<void> writeRecord({
      required PlayAgeRange range,
      required Duration age,
    }) {
      return PlayIntegrityAgeStore().write(
        PlayIntegrityAgeStore.storageKey(
          packageName: _packageName,
          apiBaseUrl: _baseUrl,
          userId: _userId,
        ),
        PlayIntegrityAgeRecord(
          rangeSignature: range.signature,
          outcome: PlayIntegrityAgeOutcome.submitted,
          at: DateTime.now().subtract(age),
        ),
      );
    }

    const PlayAgeRange adult = PlayAgeRange(
      lower: 18,
      upper: null,
      source: 'tier_c',
    );

    test('a recent submission of the same range is not repeated', () async {
      final ProviderContainer container = await start();
      await sync(container);
      await sync(container);
      expect(countOf('submit'), 1);
    });

    test('a submission under 7 days old is still fresh', () async {
      await writeRecord(range: adult, age: const Duration(days: 6));
      await sync(await start());
      expect(calls, isEmpty);
    });

    test('a submission over 7 days old is sent again', () async {
      await writeRecord(range: adult, age: const Duration(days: 8));
      await sync(await start());
      expect(countOf('submit'), 1);
    });

    test('a changed range is sent straight away', () async {
      await writeRecord(
        range: const PlayAgeRange(lower: 16, upper: 17, source: 'tier_c'),
        age: Duration.zero,
      );
      await sync(await start());
      expect(countOf('submit'), 1);
    });
  });

  group('failures', () {
    for (final (String name, DioException error) in <(String, DioException)>[
      ('no response', _rejected(null)),
      ('429', _rejected(429)),
      ('503 unavailable', _rejected(503, 'PLAY_INTEGRITY_UNAVAILABLE')),
      ('invalid challenge', _rejected(400, 'PLAY_INTEGRITY_CHALLENGE_INVALID')),
    ]) {
      test('$name allows another attempt', () async {
        api.submitError = error;
        final ProviderContainer container = await start();
        await sync(container);
        await sync(container);
        expect(countOf('submit'), 2);
      });
    }

    test('a transient native error allows another attempt', () async {
      nativeError = PlatformException(code: 'transient');
      final ProviderContainer container = await start();
      await sync(container);
      await sync(container);
      expect(countOf('prepare'), 2);
    });

    for (final (String name, DioException error) in <(String, DioException)>[
      ('404', _rejected(404, 'PLAY_INTEGRITY_NOT_AVAILABLE')),
      ('invalid token', _rejected(400, 'PLAY_INTEGRITY_TOKEN_INVALID')),
      ('invalid request', _rejected(400, 'PLAY_INTEGRITY_REQUEST_INVALID')),
    ]) {
      test('$name stops until restart without being stored', () async {
        api.submitError = error;
        final ProviderContainer container = await start();
        await sync(container);
        await sync(container);
        expect(countOf('submit'), 1);

        await sync(await start());
        expect(countOf('submit'), 2);
      });
    }

    test('a native unavailable error stops until restart', () async {
      nativeError = PlatformException(code: 'unavailable');
      final ProviderContainer container = await start();
      await sync(container);
      await sync(container);
      expect(countOf('prepare'), 1);
    });

    test('an untrusted device clears an earlier install message', () async {
      api.submitError = _rejected(403, 'PLAY_INTEGRITY_APP_NOT_RECOGNIZED');
      final ProviderContainer container = await start();
      await sync(container);
      expect(container.read(playIntegrityAgeServiceProvider), isTrue);

      await PlayIntegrityAgeStore().write(
        PlayIntegrityAgeStore.storageKey(
          packageName: _packageName,
          apiBaseUrl: _baseUrl,
          userId: _userId,
        ),
        PlayIntegrityAgeRecord(
          rangeSignature: 'older',
          outcome: PlayIntegrityAgeOutcome.submitted,
          at: DateTime.now(),
        ),
      );
      api.submitError = _rejected(403, 'PLAY_INTEGRITY_DEVICE_NOT_TRUSTED');
      await sync(container);
      expect(container.read(playIntegrityAgeServiceProvider), isFalse);
    });

    test('an untrusted device is stored without a message', () async {
      api.submitError = _rejected(403, 'PLAY_INTEGRITY_DEVICE_NOT_TRUSTED');
      final ProviderContainer container = await start();
      await sync(container);
      expect(container.read(playIntegrityAgeServiceProvider), isFalse);

      await sync(await start());
      expect(countOf('submit'), 1);
    });
  });

  group('install from Google Play message', () {
    test('shows when Age Signals reports the app is not from Play', () async {
      final ProviderContainer container = await start(
        payload: <Object?, Object?>{'status': 'not_installed_from_play'},
      );
      expect(container.read(playInstallRequiredProvider), isTrue);
    });

    test('shows without a project number too', () async {
      final ProviderContainer container = await start(
        payload: <Object?, Object?>{'status': 'not_installed_from_play'},
        projectNumber: '',
      );
      expect(container.read(playInstallRequiredProvider), isTrue);
    });

    test('shows after an app rejection and survives a restart', () async {
      api.submitError = _rejected(403, 'PLAY_INTEGRITY_APP_NOT_RECOGNIZED');
      final ProviderContainer container = await start();
      await sync(container);
      expect(container.read(playInstallRequiredProvider), isTrue);

      final ProviderContainer restarted = await start();
      await sync(restarted);
      expect(countOf('submit'), 1);
      expect(restarted.read(playInstallRequiredProvider), isTrue);
    });

    test('clears after a later successful submission', () async {
      api.submitError = _rejected(403, 'PLAY_INTEGRITY_APP_NOT_RECOGNIZED');
      await sync(await start());

      api.submitError = null;
      final ProviderContainer changed = await start(
        payload: <Object?, Object?>{
          'status': 'sharing',
          'lowerBound': 16,
          'upperBound': 17,
          'ageRangeSource': 'tier_c',
        },
      );
      await sync(changed);
      expect(changed.read(playInstallRequiredProvider), isFalse);
    });

    test('stays hidden on OSS builds', () async {
      final ProviderContainer container = await start(
        payload: <Object?, Object?>{'status': 'not_installed_from_play'},
        supported: false,
      );
      expect(container.read(playInstallRequiredProvider), isFalse);
    });

    test('stays hidden for a normal sharing user', () async {
      final ProviderContainer container = await start();
      await sync(container);
      expect(container.read(playInstallRequiredProvider), isFalse);
    });
  });

  group('Play Store verification', () {
    test('shows when Age Signals still needs a Play Store check', () async {
      final ProviderContainer container = await start(
        payload: <Object?, Object?>{'status': 'verification_required'},
      );
      expect(container.read(playVerificationRequiredProvider), isTrue);
      expect(container.read(playInstallRequiredProvider), isFalse);
    });

    test(
      'asks Age Signals again after returning from the Play Store',
      () async {
        var requests = 0;
        final ProviderContainer container = ProviderContainer(
          overrides: [
            playAgeAssuranceSupportedProvider.overrideWithValue(true),
            playIntegrityCloudProjectNumberProvider.overrideWithValue(''),
            declaredAgePayloadProvider.overrideWith((Ref ref) {
              requests += 1;
              return <Object?, Object?>{'status': 'verification_required'};
            }),
            fluxerClientProvider.overrideWithValue(_FakeFluxerClient(api)),
            fluxerBaseUrlProvider.overrideWithValue(_baseUrl),
            currentUserIdProvider.overrideWithValue(_userId),
            appRuntimeInfoProvider.overrideWith((Ref ref) => _runtimeInfo),
          ],
        );
        addTearDown(container.dispose);
        container
            .read(authStateProvider.notifier)
            .setAuthenticated(value: true);
        container.read(playIntegrityAgeServiceProvider);
        await container.read(declaredAgePayloadProvider.future);
        expect(requests, 1);

        container.read(appUiForegroundProvider.notifier).setResumed(false);
        container.read(appUiForegroundProvider.notifier).setResumed(true);
        await container.read(declaredAgePayloadProvider.future);
        expect(requests, 2);
      },
    );
  });
}
