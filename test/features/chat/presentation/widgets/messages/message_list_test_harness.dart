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
import 'package:fluxer_app/features/chat/domain/pagination_pump_policy.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_viewport.dart';
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
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/pump_fluxer_app.dart';
import '../../../../../helpers/test_l10n.dart';

const String messageListChannelId = 'message-list-anchor-channel';
const String messageListCurrentUserId = '111111111111111111';
const String messageListAuthorId = '222222222222222222';

String snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

String messageListContentFor({
  required String id,
  required int index,
  required String olderId,
  required String ackId,
  required String firstUnreadId,
  required String newerId,
  required String newestLoadedId,
}) {
  if (id == olderId) {
    return 'older message before ack';
  }
  if (id == ackId) {
    return 'ack boundary message';
  }
  if (id == firstUnreadId) {
    return 'first unread anchor target';
  }
  if (id == newerId) {
    return 'newer in-window message';
  }
  if (id == newestLoadedId) {
    return 'newest loaded message';
  }
  return 'window message $index';
}

Message harnessMessage({
  required String id,
  required String content,
  required DateTime timestamp,
  String authorId = messageListAuthorId,
  List<Attachment> attachments = const <Attachment>[],
}) {
  return Message(
    id: id,
    channelId: messageListChannelId,
    authorId: authorId,
    authorName: 'Webhook',
    webhookId: 'message-list-webhook',
    content: content,
    timestamp: timestamp,
    attachments: attachments,
  );
}

Finder messageListScrollable() {
  return find.descendant(
    of: find.byType(MessageList),
    matching: find.byType(Scrollable),
  );
}

Finder messageItemFor(String id) {
  return find.byWidgetPredicate(
    (Widget widget) => widget is MessageItem && widget.message.id == id,
    description: 'MessageItem for message id $id',
  );
}

ScrollPosition messageListScrollPosition(WidgetTester tester) {
  return tester.state<ScrollableState>(messageListScrollable()).position;
}

double messageListTrailingDistance(ScrollPosition position) {
  return (position.maxScrollExtent -
          position.pixels -
          WideComposerLayout.mobileMessageListTrailingInset)
      .clamp(0.0, double.infinity);
}

Finder offstageMessageList() => find.byType(MessageList, skipOffstage: false);

ScrollPosition offstageMessageListPosition(WidgetTester tester) {
  return tester
      .state<ScrollableState>(
        find.descendant(
          of: offstageMessageList(),
          matching: find.byType(Scrollable, skipOffstage: false),
        ),
      )
      .position;
}

Future<void> pumpMessageJump(WidgetTester tester) async {
  await pumpFluxerFrames(tester);
}

Future<void> pumpScrollToBottom(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}

Future<void> disposeMessageList(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 1));
}

int messageListAnchorEpoch(WidgetTester tester) {
  final MessageListViewport viewport = tester.widget<MessageListViewport>(
    find.byType(MessageListViewport),
  );
  return viewport.anchorEpoch;
}

/// Scroll offset at which the oldest LOADED row tops the viewport: the min
/// extent plus whatever skeleton filler stands in for unloaded history.
double messageListOldestRowOffset(WidgetTester tester) {
  final MessageListViewport viewport = tester.widget<MessageListViewport>(
    find.byType(MessageListViewport),
  );
  return messageListScrollPosition(tester).minScrollExtent +
      viewport.leadingFillerExtent;
}

class AroundAckMessageListHarness {
  AroundAckMessageListHarness({
    required this.database,
    required this.chatViewModel,
    required this.messages,
    required this.olderReadId,
    required this.ackId,
    required this.firstUnreadId,
    required this.newestLoadedId,
  });

  final db.FluxerDatabase database;
  final InstrumentedChatViewModel chatViewModel;
  final List<Message> messages;
  final String olderReadId;
  final String ackId;
  final String firstUnreadId;
  final String newestLoadedId;

  String get oldestLoadedId => messages.first.id;

  String get latestReplacementNewestId =>
      chatViewModel.latestReplacementNewestIdValue;

