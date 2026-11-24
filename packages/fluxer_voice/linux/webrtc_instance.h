#ifndef FLUXER_VOICE_WEBRTC_INSTANCE_H_
#define FLUXER_VOICE_WEBRTC_INSTANCE_H_

namespace flutter_webrtc_plugin {
class FlutterWebRTC;
}

extern "C" flutter_webrtc_plugin::FlutterWebRTC*
flutter_webrtc_plugin_get_shared_instance();

#endif
