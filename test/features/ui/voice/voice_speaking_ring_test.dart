import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/voice/voice_speaking_ring.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

void main() {
  testWidgets('speaking ring overlay does not change child constraints', (
    WidgetTester tester,
  ) async {
    BoxConstraints? inner;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [voiceSessionProvider.overrideWith(_IdleVoiceSession.new)],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Center(
            child: SizedBox(
              width: 200,
              height: 120,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                          inner = constraints;
                          return const ColoredBox(color: Color(0xFF333333));
                        },
                  ),
                  const Positioned.fill(
                    child: VoiceSpeakingRingOverlay(
                      enabled: true,
                      identity: 'user-1',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    expect(inner, isNotNull);
    expect(inner!.maxWidth, 200);
    expect(inner!.maxHeight, 120);
    expect(inner!.minWidth, 200);
    expect(inner!.minHeight, 120);
  });

  test('avatar speaking ring is sized around the tile avatar', () {
    expect(voiceSpeakingAvatarRingSize(200), 100 + kVoiceSpeakingRingWidth * 2);
  });
}
