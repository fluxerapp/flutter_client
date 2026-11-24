#include "rnnoise_engine.h"

#include <cstring>
#include <initializer_list>
#include <new>

#include "rnnoise.h"
#include "speex_resampler.h"

namespace fluxer_voice {
namespace {

constexpr int kModelRate = 48000;
constexpr int kResamplerQuality = 4;
constexpr int kWarmFrames = 4;

void Resample(SpeexResamplerState* resampler, const float* in, size_t in_frames,
              float* out, size_t out_frames) {
  spx_uint32_t consumed = static_cast<spx_uint32_t>(in_frames);
  spx_uint32_t produced = static_cast<spx_uint32_t>(out_frames);
  speex_resampler_process_float(resampler, 0, in, &consumed, out, &produced);
  if (produced < out_frames) {
    std::memset(out + produced, 0, (out_frames - produced) * sizeof(float));
  }
}

}

RnnoiseEngine* RnnoiseEngine::Create() {
  auto* engine = new (std::nothrow) RnnoiseEngine();
  if (engine != nullptr && !engine->Init()) {
    delete engine;
    return nullptr;
  }
  return engine;
}

RnnoiseEngine::~RnnoiseEngine() {
  if (state_ != nullptr) {
    rnnoise_destroy(state_);
  }
  for (RatePair* pair : {&narrow_, &wide_}) {
    if (pair->up != nullptr) {
      speex_resampler_destroy(pair->up);
    }
    if (pair->down != nullptr) {
      speex_resampler_destroy(pair->down);
    }
  }
}

bool RnnoiseEngine::Init() {
  if (rnnoise_get_frame_size() != static_cast<int>(kModelFrames)) {
    return false;
  }
  state_ = rnnoise_create(nullptr);
  narrow_.up =
      speex_resampler_init(1, 16000, kModelRate, kResamplerQuality, nullptr);
  narrow_.down =
      speex_resampler_init(1, kModelRate, 16000, kResamplerQuality, nullptr);
  wide_.up =
      speex_resampler_init(1, 32000, kModelRate, kResamplerQuality, nullptr);
  wide_.down =
      speex_resampler_init(1, kModelRate, 32000, kResamplerQuality, nullptr);
  if (state_ == nullptr || narrow_.up == nullptr || narrow_.down == nullptr ||
      wide_.up == nullptr || wide_.down == nullptr) {
    return false;
  }
  Warm();
  return true;
}

void RnnoiseEngine::Warm() {
  float samples[kModelFrames];
  for (int frame = 0; frame < kWarmFrames; ++frame) {
    for (size_t i = 0; i < kModelFrames; ++i) {
      samples[i] = i % 2 == 0 ? 500.0f : -500.0f;
    }
    rnnoise_process_frame(state_, samples, samples);
  }
  Reset();
}

void RnnoiseEngine::Reset() {
  rnnoise_init(state_, nullptr);
  for (RatePair* pair : {&narrow_, &wide_}) {
    speex_resampler_reset_mem(pair->up);
    speex_resampler_reset_mem(pair->down);
  }
}

void RnnoiseEngine::Process(const float* in, float* out, size_t frames) {
  if (frames == kModelFrames) {
    rnnoise_process_frame(state_, out, in);
    return;
  }
  const RatePair& pair = frames == 160 ? narrow_ : wide_;
  float model[kModelFrames];
  Resample(pair.up, in, frames, model, kModelFrames);
  rnnoise_process_frame(state_, model, model);
  Resample(pair.down, model, kModelFrames, out, frames);
}

}
