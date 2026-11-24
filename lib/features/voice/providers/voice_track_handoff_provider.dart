import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:fluxer_app/features/voice/utils/audio/stream_audio_utils.dart';
import 'package:fluxer_app/features/voice/utils/media/track_renderer_cache.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_audio_session.dart';
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
      ref.onDispose(cache.markSessionEnded);
      return cache;
    });

final voiceScreenShareAudioSessionProvider =
    Provider<VoiceScreenShareAudioSession<AudioTrack>>((Ref ref) {
      final VoiceScreenShareAudioSession<AudioTrack> session =
          VoiceScreenShareAudioSession<AudioTrack>(
            start: resumeScreenSharePlayback,
            stop: pauseScreenSharePlayback,
          );
      ref.onDispose(session.markSessionEnded);
      return session;
    });
