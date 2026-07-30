import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_menu_capabilities.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

const String _moderatorId = 'moderator';
const String _targetId = 'target';
const String _guildId = 'guild-1';
const String _channelId = 'voice-1';
const String _connectionId = 'conn-target';

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

VoiceParticipantMenuTarget _target() {
  final VoiceState voice = _voiceState(mute: false, deaf: false);
  return VoiceParticipantMenuTarget(
    participant: VoiceChannelParticipantData(userId: _targetId, voice: voice),
    tileId: '$_connectionId:camera',
    guildId: _guildId,
    channelId: _channelId,
    tileSource: VoiceParticipantTileSource.camera,
  );
}

class _DisconnectedVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

void main() {
  testWidgets('shows moderation when viewer is not in voice', (
    WidgetTester tester,
  ) async {
    late VoiceParticipantMenuCapabilities capabilities;
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          currentUserIdProvider.overrideWithValue(_moderatorId),
          voiceSessionProvider.overrideWith(_DisconnectedVoiceSession.new),
          voiceCallLayoutProvider.overrideWith(VoiceCallLayout.new),
        ],
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            capabilities = buildVoiceParticipantMenuCapabilities(
              ref: ref,
              target: _target(),
              voice: _target().participant.voice,
              moderation: const ModerationAccess(
                canManageTarget: true,
                canMuteMembers: true,
                canMoveMembers: true,
              ),
            );
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(capabilities.showCommunityMute, isTrue);
    expect(capabilities.showCommunityDeafen, isTrue);
    expect(capabilities.showDisconnect, isTrue);
    expect(capabilities.showSelfMute, isFalse);
    expect(capabilities.showSelfDeafen, isFalse);
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
              moderation: const ModerationAccess(
                canManageTarget: true,
                canMuteMembers: true,
                canMoveMembers: false,
              ),
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
              moderation: const ModerationAccess(
                canManageTarget: true,
                canMuteMembers: true,
                canMoveMembers: false,
              ),
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
