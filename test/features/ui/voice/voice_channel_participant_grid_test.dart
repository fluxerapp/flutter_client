import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_bar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_control_expandable_sheet.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_participant_grid.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_members_divider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_members_row.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_members_toggle.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_nameplate.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/desktop_stage.dart';
import 'package:fluxer_app/features/voice/providers/focus_members_row_provider.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/participant_tile_id.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/input_modality_override.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';
import '../../../helpers/wide_layout_test_sizes.dart';

const String _guildId = 'g1';
const String _channelId = 'voice-1';
const String _me = 'me';
const Size _phone = Size(390, 844);

const VoiceState _phoneVoice = VoiceState(
  userId: _me,
  guildId: _guildId,
  channelId: _channelId,
  connectionId: 'phone',
  isMobile: true,
);
const VoiceState _desktopVoice = VoiceState(
  userId: _me,
  guildId: _guildId,
  channelId: _channelId,
  connectionId: 'desktop',
  selfStream: true,
);

final String _streamTileId = voiceParticipantTileId(
  voice: _desktopVoice,
  userId: _me,
  source: VoiceParticipantTileSource.screenShare,
);

void main() {
  setUp(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  tearDown(() {
    VisibilityDetectorController.instance.updateInterval = const Duration(
      milliseconds: 500,
    );
  });

  testWidgets('focus puts the watched stream on stage, not the avatar tile', (
    WidgetTester tester,
  ) async {
    await _pumpCall(tester);

    final VoiceParticipantMediaTile stream = _mediaTile(
      tester,
      VoiceParticipantTileSource.screenShare,
    );
    final VoiceParticipantMediaTile avatar = _mediaTile(
      tester,
      VoiceParticipantTileSource.camera,
    );
    expect(stream.isTileFocused, isTrue);
    expect(avatar.isTileFocused, isFalse);

    final Rect streamRect = _mediaRect(
      tester,
      VoiceParticipantTileSource.screenShare,
    );
    final Rect avatarRect = _mediaRect(
      tester,
      VoiceParticipantTileSource.camera,
    );
    expect(streamRect.width, _phone.width);
    expect(streamRect.width / streamRect.height, closeTo(16 / 9, 0.01));
    expect(avatarRect.width, lessThan(streamRect.width / 2));

    final double controlsTop =
        _phone.height -
        voiceChannelControlMorphingHeaderHeight() -
        kVoiceControlBarVerticalPadding * 2;
    expect(avatarRect.bottom, lessThanOrEqualTo(controlsTop));
    expect(streamRect.bottom, lessThanOrEqualTo(avatarRect.top));

    await tester.pump(const Duration(seconds: 4));
    await releaseTestWidgetTree(tester);
  });

  testWidgets('tapping the focused stream on a phone keeps focus', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = await _pumpCall(tester);

    await tester.tapAt(
      _mediaRect(tester, VoiceParticipantTileSource.screenShare).center,
    );
    await tester.pump(const Duration(milliseconds: 400));

    expect(
      container.read(voiceCallLayoutProvider).mode,
      VoiceCallLayoutMode.focus,
    );
    expect(
      _mediaTile(tester, VoiceParticipantTileSource.screenShare).isTileFocused,
      isTrue,
    );

    await tester.pump(const Duration(seconds: 4));
    await releaseTestWidgetTree(tester);
  });

  testWidgets('tablet grid centers for visible and hidden call controls', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = await _pumpTabletGridCall(tester);

    final double screenHeight = kTabletLandscapeTestViewportSize.height;
    final double controlsFootprint =
        voiceChannelControlMorphingHeaderHeight() +
        kVoiceControlBarVerticalPadding * 2;
    final double stageCenterY = (screenHeight - controlsFootprint) / 2;

    expect(
      _mediaRect(tester, VoiceParticipantTileSource.camera).center.dy,
      closeTo(stageCenterY, 48),
    );

    container.read(voiceCallOverlayProvider.notifier).hide();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(
      _mediaRect(tester, VoiceParticipantTileSource.camera).center.dy,
      closeTo(screenHeight / 2, 48),
    );

    await tester.pump(const Duration(seconds: 4));
    await releaseTestWidgetTree(tester);
  });

  testWidgets('mouse grid uses equal 16:9 cards without touch controls', (
    WidgetTester tester,
  ) async {
    await _pumpDesktopCall(tester);

    final List<Rect> rects = _desktopTileRects(tester);
    expect(rects, hasLength(3));
    for (final Rect rect in rects) {
      expect(rect.width / rect.height, closeTo(16 / 9, 0.01));
      expect(rect.size, rects.first.size);
    }
    expect(find.byType(VoiceDesktopTileNameplate), findsNWidgets(3));
    expect(find.byIcon(Icons.fullscreen_rounded), findsNothing);
    expect(find.byType(VoiceDesktopMembersToggle), findsNothing);

    await _endCall(tester);
  });

  testWidgets('clicking a card focuses it and clicking again restores grid', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = await _pumpDesktopCall(tester);

    await tester.tapAt(_desktopTileRects(tester).first.center);
    await tester.pump(const Duration(milliseconds: 400));

    expect(container.read(voiceCallLayoutProvider).pinnedTileId, isNotNull);
    expect(
      _desktopTiles(tester).map((VoiceDesktopTile t) => t.presentation),
      containsAll(<VoiceDesktopTilePresentation>[
        VoiceDesktopTilePresentation.focusMain,
        VoiceDesktopTilePresentation.focusSecondary,
      ]),
    );
    final Rect main = _desktopTileRects(
      tester,
      VoiceDesktopTilePresentation.focusMain,
    ).single;
    final List<Rect> members = _desktopTileRects(
      tester,
      VoiceDesktopTilePresentation.focusSecondary,
    );
    expect(members, hasLength(2));
    expect(main.width / main.height, closeTo(16 / 9, 0.01));
    expect(members.first.top, greaterThanOrEqualTo(main.bottom));

    await tester.tapAt(main.center);
    await tester.pump(const Duration(milliseconds: 400));

    expect(container.read(voiceCallLayoutProvider).pinnedTileId, isNull);
    expect(
      _desktopTileRects(tester, VoiceDesktopTilePresentation.grid),
      hasLength(3),
    );

    await _endCall(tester);
  });

  testWidgets('the members row can be hidden and resized', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = await _pumpDesktopCall(tester);
    container
        .read(voiceCallLayoutProvider.notifier)
        .setMode(VoiceCallLayoutMode.focus);
    await tester.pump(const Duration(milliseconds: 400));

    final double before = tester
        .getSize(find.byType(VoiceDesktopMembersRow))
        .height;
    await tester.drag(
      find.byType(VoiceDesktopMembersDivider),
      const Offset(0, -80),
      kind: PointerDeviceKind.mouse,
    );
    await tester.pump(const Duration(milliseconds: 400));
    expect(
      tester.getSize(find.byType(VoiceDesktopMembersRow)).height,
      greaterThan(before),
    );

    container.read(voiceCallOverlayProvider.notifier).reveal();
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(find.byType(VoiceDesktopMembersToggle));
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(VoiceDesktopMembersRow), findsNothing);

    await _endCall(tester);
  });

  testWidgets('clicking the members divider does not store a height', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = await _pumpDesktopCall(tester);
    container
        .read(voiceCallLayoutProvider.notifier)
        .setMode(VoiceCallLayoutMode.focus);
    await tester.pump(const Duration(milliseconds: 400));

    await tester.tapAt(
      tester.getCenter(find.byType(VoiceDesktopMembersDivider)),
      kind: PointerDeviceKind.mouse,
    );
    await tester.pump(const Duration(milliseconds: 400));
    expect(container.read(focusMembersRowProvider).height, isNull);

    await _endCall(tester);
  });

  testWidgets('tiny compact panels fit every card without overflowing', (
    WidgetTester tester,
  ) async {
    await _pumpDesktopCall(
      tester,
      size: const Size(700, 60),
      compact: true,
      withStage: false,
    );

    expect(find.byType(VoiceDesktopTile), findsNWidgets(3));
    expect(find.byType(VoiceDesktopTileNameplate), findsNothing);
    expect(tester.takeException(), isNull);

    await _endCall(tester);
  });

  testWidgets('touch keeps the touch cards on a desktop sized screen', (
    WidgetTester tester,
  ) async {
    await _pumpDesktopCall(tester, touch: true);

    expect(find.byType(VoiceDesktopTile), findsNothing);
    expect(find.byType(VoiceParticipantMediaTile), findsNWidgets(3));

    await _endCall(tester);
  });

  testWidgets('switching from mouse to touch swaps the cards live', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = await _pumpDesktopCall(tester);
    expect(find.byType(VoiceDesktopTile), findsNWidgets(3));

    container
        .read(inputModalityProvider.notifier)
        .handlePointerEvent(const PointerDownEvent());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.byType(VoiceDesktopTile), findsNothing);

    await _endCall(tester);
  });
}

