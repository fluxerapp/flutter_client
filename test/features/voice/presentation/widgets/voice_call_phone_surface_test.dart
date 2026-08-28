import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_phone_surface.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/test_l10n.dart';

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

void main() {
  testWidgets('reverses the join slide when playPhoneExit runs', (
    WidgetTester tester,
  ) async {
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
          home: const VoiceCallPhoneSurface(child: Text('call')),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(kVoiceCallPhoneTransitionDuration);

    FadeTransition fade = tester.widget(
      find.descendant(
        of: find.byType(VoiceCallPhoneSurface),
        matching: find.byType(FadeTransition),
      ),
    );
    expect(fade.opacity.value, 1);

    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.text('call')),
    );
    final Future<void> exit = container
        .read(voiceCallOverlayProvider.notifier)
        .playPhoneExit();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 80));
    fade = tester.widget(
      find.descendant(
        of: find.byType(VoiceCallPhoneSurface),
        matching: find.byType(FadeTransition),
      ),
    );
    expect(fade.opacity.value, lessThan(1));

    await tester.pump(kVoiceCallPhoneTransitionDuration);
    fade = tester.widget(
      find.descendant(
        of: find.byType(VoiceCallPhoneSurface),
        matching: find.byType(FadeTransition),
      ),
    );
    expect(fade.opacity.value, 0);
    await exit;
  });

  testWidgets('skips the join slide when pip expand is armed', (
    WidgetTester tester,
  ) async {
    armVoicePipSkipPhoneEnter();
    addTearDown(takeVoicePipSkipPhoneEnter);
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
          home: const VoiceCallPhoneSurface(child: Text('call')),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    final FadeTransition fade = tester.widget(
      find.descendant(
        of: find.byType(VoiceCallPhoneSurface),
        matching: find.byType(FadeTransition),
      ),
    );
    expect(fade.opacity.value, 1);
    expect(peekVoicePipSkipPhoneEnter(), isFalse);
  });
}
