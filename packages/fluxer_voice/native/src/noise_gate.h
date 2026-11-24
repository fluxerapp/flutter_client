#ifndef FLUXER_VOICE_NOISE_GATE_H_
#define FLUXER_VOICE_NOISE_GATE_H_

#include <cstddef>

namespace fluxer_voice {

class NoiseGate {
 public:
  void Reset();

  void Process(const float* in, float* out, size_t frames);

 private:
  enum class State { kClosed, kOpen, kClosing };

  void Advance(float rms);

  State state_ = State::kClosed;
  int held_ = 0;
  float gain_ = 0.0f;
};

}

#endif
