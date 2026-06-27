import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/typing_indicator_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  final FluxerLocalizationsEn l10n = FluxerLocalizationsEn();

  group('resolveTypingIndicatorBulkText', () {
    test('returns null for one to three typers', () {
      expect(resolveTypingIndicatorBulkText(l10n, 1), isNull);
      expect(resolveTypingIndicatorBulkText(l10n, 2), isNull);
      expect(resolveTypingIndicatorBulkText(l10n, 3), isNull);
    });

    test('returns multiple string for exactly four typers', () {
      expect(
        resolveTypingIndicatorBulkText(l10n, 4),
        l10n.typingIndicatorMultiple,
      );
    });

    test('returns handful string for five to nine typers', () {
      expect(
        resolveTypingIndicatorBulkText(l10n, 5),
        l10n.typingIndicatorHandful,
      );
      expect(
        resolveTypingIndicatorBulkText(l10n, 9),
        l10n.typingIndicatorHandful,
      );
    });

    test('returns apocalypse string for twenty or more typers', () {
      expect(
        resolveTypingIndicatorBulkText(l10n, 20),
        l10n.typingIndicatorApocalypse,
      );
    });
  });

  group('typingIndicatorNamedTemplate', () {
    test('uses one-user template for a single typer', () {
      expect(
        typingIndicatorNamedTemplate(l10n, 1),
        l10n.typingIndicatorOne(kTypingIndicatorNamePlaceholder),
      );
    });

    test('uses two-user template for two typers', () {
      expect(
        typingIndicatorNamedTemplate(l10n, 2),
        l10n.typingIndicatorTwo(
          kTypingIndicatorNamePlaceholder,
          kTypingIndicatorNamePlaceholder,
        ),
      );
    });

    test('uses three-user template for three typers', () {
      expect(
        typingIndicatorNamedTemplate(l10n, 3),
        l10n.typingIndicatorThree(
          kTypingIndicatorNamePlaceholder,
          kTypingIndicatorNamePlaceholder,
          kTypingIndicatorNamePlaceholder,
        ),
      );
    });
  });

  group('single typer text selection', () {
    test('does not use several-people bulk text for one typer', () {
      expect(
        resolveTypingIndicatorBulkText(l10n, 1),
        isNot(l10n.typingIndicatorMultiple),
      );
    });

    test('falls back to named template when bulk text is absent', () {
      const int total = 1;
      final String? bulkText = resolveTypingIndicatorBulkText(l10n, total);
      expect(bulkText, isNull);
      expect(
        typingIndicatorNamedTemplate(l10n, total),
        l10n.typingIndicatorOne(kTypingIndicatorNamePlaceholder),
      );
    });
  });

  group('fallbackTypingUserDisplay', () {
    test('uses snowflake fallback for uncached typers', () {
      const String userId = '123456789012345678';
      expect(fallbackTypingUserDisplay(userId).displayName, '12345678…');
    });
  });
}
