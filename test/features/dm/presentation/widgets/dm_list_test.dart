// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show DmChannel, FluxerDatabase, User;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list_skeleton.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_row_timestamp.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_scroll_store_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/rendered_text_test_helpers.dart';
import '../../../../helpers/wide_layout_test_sizes.dart';

void main() {
  group('DMList loading skeleton', () {
    testWidgets('shows skeleton before initial conversations are received', (
      tester,
    ) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: const <DmConversation>[],
            hasReceivedInitialConversations: false,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(DmListSkeleton), findsOneWidget);
      expect(find.text('Friends'), findsOneWidget);
    });
  });

  group('DMList desktop', () {
    testWidgets('Friends button navigates to the DM home route', (
      tester,
    ) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final GoRouter router = GoRouter(
        initialLocation: '/channels/@me/dm-channel-1',
        routes: <RouteBase>[
          GoRoute(
            path: '/channels/@me',
            builder: (BuildContext context, GoRouterState state) {
              return const Scaffold(body: DMList());
            },
            routes: <RouteBase>[
              GoRoute(
                path: ':channelId',
                builder: (BuildContext context, GoRouterState state) {
                  return const Scaffold(body: DMList());
                },
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(conversations: const <DmConversation>[]),
          routerConfig: router,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        router.routeInformationProvider.value.uri.path,
        '/channels/@me/dm-channel-1',
      );

      await tester.tap(find.text('Friends'));
      await tester.pumpAndSettle();

      expect(router.routeInformationProvider.value.uri.path, '/channels/@me');
    });

    testWidgets('Friends row shows the pending request count', (tester) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: const <DmConversation>[],
            pendingFriendRequests: 4,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder badge = find.byType(FluxerBadge);
      expect(badge, findsOneWidget);
      expect(
        find.descendant(of: badge, matching: find.text('4')),
        findsOneWidget,
      );
      expect(tester.widget<FluxerBadge>(badge).cutoutColor, isNull);
    });
  });

  group('DMList mobile', () {
    testWidgets('shows a header divider above the mobile list', (tester) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: 'Hi there',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Messages'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('shows messages icon instead of title in compact wide peek', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(984, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final GoRouter router = GoRouter(
        initialLocation: '/channels/@me/dm-channel-1',
        routes: <RouteBase>[
          GoRoute(
            path: '/channels/@me',
            builder: (BuildContext context, GoRouterState state) {
              return const Scaffold(body: DMList());
            },
            routes: <RouteBase>[
              GoRoute(
                path: ':channelId',
                builder: (BuildContext context, GoRouterState state) {
                  return const Scaffold(body: DMList());
                },
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(conversations: const []),
          routerConfig: router,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Messages'), findsNothing);
      expect(find.byIcon(PhosphorIconsFill.chatCircle), findsOneWidget);
    });

    testWidgets('opens add friends sheet when tapping Add friends', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(overrides: _buildOverrides(conversations: const [])),
      );
      await tester.pump();

      await tester.tap(find.text('Add friends'));
      await tester.pumpAndSettle();

      expect(find.text('Add friend'), findsOneWidget);
      expect(find.text("Friend's username"), findsOneWidget);
    });

    testWidgets('Add friends badge is a capped pill cut out of the sidebar', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: const [],
            pendingFriendRequests: 120,
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder badge = find.byType(FluxerBadge);
      expect(badge, findsOneWidget);
      expect(find.text('99+'), findsOneWidget);
      expect(
        tester.widget<FluxerBadge>(badge).cutoutColor,
        buildDarkColorTheme().channelSidebarBackground,
      );
      expect(tester.getSize(badge).height, FluxerBadge.height);
      expect(tester.takeException(), isNull);
    });

    testWidgets('places the pin icon before the DM title on mobile rows', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Pinned Chat',
                lastMessage: 'Latest message',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Pinned Chat',
                lastMessageTime: _recentTime(),
              ),
            ],
            pinnedIds: {'100'},
            pinnedOrder: ['100'],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final titleRow = tester.widget<Row>(
        find.byWidgetPredicate((widget) {
          if (widget is! Row) {
            return false;
          }

          final hasTitle = widget.children.any(
            (child) => switch (child) {
              Flexible(child: final Text text) => text.data == 'Pinned Chat',
              _ => false,
            },
          );
          final hasPin = widget.children.any(
            (child) => switch (child) {
              Padding(child: final PhosphorIcon icon) =>
                icon.icon == PhosphorIconsFill.pushPin,
              _ => false,
            },
          );

          return hasTitle && hasPin;
        }),
      );

      final firstChild = titleRow.children.first;
      expect(firstChild, isA<Padding>());
      final leadingPin = (firstChild as Padding).child;
      expect(leadingPin, isA<PhosphorIcon>());
      if (leadingPin case final PhosphorIcon icon) {
        expect(icon.icon, PhosphorIconsFill.pushPin);
      } else {
        fail('Expected the leading child to be a PhosphorIcon.');
      }
    });

    testWidgets(
      'opens the quick switcher sheet from the mobile search button',
      (tester) async {
        _setMobileSurface(tester);

        await tester.pumpWidget(
          _buildTestApp(
            overrides: _buildOverrides(
              conversations: [
                DmConversation(
                  id: '100',
                  type: 1,
                  recipientId: '200',
                  recipientName: 'Monty',
                  lastMessage: 'Hi there',
                  lastMessageTime: _recentTime(),
                ),
              ],
              friendsList: const [
                Friend(
                  id: '300',
                  username: 'bob',
                  globalName: 'Bob Builder',
                  friendStatus: FriendStatus.accepted,
                  status: 'online',
                ),
              ],
            ),
          ),
        );
        await tester.pump();

        await tester.tap(_mobileSearchButton());
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));

        expect(
          find.text('Search for channels, people, or communities'),
          findsOneWidget,
        );
        expect(find.text('Search'), findsWidgets);
        expect(find.text('Friends'), findsWidgets);
      },
    );
  });

  group('DMList mobile rows', () {
    DmConversation oneToOne({
      required String id,
      required String name,
      int unreadCount = 0,
      String? lastMessageId,
      DateTime? lastMessageTime,
    }) => DmConversation(
      id: id,
      type: 1,
      recipientId: '2$id',
      recipientName: name,
      lastMessage: '',
      lastMessageTime: lastMessageTime ?? _recentTime(),
      lastMessageId: lastMessageId,
      unreadCount: unreadCount,
    );

    Finder rowSurface(String name) => find
        .ancestor(
          of: findAppText(name),
          matching: find.byType(FluxerSelectableRow),
        )
        .first;

    testWidgets('selected DM uses the subtle list selection tokens', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final colors = buildDarkColorTheme();

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            selectedChannelId: '100',
            conversations: [oneToOne(id: '100', name: 'Monty')],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final FluxerSelectableRow row = tester.widget<FluxerSelectableRow>(
        rowSurface('Monty'),
      );
      expect(row.isSelected, isTrue);
      expect(row.selectedColor, colors.listItemSelectedBg);
      expect(row.selectedBorderColor, colors.listItemSelectedBorder);
      expect(row.borderRadius, BorderRadius.circular(12));
    });

    testWidgets('rows are 50pt boxes on a 55pt pitch with 32pt avatars', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            conversations: [
              oneToOne(id: '100', name: 'Monty'),
              oneToOne(id: '101', name: 'Ada'),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder monty = find.descendant(
        of: rowSurface('Monty'),
        matching: find.byType(Container),
      );
      final Rect montyBox = tester.getRect(monty.first);
      final Rect adaBox = tester.getRect(
        find
            .descendant(of: rowSurface('Ada'), matching: find.byType(Container))
            .first,
      );
      expect(montyBox.height, 50);
      expect(adaBox.top - montyBox.top, 55);
      expect(montyBox.left, 8);
      expect(
        tester.getSize(
          find
              .descendant(
                of: rowSurface('Monty'),
                matching: find.byType(FluxerAvatar),
              )
              .first,
        ),
        const Size(32, 32),
      );
    });

    testWidgets('unread title turns bold and bright, read stays muted', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final colors = buildDarkColorTheme();

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            conversations: [
              oneToOne(id: '100', name: 'Unread', unreadCount: 2),
              oneToOne(id: '101', name: 'Read'),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final TextStyle unread = tester
          .widget<Text>(findAppText('Unread'))
          .style!;
      final TextStyle read = tester.widget<Text>(findAppText('Read')).style!;
      expect(unread.fontWeight, FontWeight.w600);
      expect(unread.color, colors.textPrimary);
      expect(read.fontWeight, FontWeight.w500);
      expect(read.color, colors.textTertiary);
    });

    testWidgets('muted rows dim the whole row including the avatar', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            mutedIds: {'100'},
            conversations: [oneToOne(id: '100', name: 'Muted')],
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Opacity opacity = tester.widget<Opacity>(
        find
            .ancestor(of: rowSurface('Muted'), matching: find.byType(Opacity))
            .first,
      );
      expect(opacity.opacity, 0.5);
      expect(
        find.descendant(
          of: find.byWidget(opacity),
          matching: find.byType(FluxerAvatar),
        ),
        findsOneWidget,
      );
    });

    testWidgets('timestamp shows only for DMs with a message', (tester) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            conversations: [
              oneToOne(id: '100', name: 'Chatty', lastMessageId: '900'),
              oneToOne(id: '101', name: 'Empty'),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: rowSurface('Chatty'),
          matching: find.byType(DmRowTimestamp),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: rowSurface('Empty'),
          matching: find.byType(DmRowTimestamp),
        ),
        findsNothing,
      );
    });

    testWidgets('group DMs show no presence dot and no member count', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            conversations: [
              DmConversation(
                id: '100',
                type: 3,
                name: 'Crew',
                recipientId: '200',
                recipientName: 'Crew',
                lastMessage: '',
                lastMessageTime: _recentTime(),
                remoteRecipientIds: const ['200', '201'],
                recipientCount: 3,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FluxerStatusIndicator), findsNothing);
      expect(findAppText('3 Members'), findsNothing);
    });

    testWidgets('row state follows its conversation when the order changes', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final FluxerDatabase db = openTestDatabase();
      addTearDown(db.close);
      final GoRouter router = _dmListRouter();
      addTearDown(router.dispose);
      final DateTime base = _recentTime();
      final List<DmConversation> first = [
        oneToOne(id: '100', name: 'Alpha', lastMessageTime: base),
        oneToOne(
          id: '101',
          name: 'Beta',
          lastMessageTime: base.subtract(const Duration(minutes: 1)),
        ),
      ];

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            conversations: first,
            database: db,
          ),
          routerConfig: router,
        ),
      );
      await tester.pumpAndSettle();
      final State betaState = tester.state(rowSurface('Beta'));
      final double betaTop = tester.getTopLeft(rowSurface('Beta')).dy;

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            conversations: [
              first[0],
              oneToOne(
                id: '101',
                name: 'Beta',
                lastMessageTime: base.add(const Duration(minutes: 1)),
              ),
            ],
            database: db,
          ),
          routerConfig: router,
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.getTopLeft(rowSurface('Beta')).dy, lessThan(betaTop));
      expect(identical(tester.state(rowSurface('Beta')), betaState), isTrue);
    });
  });

  group('DMList presence scoping', () {
    testWidgets(
      'a single recipient presence change rebuilds only that row avatar',
      (tester) async {
        _setMobileSurface(tester);

        final alicePresence = StreamController<User?>.broadcast();
        final bobPresence = StreamController<User?>.broadcast();
        addTearDown(alicePresence.close);
        addTearDown(bobPresence.close);

        await tester.pumpWidget(
          _buildTestApp(
            overrides: _buildOverrides(
              conversations: [
                DmConversation(
                  id: 'dmA',
                  type: 1,
                  recipientId: '200',
                  recipientName: 'Alice',
                  lastMessage: 'hey',
                  lastMessageAuthorId: '200',
                  lastMessageAuthorName: 'Alice',
                  lastMessageTime: _recentTime(),
                ),
                DmConversation(
                  id: 'dmB',
                  type: 1,
                  recipientId: '201',
                  recipientName: 'Bob',
                  lastMessage: 'yo',
                  lastMessageAuthorId: '201',
                  lastMessageAuthorName: 'Bob',
                  lastMessageTime: _recentTime(),
                ),
              ],
              userPresenceStreams: {
                '200': alicePresence.stream,
                '201': bobPresence.stream,
              },
            ),
          ),
        );

        alicePresence.add(_testUser(id: '200', status: 'online'));
        bobPresence.add(_testUser(id: '201', status: 'online'));
        await tester.pumpAndSettle();

        FluxerAvatar avatarFor(String name) => tester.widget<FluxerAvatar>(
          find.descendant(
            of: find
                .ancestor(of: findAppText(name), matching: find.byType(InkWell))
                .first,
            matching: find.byType(FluxerAvatar),
          ),
        );

        expect(avatarFor('Alice').status, 'online');
        expect(avatarFor('Bob').status, 'online');
        expect(avatarFor('Alice').size, 32);

        final aliceNameBefore = tester.widget<Text>(findAppText('Alice'));
        final bobNameBefore = tester.widget<Text>(findAppText('Bob'));

        alicePresence.add(_testUser(id: '200', status: 'offline'));
        bobPresence.add(_testUser(id: '201', status: 'online'));
        await tester.pumpAndSettle();

        expect(avatarFor('Alice').status, 'offline');
        expect(avatarFor('Bob').status, 'online');

        expect(
          identical(aliceNameBefore, tester.widget<Text>(findAppText('Alice'))),
          isTrue,
        );
        expect(
          identical(bobNameBefore, tester.widget<Text>(findAppText('Bob'))),
          isTrue,
        );
      },
    );
  });

  group('DMList preview', () {
    testWidgets('renders markdown preview inside IgnorePointer', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: '**Hi there**',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MessageMarkdown), findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(IgnorePointer),
          matching: find.byType(MessageMarkdown),
        ),
        findsOneWidget,
      );
    });

    testWidgets('hides preview when mode is none and shows custom status', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.none,
            recipientRows: Stream.value(const {
              '200': DmListRecipientRowData(
                customStatus: '{"text":"Playing games","emoji_animated":false}',
              ),
            }),
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: 'Hi there',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MessageMarkdown), findsNothing);
      expect(find.text('Playing games'), findsOneWidget);
    });

    testWidgets('shows preview for unread-only when conversation is unread', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            dmMessagePreviewMode: DmMessagePreviewMode.unreadOnly,
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: 'Unread preview',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageTime: _recentTime(),
                unreadCount: 2,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MessageMarkdown), findsOneWidget);
    });

    testWidgets('keeps the unread dot on the selected unread DM', (
      tester,
    ) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: [
            ..._buildOverrides(
              conversations: [
                DmConversation(
                  id: '100',
                  type: 1,
                  recipientId: '200',
                  recipientName: 'Monty',
                  lastMessage: 'Unread while hidden',
                  lastMessageAuthorId: '200',
                  lastMessageAuthorName: 'Monty',
                  lastMessageTime: _recentTime(),
                  unreadCount: 2,
                ),
              ],
            ),
            activeChannelIdProvider.overrideWithValue('100'),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ChannelUnreadIndicator), findsOneWidget);
    });

    testWidgets('unread rows turn bold and carry the mention count', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final DmChannel unreadRow = DmChannel(
        id: '100',
        type: 1,
        recipientId: '200',
        recipientCount: 1,
        recipientIds: '["200"]',
        nicksJson: '{}',
        lastMessage: 'ping',
        lastMessageTime: DateTime.utc(2026),
        unreadCount: 3,
      );

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            unreadDms: UnreadDmState(
              channels: [unreadRow],
              unreadChannelIds: const {'100'},
            ),
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: 'ping',
                lastMessageTime: _recentTime(),
                unreadCount: 3,
              ),
              DmConversation(
                id: '101',
                type: 1,
                recipientId: '201',
                recipientName: 'Quiet',
                lastMessage: 'old',
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        tester.widget<Text>(findAppText('Monty')).style?.fontWeight,
        FontWeight.w600,
      );
      expect(
        tester.widget<Text>(findAppText('Quiet')).style?.fontWeight,
        FontWeight.w500,
      );
      final Finder badge = find.byType(FluxerBadge);
      expect(badge, findsOneWidget);
      expect(
        find.descendant(of: badge, matching: find.text('3')),
        findsOneWidget,
      );
      expect(tester.widget<FluxerBadge>(badge).cutoutColor, isNull);
    });

    testWidgets('mention badge fits a desktop row at large text', (
      tester,
    ) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 1.5;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      final DmChannel unreadRow = DmChannel(
        id: '100',
        type: 1,
        recipientId: '200',
        recipientCount: 1,
        recipientIds: '["200"]',
        nicksJson: '{}',
        lastMessage: 'ping',
        lastMessageTime: DateTime.utc(2026),
        unreadCount: 12,
      );

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            unreadDms: UnreadDmState(
              channels: [unreadRow],
              unreadChannelIds: const {'100'},
            ),
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: 'ping',
                lastMessageTime: _recentTime(),
                unreadCount: 12,
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final Rect row = tester.getRect(
        find
            .ancestor(
              of: find.byType(FluxerBadge),
              matching: find.byType(FluxerSelectableRow),
            )
            .first,
      );
      final Rect badge = tester.getRect(find.byType(FluxerBadge));
      expect(badge.top, greaterThanOrEqualTo(row.top));
      expect(badge.bottom, lessThanOrEqualTo(row.bottom));
    });

    testWidgets('shows attachment fallback text', (tester) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: '',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageHasAttachments: true,
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Sent an attachment'), findsOneWidget);
    });

    testWidgets('ellipsizes long spoiled links in preview', (tester) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage:
                    '||https://example.com/very/long/spoiled/link/path||',
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(MessageMarkdown), findsOneWidget);
    });

    testWidgets('shows system message plaintext for calls', (tester) async {
      _setMobileSurface(tester);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            conversations: [
              DmConversation(
                id: '100',
                type: 1,
                recipientId: '200',
                recipientName: 'Monty',
                lastMessage: 'ignored raw content',
                lastMessageType: messageTypeCall,
                lastMessageAuthorId: '200',
                lastMessageAuthorName: 'Monty',
                lastMessageTime: _recentTime(),
              ),
            ],
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Monty started a call'), findsOneWidget);
      expect(find.textContaining('ignored raw content'), findsNothing);
    });
  });

  group('DMList scroll persistence', () {
    testWidgets('restores the list offset after the sidebar is rebuilt', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final DmListScrollStore scrollStore = DmListScrollStore();
      final GoRouter router = GoRouter(
        initialLocation: '/channels/@me',
        routes: <RouteBase>[
          GoRoute(
            path: '/channels/@me',
            builder: (BuildContext context, GoRouterState state) =>
                const Scaffold(body: DMList()),
          ),
          GoRoute(
            path: '/channels/guild',
            builder: (BuildContext context, GoRouterState state) =>
                const Scaffold(body: Text('guild sidebar')),
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(conversations: _manyConversations(40)),
            dmListScrollStoreProvider.overrideWithValue(scrollStore),
          ],
          routerConfig: router,
        ),
      );
      await tester.pumpAndSettle();
      expect(_dmListScrollOffset(tester), 0);

      await tester.drag(find.byType(ListView), const Offset(0, -400));
      await tester.pumpAndSettle();
      final double scrolledOffset = _dmListScrollOffset(tester);
      expect(scrolledOffset, greaterThan(0));

      router.go('/channels/guild');
      await tester.pumpAndSettle();
      expect(find.byType(DMList), findsNothing);
      expect(scrollStore.offset, scrolledOffset);

      router.go('/channels/@me');
      await tester.pumpAndSettle();

      expect(_dmListScrollOffset(tester), scrolledOffset);
    });

    testWidgets('clamps a stale offset to a shorter conversation list', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final DmListScrollStore scrollStore = DmListScrollStore()
        ..offset = 100000;

      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(conversations: _manyConversations(40)),
            dmListScrollStoreProvider.overrideWithValue(scrollStore),
          ],
        ),
      );
      await tester.pumpAndSettle();

      final ScrollPosition position = tester
          .state<ScrollableState>(
            find.descendant(
              of: find.byType(ListView),
              matching: find.byType(Scrollable),
            ),
          )
          .position;
      expect(position.pixels, position.maxScrollExtent);
    });

    testWidgets('opens centered on the selected conversation without a saved '
        'offset', (tester) async {
      _setMobileSurface(tester);
      final DmListScrollStore scrollStore = DmListScrollStore();

      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              conversations: _manyConversations(40),
              selectedChannelId: '1030',
            ),
            dmListScrollStoreProvider.overrideWithValue(scrollStore),
          ],
        ),
      );
      await tester.pumpAndSettle();

      final Rect list = tester.getRect(find.byType(ListView));
      expect(
        tester.getCenter(find.text('Friend 30')).dy,
        closeTo(list.center.dy, 40),
      );
    });

    testWidgets('a saved offset wins over the selected conversation', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final DmListScrollStore scrollStore = DmListScrollStore()..offset = 0;

      await tester.pumpWidget(
        _buildTestApp(
          overrides: <Override>[
            ..._buildOverrides(
              conversations: _manyConversations(40),
              selectedChannelId: '1030',
            ),
            dmListScrollStoreProvider.overrideWithValue(scrollStore),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(_dmListScrollOffset(tester), 0);
    });
  });
}

