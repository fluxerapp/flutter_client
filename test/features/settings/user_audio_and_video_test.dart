import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/user_audio_and_video.dart';
import 'package:fluxer_app/features/settings/providers/voice_prompts_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/voice_settings_applicator.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/test_l10n.dart';

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      instanceFeatureEnabledProvider(
        LimitKeys.featureHigherVideoQuality,
      ).overrideWith((Ref ref) => false),
      voiceSettingsApplicatorProvider.overrideWithValue(
        const VoiceSettingsApplicator(noiseFilterSupported: false),
      ),
      voiceMediaDevicesProvider.overrideWith(_FakeVoiceMediaDevices.new),
      voiceSettingsProvider.overrideWith(VoiceSettings.new),
      voicePromptsPreferencesProvider.overrideWith(VoicePromptsPreferences.new),
      voiceSessionProvider.overrideWith(_FakeVoiceSession.new),
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
      home: Scaffold(body: child),
    ),
  );
}

class _FakeVoiceMediaDevices extends VoiceMediaDevices {
  @override
  VoiceMediaDevicesState build() => const VoiceMediaDevicesState();
}

class _FakeVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

void main() {
  testWidgets('renders audio and video settings sections', (tester) async {
    await tester.pumpWidget(_wrap(const UserAudioAndVideo()));
    await tester.pumpAndSettle();
    expect(find.text('Audio'), findsOneWidget);
    expect(find.text('Video'), findsOneWidget);
    expect(find.text('In-call behavior'), findsOneWidget);
    expect(find.text('Focused voice'), findsOneWidget);
    expect(find.text('Mirror camera'), findsOneWidget);
  });
}
