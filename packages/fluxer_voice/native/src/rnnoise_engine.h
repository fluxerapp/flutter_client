#ifndef FLUXER_VOICE_RNNOISE_ENGINE_H_
#define FLUXER_VOICE_RNNOISE_ENGINE_H_

#include <cstddef>

struct DenoiseState;
struct SpeexResamplerState_;

namespace fluxer_voice {

constexpr size_t kModelFrames = 480;

class RnnoiseEngine {
 public:
  static RnnoiseEngine* Create();

  RnnoiseEngine(const RnnoiseEngine&) = delete;
  RnnoiseEngine& operator=(const RnnoiseEngine&) = delete;

  void Reset();

  void Process(const float* in, float* out, size_t frames);

 private:
  struct RatePair {
    SpeexResamplerState_* up = nullptr;
    SpeexResamplerState_* down = nullptr;
  };

  RnnoiseEngine() = default;
  ~RnnoiseEngine();

  bool Init();

  void Warm();

  DenoiseState* state_ = nullptr;
  RatePair narrow_;
  RatePair wide_;
};

}

#endif
