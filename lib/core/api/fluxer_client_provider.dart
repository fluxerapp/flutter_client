import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/captcha_dialog.dart';
import 'package:fluxer_app/core/api/captcha_interceptor.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/api/rate_limit_interceptor.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';
import 'package:fluxer_app/core/api/skip_auth_interceptor.dart';
import 'package:fluxer_app/core/api/sudo_dialog.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/observability/fluxer_otel_dio_interceptor.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
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

Dio _buildFluxerDio({required Ref ref, required String baseUrl}) {
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
  dio.interceptors.add(
    SessionAuthInterceptor(readToken: () => ref.read(fluxerAuthTokenProvider)),
  );
  dio.interceptors.add(SkipAuthInterceptor());
  dio.interceptors.add(RetryInterceptor(dio: dio));
  dio.interceptors.add(RateLimitInterceptor(pacer: sharedRateLimitPacer));
  dio.interceptors.add(const FluxerOtelDioInterceptor());
  dio.interceptors.add(
    CaptchaInterceptor(
      dio: dio,
      showCaptchaDialog:
          ({
            required preferredProvider,
            required turnstileSiteKey,
            required hcaptchaSiteKey,
            required baseUrl,
          }) => showCaptchaDialog(
            navigatorKey: rootNavigatorKey,
            preferredProvider: preferredProvider,
            turnstileSiteKey: turnstileSiteKey,
            hcaptchaSiteKey: hcaptchaSiteKey,
            baseUrl: baseUrl,
          ),
    ),
  );
  dio.interceptors.add(
    SudoInterceptor(
      dio: dio,
      showSudoSheet: () =>
          showSudoVerificationSheet(navigatorKey: rootNavigatorKey, dio: dio),
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printResponseTime: true,
          printResponseData: false,
        ),
      ),
    );
  }
  return dio;
}

@Riverpod(keepAlive: true)
Dio fluxerDio(Ref ref) {
  final String baseUrl = ref.watch(fluxerBaseUrlProvider);
  return _buildFluxerDio(ref: ref, baseUrl: baseUrl);
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
  return _buildFluxerDio(ref: ref, baseUrl: baseUrl);
}

@Riverpod(keepAlive: true)
FluxerClient authFluxerClient(Ref ref) {
  final Dio dio = ref.watch(authFluxerDioProvider);
  final String baseUrl = ref.watch(authFluxerBaseUrlProvider);
  return FluxerClient(dio, baseUrl: baseUrl);
}

/// Holds the current auth token. Set by the auth flow, watched by
/// [fluxerClientProvider] so the client rebuilds when the token changes.
@Riverpod(keepAlive: true)
class FluxerAuthToken extends _$FluxerAuthToken {
  @override
  String? build() => null;

  // Auth state is updated from repository flows; Riverpod state remains the
  // source of truth for consumers.
  // ignore: use_setters_to_change_properties
  void setToken(String? token) {
    state = token;
  }
}