DateTime _recentTime() => DateTime(2026, 4, 2, 12);

List<DmConversation> _manyConversations(int count) {
  return <DmConversation>[
    for (int i = 0; i < count; i++)
      DmConversation(
        id: '${1000 + i}',
        type: 1,
        recipientId: '${2000 + i}',
        recipientName: 'Friend $i',
        lastMessage: 'Message $i',
        lastMessageAuthorId: '${2000 + i}',
        lastMessageAuthorName: 'Friend $i',
        lastMessageTime: _recentTime(),
      ),
  ];
}

double _dmListScrollOffset(WidgetTester tester) {
  return tester
      .state<ScrollableState>(
        find.descendant(
          of: find.byType(ListView),
          matching: find.byType(Scrollable),
        ),
      )
      .position
      .pixels;
}

Finder _mobileSearchButton() => find.byWidgetPredicate(
  (widget) =>
      widget is PhosphorIcon &&
      widget.icon == PhosphorIconsBold.magnifyingGlass,
);

void _setMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

User _testUser({required String id, required String status}) {
  return User(
    id: id,
    username: 'user$id',
    discriminator: '0001',
    bot: false,
    system: false,
    status: status,
    mobile: false,
  );
}

List<Override> _userPresenceOverrides(
  Iterable<DmConversation> conversations, {
  Map<String, Stream<User?>>? userPresenceStreams,
}) {
  final Set<String> userIds = <String>{};
  for (final DmConversation conversation in conversations) {
    if (conversation.isGroup) {
      userIds.addAll(conversation.remoteRecipientIds);
    } else if (!conversation.isPersonalNotes) {
      userIds.add(conversation.recipientId);
    }
  }
  return <Override>[
    for (final String userId in userIds)
      userPresenceProvider(userId).overrideWith(
        (Ref ref) => userPresenceStreams?[userId] ?? Stream<User?>.value(null),
      ),
  ];
}

