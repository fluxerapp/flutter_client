import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/utils/pip/pip_featured_selector.dart';
import 'package:fluxer_app/features/voice/utils/pip/system_pip_target.dart';
import 'package:fluxer_dart/gateway.dart';

const String _me = 'me';
const String _localConnection = 'local-conn';
const String _otherDeviceConnection = 'other-device-conn';

VoiceChannelParticipantData _participant({
  required String userId,
  required String? connectionId,
  bool selfStream = false,
}) {
  return VoiceChannelParticipantData(
    userId: userId,
    voice: VoiceState(
      userId: userId,
      channelId: 'channel',
      guildId: 'guild',
      connectionId: connectionId,
      selfStream: selfStream,
    ),
  );
}

Map<String, VoicePipCandidate> _byTileId(List<VoicePipCandidate> candidates) {
  return <String, VoicePipCandidate>{
    for (final VoicePipCandidate candidate in candidates)
      candidate.tileId: candidate,
  };
}

void main() {
  test('only this device connection is local for the current user', () {
    final Map<String, VoicePipCandidate> candidates = _byTileId(
      buildVoicePipCandidates(
        participants: <VoiceChannelParticipantData>[
          _participant(userId: _me, connectionId: _localConnection),
          _participant(
            userId: _me,
            connectionId: _otherDeviceConnection,
            selfStream: true,
          ),
        ],
        media: null,
        currentUserId: _me,
        localConnectionId: _localConnection,
      ),
    );

    expect(candidates['$_localConnection|camera']!.isLocal, isTrue);
    expect(candidates['$_otherDeviceConnection|camera']!.isLocal, isFalse);
    expect(candidates['$_otherDeviceConnection|screen']!.isLocal, isFalse);
  });

  test('falls back to the user when connection ids are unknown', () {
    final Map<String, VoicePipCandidate> candidates = _byTileId(
      buildVoicePipCandidates(
        participants: <VoiceChannelParticipantData>[
          _participant(userId: _me, connectionId: _otherDeviceConnection),
        ],
        media: null,
        currentUserId: _me,
        localConnectionId: null,
      ),
    );

    expect(candidates['$_otherDeviceConnection|camera']!.isLocal, isTrue);
  });

  test('a screen share from another own device can be the system pip', () {
    const String shareTileId = '$_otherDeviceConnection|screen';
    final String? tileId = resolveVoiceSystemPipTileId(
      expandedTileId: shareTileId,
      pinnedTileId: null,
      watchedTileIds: const <String>{shareTileId},
      candidates: buildVoicePipCandidates(
        participants: <VoiceChannelParticipantData>[
          _participant(userId: _me, connectionId: _localConnection),
          _participant(
            userId: _me,
            connectionId: _otherDeviceConnection,
            selfStream: true,
          ),
        ],
        media: null,
        currentUserId: _me,
        localConnectionId: _localConnection,
      ),
    );

    expect(tileId, shareTileId);
  });
}
