import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
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
import 'package:fluxer_app/features/chat/presentation/widgets/channel/channel_chat_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/shell/providers/shell_popup_overlay_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/open_test_database.dart';

const String _channelId = 'mobile-chat-channel';
const String _currentUserId = '111111111111111111';
const String _authorUserId = '222222222222222222';

void main() {
  group('mobile message surface', () {
    testWidgets('shows loading skeleton with semantics in panel layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadingState(channelId: _channelId),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsOneWidget);
      expect(
        tester.getSemantics(find.byType(MessageListSkeleton)),
        matchesSemantics(label: 'Loading messages'),
      );
      expect(
        tester.getSize(find.byType(MessageListSkeleton)).height,
        greaterThan(400),
      );
      await _disposeWidgetTree(tester);
    });

    testWidgets('renders loaded messages in panel layout', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final Message message = _message(
        id: '333333333333333333',
        content: 'Hello Hampus',
      );
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadedState(channelId: _channelId, messages: <Message>[message]),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsNothing);
      expect(find.byType(MessageItem), findsOneWidget);
      await _disposeWidgetTree(tester);
    });

    testWidgets(
      'renders messages when read state is still loading but messages arrived',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final StreamController<db.ReadState?> readStateController =
            StreamController<db.ReadState?>.broadcast();
        addTearDown(readStateController.close);

        final db.FluxerDatabase database = await _openDatabase();
        addTearDown(database.close);
        final Message message = _message(
          id: '444444444444444444',
          content: 'Visible before read state',
        );
        final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
          _loadedState(channelId: _channelId, messages: <Message>[message]),
        );

        await tester.pumpWidget(
          _surfaceApp(
            database: database,
            chatViewModel: chatViewModel,
            readStateStream: readStateController.stream,
            child: _panelMessageSurface(
              const MessageList(expectedChannelId: _channelId),
            ),
          ),
        );
        await tester.pump();
        await tester.pump();

        expect(find.byType(MessageListSkeleton), findsNothing);
        expect(find.byType(MessageItem), findsOneWidget);
        await _disposeWidgetTree(tester);
      },
    );

    testWidgets('shows skeleton until view model channel id matches panel', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final Message message = _message(
        id: '555555555555555555',
        content: 'After sync',
      );
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadedState(channelId: '', messages: <Message>[message]),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsOneWidget);
      expect(find.text('After sync'), findsNothing);

      chatViewModel.replaceState(
        _loadedState(channelId: _channelId, messages: <Message>[message]),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsNothing);
      expect(find.byType(MessageItem), findsOneWidget);
      await _disposeWidgetTree(tester);
    });

    testWidgets(
      'keeps messages visible under drawer-style transform wrapping',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final db.FluxerDatabase database = await _openDatabase();
        addTearDown(database.close);
        final Message message = _message(
          id: '666666666666666666',
          content: 'Still visible under transform',
        );
        final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
          _loadedState(channelId: _channelId, messages: <Message>[message]),
        );

        await tester.pumpWidget(
          _surfaceApp(
            database: database,
            chatViewModel: chatViewModel,
            child: Transform.translate(
              offset: const Offset(-72, 0),
              child: RepaintBoundary(
                child: _panelMessageSurface(
                  const MessageList(expectedChannelId: _channelId),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        await tester.pump();

        expect(find.byType(MessageItem), findsOneWidget);
        await _disposeWidgetTree(tester);
      },
    );

    testWidgets('shows empty state instead of perpetual skeleton after load', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final StreamController<db.ReadState?> readStateController =
          StreamController<db.ReadState?>.broadcast();
      addTearDown(readStateController.close);

      final db.FluxerDatabase database = await _openDatabase();
      addTearDown(database.close);
      final _HarnessChatViewModel chatViewModel = _HarnessChatViewModel(
        _loadedState(channelId: _channelId),
      );

      await tester.pumpWidget(
        _surfaceApp(
          database: database,
          chatViewModel: chatViewModel,
          readStateStream: readStateController.stream,
          child: _panelMessageSurface(
            const MessageList(expectedChannelId: _channelId),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageListSkeleton), findsNothing);
      expect(find.byType(Scrollable), findsNothing);
      expect(find.text('No messages yet'), findsOneWidget);
      await _disposeWidgetTree(tester);
    });
  });

  group('ChannelChatContent mobile sync', () {
    testWidgets(
      'retries switchChannel when view model channel stays mismatched',
      (WidgetTester tester) async {
        final _RetryingChatViewModel recorder = _RetryingChatViewModel();
        final ProviderContainer container = ProviderContainer(
          overrides: _contentOverrides(recorder: recorder),
        );
        addTearDown(container.dispose);

        await tester.pumpWidget(
          _contentApp(
            container: container,
            child: const ChannelChatContent(
              channelId: _channelId,
              showTopBar: false,
            ),
          ),
        );
        await tester.pump();
        await tester.pump();
        await tester.pump();

        expect(
          recorder.switchChannelCalls
              .where((String id) => id == _channelId)
              .length,
          greaterThanOrEqualTo(2),
        );
        await _disposeWidgetTree(tester);
      },
    );

    testWidgets('shows messages after content sync completes', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _RetryingChatViewModel recorder = _RetryingChatViewModel();
      final ProviderContainer container = ProviderContainer(
        overrides: _contentOverrides(recorder: recorder),
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        _contentApp(
          container: container,
          child: const ChannelChatContent(
            channelId: _channelId,
            showTopBar: false,
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageItem), findsOneWidget);
      await _disposeWidgetTree(tester);
    });
  });
}

