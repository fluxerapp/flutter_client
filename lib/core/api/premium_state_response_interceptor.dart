import 'package:dio/dio.dart';
import 'package:fluxer_app/core/premium/premium_state_response_json.dart';

class PremiumStateResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final Object? data = response.data;
    if (data is Map && _looksLikePremiumStatePayload(data)) {
      response.data = normalizePremiumStateResponseJson(
        Map<String, dynamic>.from(data),
      );
    }
    handler.next(response);
  }

  static bool _looksLikePremiumStatePayload(Map<dynamic, dynamic> data) {
    return data.containsKey('actual') &&
        data.containsKey('effective') &&
        data.containsKey('billing');
  }
}
