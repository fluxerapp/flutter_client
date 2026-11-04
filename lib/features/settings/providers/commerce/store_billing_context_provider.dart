import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';

final storeBillingContextProvider =
    AsyncNotifierProvider<
      StoreBillingContextNotifier,
      StoreBillingContextResponse
    >(StoreBillingContextNotifier.new, retry: storeBillingContextRetry);

Duration? storeBillingContextRetry(int retryCount, Object error) {
  if (retryCount >= 10 || error is! DioException) {
    return null;
  }
  final int? status = error.response?.statusCode;
  if (status != null && status < 500) {
    return null;
  }
  return Duration(seconds: min(2 << retryCount, 60));
}

class StoreBillingContextNotifier
    extends AsyncNotifier<StoreBillingContextResponse> {
  @override
  Future<StoreBillingContextResponse> build() {
    return ref.watch(fluxerClientProvider).premium.getStoreBillingContext();
  }
}
