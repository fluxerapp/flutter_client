#include "include/fluxer_voice/fluxer_voice_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include <memory>
#include <utility>

#include "fluxer_noise_filter.h"
#include "noise_filter.g.h"
#include "webrtc_instance.h"
#include "webrtc_noise_filter.h"

namespace fluxer_voice {
namespace {

class FluxerVoicePlugin : public ::flutter::Plugin,
                          public VoiceNoiseFilterHostApi {
 public:
  FluxerVoicePlugin() = default;
  ~FluxerVoicePlugin() override = default;

  ErrorOr<bool> Attach() override {
    return AttachNoiseFilter(FlutterWebRTCPluginSharedInstance());
  }

  ErrorOr<bool> SetBackend(const NativeNoiseFilterBackend& backend) override {
    return fnf_set_backend(static_cast<int>(backend)) != 0;
  }

  ErrorOr<NativeNoiseFilterStatus> Status() override {
    fnf_stats stats;
    fnf_get_stats(&stats);
    return NativeNoiseFilterStatus(
        IsNoiseFilterAttached(),
        static_cast<NativeNoiseFilterBackend>(stats.backend),
        static_cast<int64_t>(stats.sample_rate), stats.frames,
        stats.bypassed_frames, stats.recovered_frames,
        static_cast<double>(stats.average_ns) / 1000.0,
        static_cast<double>(stats.max_ns) / 1000.0);
  }
};

}
}

void FluxerVoicePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  auto* windows_registrar =
      ::flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<::flutter::PluginRegistrarWindows>(registrar);
  auto plugin = std::make_unique<fluxer_voice::FluxerVoicePlugin>();
  fluxer_voice::VoiceNoiseFilterHostApi::SetUp(windows_registrar->messenger(),
                                               plugin.get());
  windows_registrar->AddPlugin(std::move(plugin));
}
