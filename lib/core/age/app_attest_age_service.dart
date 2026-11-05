import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart' show Sha256;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluxer_app/core/age/app_attest_key_store.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_attest_age_service.g.dart';

const MethodChannel appAttestChannel = MethodChannel('fluxer_app/app_attest');

String appAttestAgeFloorWireValue(DeclaredAgeReport report) {
  return switch (report) {
    DeclaredAgeReport.adult => 'adult',
    DeclaredAgeReport.minor => 'minor',
    DeclaredAgeReport.underMinimum => 'under_minimum',
  };
}

List<int> appAttestAgeClientData({
  required String challenge,
  required DeclaredAgeReport report,
}) {
  return utf8.encode(
    jsonEncode(<String, String>{
      'challenge': challenge,
      'age_floor': appAttestAgeFloorWireValue(report),
    }),
  );
}

const Set<ApiErrorCode> _keyRejectionCodes = <ApiErrorCode>{
  ApiErrorCode.appAttestKeyNotRegistered,
  ApiErrorCode.appAttestKeyInUse,
  ApiErrorCode.appAttestAttestationInvalid,
  ApiErrorCode.appAttestAssertionInvalid,
};

ApiErrorCode? _appAttestErrorCode(DioException error) {
  final String? code = apiErrorCodeFromDioException(error);
  return code == null ? null : ApiErrorCode.fromJson(code);
}

class _KeyRejected implements Exception {
  const _KeyRejected();
}

class _AccountChanged implements Exception {
  const _AccountChanged();
}

@Riverpod(keepAlive: true)
class AppAttestAgeService extends _$AppAttestAgeService {
  static const Duration _resubmitInterval = Duration(days: 1);
  static const Duration _initialRetryDelay = Duration(minutes: 1);
  static const Duration _maxRetryDelay = Duration(hours: 1);

  final AppAttestKeyStore _store = AppAttestKeyStore();
  final Set<String> _stopped = <String>{};
  bool _syncInFlight = false;
  bool _syncAgain = false;
  Timer? _retryTimer;
  Duration _retryDelay = _initialRetryDelay;

