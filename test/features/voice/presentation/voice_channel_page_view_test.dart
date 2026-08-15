import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_join_button.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/voice/presentation/voice_channel_page_view.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_channel_join_empty_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

const String _guildId = 'g1';
const String _channelId = 'voice-1';

void main() {
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  group('VoiceChannelPageView layout gates', () {
    testWidgets('shows join UI when not in this voice channel', (
      WidgetTester tester,
    ) async {
      await _pumpPage(tester);
      expect(find.byType(VoiceChannelJoinEmptyState), findsOneWidget);
      expect(find.byType(VoiceChannelJoinButton), findsOneWidget);
      expect(find.text('Join voice channel'), findsOneWidget);
      expect(
        find.text('This is a voice channel. Connect to start talking!'),
        findsNothing,
      );
      expect(
        find.textContaining('end-to-end encrypted', findRichText: true),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey<String>('voice-participant-grid')),
        findsNothing,
      );
      expect(find.text('Connecting…'), findsNothing);
    });

    testWidgets('shows connecting shell without participant grid', (
      WidgetTester tester,
    ) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpPage(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(
          isConnecting: true,
          guildId: _guildId,
          channelId: _channelId,
        ),
      );
      await tester.pump();

      expect(find.text('Connecting…'), findsOneWidget);
      expect(find.byType(VoiceChannelParticipantGrid), findsNothing);
      expect(
        find.byKey(const ValueKey<String>('voice-participant-grid')),
        findsNothing,
      );
    });

    testWidgets('shows participant grid after connected', (
      WidgetTester tester,
    ) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpPage(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(
          isConnecting: true,
          guildId: _guildId,
          channelId: _channelId,
        ),
      );
      await tester.pump();
      expect(find.byType(VoiceChannelParticipantGrid), findsNothing);

      session.setSession(
        const VoiceSessionState(
          isConnected: true,
          guildId: _guildId,
          channelId: _channelId,
        ),
      );
      await tester.pump();

      expect(
        find.byKey(const ValueKey<String>('voice-participant-grid')),
        findsOneWidget,
      );
      expect(find.text('Connecting…'), findsNothing);
    });

    testWidgets('shows join error banner when session has errorMessage', (
      WidgetTester tester,
    ) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpPage(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(errorMessage: kVoiceSessionErrorMicPermission),
      );
      await tester.pump();
      expect(find.byType(VoiceChannelJoinButton), findsOneWidget);
      expect(
        find.textContaining('microphone', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('still shows join UI when connecting to a different channel', (
      WidgetTester tester,
    ) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpPage(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(
          isConnecting: true,
          channelId: 'other-voice-channel',
        ),
      );
      await tester.pump();

      final VoiceChannelJoinButton joinButton = tester.widget(
        find.byType(VoiceChannelJoinButton),
      );
      expect(joinButton.onPressed, isNotNull);
    });

    testWidgets(
      'shows connecting UI when guild id differs but channel matches',
      (WidgetTester tester) async {
        final _MutableVoiceSession session = _MutableVoiceSession();
        await _pumpPage(tester, voiceSession: session);
        session.setSession(
          const VoiceSessionState(isConnecting: true, channelId: _channelId),
        );
        await tester.pump();

        expect(find.text('Connecting…'), findsOneWidget);
        expect(find.byType(VoiceChannelJoinButton), findsNothing);
      },
    );

    testWidgets('shows transport failure banner on empty state', (
      WidgetTester tester,
    ) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpPage(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(
          errorMessage: kVoiceSessionErrorTransportFailed,
        ),
      );
      await tester.pump();
      expect(
        find.textContaining('connect', findRichText: true),
        findsOneWidget,
      );
    });
  });
}

Future<void> _pumpPage(
  WidgetTester tester, {
  _MutableVoiceSession? voiceSession,
}) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final FluxerDatabase db = openTestDatabase();
  final _MutableVoiceSession session = voiceSession ?? _MutableVoiceSession();
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: _voicePageOverrides(db: db, session: session),
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(
          body: VoiceChannelPageView(guildId: _guildId, channelId: _channelId),
        ),
      ),
    ),
  );
  await tester.pump();
}

List<Override> _voicePageOverrides({
  required FluxerDatabase db,
  required _MutableVoiceSession session,
}) {
  const Channel channel = Channel(
    id: _channelId,
    guildId: _guildId,
    name: 'Lobby',
    type: ChannelType.guildVoice,
    parentId: 'cat1',
  );
  return <Override>[
    fluxerDatabaseProvider.overrideWithValue(db),
    voiceSessionProvider.overrideWith(() => session),
    guildListViewModelProvider.overrideWith(_FakeGuildListViewModel.new),
    chatViewModelProvider.overrideWith(_FakeChatViewModel.new),
    channelByIdProvider(
      _channelId,
    ).overrideWith((ref) => Stream<Channel?>.value(channel)),
    channelListViewModelProvider.overrideWith(
      () => _FakeChannelListViewModel(
        const ChannelListState(
          guild: null,
          selectedChannelId: null,
          categories: [
            ChannelCategory(id: 'cat1', name: 'Voice', channels: [channel]),
          ],
        ),
      ),
    ),
    voiceJoinEligibilityProvider(
      _channelId,
    ).overrideWith((ref) => const VoiceJoinEligibility(canJoin: true)),
    voiceChannelTextChatSupportedProvider(
      _channelId,
    ).overrideWith((ref) => false),
    voiceChannelParticipantsProvider(
      voiceChannelParticipantsFamilyKey(_guildId, _channelId),
    ).overrideWith((ref) => const <VoiceChannelParticipantData>[]),
  ];
}

class _FakeChannelListViewModel extends ChannelListViewModel {
  _FakeChannelListViewModel(this._state);

  final ChannelListState _state;

  @override
  ChannelListState build() => _state;
}

class _FakeGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: <Guild>[
      Guild(id: _guildId, name: 'Test Guild', features: <String>['VOICE_E2EE']),
    ],
  );
}

class _FakeChatViewModel extends ChatViewModel {
  @override
  ChatViewState build() => const ChatViewState(
    channelId: _channelId,
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
  Future<void> switchChannel(
    String channelId, {
    String? targetMessageId,
    bool loadMessages = true,
  }) async {}
}

class _MutableVoiceSession extends VoiceSession {
  VoiceSessionState _sessionState = const VoiceSessionState();

  @override
  VoiceSessionState build() => _sessionState;

  void setSession(VoiceSessionState next) {
    _sessionState = next;
    state = next;
  }
}
