import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';
import 'package:fluxer_app/features/shell/utils/nagbar_selection.dart';

void main() {
  group('selectVisibleNagbars', () {
    test('returns empty list when no nagbars are visible', () {
      final List<NagbarState> input = <NagbarState>[
        const NagbarState(
          type: NagbarType.unclaimedAccount,
          priority: -4,
          visible: false,
          dismissible: false,
        ),
      ];

      expect(selectVisibleNagbars(input), isEmpty);
    });

    test('sorts by priority and keeps one non-dismissible nagbar', () {
      final List<NagbarState> input = <NagbarState>[
        const NagbarState(
          type: NagbarType.emailVerification,
          priority: -3,
          visible: true,
          dismissible: false,
        ),
        const NagbarState(
          type: NagbarType.unclaimedAccount,
          priority: -4,
          visible: true,
          dismissible: false,
        ),
      ];

      final List<NagbarState> selected = selectVisibleNagbars(input);

      expect(selected, hasLength(1));
      expect(selected.first.type, NagbarType.unclaimedAccount);
    });

    test(
      'allows one dismissible nagbar in addition to one non-dismissible',
      () {
        final List<NagbarState> input = <NagbarState>[
          const NagbarState(
            type: NagbarType.unclaimedAccount,
            priority: -4,
            visible: true,
            dismissible: false,
          ),
          const NagbarState(
            type: NagbarType.premiumOnboarding,
            priority: 4,
            visible: true,
            dismissible: true,
          ),
          const NagbarState(
            type: NagbarType.giftInventory,
            priority: 5,
            visible: true,
            dismissible: true,
          ),
        ];

        final List<NagbarState> selected = selectVisibleNagbars(input);

        expect(selected, hasLength(2));
        expect(selected.first.type, NagbarType.unclaimedAccount);
        expect(selected.last.type, NagbarType.premiumOnboarding);
      },
    );
  });
}
