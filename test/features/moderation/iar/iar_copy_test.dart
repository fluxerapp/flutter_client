import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/moderation/iar/iar_copy.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  final l10n = FluxerLocalizationsEn();

  group('iarFlatMessageReasonSelectOptions', () {
    test('returns one option per message reason, in list order', () {
      final options = iarFlatMessageReasonSelectOptions(l10n);
      expect(
        options.map((option) => option.value).toList(),
        orderedEquals(messageReportReasons),
      );
    });

    test('every option has a non-empty label and description', () {
      for (final option in iarFlatMessageReasonSelectOptions(l10n)) {
        expect(option.label, isNotEmpty, reason: '${option.value} label');
        expect(
          option.description,
          allOf(isNotNull, isNotEmpty),
          reason: '${option.value} description',
        );
      }
    });

    test('omits the user/guild-only reasons', () {
      final values = iarFlatMessageReasonSelectOptions(
        l10n,
      ).map((option) => option.value).toSet();
      expect(values, isNot(contains(IarRuleReason.terrorismExtremism)));
      expect(values, isNot(contains(IarRuleReason.inappropriateProfile)));
      expect(values, isNot(contains(IarRuleReason.raidCoordination)));
    });
  });

  group('iarFlatGuildReasonSelectOptions', () {
    test('returns one option per guild reason, in list order', () {
      final options = iarFlatGuildReasonSelectOptions(l10n);
      expect(
        options.map((option) => option.value).toList(),
        orderedEquals(guildReportReasons),
      );
    });

    test('every option has a non-empty label and description', () {
      for (final option in iarFlatGuildReasonSelectOptions(l10n)) {
        expect(option.label, isNotEmpty, reason: '${option.value} label');
        expect(
          option.description,
          allOf(isNotNull, isNotEmpty),
          reason: '${option.value} description',
        );
      }
    });

    test('includes guild-only reasons', () {
      final values = iarFlatGuildReasonSelectOptions(
        l10n,
      ).map((option) => option.value).toSet();
      expect(values, contains(IarRuleReason.terrorismExtremism));
      expect(values, contains(IarRuleReason.raidCoordination));
    });
  });
}
