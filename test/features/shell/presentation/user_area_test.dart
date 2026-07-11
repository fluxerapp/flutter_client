import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  testWidgets('UserArea mic button toggles voice session when in voice', (
    WidgetTester tester,
  ) async {
    final _SpyVoiceSession session = _SpyVoiceSession();
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
          userPresenceProvider(
            '1',
          ).overrideWith((Ref ref) => Stream<User?>.value(null)),
          voiceSessionProvider.overrideWith(() => session),
        ],
        child: MaterialApp(
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
