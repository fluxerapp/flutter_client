import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_bar.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _guildId = 'g1';
const String _channelId = 'voice-1';

void main() {
  group('VoiceCallBar', () {
    testWidgets('hidden when not in voice and no error', (tester) async {
      await _pumpBar(tester);
      expect(find.byType(VoiceCallBar), findsOneWidget);
      expect(find.text('Connecting…'), findsNothing);
      expect(find.byType(PhosphorIcon), findsNothing);
      await _disposeBar(tester);
    });

    testWidgets('shows connecting label for guild voice session', (
      tester,
    ) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpBar(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(
          isConnecting: true,
          guildId: _guildId,
          channelId: _channelId,
        ),
      );
      await tester.pump();

      expect(find.textContaining('Connecting'), findsOneWidget);
      expect(find.text('Leave'), findsNothing);
      await _disposeBar(tester);
    });

    testWidgets('shows leave control when connected', (tester) async {
      final _MutableVoiceSession session = _MutableVoiceSession();
      await _pumpBar(tester, voiceSession: session);
      session.setSession(
        const VoiceSessionState(
          isConnected: true,
          guildId: _guildId,
          channelId: _channelId,
          activeConnectionId: 'conn-1',
        ),
      );
      await tester.pump();

      expect(find.text('Leave'), findsOneWidget);
      await _disposeBar(tester);
    });

    testWidgets(
      'keeps connecting label when liveKitRoom is assigned mid-connect',
      (tester) async {
        final _MutableVoiceSession session = _MutableVoiceSession();
        await _pumpBar(tester, voiceSession: session);
        session.setSession(
          const VoiceSessionState(
            isConnecting: true,
            guildId: _guildId,
            channelId: _channelId,
          ),
        );
        await tester.pump();
        expect(find.textContaining('Connecting'), findsOneWidget);

        session.setSession(
          const VoiceSessionState(
            isConnecting: true,
            guildId: _guildId,
            channelId: _channelId,
            voiceServerEndpoint: 'wss://voice.example',
          ),
        );
        await tester.pump();

        expect(find.textContaining('Connecting'), findsOneWidget);
        expect(find.text('Leave'), findsNothing);
        await _disposeBar(tester);
      },
    );
  });
}

Future<void> _pumpBar(
  WidgetTester tester, {
  _MutableVoiceSession? voiceSession,
}) async {
  final FluxerDatabase db = openTestDatabase();
  final _MutableVoiceSession session = voiceSession ?? _MutableVoiceSession();
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: _voiceBarOverrides(db: db, session: session),
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(body: VoiceCallBar()),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _disposeBar(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump();
}

List<Override> _voiceBarOverrides({
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
    channelByIdProvider(
      _channelId,
    ).overrideWith((ref) => Stream<Channel?>.value(channel)),
    channelListViewModelProvider.overrideWith(
      () => _FakeChannelListViewModel(
        const ChannelListState(
          guild: null,
          selectedChannelId: null,
          categories: [],
        ),
      ),
    ),
    guildListViewModelProvider.overrideWith(_FakeGuildListViewModel.new),
    dmViewModelProvider.overrideWith(_FakeDmViewModel.new),
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
    guilds: <Guild>[Guild(id: _guildId, name: 'Test Guild')],
  );
}

class _FakeDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: [],
    friendsList: [],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
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
