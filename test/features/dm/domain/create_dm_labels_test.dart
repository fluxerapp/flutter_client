import 'package:fluxer_app/features/dm/domain/create_dm_labels.dart';
import 'package:test/test.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  group('createDmButtonLabel', () {
    final FluxerLocalizations l10n = testL10n;

    test('uses create DM label for one friend', () {
      expect(createDmButtonLabel(l10n, 1), 'Create DM');
    });

    test('uses create group DM label for zero or many friends', () {
      expect(createDmButtonLabel(l10n, 0), 'Create group DM');
      expect(createDmButtonLabel(l10n, 2), 'Create group DM');
    });
  });
}