Widget _panelMessageSurface(Widget messageList) {
  return ColoredBox(
    color: const Color(0xFF111214),
    child: Column(
      children: <Widget>[
        const SizedBox(height: 56),
        Expanded(
          child: Stack(children: <Widget>[Positioned.fill(child: messageList)]),
        ),
        const SizedBox(height: 72),
      ],
    ),
  );
}

Future<void> _disposeWidgetTree(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 1));
}

Future<db.FluxerDatabase> _openDatabase() async {
  final db.FluxerDatabase database = openTestDatabase();
  await database.channelDao.upsertChannel(
    db.ChannelsCompanion.insert(
      id: _channelId,
      guildId: '',
      name: 'dm-hampus',
      type: const Value<int>(0),
    ),
  );
  return database;
}

List<Override> _surfaceOverrides({
  required db.FluxerDatabase database,
  required _HarnessChatViewModel chatViewModel,
  Stream<db.ReadState?>? readStateStream,
  List<Override> extraOverrides = const <Override>[],
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
    messageListReadStateProvider(_channelId).overrideWith(
      (ref) => readStateStream ?? Stream<db.ReadState?>.value(null),
    ),
    maxMessageLengthProvider.overrideWithValue(2000),
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
    ...extraOverrides,
  ];
}

Widget _surfaceApp({
  required db.FluxerDatabase database,
  required _HarnessChatViewModel chatViewModel,
  required Widget child,
  Stream<db.ReadState?>? readStateStream,
  List<Override> extraOverrides = const <Override>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _surfaceOverrides(
      database: database,
      chatViewModel: chatViewModel,
      readStateStream: readStateStream,
      extraOverrides: extraOverrides,
    ),
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Scaffold(body: SizedBox(height: 700, child: child)),
      ),
    ),
  );
}

List<Override> _contentOverrides({required _RetryingChatViewModel recorder}) {
  final db.FluxerDatabase database = openTestDatabase();
  return <Override>[
    activeChannelIdProvider.overrideWithValue(_channelId),
    shellHasPopupOverlayProvider.overrideWithValue(false),
    currentRevealSideProvider.overrideWithValue(RevealSide.main),
    chatViewModelProvider.overrideWith(() => recorder),
    fluxerDatabaseProvider.overrideWithValue(database),
    wellKnownProvider.overrideWith(_FakeWellKnown.new),
    maxMessageLengthProvider.overrideWithValue(2000),
    currentUserIdProvider.overrideWithValue(_currentUserId),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    channelMessagePermissionsProvider(
      _channelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    messageListReadStateProvider(
      _channelId,
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
      ),
    ),
    chatPreferencesProvider.overrideWithValue(const ChatPreferencesState()),
    appearancePreferencesProvider.overrideWithValue(
      const AppearancePreferencesState(),
    ),
    dmViewModelProvider.overrideWithValue(
      const DmViewState(
        conversations: <DmConversation>[],
        friendsList: <Friend>[],
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: _channelId,
      ),
    ),
  ];
}