List<Override> _buildOverrides({
  required List<DmConversation> conversations,
  List<Friend> friendsList = const [],
  Set<String> pinnedIds = const <String>{},
  List<String> pinnedOrder = const <String>[],
  Stream<Map<String, DmListRecipientRowData>>? recipientRows,
  Map<String, Stream<User?>>? userPresenceStreams,
  DmMessagePreviewMode dmMessagePreviewMode = DmMessagePreviewMode.all,
  bool hasReceivedInitialConversations = true,
  String? selectedChannelId,
  Set<String> mutedIds = const <String>{},
  FluxerDatabase? database,
  UnreadDmState unreadDms = const UnreadDmState(),
  int pendingFriendRequests = 0,
}) {
  final db = database ?? openTestDatabase();
  return [
    unreadDmChannelsProvider.overrideWith(
      () => _FakeUnreadDmChannels(unreadDms),
    ),
    fluxerDatabaseProvider.overrideWithValue(db),
    userSettingsStatusProvider.overrideWithValue(null),
    ..._userPresenceOverrides(
      conversations,
      userPresenceStreams: userPresenceStreams,
    ),
    dmListRecipientRowDataProvider.overrideWith(
      (ref) =>
          recipientRows ??
          Stream.value(const <String, DmListRecipientRowData>{}),
    ),
    appearancePreferencesProvider.overrideWith(
      () => _TestAppearancePreferences(dmMessagePreviewMode),
    ),
    currentUserIdProvider.overrideWithValue('1'),
    dmViewModelProvider.overrideWithValue(
      DmViewState(
        conversations: conversations,
        friendsList: friendsList,
        activeTab: FriendsTab.online,
        searchQuery: '',
        hasReceivedInitialConversations: hasReceivedInitialConversations,
      ),
    ),
    pinnedDmChannelIdsProvider.overrideWith((ref) => Stream.value(pinnedIds)),
    pinnedDmChannelOrderProvider.overrideWith(
      (ref) => Stream.value(pinnedOrder),
    ),
    mutedDmChannelIdsProvider.overrideWith((ref) => Stream.value(mutedIds)),
    if (selectedChannelId != null)
      activeChannelIdProvider.overrideWithValue(selectedChannelId),
    pendingFriendRequestCountProvider.overrideWith(
      (ref) => Stream.value(pendingFriendRequests),
    ),
    friendsListProvider.overrideWith((ref) => Stream.value(friendsList)),
    friendNicknameProvider.overrideWith((ref, userId) => Stream.value(null)),
    allChannelsProvider.overrideWith(
      (ref) => Stream<List<Channel>>.value(const <Channel>[]),
    ),
    guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
    favoriteChannelsProvider.overrideWith((ref) => Stream.value(const [])),
    userSettingsViewModelProvider.overrideWith(
      _VerifiedUserSettingsViewModel.new,
    ),
  ];
}

