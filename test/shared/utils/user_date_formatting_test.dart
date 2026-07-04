import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en_US');
    await initializeDateFormatting('de_DE');
  });

  group('localeUses12Hour', () {
    test('returns true for en-US', () {
      expect(localeUses12Hour('en-US'), isTrue);
    });

    test('returns false for de-DE', () {
      expect(localeUses12Hour('de-DE'), isFalse);
    });
  });

  group('resolveUse12Hour', () {
    test('returns true for twelveHour', () {
      expect(
        resolveUse12Hour(
          timeFormat: TimeFormatTypes.twelveHour,
          useSystemLocaleForTimeFormat: false,
          appLocale: 'de-DE',
          systemLocale: 'de-DE',
        ),
        isTrue,
      );
    });

    test('returns false for twentyFourHour', () {
      expect(
        resolveUse12Hour(
          timeFormat: TimeFormatTypes.twentyFourHour,
          useSystemLocaleForTimeFormat: false,
          appLocale: 'en-US',
          systemLocale: 'en-US',
        ),
        isFalse,
      );
    });

    test('auto uses app locale when system toggle is off', () {
      expect(
        resolveUse12Hour(
          timeFormat: TimeFormatTypes.auto,
          useSystemLocaleForTimeFormat: false,
          appLocale: 'en-US',
          systemLocale: 'de-DE',
        ),
        isTrue,
      );
    });

    test('auto uses system locale when system toggle is on', () {
      expect(
        resolveUse12Hour(
          timeFormat: TimeFormatTypes.auto,
          useSystemLocaleForTimeFormat: true,
          appLocale: 'en-US',
          systemLocale: 'de-DE',
        ),
        isFalse,
      );
    });
  });

  group('formatUserTime', () {
    final DateTime sample = DateTime(2025, 1, 1, 14, 30);

    test('formats 12-hour time', () {
      final String formatted = formatUserTime(sample, 'en_US', use12Hour: true);
      expect(formatted.replaceAll('\u202f', ' '), '2:30 PM');
    });

    test('formats 24-hour time', () {
      final String formatted = formatUserTime(
        sample,
        'en_US',
        use12Hour: false,
      );
      expect(formatted, '14:30');
    });
  });
}
