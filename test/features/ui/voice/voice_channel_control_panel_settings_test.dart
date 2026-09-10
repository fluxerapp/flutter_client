import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_panel_settings.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override, Ref;

import '../../../helpers/test_l10n.dart';

void main() {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();

  testWidgets('selecting Focus updates voice call layout mode', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        voiceSessionProvider.overrideWith(_TestVoiceSession.new),
        voiceChannelTextChatSupportedProvider(
          'voice-1',
        ).overrideWith((Ref ref) => Future<bool>.value(false)),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
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
            body: SingleChildScrollView(
              child: VoiceChannelControlPanelSettings(channelId: 'voice-1'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(kVoiceControlPanelViewModeKey), findsOneWidget);
    expect(
      container.read(voiceCallLayoutProvider).mode,
      VoiceCallLayoutMode.grid,
    );

    await tester.tap(find.text(testL10n.voiceCallViewModeFocus));
    await tester.pumpAndSettle();

    expect(
      container.read(voiceCallLayoutProvider).mode,
      VoiceCallLayoutMode.focus,
    );
    expect(container.read(voiceCallLayoutProvider).pinnedTileId, isNull);

    await tester.tap(find.text(testL10n.voiceCallViewModeGrid));
    await tester.pumpAndSettle();

    expect(
      container.read(voiceCallLayoutProvider).mode,
      VoiceCallLayoutMode.grid,
    );
  });
}

class _TestVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    channelId: 'voice-1',
    guildId: 'g1',
    activeConnectionId: 'conn-1',
  );
}
