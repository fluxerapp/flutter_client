import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/profile/utils/profile_timezone_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<FluxerLocalizations> _loadL10n() {
  WidgetsFlutterBinding.ensureInitialized();
  return FluxerLocalizations.delegate.load(const Locale('en'));
}

void main() {
  late FluxerLocalizations l10n;

  setUpAll(() async {
    l10n = await _loadL10n();
    await initializeDateFormatting('en');
  });

  group('formatProfileLocalTime', () {
    test('formats wall clock from UTC offset', () {
      final DateTime now = DateTime.utc(2024, 6, 15, 18);
      final String formatted = formatProfileLocalTime(
        now: now,
        offsetMinutes: -300,
        locale: 'en',
        use12Hour: true,
      );
      expect(formatted.replaceAll('\u202f', ' '), '1:00 PM');
    });
  });

  group('formatOffsetDifferenceDuration', () {
    test('returns hours and minutes', () {
      expect(formatOffsetDifferenceDuration(l10n, 150), '2 hours 30 minutes');
    });

    test('returns hours only', () {
      expect(formatOffsetDifferenceDuration(l10n, 120), '2 hours');
    });

    test('returns minutes only', () {
      expect(formatOffsetDifferenceDuration(l10n, 45), '45 minutes');
    });

    test('uses absolute value', () {
      expect(formatOffsetDifferenceDuration(l10n, -90), '1 hour 30 minutes');
    });
  });

  group('formatTimezoneDifferenceText', () {
    test('returns same time text when offsets match', () {
      expect(
        formatTimezoneDifferenceText(
          l10n: l10n,
          profileOffsetMinutes: -300,
          viewerOffsetMinutes: -300,
        ),
        l10n.userProfileSameTimeAsYou,
      );
    });

    test('returns ahead text when profile is ahead', () {
      expect(
        formatTimezoneDifferenceText(
          l10n: l10n,
          profileOffsetMinutes: 0,
          viewerOffsetMinutes: -300,
        ),
        '5 hours ahead of you',
      );
    });

    test('returns behind text when profile is behind', () {
      expect(
        formatTimezoneDifferenceText(
          l10n: l10n,
          profileOffsetMinutes: -300,
          viewerOffsetMinutes: 0,
        ),
        '5 hours behind you',
      );
    });
  });
}
