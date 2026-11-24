#ifndef FLUXER_VOICE_WEBRTC_INSTANCE_H_
#define FLUXER_VOICE_WEBRTC_INSTANCE_H_

namespace flutter_webrtc_plugin {
class FlutterWebRTC;
}

extern "C" __declspec(dllimport) flutter_webrtc_plugin::FlutterWebRTC*
FlutterWebRTCPluginSharedInstance();

#endif
