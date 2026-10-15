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
import 'package:fluxer_app/features/voice/domain/local_voice_state_data.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_tile_id.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

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
