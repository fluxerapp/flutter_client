import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';

void main() {
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

  group('DMList presence scoping', () {
    testWidgets(
      'a single recipient presence change rebuilds only that row avatar',
      (tester) async {
        _setMobileSurface(tester);

        final presence =
            StreamController<Map<String, DmListRecipientRowData>>.broadcast();
        addTearDown(presence.close);

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
              recipientRows: presence.stream,
            ),
          ),
        );

        presence.add(const {
          '200': DmListRecipientRowData(status: 'online'),
          '201': DmListRecipientRowData(status: 'online'),
        });
        await tester.pumpAndSettle();

        FluxerAvatar avatarFor(String name) => tester.widget<FluxerAvatar>(
          find.descendant(
            of: find
                .ancestor(of: find.text(name), matching: find.byType(InkWell))
                .first,
            matching: find.byType(FluxerAvatar),
          ),
        );

        expect(avatarFor('Alice').status, 'online');
        expect(avatarFor('Bob').status, 'online');

        // Sibling widgets that MUST be reused (not recreated) when only
        // Alice's presence changes — proof the parent list did not rebuild.
        final aliceNameBefore = tester.widget<Text>(find.text('Alice'));
        final bobNameBefore = tester.widget<Text>(find.text('Bob'));

        presence.add(const {
          '200': DmListRecipientRowData(status: 'offline'),
          '201': DmListRecipientRowData(status: 'online'),
        });
        await tester.pumpAndSettle();

        // Correctness: only Alice's avatar status flipped.
        expect(avatarFor('Alice').status, 'offline');
        expect(avatarFor('Bob').status, 'online');

        // Scoping: a list-level presence watch would recreate every row
        // widget and fail these identity checks.
        expect(
          identical(aliceNameBefore, tester.widget<Text>(find.text('Alice'))),
          isTrue,
        );
        expect(
          identical(bobNameBefore, tester.widget<Text>(find.text('Bob'))),
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
                status: 'online',
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
}

DateTime _recentTime() => DateTime(2026, 4, 2, 12);

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

List<Override> _buildOverrides({
  required List<DmConversation> conversations,
  List<Friend> friendsList = const [],
  Set<String> pinnedIds = const <String>{},
  List<String> pinnedOrder = const <String>[],
  Stream<Map<String, DmListRecipientRowData>>? recipientRows,
  DmMessagePreviewMode dmMessagePreviewMode = DmMessagePreviewMode.all,
}) {
  final db = openTestDatabase();
  return [
    fluxerDatabaseProvider.overrideWithValue(db),
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
      ),
    ),
    pinnedDmChannelIdsProvider.overrideWith((ref) => Stream.value(pinnedIds)),
    pinnedDmChannelOrderProvider.overrideWith(
      (ref) => Stream.value(pinnedOrder),
    ),
    mutedDmChannelIdsProvider.overrideWith(
      (ref) => Stream.value(const <String>{}),
    ),
    pendingFriendRequestCountProvider.overrideWith((ref) => Stream.value(0)),
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
    );
  }
}

Widget _buildTestApp({required List<Override> overrides}) {
  final colorTheme = buildDarkColorTheme();

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
      routerConfig: GoRouter(
        initialLocation: '/channels/@me',
        routes: [
          GoRoute(
            path: '/channels/@me',
            builder: (context, state) => const Scaffold(body: DMList()),
          ),
          GoRoute(
            path: '/channels/@me/:channelId',
            builder: (context, state) => const Scaffold(body: DMList()),
          ),
        ],
      ),
    ),
  );
}
