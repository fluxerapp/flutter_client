import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/user_panel_widgets.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_connection_stats_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_dart/gateway.dart' show VoiceState;
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/test_l10n.dart';

List<Override> _userAreaOverrides({
  required VoiceSession Function() voiceSession,
  required LocalVoiceState Function() localVoice,
}) {
  return <Override>[
    userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
    userPresenceProvider(
      '1',
    ).overrideWith((Ref ref) => Stream<User?>.value(null)),
    voiceSessionProvider.overrideWith(voiceSession),
    localVoiceStateProvider.overrideWith(localVoice),
    dmViewModelProvider.overrideWith(_EmptyDmViewModel.new),
    voiceConnectionStatsProvider.overrideWithValue(
      const VoiceConnectionStats(),
    ),
    voiceSettingsProvider.overrideWith(_FakeVoiceSettings.new),
    voiceStateForConnectionProvider(
      'conn-1',
    ).overrideWithValue(const VoiceState(userId: '1')),
  ];
}

void main() {
  testWidgets('UserArea mic button toggles voice session when in voice', (
    WidgetTester tester,
  ) async {
    final _SpyVoiceSession session = _SpyVoiceSession();
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: _userAreaOverrides(
          voiceSession: () => session,
          localVoice: _FakeLocalVoiceState.new,
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
          home: const Scaffold(body: UserArea()),
        ),
      ),
    );
    await tester.pump();

    await tester.tap(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is PhosphorIcon &&
            widget.icon == PhosphorIconsFill.microphone,
      ),
    );
    await tester.pump();

    expect(session.muteToggleCount, 1);
  });

  testWidgets(
    'UserArea mic button toggles local voice state when not in voice',
    (WidgetTester tester) async {
      final _SpyLocalVoiceState localVoice = _SpyLocalVoiceState();
      final colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        ProviderScope(
          overrides: _userAreaOverrides(
            voiceSession: _IdleVoiceSession.new,
            localVoice: () => localVoice,
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
            home: const Scaffold(body: UserArea()),
          ),
        ),
      );
      await tester.pump();

      await tester.tap(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is PhosphorIcon &&
              widget.icon == PhosphorIconsFill.microphone,
        ),
      );
      await tester.pump();

      expect(localVoice.toggleMuteCount, 1);
    },
  );

  testWidgets('UserArea shows danger styling when locally muted', (
    WidgetTester tester,
  ) async {
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: _userAreaOverrides(
          voiceSession: _IdleVoiceSession.new,
          localVoice: _MutedLocalVoiceState.new,
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
          home: const Scaffold(body: UserArea()),
        ),
      ),
    );
    await tester.pump();

    final IconTheme iconTheme = tester.widget<IconTheme>(
      find.descendant(
        of: find.byTooltip('Unmute microphone'),
        matching: find.byType(IconTheme),
      ),
    );
    expect(iconTheme.data.color, colorTheme.controlButtonDangerText);
  });

  testWidgets('UserArea uses panel control background and divider', (
    WidgetTester tester,
  ) async {
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: _userAreaOverrides(
          voiceSession: _IdleVoiceSession.new,
          localVoice: _FakeLocalVoiceState.new,
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
          home: const Scaffold(body: UserArea()),
        ),
      ),
    );
    await tester.pump();

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is ColoredBox && widget.color == colorTheme.panelControlBg,
      ),
      findsOneWidget,
    );

    expect(find.byType(UserAreaDivider), findsOneWidget);

    final Container divider = tester.widget<Container>(
      find.descendant(
        of: find.byType(UserAreaDivider),
        matching: find.byType(Container),
      ),
    );
    expect(divider.color, colorTheme.userAreaDividerColor);
  });

  testWidgets('UserArea reserves bottom safe area on wide layout', (
    WidgetTester tester,
  ) async {
    const double homeIndicatorInset = 34;
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: _userAreaOverrides(
          voiceSession: _IdleVoiceSession.new,
          localVoice: _FakeLocalVoiceState.new,
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
          home: const MediaQuery(
            data: MediaQueryData(
              size: Size(Breakpoints.shellMinWidth, 900),
              padding: EdgeInsets.only(bottom: homeIndicatorInset),
              viewPadding: EdgeInsets.only(bottom: homeIndicatorInset),
            ),
            child: Scaffold(body: UserArea()),
          ),
        ),
      ),
    );
    await tester.pump();

    final SafeArea safeArea = tester.widget<SafeArea>(find.byType(SafeArea));
    expect(safeArea.bottom, isTrue);
  });

  testWidgets('UserArea skips bottom safe area on mobile layout', (
    WidgetTester tester,
  ) async {
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: _userAreaOverrides(
          voiceSession: _IdleVoiceSession.new,
          localVoice: _FakeLocalVoiceState.new,
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
          home: const MediaQuery(
            data: MediaQueryData(
              size: Size(390, 844),
              padding: EdgeInsets.only(bottom: 34),
              viewPadding: EdgeInsets.only(bottom: 34),
            ),
            child: Scaffold(body: UserArea()),
          ),
        ),
      ),
    );
    await tester.pump();

    final SafeArea safeArea = tester.widget<SafeArea>(find.byType(SafeArea));
    expect(safeArea.bottom, isFalse);
  });
}

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: '1',
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );
}

class _FakeLocalVoiceState extends LocalVoiceState {
  @override
  LocalVoiceStateData build() => const LocalVoiceStateData();
}

class _MutedLocalVoiceState extends LocalVoiceState {
  @override
  LocalVoiceStateData build() => const LocalVoiceStateData(selfMute: true);
}

class _SpyLocalVoiceState extends LocalVoiceState {
  int toggleMuteCount = 0;

  @override
  LocalVoiceStateData build() => const LocalVoiceStateData();

  @override
  Future<void> toggleSelfMute() async {
    toggleMuteCount++;
    state = state.copyWith(selfMute: true);
  }
}

class _SpyVoiceSession extends VoiceSession {
  int muteToggleCount = 0;

  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    channelId: 'voice-1',
    activeConnectionId: 'conn-1',
  );

  @override
  Future<void> toggleSelfMute() async {
    muteToggleCount++;
  }
}

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _EmptyDmViewModel extends DmViewModel {
  @override
  DmViewState build() => const DmViewState(
    conversations: <DmConversation>[],
    friendsList: <Friend>[],
    activeTab: FriendsTab.online,
    searchQuery: '',
  );
}

class _FakeVoiceSettings extends VoiceSettings {
  @override
  VoiceSettingsState build() => const VoiceSettingsState();
}
