import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/gifts/utils/gift_duration_text.dart';
import 'package:fluxer_app/features/gifts/utils/gift_redeem_errors.dart';
import 'package:fluxer_dart/export.dart';
import '../../helpers/test_l10n.dart';

void main() {
  final l10n = testL10n;

  GiftCodeResponse gift({
    required GiftCodeResponseDurationTypeDurationType type,
    required int quantity,
  }) {
    return GiftCodeResponse(
      code: 'TEST',
      durationType: type,
      durationQuantity: quantity,
      redeemed: false,
    );
  }

  group('giftDurationText', () {
    test('quantity 0 is visionary lifetime', () {
      expect(
        giftDurationText(
          l10n,
          gift(
            type: GiftCodeResponseDurationTypeDurationType.months,
            quantity: 0,
          ),
        ),
        'Visionary (lifetime Plutonium)',
      );
    });

    test('formats months and years', () {
      expect(
        giftDurationText(
          l10n,
          gift(
            type: GiftCodeResponseDurationTypeDurationType.months,
            quantity: 1,
          ),
        ),
        '1 month of Plutonium',
      );
      expect(
        giftDurationText(
          l10n,
          gift(
            type: GiftCodeResponseDurationTypeDurationType.years,
            quantity: 2,
          ),
        ),
        '2 years of Plutonium',
      );
    });
  });

  group('giftRedeemFailureFromDio', () {
    DioException dioWithCode(String? code, {int status = 400}) {
      return DioException(
        requestOptions: RequestOptions(path: '/gifts/x'),
        response: Response<Map<String, Object?>>(
          requestOptions: RequestOptions(path: '/gifts/x'),
          statusCode: status,
          data: code == null
              ? <String, Object?>{}
              : <String, Object?>{'code': code},
        ),
      );
    }

    test('maps known ApiErrorCode values', () {
      expect(
        giftRedeemFailureFromDio(dioWithCode('UNKNOWN_GIFT_CODE')),
        GiftRedeemFailure.invalid,
      );
      expect(
        giftRedeemFailureFromDio(dioWithCode('GIFT_CODE_ALREADY_REDEEMED')),
        GiftRedeemFailure.alreadyRedeemed,
      );
      expect(
        giftRedeemFailureFromDio(
          dioWithCode('CANNOT_REDEEM_PLUTONIUM_WITH_VISIONARY'),
        ),
        GiftRedeemFailure.visionaryCannotRedeem,
      );
    });

    test('maps bare 404 to notFound', () {
      expect(
        giftRedeemFailureFromDio(dioWithCode(null, status: 404)),
        GiftRedeemFailure.notFound,
      );
    });
  });
}
