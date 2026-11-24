#include "fluxer_noise_filter.h"

#include <atomic>
#include <chrono>
#include <cmath>
#include <cstring>

#include "noise_gate.h"
#include "rnnoise_engine.h"

namespace fluxer_voice {
namespace {

constexpr int kFadeFrames = 2;
constexpr int kRnnoiseWarmupFrames = 2;

bool IsSupported(size_t frames) {
  return frames == 160 || frames == 320 || frames == kModelFrames;
}

void Sanitize(const float* in, float* out, size_t frames) {
  for (size_t i = 0; i < frames; ++i) {
    out[i] = std::isfinite(in[i]) ? in[i] : 0.0f;
  }
}

bool IsFinite(const float* samples, size_t frames) {
  for (size_t i = 0; i < frames; ++i) {
    if (!std::isfinite(samples[i])) {
      return false;
    }
  }
  return true;
}

class NoiseFilter {
 public:
  bool SetBackend(int backend) {
    if (backend < FNF_BACKEND_NONE || backend > FNF_BACKEND_RNNOISE) {
      return false;
    }
    if (backend == FNF_BACKEND_RNNOISE && !PrepareRnnoise()) {
      return false;
    }
    requested_.store(backend, std::memory_order_release);
    return true;
  }

  bool Process(float* samples, size_t frames) {
    if (busy_.test_and_set(std::memory_order_acquire)) {
      bypassed_.fetch_add(1, std::memory_order_relaxed);
      return false;
    }
    const bool processed = ProcessExclusive(samples, frames);
    busy_.clear(std::memory_order_release);
    return processed;
  }

  void GetStats(fnf_stats* stats) const {
    const int64_t frames = frames_.load(std::memory_order_relaxed);
    stats->backend = running_.load(std::memory_order_relaxed);
    stats->sample_rate = sample_rate_.load(std::memory_order_relaxed);
    stats->frames = frames;
    stats->bypassed_frames = bypassed_.load(std::memory_order_relaxed);
    stats->recovered_frames = recovered_.load(std::memory_order_relaxed);
    stats->average_ns =
        frames > 0 ? total_ns_.load(std::memory_order_relaxed) / frames : 0;
    stats->max_ns = max_ns_.load(std::memory_order_relaxed);
  }

  void ResetStats() {
    frames_.store(0, std::memory_order_relaxed);
    bypassed_.store(0, std::memory_order_relaxed);
    recovered_.store(0, std::memory_order_relaxed);
    total_ns_.store(0, std::memory_order_relaxed);
    max_ns_.store(0, std::memory_order_relaxed);
  }

 private:
  bool PrepareRnnoise() {
    if (rnnoise_.load(std::memory_order_acquire) != nullptr) {
      return true;
    }
    RnnoiseEngine* engine = RnnoiseEngine::Create();
    if (engine == nullptr) {
      return false;
    }
    rnnoise_.store(engine, std::memory_order_release);
    return true;
  }

  bool ProcessExclusive(float* samples, size_t frames) {
    const int requested = requested_.load(std::memory_order_acquire);
    sample_rate_.store(static_cast<int32_t>(frames * 100),
                       std::memory_order_relaxed);
    if (active_ == FNF_BACKEND_NONE && next_ == FNF_BACKEND_NONE &&
        requested == FNF_BACKEND_NONE) {
      return false;
    }
    if (!IsSupported(frames)) {
      active_ = FNF_BACKEND_NONE;
      next_ = FNF_BACKEND_NONE;
      last_frames_ = 0;
      running_.store(FNF_BACKEND_NONE, std::memory_order_relaxed);
      bypassed_.fetch_add(1, std::memory_order_relaxed);
      return false;
    }
    const auto start = std::chrono::steady_clock::now();
    if (frames != last_frames_) {
      last_frames_ = frames;
      ResetBackend(active_);
      ResetBackend(next_);
    }
    if (next_ == active_ && requested != active_) {
      next_ = requested;
      transition_frame_ = 0;
      ResetBackend(next_);
    }
    Render(samples, frames);
    const int64_t elapsed =
        std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::steady_clock::now() - start)
            .count();
    frames_.fetch_add(1, std::memory_order_relaxed);
    total_ns_.fetch_add(elapsed, std::memory_order_relaxed);
    if (elapsed > max_ns_.load(std::memory_order_relaxed)) {
      max_ns_.store(elapsed, std::memory_order_relaxed);
    }
    return true;
  }

