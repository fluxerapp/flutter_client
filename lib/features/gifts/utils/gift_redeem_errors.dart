import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_dart/export.dart';

enum GiftRedeemFailure {
  invalid,
  alreadyRedeemed,
  notFound,
  visionaryCannotRedeem,
  generic,
}

GiftRedeemFailure giftRedeemFailureFromDio(DioException error) {
  final ApiErrorCode code = ApiErrorCode.fromJson(
    apiErrorCodeFromDioException(error) ?? '',
  );
  return switch (code) {
    ApiErrorCode.cannotRedeemPlutoniumWithVisionary =>
      GiftRedeemFailure.visionaryCannotRedeem,
    ApiErrorCode.unknownGiftCode => GiftRedeemFailure.invalid,
    ApiErrorCode.giftCodeAlreadyRedeemed => GiftRedeemFailure.alreadyRedeemed,
    _ when error.response?.statusCode == 404 => GiftRedeemFailure.notFound,
    _ => GiftRedeemFailure.generic,
  };
}
