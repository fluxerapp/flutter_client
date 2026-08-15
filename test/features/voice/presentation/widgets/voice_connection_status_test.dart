import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_connect_failed_target.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_connection_status.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('shows failed connection status with retry and dismiss', (
    WidgetTester tester,
  ) async {
    final _SpyVoiceSession session = _SpyVoiceSession();
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[voiceSessionProvider.overrideWith(() => session)],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(body: VoiceConnectionStatus()),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Connection failed'), findsOneWidget);
    expect(find.byTooltip('Try again'), findsOneWidget);
    expect(find.byTooltip('Dismiss'), findsOneWidget);
  });

  testWidgets('shows connected voice status with channel link', (
    WidgetTester tester,
  ) async {
    final _ConnectedVoiceSession session = _ConnectedVoiceSession();
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          voiceSessionProvider.overrideWith(() => session),
          voiceConnectionStatsProvider.overrideWithValue(
            const VoiceConnectionStats(currentLatencyMs: 45),
          ),
          voiceSettingsProvider.overrideWith(_FakeVoiceSettings.new),
          channelListViewModelProvider.overrideWith(_FakeChannelList.new),
          guildListViewModelProvider.overrideWith(_FakeGuildList.new),
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
          home: const Scaffold(body: VoiceConnectionStatus()),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('In voice chat'), findsOneWidget);
    expect(find.textContaining('general'), findsOneWidget);
    expect(find.byTooltip('Disconnect'), findsOneWidget);
  });
}

class _SpyVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    connectFailed: true,
    connectFailedTarget: VoiceConnectFailedTarget(
      channelId: 'voice-1',
      guildId: 'guild-1',
    ),
  );
}

class _ConnectedVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    channelId: 'voice-1',
    guildId: 'guild-1',
    activeConnectionId: 'conn-1',
  );
}

class _FakeVoiceSettings extends VoiceSettings {
  @override
  VoiceSettingsState build() => const VoiceSettingsState();
}

class _FakeChannelList extends ChannelListViewModel {
  @override
  ChannelListState build() => const ChannelListState(
    guild: Guild(id: 'guild-1', name: 'Test Guild'),
    categories: <ChannelCategory>[
      ChannelCategory(
        id: kUncategorizedCategoryId,
        name: '',
        channels: <Channel>[
          Channel(
            id: 'voice-1',
            guildId: 'guild-1',
            name: 'general',
            type: ChannelType.guildVoice,
          ),
        ],
      ),
    ],
    selectedChannelId: null,
  );
}

class _FakeGuildList extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(
    guilds: <Guild>[Guild(id: 'guild-1', name: 'Test Guild')],
  );
}
