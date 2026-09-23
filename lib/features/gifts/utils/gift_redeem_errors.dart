import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';

enum GiftRedeemFailure {
  invalid,
  alreadyRedeemed,
  notFound,
  visionaryCannotRedeem,
  generic,
}

GiftRedeemFailure giftRedeemFailureFromDio(DioException error) {
  final String? code = apiErrorCodeFromDioException(error);
  return switch (code) {
    'CANNOT_REDEEM_PLUTONIUM_WITH_VISIONARY' =>
      GiftRedeemFailure.visionaryCannotRedeem,
    'UNKNOWN_GIFT_CODE' => GiftRedeemFailure.invalid,
    'GIFT_CODE_ALREADY_REDEEMED' => GiftRedeemFailure.alreadyRedeemed,
    _ when error.response?.statusCode == 404 => GiftRedeemFailure.notFound,
    _ => GiftRedeemFailure.generic,
  };
}
