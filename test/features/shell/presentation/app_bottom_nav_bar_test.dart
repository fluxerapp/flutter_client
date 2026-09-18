import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/app_bottom_nav_bar.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

const Size _kCompactWideSize = Size(984, 800);
const Size _kPhoneSize = Size(390, 844);

List<Override> _navOverrides() {
  return <Override>[
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: 'u1',
        username: 'testuser',
        displayName: 'Test User',
        discriminator: '0001',
        avatar: null,
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: <String>[],
      ),
    ),
    userPresenceProvider(
      'u1',
    ).overrideWith((Ref ref) => Stream<User?>.value(null)),
  ];
}

Future<({double peekWidth, Size barSize, Rect home, Rect you, Rect divider})>
_pumpNav(
  WidgetTester tester, {
  required Size size,
  bool constrainToPeekWidth = false,
}) async {
  await tester.binding.setSurfaceSize(size);
  addTearDown(() => tester.binding.setSurfaceSize(null));

  late double peekWidth;
  await tester.pumpWidget(
    pumpFluxerApp(
      child: MediaQuery(
        data: MediaQueryData(size: size),
        child: Builder(
          builder: (BuildContext context) {
            peekWidth = mobileDrawerPeekWidth(context);
            final Widget nav = Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(height: 1, color: context.colors.borderColor),
                AppBottomNavBar(currentIndex: 0, onBranchSelected: (_) {}),
              ],
            );
            return Scaffold(
              body: const SizedBox.expand(),
              bottomNavigationBar: constrainToPeekWidth
                  ? Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: SizedBox(width: peekWidth, child: nav),
                    )
                  : nav,
            );
          },
        ),
      ),
      overrides: _navOverrides(),
    ),
  );
  await tester.pump();
  return (
    peekWidth: peekWidth,
    barSize: tester.getSize(find.byType(AppBottomNavBar)),
    home: tester.getRect(find.text(testL10n.navHome)),
    you: tester.getRect(find.text(testL10n.navYou)),
    divider: tester.getRect(find.byType(Divider)),
  );
}

void main() {
  testWidgets(
    'compact-wide bar stays full width with items on the start side',
    (WidgetTester tester) async {
      final (:peekWidth, :barSize, :home, :you, :divider) = await _pumpNav(
        tester,
        size: _kCompactWideSize,
      );

      expect(barSize.width, _kCompactWideSize.width);
      expect(divider.width, _kCompactWideSize.width);
      expect(home.left, lessThan(peekWidth / 3));
      expect(you.right, lessThanOrEqualTo(peekWidth + 0.5));
      expect(you.right, lessThan(_kCompactWideSize.width / 2));
    },
  );

  testWidgets('compact-wide items do not jump when the drawer peeks', (
    WidgetTester tester,
  ) async {
    final full = await _pumpNav(tester, size: _kCompactWideSize);
    final peeked = await _pumpNav(
      tester,
      size: _kCompactWideSize,
      constrainToPeekWidth: true,
    );

    expect(peeked.home.left, moreOrLessEquals(full.home.left, epsilon: 0.5));
    expect(peeked.you.right, moreOrLessEquals(full.you.right, epsilon: 0.5));
    expect(tester.takeException(), isNull);
  });

  testWidgets('phone items still span the full bottom bar', (
    WidgetTester tester,
  ) async {
    final (:you, peekWidth: _, barSize: _, home: _, divider: _) =
        await _pumpNav(tester, size: _kPhoneSize);

    expect(you.right, greaterThan(_kPhoneSize.width * 0.7));
  });
}
