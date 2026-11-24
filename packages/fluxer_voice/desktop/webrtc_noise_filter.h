#ifndef FLUXER_VOICE_WEBRTC_NOISE_FILTER_H_
#define FLUXER_VOICE_WEBRTC_NOISE_FILTER_H_

namespace flutter_webrtc_plugin {
class FlutterWebRTC;
}

namespace fluxer_voice {

bool AttachNoiseFilter(flutter_webrtc_plugin::FlutterWebRTC* webrtc);

bool IsNoiseFilterAttached();

}

#endif