  void appendNewerMessages({
    required int count,
    String authorId = messageListAuthorId,
    MessagesOrigin origin = MessagesOrigin.newerPage,
  }) {
    final List<Message> next = List<Message>.of(
      chatViewModel.testState.messages,
    );
    final DateTime lastTimestamp = next.last.timestamp;
    for (int index = 0; index < count; index += 1) {
      final DateTime timestamp = lastTimestamp.add(
        Duration(minutes: index + 1),
      );
      next.add(
        harnessMessage(
          authorId: authorId,
          id: snowflakeForUtc(timestamp),
          content: 'appended newer message $index',
          timestamp: timestamp,
        ),
      );
    }
    chatViewModel.testState = chatViewModel.testState.copyWith(
      write: (messages: next, origin: origin),
    );
  }

  String appendRealtimeMessage({required bool acknowledgedByGateway}) {
    final List<Message> next = List<Message>.of(
      chatViewModel.testState.messages,
    );
    final DateTime timestamp = next.last.timestamp.add(
      const Duration(minutes: 1),
    );
    final String id = snowflakeForUtc(timestamp);
    next.add(
      harnessMessage(id: id, content: 'realtime message', timestamp: timestamp),
    );
    chatViewModel.testState = chatViewModel.testState.copyWith(
      write: (messages: next, origin: MessagesOrigin.liveCreate),
      pendingAutoAckMessageId: acknowledgedByGateway ? id : null,
    );
    return id;
  }

  String appendTallNewerMessage({int lines = 18}) {
    final List<Message> next = List<Message>.of(
      chatViewModel.testState.messages,
    );
    final DateTime timestamp = next.last.timestamp.add(
      const Duration(minutes: 1),
    );
    final String id = snowflakeForUtc(timestamp);
    final String content = List<String>.generate(
      lines,
      (int i) => 'tall line $i of the newest message',
    ).join('\n');
    next.add(harnessMessage(id: id, content: content, timestamp: timestamp));
    chatViewModel.testState = chatViewModel.testState.copyWith(
      write: (messages: next, origin: MessagesOrigin.liveCreate),
    );
    return id;
  }

  void prependOlderMessages({required int count}) {
    final List<Message> next = List<Message>.of(
      chatViewModel.testState.messages,
    );
    final DateTime firstTimestamp = next.first.timestamp;
    final List<Message> older = List<Message>.generate(count, (int index) {
      final DateTime timestamp = firstTimestamp.subtract(
        Duration(minutes: count - index),
      );
      return harnessMessage(
        id: snowflakeForUtc(timestamp),
        content: 'prepended older message $index',
        timestamp: timestamp,
      );
    });
    next.insertAll(0, older);
    chatViewModel.testState = chatViewModel.testState.copyWith(
      write: (messages: next, origin: MessagesOrigin.olderPage),
    );
  }
}

Future<AroundAckMessageListHarness> createAroundAckMessageListHarness({
  required int ackIndex,
  int messageCount = 50,
  bool hasMoreNewerMessages = true,
  bool readThroughNewest = false,
  String? newestAuthorId,
  bool startLoading = false,
  bool retainMessagesWhileLoading = false,
  int firstUnreadLines = 1,
}) async {
  assert(ackIndex > 0, 'ackIndex must leave one older message');
  assert(ackIndex < messageCount - 1, 'ackIndex must leave one newer message');
  final DateTime base = DateTime.utc(2026, 7, 4, 12);
  final List<String> ids = List<String>.generate(
    messageCount,
    (int index) => snowflakeForUtc(base.add(Duration(minutes: index))),
  );
  final String olderReadId = ids[ackIndex - 1];
  final String ackId = ids[ackIndex];
  final String firstUnreadId = ids[ackIndex + 1];
  final String newerId =
      ids[ackIndex + 2 < ids.length ? ackIndex + 2 : ackIndex + 1];
  final String newestLoadedId = ids.last;
  final List<Message> messages = <Message>[
    for (int index = 0; index < ids.length; index += 1)
      harnessMessage(
        id: ids[index],
        authorId: index == ids.length - 1
            ? newestAuthorId ?? messageListAuthorId
            : messageListAuthorId,
        content: ids[index] == firstUnreadId && firstUnreadLines > 1
            ? List<String>.generate(
                firstUnreadLines,
                (int line) => 'tall unread line $line',
              ).join('\n')
            : messageListContentFor(
                id: ids[index],
                index: index,
                olderId: olderReadId,
                ackId: ackId,
                firstUnreadId: firstUnreadId,
                newerId: newerId,
                newestLoadedId: newestLoadedId,
              ),
        timestamp: base.add(Duration(minutes: index)),
      ),
  ];
  final db.FluxerDatabase database = openTestDatabase();
  await database.readStateDao.upsertReadState(
    db.ReadStatesCompanion(
      channelId: const Value<String>(messageListChannelId),
      lastMessageId: Value<String?>(readThroughNewest ? newestLoadedId : ackId),
    ),
  );
  final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
    ChatViewState(
      channelId: messageListChannelId,
      messages: startLoading && !retainMessagesWhileLoading
          ? const <Message>[]
          : messages,
      replyingTo: null,
      replyMentioning: false,
      editingMessage: null,
      messageText: '',
      scrollToBottomSignal: 0,
      isLoading: startLoading,
      isSyncingMessages: false,
      isLoadingMore: false,
      isLoadingNewer: false,
      hasMoreMessages: true,
      hasMoreNewerMessages: hasMoreNewerMessages,
      errorMessage: null,
    ),
  );
  return AroundAckMessageListHarness(
    database: database,
    chatViewModel: chatViewModel,
    messages: messages,
    olderReadId: olderReadId,
    ackId: ackId,
    firstUnreadId: firstUnreadId,
    newestLoadedId: newestLoadedId,
  );
}

