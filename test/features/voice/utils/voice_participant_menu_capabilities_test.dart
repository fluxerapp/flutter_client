import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/settings/providers/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_menu_capabilities.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

const String _moderatorId = 'moderator';
const String _targetId = 'target';
const String _guildId = 'guild-1';
const String _channelId = 'voice-1';
const String _connectionId = 'conn-target';
const String _streamTileId = '$_connectionId:screen';

VoiceState _voiceState({required bool mute, required bool deaf}) {
  return VoiceState(
    userId: _targetId,
    channelId: _channelId,
    guildId: _guildId,
    connectionId: _connectionId,
    mute: mute,
    deaf: deaf,
  );
}

VoiceParticipantMenuTarget _target({
  VoiceParticipantTileSource tileSource = VoiceParticipantTileSource.camera,
  String? tileId,
}) {
  final VoiceState voice = _voiceState(mute: false, deaf: false);
  return VoiceParticipantMenuTarget(
    participant: VoiceChannelParticipantData(userId: _targetId, voice: voice),
    tileId: tileId ?? '$_connectionId:camera',
    guildId: _guildId,
    channelId: _channelId,
    tileSource: tileSource,
  );
}

class _DisconnectedVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _ConnectedVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    channelId: _channelId,
    guildId: _guildId,
    activeConnectionId: 'conn-local',
  );
}

class _ConnectedSelfVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState(
    isConnected: true,
    channelId: _channelId,
    guildId: _guildId,
  );
}

class _WatchedStreamTiles extends VoiceScreenShareWatchTile {
  _WatchedStreamTiles(this.tileIds);

  final Set<String> tileIds;

  @override
  Set<String> build() => tileIds;
}

VoiceParticipantMenuTarget _selfTarget() {
  final VoiceState voice = _voiceState(mute: false, deaf: false);
  return VoiceParticipantMenuTarget(
    participant: VoiceChannelParticipantData(userId: _targetId, voice: voice),
    tileId: '$_connectionId:camera',
    guildId: _guildId,
    channelId: _channelId,
    tileSource: VoiceParticipantTileSource.camera,
  );
}

const ProfileMenuCapabilities _fullVoiceModeration = ProfileMenuCapabilities(
  canChangeNickname: false,
  canTransfer: false,
  showTimeout: false,
  showRemoveTimeout: false,
  canKick: false,
  canBan: false,
  showManageRoles: false,
  showCommunityMute: true,
  showCommunityDeafen: true,
  showDisconnectFromVoice: true,
);

const ProfileMenuCapabilities _muteOnlyVoiceModeration =
    ProfileMenuCapabilities(
      canChangeNickname: false,
      canTransfer: false,
      showTimeout: false,
      showRemoveTimeout: false,
      canKick: false,
      canBan: false,
      showManageRoles: false,
      showCommunityMute: true,
      showCommunityDeafen: true,
      showDisconnectFromVoice: false,
    );

Future<VoiceParticipantMenuCapabilities> _pumpCapabilities(
  WidgetTester tester, {
  required List<Override> overrides,
  required VoiceParticipantMenuTarget target,
  ProfileMenuCapabilities guildCapabilities = ProfileMenuCapabilities.none,
}) async {
  late VoiceParticipantMenuCapabilities capabilities;
  await tester.pumpWidget(
    ProviderScope(
      overrides: overrides,
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          capabilities = buildVoiceParticipantMenuCapabilities(
            ref: ref,
            target: target,
            voice: target.participant.voice,
            guildCapabilities: guildCapabilities,
          );
          return const SizedBox.shrink();
        },
      ),
    ),
  );
  return capabilities;
}

