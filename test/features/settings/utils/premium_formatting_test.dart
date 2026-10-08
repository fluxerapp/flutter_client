import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/utils/premium_formatting.dart';

void main() {
  group('formatPremiumMinorUnitPrice', () {
    test('shows ISK in whole krónur from Stripe two-decimal minor units', () {
      expect(
        formatPremiumMinorUnitPrice(
          amountMinor: 59000,
          currency: 'ISK',
          locale: 'en',
        ),
        'kr590',
      );
      expect(
        formatPremiumMinorUnitPrice(
          amountMinor: 590000,
          currency: 'ISK',
          locale: 'en',
        ),
        'kr5,900',
      );
    });

    test('keeps two decimals for SEK', () {
      expect(
        formatPremiumMinorUnitPrice(
          amountMinor: 4900,
          currency: 'SEK',
          locale: 'en',
        ),
        'kr49.00',
      );
    });

    test('keeps zero-decimal currencies in their own minor unit', () {
      expect(
        formatPremiumMinorUnitPrice(
          amountMinor: 700,
          currency: 'JPY',
          locale: 'en',
        ),
        '¥700',
      );
    });

    test('returns null without an amount or currency', () {
      expect(
        formatPremiumMinorUnitPrice(
          amountMinor: null,
          currency: 'ISK',
          locale: 'en',
        ),
        isNull,
      );
      expect(
        formatPremiumMinorUnitPrice(
          amountMinor: 100,
          currency: '',
          locale: 'en',
        ),
        isNull,
      );
    });
  });
}
