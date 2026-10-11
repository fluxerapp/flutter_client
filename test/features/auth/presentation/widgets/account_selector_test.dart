import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_row.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_selector.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

class _PendingSwitch extends AccountManager {
  @override
  AccountManagerState build() {
    return const AccountManagerState(
      accounts: <StoredAccount>[
        StoredAccount(
          userId: 'user-1',
          isValid: true,
          username: 'one',
          mediaBaseUrl: 'https://fluxerusercontent.com',
        ),
        StoredAccount(
          userId: 'user-2',
          isValid: true,
          username: 'two',
          mediaBaseUrl: 'https://fluxerusercontent.com',
        ),
      ],
      isSwitching: false,
      isSwitchPending: true,
    );
  }
}

void main() {
  testWidgets('a pending switch dims the list and ignores taps', (
    tester,
  ) async {
    final List<String> selected = <String>[];
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [accountManagerProvider.overrideWith(_PendingSwitch.new)],
        child: Scaffold(
          body: AccountSelector(
            currentUserId: 'user-1',
            onSelectAccount: (StoredAccount account) =>
                selected.add(account.userId),
            onAddAccount: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(AccountRow).last, warnIfMissed: false);
    await tester.pump();

    expect(selected, isEmpty);
    expect(
      tester
          .widget<AnimatedOpacity>(
            find.ancestor(
              of: find.byType(AccountRow).first,
              matching: find.byType(AnimatedOpacity),
            ),
          )
          .opacity,
      0.5,
    );
  });
}