class _FakeUnreadDmChannels extends UnreadDmChannels {
  _FakeUnreadDmChannels(this._state);

  final UnreadDmState _state;

  @override
  UnreadDmState build() => _state;
}

class _TestAppearancePreferences extends AppearancePreferences {
  _TestAppearancePreferences(this._dmMessagePreviewMode);

  final DmMessagePreviewMode _dmMessagePreviewMode;

  @override
  AppearancePreferencesState build() {
    return AppearancePreferencesState(
      dmMessagePreviewMode: _dmMessagePreviewMode,
    );
  }
}

class _EmptyGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: <Guild>[]);
}

class _VerifiedUserSettingsViewModel extends UserSettingsViewModel {
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
      isProfileLoaded: true,
    );
  }
}

GoRouter _dmListRouter() => GoRouter(
  initialLocation: '/channels/@me',
  routes: <RouteBase>[
    GoRoute(
      path: '/channels/@me',
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold(body: DMList());
      },
    ),
    GoRoute(
      path: '/channels/@me/:channelId',
      builder: (BuildContext context, GoRouterState state) {
        return const Scaffold(body: DMList());
      },
    ),
  ],
);

Widget _buildTestApp({
  required List<Override> overrides,
  GoRouter? routerConfig,
}) {
  final colorTheme = buildDarkColorTheme();
  final GoRouter router = routerConfig ?? _dmListRouter();

  return ProviderScope(
    overrides: <Override>[
      fluxerRouterProvider.overrideWithValue(router),
      ...overrides,
    ],
    child: MaterialApp.router(
      localizationsDelegates: fluxerLocalizationsDelegates,
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