Future<AroundAckMessageListHarness> createBottomMessageListHarness({
  int messageCount = 80,
  bool hasMoreNewerMessages = false,
  String? newestAuthorId,
}) {
  assert(messageCount >= 3, 'messageCount must leave loaded jump targets');
  return createAroundAckMessageListHarness(
    ackIndex: messageCount - 2,
    messageCount: messageCount,
    hasMoreNewerMessages: hasMoreNewerMessages,
    readThroughNewest: true,
    newestAuthorId: newestAuthorId,
  );
}

Widget messageListApp({
  required db.FluxerDatabase database,
  required InstrumentedChatViewModel chatViewModel,
  Set<String> blockedUserIds = const <String>{},
  Widget body = const MessageList(expectedChannelId: messageListChannelId),
  List<Override> overrides = const <Override>[],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      ...messageListOverrides(
        database: database,
        chatViewModel: chatViewModel,
        blockedUserIds: blockedUserIds,
      ),
      ...overrides,
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
      home: Scaffold(body: body),
    ),
  );
}

String centerVisibleMessageItemId(WidgetTester tester) {
  final Rect viewport = tester.getRect(messageListScrollable());
  final double centerY = viewport.center.dy;
  String? bestId;
  double? bestDistance;
  for (final MessageItem item in tester.widgetList<MessageItem>(
    find.byType(MessageItem),
  )) {
    final Finder finder = messageItemFor(item.message.id);
    final Rect rect = tester.getRect(finder);
    if (rect.bottom <= viewport.top || rect.top >= viewport.bottom) {
      continue;
    }
    final double distance = (rect.center.dy - centerY).abs();
    if (bestDistance == null || distance < bestDistance) {
      bestDistance = distance;
      bestId = item.message.id;
    }
  }
  final String? id = bestId;
  if (id == null) {
    throw TestFailure('Expected at least one visible MessageItem in $viewport');
  }
  return id;
}

class RevealToggleHost extends StatefulWidget {
  const RevealToggleHost({super.key, this.initialVisible = true});

  final bool initialVisible;

  @override
  State<RevealToggleHost> createState() => RevealToggleHostState();
}

class RevealToggleHostState extends State<RevealToggleHost> {
  late bool _visible = widget.initialVisible;

