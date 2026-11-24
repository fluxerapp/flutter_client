#include "noise_gate.h"

#include <cmath>

namespace fluxer_voice {
namespace {

constexpr float kOpenThreshold = 272.55235f;
constexpr float kCloseThreshold = 136.59976f;
constexpr int kHoldFrames = 18;
constexpr float kRampSeconds = 0.005f;

}

void NoiseGate::Reset() {
  state_ = State::kClosed;
  held_ = 0;
  gain_ = 0.0f;
}

void NoiseGate::Process(const float* in, float* out, size_t frames) {
  float energy = 0.0f;
  for (size_t i = 0; i < frames; ++i) {
    energy += in[i] * in[i];
  }
  Advance(std::sqrt(energy / static_cast<float>(frames)));
  const float target = state_ == State::kClosed ? 0.0f : 1.0f;
  const float step =
      1.0f / (kRampSeconds * static_cast<float>(frames) * 100.0f);
  for (size_t i = 0; i < frames; ++i) {
    if (gain_ < target) {
      gain_ = gain_ + step < target ? gain_ + step : target;
    } else if (gain_ > target) {
      gain_ = gain_ - step > target ? gain_ - step : target;
    }
    out[i] = in[i] * gain_;
  }
}

void NoiseGate::Advance(float rms) {
  switch (state_) {
    case State::kClosed:
      if (rms > kOpenThreshold) {
        state_ = State::kOpen;
      }
      break;
    case State::kOpen:
      if (rms < kCloseThreshold) {
        state_ = State::kClosing;
        held_ = 0;
      }
      break;
    case State::kClosing:
      if (rms > kCloseThreshold) {
        state_ = State::kOpen;
      } else if (held_ > kHoldFrames) {
        state_ = State::kClosed;
      } else {
        ++held_;
      }
      break;
  }
}

}
