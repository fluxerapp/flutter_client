import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_mutuals_sheet.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_loading_skeleton.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_mutual_list.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../../../helpers/test_l10n.dart';

void _useMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}

Widget _buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      friendsListProvider.overrideWith(
        (ref) => Stream<List<Friend>>.value(const <Friend>[]),
      ),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      // The loading skeleton pulses forever, so pumpAndSettle only terminates
      // with reduced motion.
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(disableAnimations: true),
        child: child!,
      ),
      home: Scaffold(body: child),
    ),
  );
}

Widget _sheetLauncher(void Function(BuildContext context) show) {
  return Builder(
    builder: (context) => ElevatedButton(
      onPressed: () => show(context),
      child: const Text('Open'),
    ),
  );
}

List<UserPartialResponse> _mutualFriends(int count) {
  return List<UserPartialResponse>.generate(
    count,
    (int index) => UserPartialResponse(
      id: '$index',
      username: 'user$index',
      discriminator: '1234',
      globalName: null,
      avatar: null,
      avatarColor: null,
      flags: 0,
    ),
  );
}

Future<void> _expectNoOverscrollHeldAboveTop(
  WidgetTester tester,
  Finder scrollView,
) async {
  final ScrollPosition position = tester
      .state<ScrollableState>(
        find.descendant(of: scrollView, matching: find.byType(Scrollable)),
      )
      .position;

  // Upward drags grow the sheet extent before they scroll the list.
  for (int attempt = 0; attempt < 3 && position.pixels <= 0; attempt++) {
    await tester.drag(scrollView, const Offset(0, -300));
    await tester.pumpAndSettle();
  }
  expect(position.pixels, greaterThan(0));

  double minPixels = position.pixels;
  void trackMinPixels() {
    minPixels = math.min(minPixels, position.pixels);
  }

  position.addListener(trackMinPixels);
  await tester.fling(scrollView, const Offset(0, 300), 5000);
  for (int frame = 0; frame < 8; frame++) {
    await tester.pump(const Duration(milliseconds: 16));
  }

  final TestGesture hold = await tester.startGesture(
    tester.getCenter(scrollView),
  );
  for (int move = 0; move < 3; move++) {
    await hold.moveBy(const Offset(0, 12));
    await tester.pump(const Duration(milliseconds: 16));
  }
  position.removeListener(trackMinPixels);
  expect(minPixels, greaterThanOrEqualTo(0));

  await hold.up();
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('profile sheet content cannot be held above the sheet top', (
    tester,
  ) async {
    // Bouncing overscroll is what opens the gap, so the clamp only shows up
    // under the iOS physics default.
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    _useMobileSurface(tester);

    try {
      await tester.pumpWidget(
        _buildTestApp(
          _sheetLauncher(
            (context) => unawaited(
              FluxerBottomSheet.showScrollable<void>(
                context,
                initialChildSize: 0.95,
                minChildSize: 0.5,
                disableTopPadding: true,
                showDragHandle: false,
                builder: (sheetContext, scrollController, close) =>
                    UserProfileLoadingSkeleton(
                      scrollController: scrollController,
                      showTopHandle: true,
                    ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await _expectNoOverscrollHeldAboveTop(
        tester,
        find.descendant(
          of: find.byType(UserProfileLoadingSkeleton),
          matching: find.byType(CustomScrollView),
        ),
      );
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });

  testWidgets('mutuals sheet content cannot be held above the sheet top', (
    tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    _useMobileSurface(tester);

    try {
      await tester.pumpWidget(
        _buildTestApp(
          _sheetLauncher(
            (context) => unawaited(
              UserProfileMutualsSheet.show(
                context,
                friends: _mutualFriends(40),
                communities: const <UserProfileFullResponseMutualGuilds>[],
                initialType: UserProfileMutualListType.friends,
                onFriendTap: (_) {},
                onCommunityTap: (_) {},
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      await _expectNoOverscrollHeldAboveTop(
        tester,
        find.ancestor(
          of: find.byType(UserProfileMutualList),
          matching: find.byType(ListView),
        ),
      );
    } finally {
      debugDefaultTargetPlatformOverride = null;
    }
  });
}
