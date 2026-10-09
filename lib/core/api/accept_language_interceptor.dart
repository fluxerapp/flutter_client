import 'dart:ui' show Locale;

import 'package:dio/dio.dart';

const String kAcceptLanguageHeader = 'Accept-Language';

class AcceptLanguageInterceptor extends Interceptor {
  AcceptLanguageInterceptor({required this.readLocale});

  final Locale Function() readLocale;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!options.headers.containsKey(kAcceptLanguageHeader)) {
      options.headers[kAcceptLanguageHeader] = readLocale().toLanguageTag();
    }
    handler.next(options);
  }
}
