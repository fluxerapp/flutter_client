import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_api_features.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/session_authorization_header.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

Dio createPushAccountDio(
  Ref ref, {
  required String token,
  required String apiBaseUrl,
}) {
  return Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: <String, dynamic>{
        'Authorization': formatSessionAuthorizationHeader(token),
        'User-Agent': ref.read(fluxerClientPropertiesProvider).userAgent,
        'X-Fluxer-Client-Properties': ref.read(
          fluxerClientPropertiesHeaderProvider,
        ),
        fluxerApiFeaturesHeaderName: buildFluxerApiFeaturesHeaderValue(),
      },
    ),
  );
}
