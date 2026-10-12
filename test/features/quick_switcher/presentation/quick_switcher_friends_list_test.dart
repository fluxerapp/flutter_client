import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_view.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/widgets/quick_switcher_friends_list.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

const String _kFriendId = '42';

class _FakeDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: <Friend>[
      Friend(
        id: _kFriendId,
        username: 'simthird',
        globalName: 'Sim Third',
        friendStatus: FriendStatus.accepted,
      ),
    ],
    activeTab: FriendsTab.all,
    searchQuery: '',
  );
}

class _FakeUserNoteViewModel extends UserNoteViewModel {
  @override
  Stream<String?> build({required String userId}) =>
      Stream<String?>.value(null);
}

List<Override> _overrides() {
  return <Override>[
    instanceRuntimeConfigOverride(),
    fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
    dmViewModelProvider.overrideWith(_FakeDmViewModel.new),
    userPresenceProvider(_kFriendId).overrideWith(
      (Ref ref) => Stream<User?>.value(
        const User(
          id: _kFriendId,
          username: 'simthird',
          discriminator: '0',
          bot: false,
          system: false,
          status: 'online',
          mobile: false,
        ),
      ),
    ),
    userNoteViewModelProvider(
      userId: _kFriendId,
    ).overrideWith(_FakeUserNoteViewModel.new),
  ];
}

class _Harness {
  _Harness()
    : router = GoRouter(
        initialLocation: '/home',
        routes: <RouteBase>[
          ShellRoute(
            builder: (_, _, Widget child) => child,
            routes: <RouteBase>[
              GoRoute(path: '/home', builder: (_, _) => const _Launcher()),
              GoRoute(path: '/elsewhere', builder: (_, _) => const _Launcher()),
            ],
          ),
        ],
      );

  final GoRouter router;
  int switcherCloses = 0;

  Widget build() {
    final colorTheme = buildDarkColorTheme();
    return ProviderScope(
      overrides: _overrides(),
      child: _HarnessScope(
        harness: this,
        child: MaterialApp.router(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}

class _HarnessScope extends InheritedWidget {
  const _HarnessScope({required this.harness, required super.child});

  final _Harness harness;

  @override
  bool updateShouldNotify(_HarnessScope oldWidget) => false;
}

class _Launcher extends StatelessWidget {
  const _Launcher();

  @override
  Widget build(BuildContext context) {
    final _Harness harness = context
        .getInheritedWidgetOfExactType<_HarnessScope>()!
        .harness;
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => unawaited(
            FluxerBottomSheet.showScrollable<void>(
              context,
              useRootNavigator: true,
              builder: (_, scrollController, close) => QuickSwitcherFriendsList(
                searchQuery: '',
                scrollController: scrollController,
                onNavigatedAway: () {
                  harness.switcherCloses++;
                  close();
                },
              ),
            ),
          ),
          child: const Text('open switcher'),
        ),
      ),
    );
  }
}

Future<void> _openFriendProfile(WidgetTester tester) async {
  await tester.tap(find.text('open switcher'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Sim Third'));
  await tester.pumpAndSettle();
}

void _dismissTopSheet(WidgetTester tester) {
  Navigator.of(
    tester.element(find.byType(UserProfileView)),
    rootNavigator: true,
  ).pop();
}

void main() {
  testWidgets('closing a friend profile returns to the friends list', (
    WidgetTester tester,
  ) async {
    final _Harness harness = _Harness();
    await tester.pumpWidget(harness.build());
    await _openFriendProfile(tester);

    expect(find.byType(UserProfileView), findsOneWidget);
    expect(find.byType(QuickSwitcherFriendsList), findsOneWidget);
    expect(harness.switcherCloses, 0);

    _dismissTopSheet(tester);
    await tester.pumpAndSettle();

    expect(find.byType(UserProfileView), findsNothing);
    expect(find.byType(QuickSwitcherFriendsList), findsOneWidget);
    expect(harness.switcherCloses, 0);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('a profile action that navigates closes the switcher', (
    WidgetTester tester,
  ) async {
    final _Harness harness = _Harness();
    await tester.pumpWidget(harness.build());
    await _openFriendProfile(tester);

    _dismissTopSheet(tester);
    harness.router.go('/elsewhere');
    await tester.pumpAndSettle();

    expect(harness.switcherCloses, 1);
    expect(find.byType(QuickSwitcherFriendsList), findsNothing);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('navigating to the current location still closes the switcher', (
    WidgetTester tester,
  ) async {
    final _Harness harness = _Harness();
    await tester.pumpWidget(harness.build());
    await _openFriendProfile(tester);

    _dismissTopSheet(tester);
    harness.router.go('/home');
    await tester.pumpAndSettle();

    expect(harness.switcherCloses, 1);
    expect(find.byType(QuickSwitcherFriendsList), findsNothing);
    await releaseTestWidgetTree(tester);
  });
}