  @override
  int build() {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) {
      return 0;
    }
    ref
      ..onDispose(() => _retryTimer?.cancel())
      ..listen<AsyncValue<DeclaredAgeReport?>>(declaredAgeReportProvider, (
        _,
        AsyncValue<DeclaredAgeReport?> next,
      ) {
        if (next.hasValue) {
          unawaited(sync());
        }
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          unawaited(sync());
        }
      });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(sync());
    });
    return 0;
  }

  Future<void> sync() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.iOS) {
      return;
    }
    if (_syncInFlight) {
      _syncAgain = true;
      return;
    }
    _syncInFlight = true;
    try {
      do {
        _syncAgain = false;
        await _syncOnce();
      } while (_syncAgain && ref.mounted);
    } on Object catch (e, st) {
      talker.handle(e, st, '[AppAttestAge] sync failed');
    } finally {
      _syncInFlight = false;
    }
  }

  Future<void> _syncOnce() async {
    if (!ref.read(authStateProvider)) {
      return;
    }
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null || userId.isEmpty) {
      return;
    }
    final DeclaredAgeReport? report = await ref.read(
      declaredAgeReportProvider.future,
    );
    if (report == null || !ref.mounted) {
      return;
    }
    final String apiBaseUrl = ref.read(fluxerBaseUrlProvider);
    final String bundleId = (await ref.read(
      appRuntimeInfoProvider.future,
    )).packageName;
    final String storageKey = AppAttestKeyStore.storageKey(
      bundleId: bundleId,
      apiBaseUrl: apiBaseUrl,
      userId: userId,
    );
    if (_stopped.contains(storageKey)) {
      return;
    }
    if (await appAttestChannel.invokeMethod<bool>('isSupported') != true) {
      _stopped.add(storageKey);
      return;
    }
    AppAttestKeyRecord? record = await _store.read(storageKey);
    if (record != null &&
        record.isFresh(report, DateTime.now(), _resubmitInterval)) {
      return;
    }
    try {
      for (var attempt = 0; ; attempt++) {
        try {
          final AppAttestKeyRecord registered = await _registeredKey(
            userId: userId,
            storageKey: storageKey,
            record: record,
          );
          await _submit(
            userId: userId,
            keyId: registered.keyId,
            report: report,
          );
          await _store.write(
            storageKey,
            AppAttestKeyRecord(
              keyId: registered.keyId,
              registered: true,
              submittedReport: report,
              submittedAt: DateTime.now(),
            ),
          );
          _retryDelay = _initialRetryDelay;
          talker.info('[AppAttestAge] age range submitted');
          if (ref.mounted) {
            unawaited(
              ref
                  .read(currentUserPrivateReadProvider(userId).notifier)
                  .refresh(),
            );
          }
          return;
        } on _KeyRejected {
          await _store.delete(storageKey);
          record = null;
          if (attempt >= 1) {
            talker.warning('[AppAttestAge] new key rejected, stopping');
            _stopped.add(storageKey);
            return;
          }
          talker.warning('[AppAttestAge] key rejected, making a new one');
        }
      }
    } on _AccountChanged {
      _syncAgain = true;
    } on PlatformException catch (e) {
      if (e.code == 'serverUnavailable') {
        _scheduleRetry(null);
        return;
      }
      talker.warning('[AppAttestAge] App Attest failed with ${e.code}');
      _stopped.add(storageKey);
    } on DioException catch (e) {
      final int? status = e.response?.statusCode;
      if (status == 404) {
        talker.info('[AppAttestAge] not available on this instance');
        _stopped.add(storageKey);
        return;
      }
      if (status == null ||
          status == 429 ||
          status >= 500 ||
          _appAttestErrorCode(e) == ApiErrorCode.appAttestChallengeInvalid) {
        final int? retryAfterMs = retryAfterMsFromDioException(e);
        _scheduleRetry(
          retryAfterMs == null ? null : Duration(milliseconds: retryAfterMs),
        );
        return;
      }
      talker.warning(
        '[AppAttestAge] request failed status=$status '
        'code=${_appAttestErrorCode(e)}',
      );
      _stopped.add(storageKey);
    }
  }

  Future<AppAttestKeyRecord> _registeredKey({
    required String userId,
    required String storageKey,
    required AppAttestKeyRecord? record,
  }) async {
    if (record != null && record.registered) {
      return record;
    }
    final String keyId;
    if (record != null) {
      keyId = record.keyId;
    } else {
      keyId = await _platform<String>(() {
        return appAttestChannel.invokeMethod<String>('generateKey');
      });
      await _store.write(
        storageKey,
        AppAttestKeyRecord(keyId: keyId, registered: false),
      );
    }
    final String challenge = await _challenge(
      userId,
      AppAttestChallengeRequestPurposePurpose.attest,
    );
    final Uint8List attestation = await _platform<Uint8List>(() async {
      return appAttestChannel.invokeMethod<Uint8List>(
        'attestKey',
        <String, Object>{
          'keyId': keyId,
          'clientDataHash': await _sha256(utf8.encode(challenge)),
        },
      );
    });
    _ensureAccount(userId);
    await _rejectingKey(
      ref
          .read(fluxerClientProvider)
          .users
          .registerAppAttestKey(
            body: AppAttestKeyRegisterRequest(
              keyId: keyId,
              attestation: base64Encode(attestation),
              challenge: challenge,
            ),
          ),
    );
    final AppAttestKeyRecord registered = AppAttestKeyRecord(
      keyId: keyId,
      registered: true,
    );
    await _store.write(storageKey, registered);
    return registered;
  }

  Future<void> _submit({
    required String userId,
    required String keyId,
    required DeclaredAgeReport report,
  }) async {
    final String challenge = await _challenge(
      userId,
      AppAttestChallengeRequestPurposePurpose.valueAssert,
    );
    final List<int> clientData = appAttestAgeClientData(
      challenge: challenge,
      report: report,
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
    _ensureAccount(userId);
    await _rejectingKey(
      ref
          .read(fluxerClientProvider)
          .users
          .submitAgeAssurance(
            body: AgeAssuranceSubmitRequest(
              keyId: keyId,
              assertion: base64Encode(assertion),
              clientData: base64Encode(clientData),
            ),
          ),
    );
  }

  Future<String> _challenge(
    String userId,
    AppAttestChallengeRequestPurposePurpose purpose,
  ) async {
    _ensureAccount(userId);
    final AppAttestChallengeResponse response = await ref
        .read(fluxerClientProvider)
        .users
        .createAppAttestChallenge(
          body: AppAttestChallengeRequest(purpose: purpose),
        );
    return response.challenge;
  }

  void _ensureAccount(String userId) {
    if (!ref.mounted || ref.read(currentUserIdProvider) != userId) {
      throw const _AccountChanged();
    }
  }

  Future<T> _platform<T>(Future<T?> Function() call) async {
    try {
      final T? value = await call();
      if (value == null) {
        throw PlatformException(code: 'unknownSystemFailure');
      }
      return value;
    } on PlatformException catch (e) {
      if (e.code == 'invalidKey') {
        throw const _KeyRejected();
      }
      rethrow;
    }
  }

  Future<void> _rejectingKey(Future<void> request) async {
    try {
      await request;
    } on DioException catch (e) {
      if (_keyRejectionCodes.contains(_appAttestErrorCode(e))) {
        throw const _KeyRejected();
      }
      rethrow;
    }
  }

  Future<Uint8List> _sha256(List<int> bytes) async {
    return Uint8List.fromList((await Sha256().hash(bytes)).bytes);
  }

  void _scheduleRetry(Duration? after) {
    _retryTimer?.cancel();
    final Duration delay = after ?? _retryDelay;
    _retryDelay = Duration(
      milliseconds: min(
        _retryDelay.inMilliseconds * 2,
        _maxRetryDelay.inMilliseconds,
      ),
    );
    talker.info('[AppAttestAge] retrying in ${delay.inSeconds}s');
    _retryTimer = Timer(delay, () {
      unawaited(sync());
    });
  }
}
