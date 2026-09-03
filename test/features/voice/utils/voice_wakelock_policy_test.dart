import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_wakelock_policy.dart';

void main() {
  const VoiceSessionState guildVoice = VoiceSessionState(
    isConnected: true,
    guildId: 'g1',
    channelId: 'v1',
  );
  const VoiceSessionState dmVoice = VoiceSessionState(
    isConnected: true,
    channelId: 'dm1',
  );
  const RouteState guildVoiceRoute = RouteState(
    location: '/channels/g1/v1',
    activeBranchLocation: '/channels/g1/v1',
    activeBranchIndex: 0,
    kind: RouteKind.chat,
    guildId: 'g1',
    channelId: 'v1',
  );
  const RouteState dmCallRoute = RouteState(
    location: '/channels/@me/dm1/call',
    activeBranchLocation: '/channels/@me/dm1',
    activeBranchIndex: 0,
    kind: RouteKind.chat,
    guildId: null,
    channelId: 'dm1',
  );

  group('voiceWakelockShouldBeEnabled', () {
    test('watching a stream keeps the screen awake', () {
      expect(
        voiceWakelockShouldBeEnabled(
          voice: guildVoice,
          watchedTileId: 'user|screen',
          route: guildVoiceRoute,
          showsOverlay: true,
        ),
        isTrue,
      );
    });

    test('dm call route keeps the screen awake', () {
      expect(
        voiceWakelockShouldBeEnabled(
          voice: dmVoice,
          watchedTileId: null,
          route: dmCallRoute,
          showsOverlay: true,
        ),
        isTrue,
      );
    });

    test('immersive guild voice keeps the screen awake', () {
      expect(
        voiceWakelockShouldBeEnabled(
          voice: guildVoice,
          watchedTileId: null,
          route: guildVoiceRoute,
          showsOverlay: false,
        ),
        isTrue,
      );
    });

    test('guild voice with visible overlay does not keep the screen awake', () {
      expect(
        voiceWakelockShouldBeEnabled(
          voice: guildVoice,
          watchedTileId: null,
          route: guildVoiceRoute,
          showsOverlay: true,
        ),
        isFalse,
      );
    });

    test('not connected does not keep the screen awake', () {
      expect(
        voiceWakelockShouldBeEnabled(
          voice: const VoiceSessionState(isConnecting: true, guildId: 'g1'),
          watchedTileId: 'user|screen',
          route: guildVoiceRoute,
          showsOverlay: false,
        ),
        isFalse,
      );
    });
  });
}
