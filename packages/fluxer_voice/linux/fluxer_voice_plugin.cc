#include "include/fluxer_voice/fluxer_voice_plugin.h"

#include "fluxer_noise_filter.h"
#include "noise_filter.g.h"
#include "webrtc_instance.h"
#include "webrtc_noise_filter.h"

static FluxerVoiceVoiceNoiseFilterHostApiAttachResponse* handle_attach(
    gpointer user_data) {
  const bool attached = fluxer_voice::AttachNoiseFilter(
      flutter_webrtc_plugin_get_shared_instance());
  return fluxer_voice_voice_noise_filter_host_api_attach_response_new(attached);
}

static FluxerVoiceVoiceNoiseFilterHostApiSetBackendResponse* handle_set_backend(
    FluxerVoiceNativeNoiseFilterBackend backend, gpointer user_data) {
  return fluxer_voice_voice_noise_filter_host_api_set_backend_response_new(
      fnf_set_backend(static_cast<int>(backend)) != 0);
}

static FluxerVoiceVoiceNoiseFilterHostApiStatusResponse* handle_status(
    gpointer user_data) {
  fnf_stats stats;
  fnf_get_stats(&stats);
  g_autoptr(FluxerVoiceNativeNoiseFilterStatus) status =
      fluxer_voice_native_noise_filter_status_new(
          fluxer_voice::IsNoiseFilterAttached(),
          static_cast<FluxerVoiceNativeNoiseFilterBackend>(stats.backend),
          stats.sample_rate, stats.frames, stats.bypassed_frames,
          stats.recovered_frames, stats.average_ns / 1000.0,
          stats.max_ns / 1000.0);
  return fluxer_voice_voice_noise_filter_host_api_status_response_new(status);
}

static FluxerVoiceVoiceNoiseFilterHostApiVTable host_api_vtable = {
    .attach = handle_attach,
    .set_backend = handle_set_backend,
    .status = handle_status,
};

void fluxer_voice_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  fluxer_voice_voice_noise_filter_host_api_set_method_handlers(
      fl_plugin_registrar_get_messenger(registrar), nullptr, &host_api_vtable,
      nullptr, nullptr);
}
