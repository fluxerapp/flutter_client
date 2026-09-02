import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/markdown_timestamp_format.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('en_US');
    await initializeDateFormatting('fr');
    await initializeDateFormatting('de');
  });

  final FluxerLocalizations englishUs = lookupFluxerLocalizations(
    const Locale('en', 'US'),
  );
  final FluxerLocalizations french = lookupFluxerLocalizations(
    const Locale('fr'),
  );
  final DateTime dateTime = DateTime(2026, 7, 20, 16, 5, 7);

  test('absolute styles use the app locale, not Intl.defaultLocale', () {
    final String? previousDefaultLocale = Intl.defaultLocale;
    Intl.defaultLocale = 'de';
    addTearDown(() => Intl.defaultLocale = previousDefaultLocale);

    expect(
      formatMarkdownTimestamp(dateTime, 'D', french, use12Hour: false),
      DateFormat.yMMMMd('fr').format(dateTime),
    );
    expect(
      formatMarkdownTimestamp(dateTime, 'F', french, use12Hour: false),
      DateFormat.yMMMMEEEEd('fr').add_Hm().format(dateTime),
    );
  });

  test('time styles honor the user 12 or 24-hour preference', () {
    expect(
      formatMarkdownTimestamp(
        dateTime,
        't',
        englishUs,
        use12Hour: true,
      ).replaceAll('\u202f', ' '),
      '4:05 PM',
    );
    expect(
      formatMarkdownTimestamp(dateTime, 't', englishUs, use12Hour: false),
      '16:05',
    );
    expect(
      formatMarkdownTimestamp(
        dateTime,
        'T',
        englishUs,
        use12Hour: true,
      ).replaceAll('\u202f', ' '),
      '4:05:07 PM',
    );
    expect(
      formatMarkdownTimestamp(dateTime, 'T', englishUs, use12Hour: false),
      '16:05:07',
    );
  });

  test('relative style stays localised for past and future values', () {
    final DateTime now = DateTime(2026, 7, 20, 16);
    final DateTime past = now.subtract(const Duration(hours: 2));
    final DateTime future = now.add(const Duration(days: 2));

    expect(
      formatMarkdownTimestamp(past, 'R', french, use12Hour: false, now: now),
      french.relativeTimeHours(2),
    );
    expect(
      formatMarkdownTimestamp(future, 'R', french, use12Hour: false, now: now),
      french.relativeTimeInDays(2),
    );
  });
}
