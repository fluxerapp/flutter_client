import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart' show Sha256;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/age/play_integrity_age_store.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'play_integrity_age_service.g.dart';

const MethodChannel playIntegrityChannel = MethodChannel(
  'fluxer_app/play_integrity',
);

const String _statusNotInstalledFromPlay = 'not_installed_from_play';

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

final playAgeAssuranceSupportedProvider = Provider<bool>((Ref ref) {
  return defaultTargetPlatform == TargetPlatform.android &&
      ref.watch(declaredAgeReportingSupportedProvider);
});

final playIntegrityCloudProjectNumberProvider = Provider<String>((Ref ref) {
  return AppBuildConfig.playIntegrityCloudProjectNumber;
});

final playIntegrityAgeStoreProvider = Provider<PlayIntegrityAgeStore>((
  Ref ref,
) {
  return PlayIntegrityAgeStore();
});

final playInstallRequiredProvider = Provider<bool>((Ref ref) {
  if (!ref.watch(playAgeAssuranceSupportedProvider)) {
    return false;
  }
  final Map<Object?, Object?>? payload = ref
      .watch(declaredAgePayloadProvider)
      .value;
  if (payload?['status'] == _statusNotInstalledFromPlay) {
    return true;
  }
  return ref.watch(playIntegrityAgeServiceProvider);
});

final playVerificationRequiredProvider = Provider<bool>((Ref ref) {
  if (!ref.watch(playAgeAssuranceSupportedProvider)) {
    return false;
  }
  return declaredAgeVerificationRequired(
    ref.watch(declaredAgePayloadProvider).value,
  );
});

class _AccountChanged implements Exception {
  const _AccountChanged();
}

@Riverpod(keepAlive: true)
class PlayIntegrityAgeService extends _$PlayIntegrityAgeService {
  static const Duration _resubmitInterval = Duration(days: 7);
  static const Duration _initialRetryDelay = Duration(minutes: 1);
  static const Duration _maxRetryDelay = Duration(hours: 1);

  final Set<String> _stopped = <String>{};
  bool _syncInFlight = false;
  bool _syncAgain = false;
  Timer? _retryTimer;
  Duration _retryDelay = _initialRetryDelay;

  bool get _supported => ref.read(playAgeAssuranceSupportedProvider);

  bool get _enabled =>
      _supported &&
      ref.read(playIntegrityCloudProjectNumberProvider).isNotEmpty;

