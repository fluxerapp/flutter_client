#include "webrtc_noise_filter.h"

#include <cstddef>

#include "flutter_webrtc.h"
#include "fluxer_noise_filter.h"
#include "rtc_audio_processing.h"

namespace fluxer_voice {
namespace {

class NoiseFilterProcessor
    : public libwebrtc::RTCAudioProcessing::CustomProcessing {
 public:
  void Initialize(int sample_rate_hz, int num_channels) override {}

  void Process(int num_bands, int num_frames, int buffer_size,
               float* buffer) override {
    if (num_frames > 0 && buffer_size >= num_frames) {
      fnf_process(buffer, static_cast<size_t>(num_frames));
    }
  }

  void Reset(int new_rate) override {}

  void Release() override {}
};

flutter_webrtc_plugin::FlutterWebRTC* g_attached_to = nullptr;

}

bool AttachNoiseFilter(flutter_webrtc_plugin::FlutterWebRTC* webrtc) {
  if (webrtc == nullptr) {
    return false;
  }
  if (webrtc == g_attached_to) {
    return true;
  }
  auto processing = webrtc->audio_processing();
  if (processing.get() == nullptr) {
    return false;
  }
  static auto* processor = new NoiseFilterProcessor();
  processing->SetCapturePostProcessing(processor);
  g_attached_to = webrtc;
  return true;
}

bool IsNoiseFilterAttached() { return g_attached_to != nullptr; }

}
