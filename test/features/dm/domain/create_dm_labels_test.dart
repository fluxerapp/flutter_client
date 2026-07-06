import 'package:fluxer_app/features/dm/domain/create_dm_labels.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';
import 'package:test/test.dart';

void main() {
  group('createDmButtonLabel', () {
    final FluxerLocalizationsEn l10n = FluxerLocalizationsEn();

    test('uses create DM label for one friend', () {
      expect(createDmButtonLabel(l10n, 1), 'Create DM');
    });

    test('uses create group DM label for zero or many friends', () {
      expect(createDmButtonLabel(l10n, 0), 'Create group DM');
      expect(createDmButtonLabel(l10n, 2), 'Create group DM');
    });
  });
}
