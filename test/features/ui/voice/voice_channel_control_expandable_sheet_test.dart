import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_expandable_sheet.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_panel_settings.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override, Ref;

import '../../../helpers/test_l10n.dart';

const Size _kMobileViewport = Size(390, 844);

List<Override> _voiceTestOverrides({
  bool canScreenShare = false,
  bool textChatSupported = false,
}) {
  return <Override>[
    voiceSessionProvider.overrideWith(_TestVoiceSession.new),
    screenShareCapabilityProvider.overrideWith(
      (Ref ref) => Future<bool>.value(canScreenShare),
    ),
    voiceChannelTextChatSupportedProvider(
      'voice-1',
    ).overrideWith((Ref ref) => Future<bool>.value(textChatSupported)),
  ];
}

void main() {
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  group('VoiceChannelControlExpandableSheet', () {
    testWidgets('shows morphing bar with integrated drag handle', (
      tester,
    ) async {
      await _pumpExpandableSheet(tester, colorTheme: colorTheme);
      expect(find.byKey(kVoiceControlMorphingBarKey), findsOneWidget);
      expect(find.byKey(kVoiceControlSheetDragHandleKey), findsOneWidget);
      expect(find.byType(VoiceChannelControlBarContent), findsOneWidget);
      expect(find.byType(PhosphorIcon), findsWidgets);
    });

    testWidgets('collapsed bar width fits control buttons', (tester) async {
      await _pumpExpandableSheet(tester, colorTheme: colorTheme);
      final double barWidth = tester
          .getSize(find.byKey(kVoiceControlMorphingBarKey))
          .width;
      final double expectedCollapsedWidth =
          voiceChannelControlMorphingCollapsedWidth(buttonCount: 4);
      expect(barWidth, closeTo(expectedCollapsedWidth, 1));
    });

    testWidgets('drag up grows the bar height and width in place', (
      tester,
    ) async {
      await _pumpExpandableSheet(tester, colorTheme: colorTheme);
      final Finder bar = find.byKey(kVoiceControlMorphingBarKey);
      final double startHeight = tester.getSize(bar).height;
      final double startWidth = tester.getSize(bar).width;
      await tester.drag(
        find.byKey(kVoiceControlSheetDragHandleKey),
        const Offset(0, -280),
      );
      await tester.pumpAndSettle();
      final double endHeight = tester.getSize(bar).height;
      final double endWidth = tester.getSize(bar).width;
      expect(endHeight, greaterThan(startHeight));
      expect(endWidth, greaterThan(startWidth));
    });

    testWidgets('drag up from control buttons expands the bar', (tester) async {
      await _pumpExpandableSheet(tester, colorTheme: colorTheme);
      final Finder bar = find.byKey(kVoiceControlMorphingBarKey);
      final double startHeight = tester.getSize(bar).height;
      await tester.drag(
        find.byKey(kVoiceControlSheetDragHeaderKey),
        const Offset(0, -280),
      );
      await tester.pumpAndSettle();
      expect(tester.getSize(bar).height, greaterThan(startHeight));
    });

    testWidgets('expanded panel shows grouped voice settings', (tester) async {
      await _pumpExpandableSheet(tester, colorTheme: colorTheme);
      await tester.drag(
        find.byKey(kVoiceControlSheetDragHeaderKey),
        const Offset(0, -280),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(kVoiceControlPanelSettingsKey), findsOneWidget);
      expect(find.byKey(kVoiceControlPanelOnlyShowVideosKey), findsOneWidget);
      expect(find.byKey(kVoiceControlPanelShowOwnCameraKey), findsOneWidget);
      expect(
        find.byType(FluxerRadioGroup<NoiseSuppressionTier>),
        findsOneWidget,
      );
    });

    testWidgets('expanded panel shows show chat row when supported', (
      tester,
    ) async {
      await _pumpExpandableSheet(
        tester,
        colorTheme: colorTheme,
        textChatSupported: true,
      );
      await tester.drag(
        find.byKey(kVoiceControlSheetDragHeaderKey),
        const Offset(0, -280),
      );
      await tester.pumpAndSettle();
      expect(find.byKey(kVoiceControlPanelShowChatKey), findsOneWidget);
    });

    testWidgets('pull down on panel list collapses the bar', (tester) async {
      await _pumpExpandableSheet(tester, colorTheme: colorTheme);
      final Finder bar = find.byKey(kVoiceControlMorphingBarKey);
      await tester.drag(
        find.byKey(kVoiceControlSheetDragHeaderKey),
        const Offset(0, -280),
      );
      await tester.pumpAndSettle();
      final double expandedHeight = tester.getSize(bar).height;
      expect(find.byKey(kVoiceControlPanelSettingsKey), findsOneWidget);
      await tester.drag(
        find.byKey(kVoiceControlPanelSettingsKey),
        const Offset(0, 450),
        warnIfMissed: false,
      );
      await tester.pumpAndSettle();
      final double collapsedHeight = tester.getSize(bar).height;
      expect(collapsedHeight, lessThan(expandedHeight));
      expect(find.byKey(kVoiceControlPanelSettingsKey), findsNothing);
    });
  });

  group('VoiceCallMobilePageLayout', () {
    testWidgets(
      'keeps the call stage full height when chrome shows, expands, or hides',
      (tester) async {
        await tester.binding.setSurfaceSize(_kMobileViewport);
        addTearDown(() => tester.binding.setSurfaceSize(null));
        await tester.pumpWidget(
          ProviderScope(
            overrides: _voiceTestOverrides(),
            child: MaterialApp(
              locale: kTestLocale,
              localizationsDelegates:
                  FluxerLocalizations.localizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: const Scaffold(
                body: VoiceCallMobilePageLayout(
                  channelId: 'voice-1',
                  child: ColoredBox(
                    color: Colors.red,
                    child: SizedBox.expand(key: Key('grid')),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();
        final double layoutHeight = tester
            .getSize(find.byType(VoiceCallMobilePageLayout))
            .height;
        final double gridHeightCollapsed = tester
            .getSize(find.byKey(const Key('grid')))
            .height;
        expect(gridHeightCollapsed, closeTo(layoutHeight, 1));
        await tester.drag(
          find.byKey(kVoiceControlSheetDragHandleKey),
          const Offset(0, -280),
        );
        await tester.pumpAndSettle();
        final double gridHeightExpanded = tester
            .getSize(find.byKey(const Key('grid')))
            .height;
        expect(gridHeightExpanded, closeTo(gridHeightCollapsed, 1));
        final ProviderContainer container = ProviderScope.containerOf(
          tester.element(find.byKey(const Key('grid'))),
        );
        container.read(voiceCallOverlayProvider.notifier).hide();
        await tester.pumpAndSettle();
        expect(
          tester.getSize(find.byKey(const Key('grid'))).height,
          closeTo(gridHeightCollapsed, 1),
        );
      },
    );
  });
}

Future<void> _pumpExpandableSheet(
  WidgetTester tester, {
  required FluxerColorTheme colorTheme,
  bool textChatSupported = false,
}) async {
  await tester.binding.setSurfaceSize(_kMobileViewport);
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    ProviderScope(
      overrides: _voiceTestOverrides(textChatSupported: textChatSupported),
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children: <Widget>[
                  VoiceChannelControlExpandableSheet(
                    channelId: 'voice-1',
                    guildId: 'g1',
                    isConnected: true,
                    connectionId: 'conn-1',
                    parentHeight: constraints.maxHeight,
                    parentWidth: constraints.maxWidth,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
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
