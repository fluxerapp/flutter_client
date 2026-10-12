import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_topic_dialog.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_mention.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/members/providers/member_list_subscription_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../helpers/instance_runtime_config_override.dart';
import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _guildId = '1000000000000000001';
const String _topicChannelId = '1000000000000000002';
const String _targetChannelId = '1000000000000000003';
const String _messageId = '1000000000000000004';
const String _targetPath = '/channels/$_guildId/$_targetChannelId/$_messageId';
const String _topic =
    'Rules: https://fluxer.app/channels/$_guildId/$_targetChannelId/$_messageId';
const Channel _topicChannel = Channel(
  id: _topicChannelId,
  guildId: _guildId,
  name: 'general',
  topic: _topic,
);
const Channel _targetChannel = Channel(
  id: _targetChannelId,
  guildId: _guildId,
  name: 'rules',
  topic: _topic,
);

class _FakeAppearance extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

class _RecordingChatViewModel extends ChatViewModel {
  final List<String> jumpedTo = <String>[];

  @override
  ChatViewState build() => const ChatViewState(
    channelId: _targetChannelId,
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

  @override
  Future<void> goToRepliedMessage({
    required String channelId,
    required String messageId,
  }) async {
    jumpedTo.add(messageId);
  }
}

class _EmptyPins extends ChannelPins {
  @override
  Future<ChannelPinsState> build(String channelId) async {
    return const ChannelPinsState(
      items: <PinnedMessageEntry>[],
      hasMore: false,
    );
  }
}

void main() {
  late FluxerDatabase database;
  late GoRouter router;

  setUp(() async {
    database = openTestDatabase();
    for (final String id in <String>[_topicChannelId, _targetChannelId]) {
      await database.channelDao.upsertChannel(
        ChannelsCompanion.insert(
          id: id,
          guildId: _guildId,
          name: id == _topicChannelId ? 'general' : 'rules',
          type: const Value(0),
        ),
      );
    }
    router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
        GoRoute(
          path: '/channels/:guildId/:channelId/:messageId',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
      ],
    );
    addTearDown(router.dispose);
  });

  ProviderContainer buildContainer({
    String activeChannelId = _topicChannelId,
    _RecordingChatViewModel? chat,
  }) {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        instanceRuntimeConfigOverride(),
        fluxerDatabaseProvider.overrideWithValue(database),
        fluxerRouterProvider.overrideWithValue(router),
        activeChannelIdProvider.overrideWithValue(activeChannelId),
        appearancePreferencesProvider.overrideWith(_FakeAppearance.new),
        for (final String id in <String>[
          _topicChannelId,
          _targetChannelId,
        ]) ...[
          memberListDetailsSubscriptionProvider(
            _guildId,
            id,
            true,
          ).overrideWith((ref) {}),
          channelPinsProvider(id).overrideWith(_EmptyPins.new),
        ],
        if (chat != null) chatViewModelProvider.overrideWith(() => chat),
      ],
    );
    addTearDown(container.dispose);
    container.read(gatewayReadyProvider.notifier).setReady();
    return container;
  }

  Future<BuildContext> pumpShell(
    WidgetTester tester,
    ProviderContainer container,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    late BuildContext branch;
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          navigatorKey: rootNavigatorKey,
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Navigator(
            key: homeBranchNavigatorKey,
            onGenerateRoute: (RouteSettings settings) =>
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    branch = context;
                    return const Scaffold(body: Text('chat'));
                  },
                ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return branch;
  }

  testWidgets('a message link in the details sheet topic closes the sheet', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    final BuildContext branch = await pumpShell(tester, container);

    unawaited(
      showChannelDetailsSheetAndJump(
        branch,
        container: container,
        channel: _topicChannel,
        dm: null,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ChannelDetailsSheet), findsOneWidget);

    await tester.tap(find.byType(ChannelJumpLinkMention).first);
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, _targetPath);
    await tester.pumpAndSettle();
    expect(
      find.byType(ChannelDetailsSheet, skipOffstage: false),
      findsNothing,
      reason: 'the topic must not stay open over the jumped-to message',
    );
    expect(find.text('chat'), findsOneWidget);
  });

  testWidgets('a same-channel message link in the topic closes the sheet', (
    tester,
  ) async {
    final _RecordingChatViewModel chat = _RecordingChatViewModel();
    final ProviderContainer container = buildContainer(
      activeChannelId: _targetChannelId,
      chat: chat,
    );
    final BuildContext branch = await pumpShell(tester, container);

    unawaited(
      showChannelDetailsSheetAndJump(
        branch,
        container: container,
        channel: _targetChannel,
        dm: null,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ChannelDetailsSheet), findsOneWidget);

    await tester.tap(find.byType(ChannelJumpLinkMention).first);
    await tester.pumpAndSettle();

    expect(chat.jumpedTo, <String>[_messageId]);
    await tester.pumpAndSettle();
    expect(
      find.byType(ChannelDetailsSheet, skipOffstage: false),
      findsNothing,
      reason: 'the topic must close when it jumps within the open channel',
    );
    expect(find.text('chat'), findsOneWidget);
  });

  testWidgets('a message link in the topic dialog closes the dialog', (
    tester,
  ) async {
    final ProviderContainer container = buildContainer();
    final BuildContext branch = await pumpShell(tester, container);

    unawaited(
      showChannelTopicDialog(
        branch,
        channelName: 'general',
        topic: _topic,
        channelId: _topicChannelId,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(ChannelJumpLinkMention), findsOneWidget);

    await tester.tap(find.byType(ChannelJumpLinkMention));
    await tester.pumpAndSettle();

    expect(router.routeInformationProvider.value.uri.path, _targetPath);
    await tester.pumpAndSettle();
    expect(
      find.byType(ChannelJumpLinkMention, skipOffstage: false),
      findsNothing,
      reason: 'the topic dialog must close when its link jumps',
    );
    expect(find.text('chat'), findsOneWidget);
  });
}
