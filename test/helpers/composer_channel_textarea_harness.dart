import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import 'fake_well_known.dart';
import 'instance_runtime_config_override.dart';
import 'open_test_database.dart';
import 'test_l10n.dart';

const String kComposerHarnessChannelA = '1000000000000000100';
const String kComposerHarnessChannelB = '1000000000000000101';
const String kComposerHarnessUserId = '1000000000000000001';

class MutableChatViewModel extends ChatViewModel {
  @override
  ChatViewState build() => const ChatViewState(
    channelId: kComposerHarnessChannelA,
    messages: <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: 'draft-a',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );

  void setComposerChannel({
    required String channelId,
    required String messageText,
  }) {
    state = state.copyWith(channelId: channelId, messageText: messageText);
  }

  void setMessageText(String messageText) {
    state = state.copyWith(messageText: messageText);
  }

  @override
  void updateMessageText(String text) {
    state = state.copyWith(messageText: text);
  }
}

class _HarnessDmViewModel extends DmViewModel {
  @override
  DmViewState build() => DmViewState(
    conversations: <DmConversation>[
      DmConversation(
        id: kComposerHarnessChannelA,
        type: 1,
        recipientId: '2000000000000000001',
        recipientName: 'Alice',
        lastMessage: '',
        lastMessageTime: DateTime.utc(2026),
      ),
      DmConversation(
        id: kComposerHarnessChannelB,
        type: 1,
        recipientId: '2000000000000000002',
        recipientName: 'Bob',
        lastMessage: '',
        lastMessageTime: DateTime.utc(2026),
      ),
    ],
    friendsList: const [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _EmptyGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: <Guild>[]);
}

List<Override> composerChannelTextareaOverrides({
  required FluxerDatabase database,
}) {
  return <Override>[
    chatViewModelProvider.overrideWith(MutableChatViewModel.new),
    dmViewModelProvider.overrideWith(_HarnessDmViewModel.new),
    guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    currentUserIdProvider.overrideWithValue(kComposerHarnessUserId),
    fluxerDatabaseProvider.overrideWithValue(database),
    wellKnownProvider.overrideWith(FakeWellKnown.new),
    instanceRuntimeConfigOverride(),
    maxMessageLengthProvider.overrideWithValue(2000),
    channelMessagePermissionsProvider(
      kComposerHarnessChannelA,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    channelMessagePermissionsProvider(
      kComposerHarnessChannelB,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
  ];
}

Future<ProviderContainer> pumpComposerChannelTextareaHarness(
  WidgetTester tester, {
  List<Override> extraOverrides = const <Override>[],
  FluxerDatabase? database,
}) async {
  final FluxerDatabase db = database ?? openTestDatabase();
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      ...composerChannelTextareaOverrides(database: db),
      ...extraOverrides,
    ],
  );
  tester.view.physicalSize = const Size(400, 900);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(body: ChannelTextarea()),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 200));
  return container;
}

MutableChatViewModel readMutableChatViewModel(ProviderContainer container) {
  return container.read(chatViewModelProvider.notifier) as MutableChatViewModel;
}

Finder channelComposerField() {
  return find.byKey(const ValueKey<String>('channel-composer-field'));
}
