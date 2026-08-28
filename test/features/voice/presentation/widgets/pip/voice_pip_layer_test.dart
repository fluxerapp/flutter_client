import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/pip/voice_pip_card.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/pip/voice_pip_layer.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_morph.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_snap.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/test_l10n.dart';

const RouteState _offCallRoute = RouteState(
  location: '/channels/g1/text',
  activeBranchLocation: '/channels/g1/text',
  activeBranchIndex: 0,
  kind: RouteKind.chat,
  guildId: 'g1',
  channelId: 'text',
);

const RouteState _onCallRoute = RouteState(
  location: '/channels/g1/v1',
  activeBranchLocation: '/channels/g1/v1',
  activeBranchIndex: 0,
  kind: RouteKind.chat,
  guildId: 'g1',
  channelId: 'v1',
);

void main() {
  group('VoicePipCard', () {
    testWidgets('renders live badge for a stream without a name', (
      tester,
    ) async {
      final colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(
            body: SizedBox(
              width: 160,
              height: 90,
              child: VoicePipCard(
                speaking: false,
                isScreenShare: true,
                child: ColoredBox(color: Color(0xFF222222)),
              ),
            ),
          ),
        ),
      );
      expect(find.text('Alex'), findsNothing);
      expect(find.text('LIVE'), findsOneWidget);
    });
  });

  group('VoicePipLayer', () {
    testWidgets('shows collapsed pip off the voice page', (tester) async {
      final colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            voiceSessionProvider.overrideWith(_ConnectedGuildVoice.new),
            voicePipFeaturedTileIdProvider.overrideWith(_FixedFeatured.new),
            voicePipCallViewObscuredProvider.overrideWithValue(false),
            routeStateProvider.overrideWithValue(
              const RouteState(
                location: '/channels/g1/text',
                activeBranchLocation: '/channels/g1/text',
                activeBranchIndex: 0,
                kind: RouteKind.chat,
                guildId: 'g1',
                channelId: 'text',
              ),
            ),
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
            home: const VoicePipLayer(child: SizedBox.expand()),
          ),
        ),
      );
      await tester.pump();
      expect(find.byKey(kVoiceInAppPipKey), findsOneWidget);
    });

    testWidgets('hides collapsed pip on the voice channel route', (
      tester,
    ) async {
      final colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            voiceSessionProvider.overrideWith(_ConnectedGuildVoice.new),
            voicePipFeaturedTileIdProvider.overrideWith(_FixedFeatured.new),
            voicePipCallViewObscuredProvider.overrideWithValue(false),
            routeStateProvider.overrideWithValue(
              const RouteState(
                location: '/channels/g1/v1',
                activeBranchLocation: '/channels/g1/v1',
                activeBranchIndex: 0,
                kind: RouteKind.chat,
                guildId: 'g1',
                channelId: 'v1',
              ),
            ),
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
            home: const VoicePipLayer(child: SizedBox.expand()),
          ),
        ),
      );
      await tester.pump();
      expect(find.byKey(kVoiceInAppPipKey), findsNothing);
    });

    testWidgets('snaps pip to the nearest edge after a drop', (tester) async {
      final colorTheme = buildDarkColorTheme();
      await tester.pumpWidget(
        ProviderScope(
          overrides: <Override>[
            voiceSessionProvider.overrideWith(_ConnectedGuildVoice.new),
            voicePipFeaturedTileIdProvider.overrideWith(_FixedFeatured.new),
            voicePipCallViewObscuredProvider.overrideWithValue(false),
            routeStateProvider.overrideWithValue(
              const RouteState(
                location: '/channels/g1/text',
                activeBranchLocation: '/channels/g1/text',
                activeBranchIndex: 0,
                kind: RouteKind.chat,
                guildId: 'g1',
                channelId: 'text',
              ),
            ),
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
            home: const VoicePipLayer(child: SizedBox.expand()),
          ),
        ),
      );
      await tester.pump();
      final Finder pip = find.byKey(kVoiceInAppPipKey);
      final Offset start = tester.getTopLeft(pip);
      await tester.timedDrag(
        pip,
        const Offset(-90, -140),
        const Duration(milliseconds: 500),
      );
      await tester.pumpAndSettle();
      final Offset dropped = tester.getTopLeft(pip);
      expect(dropped.dx, closeTo(start.dx, 1));
      expect(dropped.dy, lessThan(start.dy - 100));
      expect(dropped.dy, greaterThan(start.dy - 180));
      expect(tester.getSize(pip), kVoicePipCompactSize);
    });

    testWidgets('hero flight grows from the pip into the voice card slot', (
      tester,
    ) async {
      addTearDown(takeVoicePipSkipPhoneEnter);
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _MutableRoute route = _MutableRoute(_offCallRoute);
      await tester.pumpWidget(_heroHarness(route: route));
      await tester.pump();
      await tester.pump();

      expect(find.byKey(kVoiceInAppPipKey), findsOneWidget);
      expect(find.byKey(kVoicePipExpandSlotKey), findsNothing);
      final Rect pipRect = tester.getRect(find.byKey(kVoiceInAppPipKey));

      route.goTo(_onCallRoute);
      await tester.pump();
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));

      expect(find.byKey(kVoicePipExpandSlotKey), findsOneWidget);
      expect(find.byKey(kVoicePipFlightKey), findsOneWidget);
      expect(find.byKey(kVoiceInAppPipKey), findsNothing);
      final Rect slotRect = tester.getRect(find.byKey(kVoicePipExpandSlotKey));
      expect(pipRect.width, lessThan(slotRect.width));
      final Rect startFlight = tester.getRect(find.byKey(kVoicePipFlightKey));
      expect(startFlight.left, closeTo(pipRect.left, 24));
      expect(startFlight.top, closeTo(pipRect.top, 24));
      expect(startFlight.width, closeTo(pipRect.width, 36));

      await tester.pump(const Duration(milliseconds: 200));
      final Rect midFlight = tester.getRect(find.byKey(kVoicePipFlightKey));
      expect(midFlight.width, greaterThan(startFlight.width + 8));
      expect(
        (midFlight.center - slotRect.center).distance,
        lessThan((startFlight.center - slotRect.center).distance),
      );

      await tester.pumpAndSettle();
      expect(find.byKey(kVoicePipFlightKey), findsNothing);
      expect(find.byKey(kVoiceInAppPipKey), findsNothing);
    });

    testWidgets('hero flight shrinks from the voice card back to the pip', (
      tester,
    ) async {
      addTearDown(takeVoicePipSkipPhoneEnter);
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final _MutableRoute route = _MutableRoute(_offCallRoute);
      await tester.pumpWidget(_heroHarness(route: route));
      await tester.pump();
      await tester.pump();
      final Rect pipRect = tester.getRect(find.byKey(kVoiceInAppPipKey));

      route.goTo(_onCallRoute);
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 16));
      await tester.pumpAndSettle();
      expect(find.byKey(kVoicePipFlightKey), findsNothing);

      final Rect slotRect = tester.getRect(find.byKey(kVoicePipExpandSlotKey));
      route.goTo(_offCallRoute);
      await tester.pump();

      expect(find.byKey(kVoicePipFlightKey), findsOneWidget);
      expect(find.byKey(kVoiceInAppPipKey), findsNothing);
      final Rect startCollapse = tester.getRect(find.byKey(kVoicePipFlightKey));
      expect(startCollapse.width, closeTo(slotRect.width, 40));
      expect(startCollapse.width, greaterThan(pipRect.width + 40));
      expect(startCollapse.center.dy, closeTo(slotRect.center.dy, 48));

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      final Rect midCollapse = tester.getRect(find.byKey(kVoicePipFlightKey));
      expect(midCollapse.width, lessThan(startCollapse.width - 8));
      expect(midCollapse.height, lessThan(startCollapse.height - 8));
      expect(midCollapse.width, greaterThan(pipRect.width + 8));

      await tester.pump(kVoiceCallPhoneTransitionDuration);
      Rect? lastFlight;
      if (find.byKey(kVoicePipFlightKey).evaluate().isNotEmpty) {
        lastFlight = tester.getRect(find.byKey(kVoicePipFlightKey));
      }
      await tester.pump(kVoiceCallPhoneTransitionDuration);
      await tester.pump();
      expect(find.byKey(kVoiceInAppPipKey), findsOneWidget);
      expect(find.byKey(kVoicePipFlightKey), findsNothing);
      final Rect restored = tester.getRect(find.byKey(kVoiceInAppPipKey));
      expect(restored.width, closeTo(pipRect.width, 2));
      expect(restored.left, closeTo(pipRect.left, 2));
      if (lastFlight != null) {
        expect(restored.left, closeTo(lastFlight.left, 2));
        expect(restored.top, closeTo(lastFlight.top, 2));
        expect(restored.width, closeTo(lastFlight.width, 2));
        expect(restored.height, closeTo(lastFlight.height, 2));
      }
    });
  });
}

