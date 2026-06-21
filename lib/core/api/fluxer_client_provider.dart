import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/captcha_dialog.dart';
import 'package:fluxer_app/core/api/captcha_interceptor.dart';
import 'package:fluxer_app/core/api/fluxer_client_properties.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';
import 'package:fluxer_app/core/api/skip_auth_interceptor.dart';
import 'package:fluxer_app/core/api/sudo_dialog.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
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

@Riverpod(keepAlive: true)
Dio fluxerDio(Ref ref) {
  final baseUrl = ref.watch(fluxerBaseUrlProvider);
  final userAgent = ref.watch(fluxerClientPropertiesProvider).userAgent;
  final clientPropertiesHeader = ref.watch(
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
      },
    ),
  );

  dio.interceptors.add(
    SessionAuthInterceptor(readToken: () => ref.read(fluxerAuthTokenProvider)),
  );
  dio.interceptors.add(SkipAuthInterceptor());
  dio.interceptors.add(RetryInterceptor(dio: dio));
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
          printRequestHeaders: true,
        ),
      ),
    );
  }

  return dio;
}

@Riverpod(keepAlive: true)
FluxerClient fluxerClient(Ref ref) {
  final dio = ref.watch(fluxerDioProvider);
  final baseUrl = ref.watch(fluxerBaseUrlProvider);
  return FluxerClient(dio, baseUrl: baseUrl);
}

/// Holds the current auth token. Set by the auth flow, watched by
/// [fluxerClientProvider] so the client rebuilds when the token changes.
@Riverpod(keepAlive: true)
class FluxerAuthToken extends _$FluxerAuthToken {
  @override
  String? build() => null;

  void setToken(String? token) {
    state = token;
  }
}