  void Render(float* samples, size_t frames) {
    float input[kModelFrames];
    Sanitize(samples, input, frames);
    float current[kModelFrames];
    if (!Apply(active_, input, current, frames)) {
      std::memcpy(samples, input, frames * sizeof(float));
      return;
    }
    if (next_ == active_) {
      std::memcpy(samples, current, frames * sizeof(float));
      return;
    }
    float target[kModelFrames];
    if (!Apply(next_, input, target, frames)) {
      std::memcpy(samples, current, frames * sizeof(float));
      return;
    }
    Crossfade(current, target, samples, frames);
    if (++transition_frame_ >= WarmupFrames() + kFadeFrames) {
      active_ = next_;
      running_.store(active_, std::memory_order_relaxed);
    }
  }

  int WarmupFrames() const {
    return next_ == FNF_BACKEND_RNNOISE ? kRnnoiseWarmupFrames : 0;
  }

  void Crossfade(const float* from, const float* to, float* out,
                 size_t frames) const {
    const int fade_frame = transition_frame_ - WarmupFrames();
    if (fade_frame < 0) {
      std::memcpy(out, from, frames * sizeof(float));
      return;
    }
    const float total = static_cast<float>(frames * kFadeFrames);
    const size_t offset = static_cast<size_t>(fade_frame) * frames;
    for (size_t i = 0; i < frames; ++i) {
      const float mix = static_cast<float>(offset + i + 1) / total;
      out[i] = from[i] + (to[i] - from[i]) * mix;
    }
  }

  bool Apply(int backend, const float* in, float* out, size_t frames) {
    switch (backend) {
      case FNF_BACKEND_GATE:
        gate_.Process(in, out, frames);
        return true;
      case FNF_BACKEND_RNNOISE: {
        RnnoiseEngine* engine = rnnoise_.load(std::memory_order_acquire);
        engine->Process(in, out, frames);
        if (IsFinite(out, frames)) {
          return true;
        }
        engine->Reset();
        recovered_.fetch_add(1, std::memory_order_relaxed);
        return false;
      }
      default:
        std::memcpy(out, in, frames * sizeof(float));
        return true;
    }
  }

  void ResetBackend(int backend) {
    if (backend == FNF_BACKEND_GATE) {
      gate_.Reset();
    } else if (backend == FNF_BACKEND_RNNOISE) {
      rnnoise_.load(std::memory_order_acquire)->Reset();
    }
  }

  std::atomic<int> requested_{FNF_BACKEND_NONE};
  std::atomic<int> running_{FNF_BACKEND_NONE};
  std::atomic<RnnoiseEngine*> rnnoise_{nullptr};
  std::atomic_flag busy_ = ATOMIC_FLAG_INIT;
  std::atomic<int32_t> sample_rate_{0};
  std::atomic<int64_t> frames_{0};
  std::atomic<int64_t> bypassed_{0};
  std::atomic<int64_t> recovered_{0};
  std::atomic<int64_t> total_ns_{0};
  std::atomic<int64_t> max_ns_{0};

  NoiseGate gate_;
  int active_ = FNF_BACKEND_NONE;
  int next_ = FNF_BACKEND_NONE;
  int transition_frame_ = 0;
  size_t last_frames_ = 0;
};

NoiseFilter g_filter;

}
}

int fnf_set_backend(int backend) {
  return fluxer_voice::g_filter.SetBackend(backend) ? 1 : 0;
}

int fnf_process(float* samples, size_t frames) {
  if (samples == nullptr || frames == 0) {
    return 0;
  }
  return fluxer_voice::g_filter.Process(samples, frames) ? 1 : 0;
}

void fnf_get_stats(fnf_stats* stats) {
  if (stats != nullptr) {
    fluxer_voice::g_filter.GetStats(stats);
  }
}

void fnf_reset_stats(void) {
  fluxer_voice::g_filter.ResetStats();
}