class _MutableRoute extends RouteStateNotifier {
  _MutableRoute(this._value);

  RouteState _value;

  @override
  RouteState build() => _value;

  void goTo(RouteState next) {
    _value = next;
    state = next;
  }
}

Widget _heroHarness({required _MutableRoute route}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: <Override>[
      voiceSessionProvider.overrideWith(_ConnectedGuildVoice.new),
      voicePipFeaturedTileIdProvider.overrideWith(_FixedFeatured.new),
      voicePipCallViewObscuredProvider.overrideWithValue(false),
      routeStateProvider.overrideWith(() => route),
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
      home: VoicePipLayer(child: _HeroCallSlot()),
    ),
  );
}

class _HeroCallSlot extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool onCall = ref.watch(
      routeStateProvider.select((RouteState s) => s.channelId == 'v1'),
    );
    if (!onCall) {
      return const SizedBox.expand();
    }
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 72),
        child: SizedBox(
          width: 220,
          height: 320,
          child: KeyedSubtree(
            key: kVoicePipExpandSlotKey,
            child: const ColoredBox(color: Color(0xFF333333)),
          ),
        ),
      ),
    );
  }
}

class _ConnectedGuildVoice extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    guildId: 'g1',
    channelId: 'v1',
  );
}

class _FixedFeatured extends VoicePipFeatured {
  @override
  String? build() => 'conn|camera';
}
