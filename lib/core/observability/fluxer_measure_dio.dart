import 'package:dio/dio.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/observability/fluxer_measure_dio_interceptor.dart';
import 'package:fluxer_app/core/observability/fluxer_measure_http.dart';

void attachFluxerMeasureDioInterceptor(
  Dio dio, {
  required FluxerMeasureHttpTrackingGate shouldTrackRequest,
}) {
  if (!AppBuildConfig.hasObservabilityConfig) {
    return;
  }
  dio.interceptors.add(
    FluxerMeasureDioInterceptor(shouldTrackRequest: shouldTrackRequest),
  );
}
