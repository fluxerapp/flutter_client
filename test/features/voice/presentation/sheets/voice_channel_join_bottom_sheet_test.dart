// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_join_bottom_sheet.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_e2ee_status_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_join_eligibility_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helpers/test_l10n.dart';

const String _guildId = 'guild-1';
const String _channelId = 'voice-1';
const String _channelName = 'General';

List<Override> _sheetOverrides() {
  return <Override>[
    voiceSessionProvider.overrideWith(_IdleVoiceSession.new),
    voiceJoinEligibilityProvider(
      _channelId,
    ).overrideWith((Ref ref) => const VoiceJoinEligibility(canJoin: true)),
    voiceChannelTextChatSupportedProvider(
      _channelId,
    ).overrideWith((Ref ref) => false),
    voiceChannelE2eeStatusProvider(
      guildId: _guildId,
      channelId: _channelId,
      emptyChannelStatus: ChannelE2eeStatus.encrypted,
    ).overrideWithValue(ChannelE2eeStatus.none),
  ];
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: _sheetOverrides(),
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

Future<(ProviderContainer, Completer<VoiceChannelJoinSheetResult?>)>
_pumpSheetHost(WidgetTester tester) async {
  final Completer<VoiceChannelJoinSheetResult?> result =
      Completer<VoiceChannelJoinSheetResult?>();
  await tester.pumpWidget(
    _buildTestApp(
      child: Builder(
        builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () {
              result.complete(
                showVoiceChannelJoinBottomSheet(
                  context,
                  channelName: _channelName,
                  guildId: _guildId,
                  channelId: _channelId,
                ),
              );
            },
            child: const Text('Open'),
          );
        },
      ),
    ),
  );
  final ProviderContainer container = ProviderScope.containerOf(
    tester.element(find.byType(ElevatedButton)),
  );
  container.read(localVoiceStateProvider);
  await tester.pump();
  return (container, result);
}

Future<VoiceChannelJoinSheetResult?> _openAndConnect(
  WidgetTester tester,
  Completer<VoiceChannelJoinSheetResult?> result, {
  Future<void> Function()? interact,
}) async {
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
  if (interact != null) {
    await interact();
  }
  await tester.tap(find.text(testL10n.voiceChannelJoinConnect));
  await tester.pumpAndSettle();
  return result.future;
}

void main() {
  group('VoiceChannelJoinBottomSheet', () {
    testWidgets('shows persisted mute and deafen and connects with them', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        kPersistedSelfMuteKey: true,
        kPersistedSelfDeafKey: true,
      });
      final (_, Completer<VoiceChannelJoinSheetResult?> result) =
          await _pumpSheetHost(tester);

      final VoiceChannelJoinSheetResult? connectResult = await _openAndConnect(
        tester,
        result,
        interact: () async {
          expect(find.text(testL10n.voiceControlUnmute), findsOneWidget);
          expect(find.text(testL10n.voiceControlUndeafen), findsOneWidget);
        },
      );

      expect(connectResult, isA<VoiceChannelJoinConnectResult>());
      final VoiceChannelJoinConnectResult connect =
          connectResult! as VoiceChannelJoinConnectResult;
      expect(connect.initialSelfMute, isTrue);
      expect(connect.initialSelfDeaf, isTrue);
    });

    testWidgets('undeafen in the sheet is used on connect', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final (
        ProviderContainer container,
        Completer<VoiceChannelJoinSheetResult?> result,
      ) = await _pumpSheetHost(
        tester,
      );
      await container.read(localVoiceStateProvider.notifier).toggleSelfDeaf();
      await tester.pump();

      final VoiceChannelJoinSheetResult? connectResult = await _openAndConnect(
        tester,
        result,
        interact: () async {
          await tester.tap(find.text(testL10n.voiceControlUndeafen));
          await tester.pumpAndSettle();
        },
      );

      expect(connectResult, isA<VoiceChannelJoinConnectResult>());
      final VoiceChannelJoinConnectResult connect =
          connectResult! as VoiceChannelJoinConnectResult;
      expect(connect.initialSelfMute, isFalse);
      expect(connect.initialSelfDeaf, isFalse);
      expect(container.read(localVoiceStateProvider).selfMute, isFalse);
      expect(container.read(localVoiceStateProvider).selfDeaf, isFalse);
    });

    testWidgets('unmuted prefs stay unmuted on connect', (
      WidgetTester tester,
    ) async {
      SharedPreferences.setMockInitialValues(<String, Object>{});
      final (_, Completer<VoiceChannelJoinSheetResult?> result) =
          await _pumpSheetHost(tester);

      final VoiceChannelJoinSheetResult? connectResult = await _openAndConnect(
        tester,
        result,
        interact: () async {
          expect(find.text(testL10n.voiceControlMute), findsOneWidget);
          expect(find.text(testL10n.voiceControlDeafen), findsOneWidget);
        },
      );

      expect(connectResult, isA<VoiceChannelJoinConnectResult>());
      final VoiceChannelJoinConnectResult connect =
          connectResult! as VoiceChannelJoinConnectResult;
      expect(connect.initialSelfMute, isFalse);
      expect(connect.initialSelfDeaf, isFalse);
    });
  });
}

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}
