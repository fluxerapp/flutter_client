import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

const String _channelId = 'loading-test-channel';
const String _otherChannelId = 'loading-test-other-channel';
const String _currentUserId = '111111111111111111';

class _LoadingChatViewModel extends ChatViewModel {
  _LoadingChatViewModel(this._initialState);

  final ChatViewState _initialState;

  @override
  ChatViewState build() {
    ref
        .read(chatReadViewportProvider.notifier)
        .setActiveChannel(_initialState.channelId);
    return _initialState;
  }

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

Future<db.FluxerDatabase> _openDatabase() async {
  final db.FluxerDatabase database = openTestDatabase();
  await database.channelDao.upsertChannel(
    db.ChannelsCompanion.insert(
      id: _channelId,
      guildId: '',
      name: 'general',
      type: const Value<int>(0),
    ),
  );
  return database;
}

List<Override> _messageListOverrides({
  required db.FluxerDatabase database,
  required ChatViewModel chatViewModel,
}) {
  return <Override>[
    fluxerDatabaseProvider.overrideWithValue(database),
    chatViewModelProvider.overrideWith(() => chatViewModel),
    currentUserIdProvider.overrideWithValue(_currentUserId),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    activeGuildIdProvider.overrideWithValue(null),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: _channelId,
      ),
    ),
    dmViewModelProvider.overrideWithValue(
      const DmViewState(
        conversations: <DmConversation>[],
        friendsList: <Friend>[],
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    channelMessagePermissionsProvider(
      _channelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    channelMessagePermissionsProvider(
      _otherChannelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    messageListReadStateProvider(
      _channelId,
    ).overrideWith((ref) => Stream<db.ReadState?>.value(null)),
    messageListReadStateProvider(
      _otherChannelId,
    ).overrideWith((ref) => Stream<db.ReadState?>.value(null)),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: _currentUserId,
        username: 'tester',
        displayName: 'Tester',
        discriminator: '0',
        avatar: null,
        avatarColor: null,
        memberSince: null,
        status: 'online',
        messageDisplayCompact: false,
        developerMode: false,
        trustedDomains: <String>[],
        renderEmbeds: false,
        renderReactions: false,
        inlineAttachmentMedia: false,
      ),
    ),
    chatPreferencesProvider.overrideWithValue(const ChatPreferencesState()),
    appearancePreferencesProvider.overrideWithValue(
      const AppearancePreferencesState(),
    ),
  ];
}

Widget _messageListApp({
  required db.FluxerDatabase database,
  required ChatViewModel chatViewModel,
  required Widget body,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _messageListOverrides(
      database: database,
      chatViewModel: chatViewModel,
    ),
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: body),
    ),
  );
}

Widget _skeletonApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
      userSettingsViewModelProvider.overrideWithValue(
        const UserSettingsViewState(
          userId: 'user-1',
          username: 'tester',
          displayName: 'Tester',
          discriminator: '0',
          avatar: null,
          avatarColor: null,
          memberSince: null,
          status: 'online',
          messageDisplayCompact: false,
          developerMode: false,
          trustedDomains: <String>[],
        ),
      ),
      appearancePreferencesProvider.overrideWithValue(
        const AppearancePreferencesState(),
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
      home: Scaffold(body: child),
    ),
  );
}

ChatViewState _loadingState({required String channelId}) {
  return ChatViewState(
    channelId: channelId,
    messages: const <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: true,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: true,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );
}

Future<void> _disposeWidgetTree(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 1));
}

void main() {
  testWidgets('renders without loading spinner', (tester) async {
    await tester.pumpWidget(
      _skeletonApp(const MessageListSkeleton(channelId: 'channel-1')),
    );

    expect(find.byType(MessageListSkeleton), findsOneWidget);
    expect(find.byType(ChatLoadingSpinner), findsNothing);
  });

  testWidgets('exposes loading semantics', (tester) async {
    await tester.pumpWidget(
      _skeletonApp(const MessageListSkeleton(channelId: 'channel-1')),
    );

    expect(
      tester.getSemantics(find.byType(MessageListSkeleton)),
      matchesSemantics(label: 'Loading messages'),
    );
  });

  testWidgets('uses backgroundModifierAccent with web opacity tiers', (
    tester,
  ) async {
    await tester.pumpWidget(
      _skeletonApp(const MessageListSkeleton(channelId: 'channel-1')),
    );

    final Iterable<Opacity> opacityLayers = tester.widgetList<Opacity>(
      find.descendant(
        of: find.byType(MessageListSkeleton),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacityLayers, isNotEmpty);
    expect(
      opacityLayers.map((Opacity layer) => layer.opacity).toSet(),
      containsAll(<double>[0.35, 0.45, 0.55]),
    );
  });

  testWidgets('uses full viewport width on mobile', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      _skeletonApp(const MessageListSkeleton(channelId: 'channel-1')),
    );

    expect(tester.getSize(find.byType(MessageListSkeleton)).width, 390);
  });

  testWidgets('shows skeleton while initial messages load', (tester) async {
    final db.FluxerDatabase database = await _openDatabase();
    addTearDown(database.close);
    final _LoadingChatViewModel chatViewModel = _LoadingChatViewModel(
      _loadingState(channelId: _channelId),
    );

    await tester.pumpWidget(
      _messageListApp(
        database: database,
        chatViewModel: chatViewModel,
        body: const MessageList(expectedChannelId: _channelId),
      ),
    );
    await tester.pump();

    expect(find.byType(MessageListSkeleton), findsOneWidget);
    expect(find.byType(ChatLoadingSpinner), findsNothing);
    await _disposeWidgetTree(tester);
  });

  testWidgets('shows mismatch placeholder when panel channel is not ready', (
    tester,
  ) async {
    final db.FluxerDatabase database = await _openDatabase();
    addTearDown(database.close);
    final _LoadingChatViewModel chatViewModel = _LoadingChatViewModel(
      _loadingState(channelId: _channelId),
    );

    await tester.pumpWidget(
      _messageListApp(
        database: database,
        chatViewModel: chatViewModel,
        body: const MessageList(expectedChannelId: _otherChannelId),
      ),
    );
    await tester.pump();

    expect(find.byType(MessageListMismatchPlaceholder), findsOneWidget);
    expect(find.byType(MessageListSkeleton), findsNothing);
    expect(find.byType(ChatLoadingSpinner), findsNothing);
    await _disposeWidgetTree(tester);
  });
}