Widget _contentApp({
  required ProviderContainer container,
  required Widget child,
}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844)),
        child: Scaffold(body: child),
      ),
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

ChatViewState _loadedState({
  required String channelId,
  List<Message> messages = const <Message>[],
}) {
  return ChatViewState(
    channelId: channelId,
    messages: messages,
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );
}

Message _message({required String id, required String content}) {
  return Message(
    id: id,
    channelId: _channelId,
    authorId: _authorUserId,
    authorName: 'Hampus',
    content: content,
    timestamp: DateTime.utc(2026, 7, 25, 12),
  );
}

class _HarnessChatViewModel extends ChatViewModel {
  _HarnessChatViewModel(this._initialState);

  final ChatViewState _initialState;

  void replaceState(ChatViewState nextState) {
    state = nextState;
  }

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

class _RetryingChatViewModel extends ChatViewModel {
  final List<String> switchChannelCalls = <String>[];
  int _callCount = 0;

  @override
  ChatViewState build() {
    ref.read(chatReadViewportProvider.notifier).setActiveChannel('');
    return const ChatViewState(
      channelId: '',
      messages: <Message>[],
      replyingTo: null,
      replyMentioning: false,
      editingMessage: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: false,
      isSyncingMessages: false,
      isLoadingMore: false,
      isLoadingNewer: false,
      hasMoreMessages: false,
      hasMoreNewerMessages: false,
      errorMessage: null,
    );
  }

  @override
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {
    switchChannelCalls.add(channelId);
    _callCount += 1;
    if (_callCount == 1) {
      return;
    }
    state = _loadedState(
      channelId: channelId,
      messages: <Message>[
        _message(id: '777777777777777777', content: 'Synced hello'),
      ],
    );
  }

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

class _FakeWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    return const WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: WellKnownFluxerResponseEndpoints(
        api: '',
        apiClient: '',
        apiPublic: '',
        gateway: '',
        media: '',
        staticCdn: '',
        marketing: '',
        admin: '',
        invite: '',
        gift: '',
        webapp: '',
      ),
      captcha: WellKnownFluxerResponseCaptcha(
        provider: 'none',
        hcaptchaSiteKey: null,
        turnstileSiteKey: null,
      ),
      features: WellKnownFluxerResponseFeatures(
        voiceEnabled: false,
        stripeEnabled: false,
        selfHosted: false,
        presignedAttachmentUploads: false,
        emailsEnabled: false,
      ),
      gif: WellKnownFluxerResponseGif(
        provider: '',
        displayName: '',
        attributionRequired: false,
      ),
      sso: WellKnownFluxerResponseSso(
        enabled: false,
        enforced: false,
        displayName: null,
        redirectUri: '',
      ),
      registration: WellKnownFluxerResponseRegistration(
        mode: WellKnownFluxerResponseRegistrationModeMode.open,
        adminRegistrationUrlsEnabled: false,
      ),
      community: WellKnownFluxerResponseCommunity(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
      ),
      services: WellKnownFluxerResponseServices(
        gifEnabled: false,
        youtubeEnabled: false,
        blueskyEnabled: false,
      ),
      limits: WellKnownFluxerResponseLimits(
        version: WellKnownFluxerResponseLimitsVersionVersion.value2,
        traitDefinitions: <String>[],
        rules: <WellKnownFluxerResponseLimitsRules>[],
        defaultsHash: '',
      ),
      push: WellKnownFluxerResponsePush(publicVapidKey: null),
      appPublic: WellKnownFluxerResponseAppPublic(
        branding: WellKnownFluxerResponseAppPublicBranding(
          productName: '',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
        ),
        setup: WellKnownFluxerResponseAppPublicSetup(
          configured: true,
          adminUrl: null,
        ),
        legal: WellKnownFluxerResponseAppPublicLegal(
          termsUrl: null,
          privacyUrl: null,
        ),
        registration: WellKnownFluxerResponseAppPublicRegistration(
          collectDateOfBirth: false,
        ),
      ),
    );
  }
}