void main() {
  testWidgets('shows moderation when viewer is not in voice', (
    WidgetTester tester,
  ) async {
    final VoiceParticipantMenuCapabilities capabilities =
        await _pumpCapabilities(
          tester,
          overrides: <Override>[
            currentUserIdProvider.overrideWithValue(_moderatorId),
            voiceSessionProvider.overrideWith(_DisconnectedVoiceSession.new),
            voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
            voiceSettingsProvider.overrideWith(VoiceSettings.new),
          ],
          target: _target(),
          guildCapabilities: _fullVoiceModeration,
        );
    expect(capabilities.showCommunityMute, isTrue);
    expect(capabilities.showCommunityDeafen, isTrue);
    expect(capabilities.showDisconnect, isTrue);
    expect(capabilities.showSelfMute, isFalse);
    expect(capabilities.showSelfDeafen, isFalse);
    expect(capabilities.showDisplayPreferences, isFalse);
    expect(capabilities.showVolume, isFalse);
  });

  testWidgets('shows user volume without connection volume setting', (
    WidgetTester tester,
  ) async {
    final VoiceParticipantMenuCapabilities capabilities =
        await _pumpCapabilities(
          tester,
          overrides: <Override>[
            currentUserIdProvider.overrideWithValue(_moderatorId),
            voiceSessionProvider.overrideWith(_ConnectedVoiceSession.new),
            voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
            voiceSettingsProvider.overrideWith(VoiceSettings.new),
          ],
          target: _target(),
        );
    expect(capabilities.showVolume, isTrue);
    expect(capabilities.isLocallyMuted, isFalse);
    expect(capabilities.showStreamControls, isFalse);
  });

  testWidgets('marks a watched stream tile as watching', (
    WidgetTester tester,
  ) async {
    final VoiceParticipantMenuTarget streamTarget = _target(
      tileSource: VoiceParticipantTileSource.screenShare,
      tileId: _streamTileId,
    );
    final VoiceParticipantMenuCapabilities capabilities =
        await _pumpCapabilities(
          tester,
          overrides: <Override>[
            currentUserIdProvider.overrideWithValue(_moderatorId),
            voiceSessionProvider.overrideWith(_ConnectedVoiceSession.new),
            voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
            voiceSettingsProvider.overrideWith(VoiceSettings.new),
            voiceScreenShareWatchTileProvider.overrideWith(
              () => _WatchedStreamTiles(<String>{_streamTileId}),
            ),
          ],
          target: streamTarget,
        );
    expect(capabilities.isScreenShareTile, isTrue);
    expect(capabilities.isWatching, isTrue);
    expect(capabilities.showVolume, isFalse);
    expect(capabilities.showStreamControls, isFalse);
  });

  testWidgets('hides stream audio controls when not watching', (
    WidgetTester tester,
  ) async {
    final VoiceParticipantMenuCapabilities capabilities =
        await _pumpCapabilities(
          tester,
          overrides: <Override>[
            currentUserIdProvider.overrideWithValue(_moderatorId),
            voiceSessionProvider.overrideWith(_ConnectedVoiceSession.new),
            voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
            voiceSettingsProvider.overrideWith(VoiceSettings.new),
          ],
          target: _target(
            tileSource: VoiceParticipantTileSource.screenShare,
            tileId: _streamTileId,
          ),
        );
    expect(capabilities.isWatching, isFalse);
    expect(capabilities.showStreamControls, isFalse);
  });

  testWidgets('shows display preferences for self in voice', (
    WidgetTester tester,
  ) async {
    late VoiceParticipantMenuCapabilities capabilities;
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          currentUserIdProvider.overrideWithValue(_targetId),
          voiceSessionProvider.overrideWith(_ConnectedSelfVoiceSession.new),
          voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
          voiceSettingsProvider.overrideWith(VoiceSettings.new),
        ],
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            capabilities = buildVoiceParticipantMenuCapabilities(
              ref: ref,
              target: _selfTarget(),
              voice: _selfTarget().participant.voice,
            );
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(capabilities.showDisplayPreferences, isTrue);
    expect(capabilities.prioritizeSpeakingParticipants, isFalse);
  });

  testWidgets('reflects live voice state for community mute checkbox', (
    WidgetTester tester,
  ) async {
    final VoiceState initialVoice = _voiceState(mute: false, deaf: false);
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        currentUserIdProvider.overrideWithValue(_moderatorId),
        voiceSessionProvider.overrideWith(_DisconnectedVoiceSession.new),
        voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
        voiceSettingsProvider.overrideWith(VoiceSettings.new),
      ],
    );
    addTearDown(container.dispose);
    container.read(voiceStatesMapProvider.notifier).update(initialVoice);

    late VoiceParticipantMenuCapabilities capabilities;
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            capabilities = buildVoiceParticipantMenuCapabilities(
              ref: ref,
              target: _target(),
              voice: watchTargetVoiceState(ref, _target()),
              guildCapabilities: _muteOnlyVoiceModeration,
            );
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(capabilities.isCommunityMuted, isFalse);

    container
        .read(voiceStatesMapProvider.notifier)
        .update(_voiceState(mute: true, deaf: false));
    await tester.pump();

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            capabilities = buildVoiceParticipantMenuCapabilities(
              ref: ref,
              target: _target(),
              voice: watchTargetVoiceState(ref, _target()),
              guildCapabilities: _muteOnlyVoiceModeration,
            );
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(capabilities.isCommunityMuted, isTrue);
    expect(capabilities.isCommunityDeafened, isFalse);
  });
}