Future<void> _endCall(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 4));
  await releaseTestWidgetTree(tester);
}

Finder _desktopTileFinder([VoiceDesktopTilePresentation? presentation]) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is VoiceDesktopTile &&
        (presentation == null || widget.presentation == presentation),
  );
}

List<VoiceDesktopTile> _desktopTiles(WidgetTester tester) =>
    tester.widgetList<VoiceDesktopTile>(_desktopTileFinder()).toList();

List<Rect> _desktopTileRects(
  WidgetTester tester, [
  VoiceDesktopTilePresentation? presentation,
]) => <Rect>[
  for (final Element element in _desktopTileFinder(presentation).evaluate())
    tester.getRect(find.byElementPredicate((Element e) => e == element)),
];

Future<ProviderContainer> _pumpDesktopCall(
  WidgetTester tester, {
  bool touch = false,
  bool compact = false,
  bool withStage = true,
  Size size = kDesktopTestViewportSize,
}) async {
  final Widget grid = VoiceChannelParticipantGrid(
    guildId: _guildId,
    channelId: _channelId,
    compact: compact,
  );
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final FluxerDatabase db = openTestDatabase();
  final String participantKey = voiceChannelParticipantsFamilyKey(
    _guildId,
    _channelId,
  );
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      inputModalityOverride(touch: touch),
      voiceSessionProvider.overrideWith(_ConnectedVoiceSession.new),
      currentUserIdProvider.overrideWithValue(_me),
      localVoiceStateProvider.overrideWithValue(const LocalVoiceStateData()),
      guildUserDisplayFromDbProvider.overrideWith(
        (Ref ref, (String, String?) args) =>
            const AsyncValue<GuildUserDisplay?>.data(null),
      ),
      voiceChannelGridStructureProvider(
        participantKey,
      ).overrideWith((Ref ref) => 'desktop'),
      voiceChannelParticipantsProvider(participantKey).overrideWith(
        (Ref ref) => const <VoiceChannelParticipantData>[
          VoiceChannelParticipantData(userId: _me, voice: _phoneVoice),
          VoiceChannelParticipantData(
            userId: 'friend-1',
            voice: VoiceState(
              userId: 'friend-1',
              guildId: _guildId,
              channelId: _channelId,
              connectionId: 'c1',
            ),
          ),
          VoiceChannelParticipantData(
            userId: 'friend-2',
            voice: VoiceState(
              userId: 'friend-2',
              guildId: _guildId,
              channelId: _channelId,
              connectionId: 'c2',
              selfMute: true,
            ),
          ),
        ],
      ),
    ],
  );
  addTearDown(container.dispose);
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: DesktopPointerUiScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: withStage ? VoiceDesktopStage(child: grid) : grid,
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
  return container;
}

