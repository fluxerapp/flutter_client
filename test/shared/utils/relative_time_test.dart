import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';

Future<FluxerLocalizations> _loadL10n() {
  WidgetsFlutterBinding.ensureInitialized();
  return FluxerLocalizations.delegate.load(const Locale('en'));
}

void main() {
  group('relativeTime', () {
    test('returns just-now for under one minute', () async {
      final l10n = await _loadL10n();
      final result = relativeTime(
        DateTime.now().subtract(const Duration(seconds: 30)),
        l10n,
      );
      expect(result, 'just now');
    });

    test('returns minutes for < 1 hour', () async {
      final l10n = await _loadL10n();
      final result = relativeTime(
        DateTime.now().subtract(const Duration(minutes: 5)),
        l10n,
      );
      expect(result, '5 minutes ago');
    });

    test('returns hours for < 1 day', () async {
      final l10n = await _loadL10n();
      final result = relativeTime(
        DateTime.now().subtract(const Duration(hours: 3)),
        l10n,
      );
      expect(result, '3 hours ago');
    });

    test('returns days for < 30 days', () async {
      final l10n = await _loadL10n();
      final result = relativeTime(
        DateTime.now().subtract(const Duration(days: 4)),
        l10n,
      );
      expect(result, '4 days ago');
    });

    test('returns months for sixty days', () async {
      final l10n = await _loadL10n();
      final result = relativeTime(
        DateTime.now().subtract(const Duration(days: 60)),
        l10n,
      );
      expect(result, '2 months ago');
    });

    test('returns years for ~730 days', () async {
      final l10n = await _loadL10n();
      final result = relativeTime(
        DateTime.now().subtract(const Duration(days: 730)),
        l10n,
      );
      expect(result, '2 years ago');
    });
  });

  group('relativeTimestamp', () {
    test('returns future hours', () async {
      final l10n = await _loadL10n();
      final DateTime now = DateTime(2026, 7, 20, 16);
      final result = relativeTimestamp(
        now.add(const Duration(hours: 5)),
        l10n,
        now: now,
      );
      expect(result, 'in 5 hours');
    });

    test('returns future days', () async {
      final l10n = await _loadL10n();
      final DateTime now = DateTime(2026, 7, 20, 16);
      final result = relativeTimestamp(
        now.add(const Duration(days: 2)),
        l10n,
        now: now,
      );
      expect(result, 'in 2 days');
    });

    test('returns past weeks', () async {
      final l10n = await _loadL10n();
      final DateTime now = DateTime(2026, 7, 20, 16);
      final result = relativeTimestamp(
        now.subtract(const Duration(days: 14)),
        l10n,
        now: now,
      );
      expect(result, '2 weeks ago');
    });
  });

  group('relativeTimeShort', () {
    test('returns "now" for under one minute', () async {
      final l10n = await _loadL10n();
      final result = relativeTimeShort(
        DateTime.now().subtract(const Duration(seconds: 30)),
        l10n,
      );
      expect(result, 'now');
    });

    test('returns "5m" for five minutes', () async {
      final l10n = await _loadL10n();
      final result = relativeTimeShort(
        DateTime.now().subtract(const Duration(minutes: 5)),
        l10n,
      );
      expect(result, '5m');
    });

    test('returns "2h" for two hours', () async {
      final l10n = await _loadL10n();
      final result = relativeTimeShort(
        DateTime.now().subtract(const Duration(hours: 2)),
        l10n,
      );
      expect(result, '2h');
    });

    test('returns "3d" for three days', () async {
      final l10n = await _loadL10n();
      final result = relativeTimeShort(
        DateTime.now().subtract(const Duration(days: 3)),
        l10n,
      );
      expect(result, '3d');
    });

    test('returns "2mo" for sixty days', () async {
      final l10n = await _loadL10n();
      final result = relativeTimeShort(
        DateTime.now().subtract(const Duration(days: 60)),
        l10n,
      );
      expect(result, '2mo');
    });

    test('returns "2y" for ~730 days', () async {
      final l10n = await _loadL10n();
      final result = relativeTimeShort(
        DateTime.now().subtract(const Duration(days: 730)),
        l10n,
      );
      expect(result, '2y');
    });
  });
}
