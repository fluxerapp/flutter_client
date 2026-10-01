import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_screen_share_audio_session.dart';
import 'package:fluxer_app/features/voice/utils/voice_track_renderer_cache.dart';
import 'package:livekit_client/livekit_client.dart';

final voiceTrackRendererCacheProvider =
    Provider<VoiceTrackRendererCache<RTCVideoRenderer>>((Ref ref) {
      final VoiceTrackRendererCache<RTCVideoRenderer> cache =
          VoiceTrackRendererCache<RTCVideoRenderer>(
            create: () async {
              final RTCVideoRenderer renderer = RTCVideoRenderer();
              await renderer.initialize();
              return renderer;
            },
            dispose: (RTCVideoRenderer renderer) async {
              renderer.onResize = null;
              try {
                await renderer.setSrcObject();
              } on Object {
                // Detach can fail once the texture is already gone.
              }
              try {
                await renderer.dispose();
              } on Object {
                // Dispose can fail once the texture is already gone.
              }
            },
          );
      _bindVoiceSession(
        ref,
        onEnded: cache.markSessionEnded,
        onActive: cache.markSessionActive,
      );
      ref.onDispose(cache.markSessionEnded);
      return cache;
    });

final voiceScreenShareAudioSessionProvider =
    Provider<VoiceScreenShareAudioSession<AudioTrack>>((Ref ref) {
      final VoiceScreenShareAudioSession<AudioTrack> session =
          VoiceScreenShareAudioSession<AudioTrack>(
            start: (AudioTrack track) async {
              await track.start();
            },
            stop: (AudioTrack track) async {
              await track.stop();
            },
          );
      _bindVoiceSession(
        ref,
        onEnded: session.markSessionEnded,
        onActive: session.markSessionActive,
      );
      ref.onDispose(session.markSessionEnded);
      return session;
    });

void _bindVoiceSession(
  Ref ref, {
  required void Function() onEnded,
  required void Function() onActive,
}) {
  ref.listen<VoiceSessionState>(voiceSessionProvider, (
    VoiceSessionState? previous,
    VoiceSessionState next,
  ) {
    if (next.isInVoice) {
      onActive();
      return;
    }
    if (previous?.isInVoice ?? false) {
      onEnded();
    }
  });
}