  @override
  bool build() {
    if (!_supported) {
      return false;
    }
    ref
      ..onDispose(() => _retryTimer?.cancel())
      ..listen<AsyncValue<Map<Object?, Object?>?>>(declaredAgePayloadProvider, (
        _,
        AsyncValue<Map<Object?, Object?>?> next,
      ) {
        if (next.hasValue) {
          unawaited(sync());
        }
      })
      ..listen<bool>(appUiForegroundProvider, (bool? previous, bool next) {
        if (next && previous == false) {
          if (declaredAgeVerificationRequired(
            ref.read(declaredAgePayloadProvider).value,
          )) {
            ref.invalidate(declaredAgePayloadProvider);
          }
          unawaited(sync());
        }
      });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      unawaited(sync());
    });
    return false;
  }

  Future<void> sync() async {
    if (!_enabled) {
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
      talker.handle(e, st, '[PlayIntegrityAge] sync failed');
    } finally {
      _syncInFlight = false;
    }
  }

  Future<void> _syncOnce() async {
    final String? userId = ref.read(currentUserIdProvider);
    if (!ref.read(authStateProvider) || userId == null || userId.isEmpty) {
      state = false;
      return;
    }
    final PlayAgeRange? range = PlayAgeRange.fromPayload(
      await ref.read(declaredAgePayloadProvider.future),
    );
    if (!ref.mounted) {
      return;
    }
    if (range == null) {
      state = false;
      return;
    }
    final String apiBaseUrl = ref.read(fluxerBaseUrlProvider);
    final String packageName = (await ref.read(
      appRuntimeInfoProvider.future,
    )).packageName;
    final String storageKey = PlayIntegrityAgeStore.storageKey(
      packageName: packageName,
      apiBaseUrl: apiBaseUrl,
      userId: userId,
    );
    final PlayIntegrityAgeStore store = ref.read(playIntegrityAgeStoreProvider);
    final PlayIntegrityAgeRecord? record = await store.read(storageKey);
    if (!ref.mounted) {
      return;
    }
    if (record != null &&
        record.isFresh(range, DateTime.now(), _resubmitInterval)) {
      state = record.outcome == PlayIntegrityAgeOutcome.appNotRecognized;
      return;
    }
    if (_stopped.contains(storageKey)) {
      return;
    }
    try {
      await _submit(userId: userId, packageName: packageName, range: range);
      await _record(storageKey, range, PlayIntegrityAgeOutcome.submitted);
      _retryDelay = _initialRetryDelay;
      talker.info('[PlayIntegrityAge] age range submitted');
      if (ref.mounted) {
        unawaited(
          ref.read(currentUserPrivateReadProvider(userId).notifier).refresh(),
        );
      }
    } on _AccountChanged {
      _syncAgain = true;
    } on MissingPluginException {
      _stopped.add(storageKey);
    } on PlatformException catch (e) {
      if (e.code == 'transient') {
        _scheduleRetry(null);
        return;
      }
      talker.warning('[PlayIntegrityAge] Play Integrity failed: ${e.code}');
      _stopped.add(storageKey);
    } on DioException catch (e) {
      await _handleRequestFailure(e, storageKey, range);
    }
  }

  Future<void> _submit({
    required String userId,
    required String packageName,
    required PlayAgeRange range,
  }) async {
    await playIntegrityChannel.invokeMethod<void>('prepare', <String, String>{
      'cloudProjectNumber': ref.read(playIntegrityCloudProjectNumberProvider),
    });
    _ensureAccount(userId);
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
      <String, String>{
        'requestHash': await playIntegrityRequestHash(clientData),
      },
    );
    if (token == null) {
      throw PlatformException(code: 'unavailable');
    }
    _ensureAccount(userId);
    await ref
        .read(fluxerClientProvider)
        .users
        .submitPlayIntegrityAgeAssurance(
          body: PlayIntegrityAgeSubmitRequest(
            packageName: packageName,
            integrityToken: token,
            clientData: base64Encode(clientData),
          ),
        );
  }

  Future<void> _handleRequestFailure(
    DioException error,
    String storageKey,
    PlayAgeRange range,
  ) async {
    final String? rawCode = apiErrorCodeFromDioException(error);
    final ApiErrorCode? code = rawCode == null
        ? null
        : ApiErrorCode.fromJson(rawCode);
    if (code == ApiErrorCode.playIntegrityAppNotRecognized) {
      talker.info('[PlayIntegrityAge] app not installed from Google Play');
      await _record(
        storageKey,
        range,
        PlayIntegrityAgeOutcome.appNotRecognized,
      );
      return;
    }
    if (code == ApiErrorCode.playIntegrityDeviceNotTrusted) {
      talker.info('[PlayIntegrityAge] device failed the Play device check');
      await _record(
        storageKey,
        range,
        PlayIntegrityAgeOutcome.deviceNotTrusted,
      );
      return;
    }
    final int? status = error.response?.statusCode;
    if (status == 404) {
      talker.info('[PlayIntegrityAge] not available on this instance');
      _stopped.add(storageKey);
      return;
    }
    if (status == null ||
        status == 429 ||
        status >= 500 ||
        code == ApiErrorCode.playIntegrityChallengeInvalid) {
      final int? retryAfterMs = retryAfterMsFromDioException(error);
      _scheduleRetry(
        retryAfterMs == null ? null : Duration(milliseconds: retryAfterMs),
      );
      return;
    }
    talker.warning(
      '[PlayIntegrityAge] request failed status=$status code=$rawCode',
    );
    _stopped.add(storageKey);
  }

  Future<void> _record(
    String storageKey,
    PlayAgeRange range,
    PlayIntegrityAgeOutcome outcome,
  ) async {
    await ref
        .read(playIntegrityAgeStoreProvider)
        .write(
          storageKey,
          PlayIntegrityAgeRecord(
            rangeSignature: range.signature,
            outcome: outcome,
            at: DateTime.now(),
          ),
        );
    if (ref.mounted) {
      state = outcome == PlayIntegrityAgeOutcome.appNotRecognized;
    }
  }

  void _ensureAccount(String userId) {
    if (!ref.mounted || ref.read(currentUserIdProvider) != userId) {
      throw const _AccountChanged();
    }
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
    talker.info('[PlayIntegrityAge] retrying in ${delay.inSeconds}s');
    _retryTimer = Timer(delay, () {
      unawaited(sync());
    });
  }
}
