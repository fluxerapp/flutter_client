import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/accept_language_interceptor.dart';
import 'package:fluxer_app/core/api/captcha_interceptor.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/api/premium_state_response_interceptor.dart';
import 'package:fluxer_app/core/api/rate_limit_interceptor.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';
import 'package:fluxer_app/core/api/skip_auth_interceptor.dart';
import 'package:fluxer_app/core/api/sudo_dialog.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/observability/fluxer_measure_dio.dart';
import 'package:fluxer_app/core/observability/measure_http_policy.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

export 'package:fluxer_app/core/providers/active_instance_provider.dart';

part 'fluxer_client_provider.g.dart';

@Riverpod(keepAlive: true)
FluxerClientProperties fluxerClientProperties(Ref ref) {
  final AsyncValue<AppRuntimeInfo> runtime = ref.watch(appRuntimeInfoProvider);
  return runtime.when(
    data: (AppRuntimeInfo info) =>
        buildFluxerClientProperties(runtimeInfo: info),
    loading: buildFluxerClientProperties,
    error: (Object err, StackTrace stack) => buildFluxerClientProperties(),
  );
}

@Riverpod(keepAlive: true)
String fluxerClientPropertiesHeader(Ref ref) {
  final FluxerClientProperties properties = ref.watch(
    fluxerClientPropertiesProvider,
  );
  return encodeFluxerClientPropertiesHeader(
    toClientPropertiesWireMap(properties),
  );
}

Dio _buildFluxerDio({
  required Ref ref,
  required String baseUrl,
  required InstanceConfigSnapshot instanceSnapshot,
}) {
  final String userAgent = ref.watch(fluxerClientPropertiesProvider).userAgent;
  final String clientPropertiesHeader = ref.watch(
    fluxerClientPropertiesHeaderProvider,
  );
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 10),
      headers: <String, dynamic>{
        'User-Agent': userAgent,
        'X-Fluxer-Client-Properties': clientPropertiesHeader,
        fluxerApiFeaturesHeaderName: buildFluxerApiFeaturesHeaderValue(),
      },
    ),
  );
  final ProviderContainer container = ref.container;
  dio.interceptors.add(
    AcceptLanguageInterceptor(
      readLocale: () => container.read(effectiveAppLocaleProvider),
    ),
  );
  String? readToken() => ref.read(fluxerAuthTokenProvider);
  dio.interceptors.add(SessionAuthInterceptor(readToken: readToken));
  dio.interceptors.add(SkipAuthInterceptor());
  dio.interceptors.add(RetryInterceptor(dio: dio, readToken: readToken));
  final RateLimitPacer rateLimitPacer = RateLimitPacer();
  ref.listen<String?>(
    fluxerAuthTokenProvider,
    (String? previous, String? next) => rateLimitPacer.clear(),
  );
  dio.interceptors.add(RateLimitInterceptor(pacer: rateLimitPacer));
  dio.interceptors.add(PremiumStateResponseInterceptor());
  attachFluxerMeasureDioInterceptor(
    dio,
    shouldTrackRequest: (Uri uri) => kMeasureHttpPolicy.shouldTrackHttpRequest(
      instance: instanceSnapshot,
      requestUri: uri,
    ),
  );
  dio.interceptors.add(
    CaptchaInterceptor(
      dio: dio,
      showSlowSolveHint: () {
        final FluxerToast toast = FluxerToast(
          message: ref.read(appLocalizationsProvider).authCheckStillWorking,
          duration: const Duration(seconds: 60),
        );
        ref.read(toastProvider.notifier).show(toast);
        return () => ref.read(toastProvider.notifier).hide(toast);
      },
    ),
  );
  dio.interceptors.add(
    SudoInterceptor(
      dio: dio,
      showSudoSheet: (SudoChallenge challenge) => showSudoVerificationSheet(
        navigatorKey: rootNavigatorKey,
        dio: dio,
        challenge: challenge,
      ),
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printResponseTime: true,
          printResponseData: false,
          printRequestData: false,
          printErrorData: false,
          printErrorHeaders: false,
        ),
      ),
    );
  }
  return dio;
}

@Riverpod(keepAlive: true)
Dio fluxerDio(Ref ref) {
  final String baseUrl = ref.watch(fluxerBaseUrlProvider);
  final InstanceConfigSnapshot instance = ref.watch(activeInstanceProvider);
  return _buildFluxerDio(
    ref: ref,
    baseUrl: baseUrl,
    instanceSnapshot: instance,
  );
}

@Riverpod(keepAlive: true)
FluxerClient fluxerClient(Ref ref) {
  final Dio dio = ref.watch(fluxerDioProvider);
  final String baseUrl = ref.watch(fluxerBaseUrlProvider);
  return FluxerClient(dio, baseUrl: baseUrl);
}

@Riverpod(keepAlive: true)
String authFluxerBaseUrl(Ref ref) {
  return ref.watch(authInstanceSnapshotProvider).apiBaseUrl;
}

@Riverpod(keepAlive: true)
Dio authFluxerDio(Ref ref) {
  final String baseUrl = ref.watch(authFluxerBaseUrlProvider);
  final InstanceConfigSnapshot instance = ref.watch(
    authInstanceSnapshotProvider,
  );
  return _buildFluxerDio(
    ref: ref,
    baseUrl: baseUrl,
    instanceSnapshot: instance,
  );
}

@Riverpod(keepAlive: true)
FluxerClient authFluxerClient(Ref ref) {
  final Dio dio = ref.watch(authFluxerDioProvider);
  final String baseUrl = ref.watch(authFluxerBaseUrlProvider);
  return FluxerClient(dio, baseUrl: baseUrl);
}

@Riverpod(keepAlive: true)
class FluxerAuthToken extends _$FluxerAuthToken {
  @override
  String? build() => null;

  void setToken(String? token) {
    if (state == token) {
      return;
    }
    state = token;
  }
}
