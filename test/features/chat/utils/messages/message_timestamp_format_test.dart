import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_timestamp_format.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<FluxerLocalizations> _loadL10n() {
  WidgetsFlutterBinding.ensureInitialized();
  return FluxerLocalizations.delegate.load(const Locale('en'));
}

void main() {
  group('formatMessageTimestamp', () {
    late FluxerLocalizations l10n;
    const String locale = 'en_US';
    final DateTime now = DateTime(2026, 6, 19, 15, 30);

    setUpAll(() async {
      l10n = await _loadL10n();
      await initializeDateFormatting('de');
      await initializeDateFormatting('en_GB');
    });

    test('formats today with localized time', () {
      final DateTime timestamp = DateTime(2026, 6, 19, 15, 30);
      final String result = formatMessageTimestamp(
        timestamp,
        l10n,
        locale,
        use12Hour: true,
        now: now,
      );
      expect(
        result,
        l10n.chatMessageTimestampToday(DateFormat.jm(locale).format(timestamp)),
      );
    });

    test('formats yesterday with localized time', () {
      final DateTime timestamp = DateTime(2026, 6, 18, 9, 5);
      final String result = formatMessageTimestamp(
        timestamp,
        l10n,
        locale,
        use12Hour: true,
        now: now,
      );
      expect(
        result,
        l10n.chatMessageTimestampYesterday(
          DateFormat.jm(locale).format(timestamp),
        ),
      );
    });

    test('formats older dates with locale date and time', () {
      final DateTime timestamp = DateTime(2026, 6, 17, 9, 5);
      final String result = formatMessageTimestamp(
        timestamp,
        l10n,
        locale,
        use12Hour: true,
        now: now,
      );
      final String expected = DateFormat.yMd(locale).add_jm().format(timestamp);
      expect(result, expected);
    });

    test('treats previous calendar day as yesterday across midnight', () {
      final DateTime reference = DateTime(2026, 6, 19, 0, 1);
      final DateTime timestamp = DateTime(2026, 6, 18, 23, 59);
      final String result = formatMessageTimestamp(
        timestamp,
        l10n,
        locale,
        use12Hour: true,
        now: reference,
      );
      expect(
        result,
        l10n.chatMessageTimestampYesterday(
          DateFormat.jm(locale).format(timestamp),
        ),
      );
    });

    test('formats older dates using locale-specific separators', () {
      const String germanLocale = 'de';
      final DateTime timestamp = DateTime(2026, 6, 17, 9, 5);
      final String result = formatMessageTimestamp(
        timestamp,
        l10n,
        germanLocale,
        use12Hour: true,
        now: now,
      );
      expect(result, contains('.'));
      expect(result, isNot(contains('09:05')));
    });

    test('formats British English 12-hour times after midday', () {
      const String locale = 'en_GB';
      final DateTime timestamp = DateTime(2026, 6, 19, 14);
      final String result = formatMessageTimestamp(
        timestamp,
        l10n,
        locale,
        use12Hour: true,
        now: now,
      );
      expect(result.toLowerCase(), contains('2:00 pm'));
      expect(result, isNot(contains('14:00')));
    });
  });
}
