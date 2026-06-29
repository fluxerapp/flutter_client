import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_navbar_item.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_cluster.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  group('DmNavbarItem', () {
    testWidgets('tap on avatar navigates to the DM channel route', (
      tester,
    ) async {
      final router = _buildRouter(
        home: const DmNavbarItem(
          channelId: '1000000000000000001',
          recipientId: '1000000000000000002',
          displayName: 'Alpha',
          type: 1,
        ),
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(_buildTestApp(router: router));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(DmNavbarItem));
      await tester.pumpAndSettle();

      expect(router.state.uri.path, '/channels/@me/1000000000000000001');
    });

    testWidgets('tap on unread pill navigates to the DM channel route', (
      tester,
    ) async {
      final router = _buildRouter(
        home: const DmNavbarItem(
          channelId: '1000000000000000003',
          recipientId: '1000000000000000004',
          displayName: 'Beta',
          type: 1,
        ),
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(_buildTestApp(router: router));
      await tester.pumpAndSettle();

      final itemTopLeft = tester.getTopLeft(find.byType(DmNavbarItem));
      await tester.tapAt(itemTopLeft + const Offset(2, 24));
      await tester.pumpAndSettle();

      expect(router.state.uri.path, '/channels/@me/1000000000000000003');
    });

    testWidgets('each item navigates to its own channel after reorder', (
      tester,
    ) async {
      final router = _buildRouter(
        home: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DmNavbarItem(
              key: ValueKey('dm-first'),
              channelId: '1000000000000000005',
              recipientId: '1000000000000000006',
              displayName: 'First',
              type: 1,
            ),
            DmNavbarItem(
              key: ValueKey('dm-second'),
              channelId: '1000000000000000007',
              recipientId: '1000000000000000008',
              displayName: 'Second',
              type: 1,
            ),
          ],
        ),
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(_buildTestApp(router: router));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const ValueKey('dm-second')));
      await tester.pumpAndSettle();
      expect(router.state.uri.path, '/channels/@me/1000000000000000007');

      router.go('/test');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const ValueKey('dm-first')));
      await tester.pumpAndSettle();
      expect(router.state.uri.path, '/channels/@me/1000000000000000005');
    });

    testWidgets('group DM without uploaded icon renders member cluster', (
      tester,
    ) async {
      final router = _buildRouter(
        home: const DmNavbarItem(
          channelId: '1000000000000000010',
          recipientId: '1000000000000000011',
          displayName: 'Group',
          type: 3,
        ),
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          router: router,
          dmViewState: DmViewState(
            conversations: [
              DmConversation(
                id: '1000000000000000010',
                type: 3,
                recipientId: '1000000000000000011',
                recipientName: 'Group',
                lastMessage: '',
                lastMessageTime: DateTime.fromMillisecondsSinceEpoch(0),
                groupMembers: const <GroupMemberInfo>[
                  GroupMemberInfo(id: '1000000000000000011', name: 'Alpha'),
                  GroupMemberInfo(id: '1000000000000000012', name: 'Beta'),
                  GroupMemberInfo(id: '1000000000000000013', name: 'Gamma'),
                ],
              ),
            ],
            friendsList: [],
            activeTab: FriendsTab.online,
            searchQuery: '',
          ),
        ),
      );

      final cluster = tester.widget<FluxerAvatarCluster>(
        find.byType(FluxerAvatarCluster),
      );
      expect(cluster.iconUrl, isNull);
      expect(cluster.members.map((member) => member.userId), [
        '1000000000000000011',
        '1000000000000000012',
        '1000000000000000013',
      ]);
    });
  });
}

GoRouter _buildRouter({required Widget home}) {
  return GoRouter(
    initialLocation: '/test',
    routes: [
      GoRoute(
        path: '/test',
        builder: (context, state) => Scaffold(body: Center(child: home)),
      ),
      GoRoute(
        path: '/channels/@me',
        builder: (context, state) => const SizedBox.shrink(),
        routes: [
          GoRoute(
            path: ':channelId',
            builder: (context, state) => const SizedBox.shrink(),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTestApp({required GoRouter router, DmViewState? dmViewState}) {
  final colorTheme = buildDarkColorTheme();
  final overrides = <Override>[
    fluxerRouterProvider.overrideWithValue(router),
    currentUserIdProvider.overrideWithValue('1'),
    mutedDmChannelIdsProvider.overrideWith(
      (ref) => Stream.value(const <String>{}),
    ),
    friendNicknameProvider.overrideWith((ref, userId) => Stream.value(null)),
    userPresenceProvider(
      '1000000000000000002',
    ).overrideWith((ref) => Stream.value(null)),
    userPresenceProvider(
      '1000000000000000004',
    ).overrideWith((ref) => Stream.value(null)),
    userPresenceProvider(
      '1000000000000000006',
    ).overrideWith((ref) => Stream.value(null)),
    userPresenceProvider(
      '1000000000000000008',
    ).overrideWith((ref) => Stream.value(null)),
    dmViewModelProvider.overrideWithValue(
      dmViewState ??
          const DmViewState(
            conversations: [],
            friendsList: [],
            activeTab: FriendsTab.online,
            searchQuery: '',
          ),
    ),
    userSettingsViewModelProvider.overrideWith(_TestUserSettingsViewModel.new),
    matureContentGateReasonProvider(
      '1000000000000000001',
    ).overrideWith((ref) => MatureContentGateReason.none),
    matureContentGateReasonProvider(
      '1000000000000000003',
    ).overrideWith((ref) => MatureContentGateReason.none),
    matureContentGateReasonProvider(
      '1000000000000000005',
    ).overrideWith((ref) => MatureContentGateReason.none),
    matureContentGateReasonProvider(
      '1000000000000000007',
    ).overrideWith((ref) => MatureContentGateReason.none),
    unreadDmChannelsProvider.overrideWith(
      () => _FakeUnreadDmChannels(
        const UnreadDmState(
          unreadChannelIds: {
            '1000000000000000001',
            '1000000000000000003',
            '1000000000000000005',
            '1000000000000000007',
          },
        ),
      ),
    ),
  ];

  return ProviderScope(
    overrides: overrides,
    child: MaterialApp.router(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      routerConfig: router,
    ),
  );
}

class _TestUserSettingsViewModel extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() {
    return const UserSettingsViewState(
      userId: '1',
      username: 'user',
      displayName: 'user',
      discriminator: '0001',
      avatar: null,
      avatarColor: null,
      memberSince: null,
      status: 'online',
      messageDisplayCompact: false,
      developerMode: false,
      trustedDomains: <String>[],
      email: 'user@example.com',
      verified: true,
    );
  }
}

class _FakeUnreadDmChannels extends UnreadDmChannels {
  _FakeUnreadDmChannels(this._state);

  final UnreadDmState _state;

  @override
  UnreadDmState build() => _state;
}
