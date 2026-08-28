import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_pip_visibility.dart';

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

  group('voicePip visibility', () {
    test('guild voice page hides collapsed pip', () {
      expect(
        voicePipIsOnSessionCallRoute(
          voice: guildVoice,
          location: '/channels/g1/v1',
          routeGuildId: 'g1',
          routeChannelId: 'v1',
        ),
        isTrue,
      );
      expect(
        voicePipShouldShowCollapsed(
          voice: guildVoice,
          onSessionCallRoute: true,
          showsEmbeddedDmPanel: false,
          hasFeaturedVisual: true,
          incomingCallBlocking: false,
        ),
        isFalse,
      );
    });

    test('other guild channel shows collapsed pip', () {
      expect(
        voicePipIsOnSessionCallRoute(
          voice: guildVoice,
          location: '/channels/g1/text',
          routeGuildId: 'g1',
          routeChannelId: 'text',
        ),
        isFalse,
      );
      expect(
        voicePipShouldShowCollapsed(
          voice: guildVoice,
          onSessionCallRoute: false,
          showsEmbeddedDmPanel: false,
          hasFeaturedVisual: true,
          incomingCallBlocking: false,
        ),
        isTrue,
      );
    });

    test('dm call route uses top location not shell branch', () {
      expect(classifyRoute('/channels/@me/dm1/call'), RouteKind.dmCall);
      expect(
        voicePipIsOnSessionCallRoute(
          voice: dmVoice,
          location: '/channels/@me/dm1/call',
          routeGuildId: null,
          routeChannelId: 'dm1',
        ),
        isTrue,
      );
    });

    test('embedded dm panel hides collapsed pip', () {
      expect(
        showsEmbeddedDmVoicePanel(channelId: 'dm1', voice: dmVoice),
        isTrue,
      );
      expect(
        voicePipShouldShowCollapsed(
          voice: dmVoice,
          onSessionCallRoute: false,
          showsEmbeddedDmPanel: true,
          hasFeaturedVisual: true,
          incomingCallBlocking: false,
        ),
        isFalse,
      );
    });

    test('voice-only still shows collapsed pip when a tile is featured', () {
      expect(
        voicePipShouldShowCollapsed(
          voice: guildVoice,
          onSessionCallRoute: false,
          showsEmbeddedDmPanel: false,
          hasFeaturedVisual: true,
          incomingCallBlocking: false,
        ),
        isTrue,
      );
    });

    test('drawer covering the call view is not the call route', () {
      expect(
        voicePipIsOnSessionCallRoute(
          voice: guildVoice,
          location: '/channels/g1/v1',
          routeGuildId: 'g1',
          routeChannelId: 'v1',
          callViewObscured: true,
        ),
        isFalse,
      );
    });

    test('incoming ring hides collapsed pip', () {
      expect(
        voicePipShouldShowCollapsed(
          voice: guildVoice,
          onSessionCallRoute: false,
          showsEmbeddedDmPanel: false,
          hasFeaturedVisual: true,
          incomingCallBlocking: true,
        ),
        isFalse,
      );
    });
  });
}