  void setVisible({required bool visible}) {
    setState(() {
      _visible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !_visible,
      child: TickerMode(
        enabled: _visible,
        child: MessageList(
          expectedChannelId: messageListChannelId,
          visible: _visible,
        ),
      ),
    );
  }
}

RevealToggleHostState revealHostState(WidgetTester tester) =>
    tester.state<RevealToggleHostState>(find.byType(RevealToggleHost));

List<Override> messageListOverrides({
  required db.FluxerDatabase database,
  required InstrumentedChatViewModel chatViewModel,
  required Set<String> blockedUserIds,
}) {
  return <Override>[
    fluxerDatabaseProvider.overrideWithValue(database),
    chatViewModelProvider.overrideWith(() => chatViewModel),
    currentUserIdProvider.overrideWithValue(messageListCurrentUserId),
    blockedUserIdsProvider.overrideWithValue(blockedUserIds),
    activeGuildIdProvider.overrideWithValue(null),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: messageListChannelId,
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
      messageListChannelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: messageListCurrentUserId,
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

class InstrumentedChatViewModel extends ChatViewModel {
  InstrumentedChatViewModel(
    this._initialState, {
    this.enableTrimToNewestWindow = false,
  });

  final ChatViewState _initialState;
  final bool enableTrimToNewestWindow;
  int loadNewerCallCount = 0;
  int trimAroundVisibleCallCount = 0;
  final List<bool> userScrollActiveLog = <bool>[];
  String? _latestReplacementNewestId;

  @override
  ChatViewState build() {
    ref
        .read(chatReadViewportProvider.notifier)
        .setActiveChannel(_initialState.channelId);
    return _initialState;
  }

  ChatViewState get testState => state;

  set testState(ChatViewState nextState) {
    state = nextState;
  }

  String get latestReplacementNewestIdValue {
    final String? id = _latestReplacementNewestId;
    if (id == null) {
      throw StateError('jumpToLatestMessages has not replaced the window yet');
    }
    return id;
  }

  List<Message> latestReplacementMessages() {
    const int latestWindowCount = 30;
    final DateTime firstTimestamp = state.messages.isEmpty
        ? DateTime.utc(2026, 7, 5, 12)
        : state.messages.last.timestamp.add(const Duration(hours: 1));
    return <Message>[
      for (int index = 0; index < latestWindowCount; index += 1)
        harnessMessage(
          id: snowflakeForUtc(firstTimestamp.add(Duration(minutes: index))),
          content: index == latestWindowCount - 1
              ? 'latest replacement newest message'
              : 'latest replacement message $index',
          timestamp: firstTimestamp.add(Duration(minutes: index)),
        ),
    ];
  }

  PageLoadResult stubPageResult({
    required PaginationEdge edge,
    required PageLoadStatus status,
    required String? requestCursor,
    String? installedBoundary,
    bool? hasMoreAtEdge,
  }) => PageLoadResult(
    edge: edge,
    channelId: state.channelId,
    windowEpoch: state.windowEpoch,
    requestCursor: requestCursor,
    installedBoundary: installedBoundary,
    status: status,
    hasMoreAtEdge:
        hasMoreAtEdge ??
        (edge == PaginationEdge.older
            ? state.hasMoreMessages
            : state.hasMoreNewerMessages),
  );

  String? requestCursorFor(PaginationEdge edge) => state.messages.isEmpty
      ? null
      : (edge == PaginationEdge.older
            ? state.messages.first.id
            : state.messages.last.id);

  @override
  Future<PageLoadResult> loadNewer() async {
    loadNewerCallCount += 1;
    return stubPageResult(
      edge: PaginationEdge.newer,
      status: PageLoadStatus.empty,
      requestCursor: requestCursorFor(PaginationEdge.newer),
    );
  }

  @override
  Future<PageLoadResult> loadMore() async => stubPageResult(
    edge: PaginationEdge.older,
    status: PageLoadStatus.empty,
    requestCursor: requestCursorFor(PaginationEdge.older),
  );

  @override
  Future<void> ackCurrentChannel({bool force = false}) async {}

  @override
  Future<void> markCurrentChannelRead() async {}

  @override
  Future<void> jumpToFirstUnread() async {}

  @override
  Future<bool> jumpToLatestMessages() async {
    final List<Message> latestMessages = latestReplacementMessages();
    _latestReplacementNewestId = latestMessages.last.id;
    state = state.copyWith(
      write: (messages: latestMessages, origin: MessagesOrigin.windowSwap),
      hasMoreNewerMessages: false,
    );
    scrollToBottom();
    return true;
  }

  @override
  void trimToNewestWindow() {
    if (!enableTrimToNewestWindow) {
      return;
    }
    super.trimToNewestWindow();
  }

  @override
  void trimAroundVisible(String visibleMessageId) {
    trimAroundVisibleCallCount += 1;
    super.trimAroundVisible(visibleMessageId);
  }

  @override
  void setUserScrollActive({required String channelId, required bool active}) {
    userScrollActiveLog.add(active);
    super.setUserScrollActive(channelId: channelId, active: active);
  }

  @override
  void clearCurrentManualUnread() {}

  @override
  void clearStickyUnreadAfterBuildForCurrentChannel() {}
}

class PagingInstrumentedChatViewModel extends InstrumentedChatViewModel {
  PagingInstrumentedChatViewModel(
    super._initialState, {
    required List<List<Message>> newerPages,
    super.enableTrimToNewestWindow,
  }) : _newerPages = newerPages.map(List<Message>.from).toList();

  final List<List<Message>> _newerPages;

  @override
  Future<PageLoadResult> loadNewer() async {
    loadNewerCallCount += 1;
    final String? requestCursor = requestCursorFor(PaginationEdge.newer);
    if (_newerPages.isEmpty) {
      return stubPageResult(
        edge: PaginationEdge.newer,
        status: PageLoadStatus.empty,
        requestCursor: requestCursor,
      );
    }
    final List<Message> page = _newerPages.removeAt(0);
    state = state.copyWith(
      write: (
        messages: <Message>[...state.messages, ...page],
        origin: MessagesOrigin.newerPage,
      ),
      hasMoreNewerMessages: _newerPages.isNotEmpty,
      isLoadingNewer: false,
    );
    return stubPageResult(
      edge: PaginationEdge.newer,
      status: PageLoadStatus.applied,
      requestCursor: requestCursor,
      installedBoundary: page.last.id,
      hasMoreAtEdge: _newerPages.isNotEmpty,
    );
  }
}

final DateTime messageListSeedBase = DateTime.utc(2026, 7, 4, 12);

List<Message> seedMessages(int count) => <Message>[
  for (int index = 0; index < count; index += 1)
    harnessMessage(
      id: snowflakeForUtc(messageListSeedBase.add(Duration(minutes: index))),
      content: 'message $index',
      timestamp: messageListSeedBase.add(Duration(minutes: index)),
    ),
];

List<Message> newerRows(
  List<Message> after, {
  required int count,
  String label = 'newer',
}) {
  final DateTime last = after.last.timestamp;
  return <Message>[
    for (int index = 0; index < count; index += 1)
      harnessMessage(
        id: snowflakeForUtc(last.add(Duration(minutes: index + 1))),
        content: '$label $index',
        timestamp: last.add(Duration(minutes: index + 1)),
      ),
  ];
}

/// Rows strictly older than [before]'s first row, oldest first.
List<Message> olderRows(List<Message> before, {required int count}) {
  final DateTime first = before.first.timestamp;
  return <Message>[
    for (int index = count; index >= 1; index -= 1)
      harnessMessage(
        id: snowflakeForUtc(first.subtract(Duration(minutes: index))),
        content: 'older $index',
        timestamp: first.subtract(Duration(minutes: index)),
      ),
  ];
}

ChatViewState detachedState(
  List<Message> messages, {
  required bool hasMoreNewer,
}) => ChatViewState(
  channelId: messageListChannelId,
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
  hasMoreMessages: true,
  hasMoreNewerMessages: hasMoreNewer,
  errorMessage: null,
);

Future<InstrumentedChatViewModel> pumpBottomList(
  WidgetTester tester, {
  required bool hasMoreNewer,
  int count = 60,
  bool enableTrimToNewestWindow = false,
}) async {
  tester.view.physicalSize = const Size(420, 640);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
    detachedState(seedMessages(count), hasMoreNewer: hasMoreNewer),
    enableTrimToNewestWindow: enableTrimToNewestWindow,
  );
  await tester.pumpWidget(
    messageListApp(database: openTestDatabase(), chatViewModel: chatViewModel),
  );
  await pumpFluxerFrames(tester);
  for (int i = 0; i < 4; i += 1) {
    await tester.pump();
  }
  return chatViewModel;
}

({String id, Rect rect}) anchorSample(WidgetTester tester, String id) =>
    (id: id, rect: tester.getRect(messageItemFor(id)));

void expectPreserved(
  WidgetTester tester,
  ({String id, Rect rect}) before, {
  required String reason,
}) {
  expect(messageItemFor(before.id), findsOneWidget, reason: reason);
  expect(
    tester.getRect(messageItemFor(before.id)).top,
    moreOrLessEquals(before.rect.top, epsilon: 1),
    reason: reason,
  );
}

void configureMessageListViewport(WidgetTester tester) {
  tester.view.physicalSize = const Size(420, 640);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void injectLiveCreates(
  InstrumentedChatViewModel chatViewModel,
  List<Message> after, {
  required int count,
  String label = 'live',
}) {
  chatViewModel.testState = chatViewModel.testState.copyWith(
    write: (
      messages: <Message>[
        ...after,
        ...newerRows(after, count: count, label: label),
      ],
      origin: MessagesOrigin.liveCreate,
    ),
  );
}