VoiceParticipantMediaTile _mediaTile(
  WidgetTester tester,
  VoiceParticipantTileSource source,
) {
  return tester.widget<VoiceParticipantMediaTile>(_mediaFinder(source));
}

Rect _mediaRect(WidgetTester tester, VoiceParticipantTileSource source) {
  return tester.getRect(_mediaFinder(source));
}

Finder _mediaFinder(VoiceParticipantTileSource source) {
  return find.byWidgetPredicate(
    (Widget widget) =>
        widget is VoiceParticipantMediaTile && widget.tileSource == source,
  );
}

Future<ProviderContainer> _pumpTabletGridCall(WidgetTester tester) async {
  tester.view.physicalSize = kTabletLandscapeTestViewportSize;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final FluxerDatabase db = openTestDatabase();
  final String participantKey = voiceChannelParticipantsFamilyKey(
    _guildId,
    _channelId,
  );
  const VoiceState soloVoice = VoiceState(
    userId: _me,
    guildId: _guildId,
    channelId: _channelId,
    connectionId: 'tablet',
  );
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      inputModalityProvider.overrideWith(_TouchPrimaryModality.new),
      voiceSessionProvider.overrideWith(_ConnectedVoiceSession.new),
      currentUserIdProvider.overrideWithValue(_me),
      localVoiceStateProvider.overrideWithValue(const LocalVoiceStateData()),
      guildUserDisplayFromDbProvider.overrideWith(
        (Ref ref, (String, String?) args) =>
            const AsyncValue<GuildUserDisplay?>.data(null),
      ),
      voiceChannelGridStructureProvider(
        participantKey,
      ).overrideWith((Ref ref) => 'tablet'),
      voiceChannelParticipantsProvider(participantKey).overrideWith(
        (Ref ref) => const <VoiceChannelParticipantData>[
          VoiceChannelParticipantData(userId: _me, voice: soloVoice),
        ],
      ),
    ],
  );
  addTearDown(container.dispose);
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
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
          body: VoiceCallMobilePageLayout(
            channelId: _channelId,
            child: VoiceChannelParticipantGrid(
              guildId: _guildId,
              channelId: _channelId,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
  return container;
}

Future<ProviderContainer> _pumpCall(WidgetTester tester) async {
  tester.view.physicalSize = _phone;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  final FluxerDatabase db = openTestDatabase();
  final String participantKey = voiceChannelParticipantsFamilyKey(
    _guildId,
    _channelId,
  );
  final ProviderContainer container = ProviderContainer(
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      voiceSessionProvider.overrideWith(_ConnectedVoiceSession.new),
      currentUserIdProvider.overrideWithValue(_me),
      localVoiceStateProvider.overrideWithValue(const LocalVoiceStateData()),
      guildUserDisplayFromDbProvider.overrideWith(
        (Ref ref, (String, String?) args) =>
            const AsyncValue<GuildUserDisplay?>.data(null),
      ),
      voiceChannelGridStructureProvider(
        participantKey,
      ).overrideWith((Ref ref) => 'phone;desktop'),
      voiceChannelParticipantsProvider(participantKey).overrideWith(
        (Ref ref) => const <VoiceChannelParticipantData>[
          VoiceChannelParticipantData(userId: _me, voice: _phoneVoice),
          VoiceChannelParticipantData(userId: _me, voice: _desktopVoice),
        ],
      ),
    ],
  );
  addTearDown(container.dispose);
  container
      .read(voiceScreenShareWatchTileProvider.notifier)
      .watch(_streamTileId);
  container
      .read(voiceCallLayoutProvider.notifier)
      .setMode(VoiceCallLayoutMode.focus);
  final FluxerColorTheme colorTheme = buildDarkColorTheme();
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
          body: VoiceCallMobilePageLayout(
            channelId: _channelId,
            child: VoiceChannelParticipantGrid(
              guildId: _guildId,
              channelId: _channelId,
            ),
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 400));
  return container;
}

class _TouchPrimaryModality extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _ConnectedVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    guildId: _guildId,
    channelId: _channelId,
    activeConnectionId: 'phone',
  );

  @override
  void updateViewerStreamKeys(List<String> viewerStreamKeys) {}
}
