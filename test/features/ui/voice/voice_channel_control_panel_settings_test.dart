import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_panel_settings.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_change_audio_output_row.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/audio/speaker_route.dart';
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
          localizationsDelegates: fluxerLocalizationsDelegates,
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

  testWidgets('on iOS shows native change audio output instead of earpiece', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
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
          localizationsDelegates: fluxerLocalizationsDelegates,
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

    expect(find.byKey(kVoiceChangeAudioOutputKey), findsOneWidget);
    expect(find.text(testL10n.voiceChangeAudioOutputLabel), findsOneWidget);

    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('on Android the output row opens a sheet of available routes', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        voiceAvailableOutputRoutesProvider.overrideWith(
          _BluetoothAvailableRoutes.new,
        ),
        voiceBluetoothDeviceNameProvider.overrideWith(_BudsDeviceName.new),
      ],
    );
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
          home: const Scaffold(body: VoiceChangeAudioOutputPanelRow()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Galaxy Buds2 Pro'), findsOneWidget);
    expect(find.text(testL10n.voiceOutputRouteSpeaker), findsNothing);

    await tester.tap(find.byKey(kVoiceChangeAudioOutputKey));
    await tester.pumpAndSettle();

    expect(find.text(testL10n.voiceOutputRouteSpeaker), findsOneWidget);
    expect(find.text(testL10n.voiceOutputRouteEarpiece), findsOneWidget);
    expect(find.text(testL10n.voiceOutputRouteHeadset), findsNothing);
    expect(find.text('Galaxy Buds2 Pro'), findsNWidgets(2));

    await tester.tap(find.text(testL10n.voiceOutputRouteEarpiece));
    await tester.pumpAndSettle();

    final VoiceSettingsState settings = container.read(voiceSettingsProvider);
    expect(settings.outputRoute, VoiceOutputRoute.earpiece);
    expect(settings.outputRouteOverride, VoiceOutputRoute.earpiece);
    expect(find.text('Galaxy Buds2 Pro'), findsNothing);
    expect(find.text(testL10n.voiceOutputRouteEarpiece), findsOneWidget);

    await tester.pump(const Duration(seconds: 1));
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets('on iOS shows the device name of a car or AirPlay output', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        voiceSessionProvider.overrideWith(_TestVoiceSession.new),
        voiceChannelTextChatSupportedProvider(
          'voice-1',
        ).overrideWith((Ref ref) => Future<bool>.value(false)),
        voiceIosNativeRouteSyncProvider.overrideWith(_CarRouteSync.new),
      ],
    );
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
          home: const Scaffold(
            body: SingleChildScrollView(
              child: VoiceChannelControlPanelSettings(channelId: 'voice-1'),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Car Audio'), findsOneWidget);
    expect(find.text(testL10n.voiceOutputRouteHeadset), findsNothing);

    debugDefaultTargetPlatformOverride = null;
  });
}

class _CarRouteSync extends VoiceIosNativeRouteSync {
  @override
  VoiceActiveOutputRoute? build() => const VoiceActiveOutputRoute(
    VoiceOutputRoute.headset,
    deviceName: 'Car Audio',
  );
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

class _BluetoothAvailableRoutes extends VoiceAvailableOutputRoutes {
  @override
  Set<VoiceOutputRoute> build() => <VoiceOutputRoute>{
    ...kPhoneVoiceOutputRoutes,
    VoiceOutputRoute.bluetooth,
  };
}

class _BudsDeviceName extends VoiceBluetoothDeviceName {
  @override
  String? build() => 'Galaxy Buds2 Pro';
}
