import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_mutual_list.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_mutuals_section.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

Widget _buildApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      friendsListProvider.overrideWith(
        (ref) => Stream<List<Friend>>.value(const <Friend>[]),
      ),
    ],
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

UserPartialResponse _buildUser({
  required String id,
  required String username,
  String? globalName,
}) {
  return UserPartialResponse(
    id: id,
    username: username,
    discriminator: '1234',
    globalName: globalName,
    avatar: null,
    avatarColor: null,
    flags: 0,
  );
}

void main() {
  group('UserProfileMutualsSection', () {
    testWidgets('renders mutual count rows', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(
          UserProfileMutualsSection(
            friends: <UserPartialResponse>[
              _buildUser(id: '1', username: 'alice'),
              _buildUser(id: '2', username: 'bob'),
            ],
            communities: const <UserProfileFullResponseMutualGuilds>[
              UserProfileFullResponseMutualGuilds(id: '10', nick: null),
            ],
            onFriendTap: (_) {},
            onCommunityTap: (_) {},
          ),
        ),
      );

      expect(find.text('Mutual Friends (2)'), findsOneWidget);
      expect(find.text('Mutual Communities (1)'), findsOneWidget);
    });

    testWidgets('opens friend list bottom sheet', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(
          UserProfileMutualsSection(
            friends: <UserPartialResponse>[
              _buildUser(id: '1', username: 'alice', globalName: 'Alice'),
            ],
            communities: const <UserProfileFullResponseMutualGuilds>[],
            onFriendTap: (_) {},
            onCommunityTap: (_) {},
          ),
        ),
      );

      await tester.tap(find.text('Mutual Friends (1)'));
      await tester.pumpAndSettle();

      expect(find.text('Mutual Friends'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('alice#1234'), findsOneWidget);
    });
  });

  group('UserProfileMutualList', () {
    testWidgets('renders friends empty state', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(
          UserProfileMutualList(
            type: UserProfileMutualListType.friends,
            friends: const <UserPartialResponse>[],
            communities: const <UserProfileFullResponseMutualGuilds>[],
            onFriendTap: (_) {},
            onCommunityTap: (_) {},
          ),
        ),
      );

      expect(find.text('No mutual friends found.'), findsOneWidget);
    });

    testWidgets('renders communities empty state', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildApp(
          UserProfileMutualList(
            type: UserProfileMutualListType.communities,
            friends: const <UserPartialResponse>[],
            communities: const <UserProfileFullResponseMutualGuilds>[],
            onFriendTap: (_) {},
            onCommunityTap: (_) {},
          ),
        ),
      );

      expect(find.text('No mutual communities found.'), findsOneWidget);
    });
  });
}
