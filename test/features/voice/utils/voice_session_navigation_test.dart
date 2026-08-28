import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_session_navigation.dart';

void main() {
  const VoiceSessionState guildVoice = VoiceSessionState(
    isConnected: true,
    guildId: 'g1',
    channelId: 'v1',
  );

  group('voiceCallMinimizePath', () {
    test('returns the guild channel list for a guild call', () {
      expect(voiceCallMinimizePath(voice: guildVoice), RoutePaths.guild('g1'));
    });

    test('returns the dm channel for a dm call', () {
      expect(
        voiceCallMinimizePath(
          voice: const VoiceSessionState(isConnected: true, channelId: 'dm1'),
        ),
        RoutePaths.dmChannel('dm1'),
      );
    });
  });
}
