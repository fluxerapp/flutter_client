#include <atomic>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
#include <random>
#include <thread>
#include <vector>

#include "fluxer_noise_filter.h"

namespace {

std::atomic<bool> g_forbid_allocation{false};
std::atomic<int> g_allocations{0};
int g_failures = 0;

#define CHECK(condition)                                            \
  do {                                                              \
    if (!(condition)) {                                             \
      std::printf("FAIL %s:%d %s\n", __func__, __LINE__, #condition); \
      ++g_failures;                                                 \
    }                                                               \
  } while (0)

#if defined(__APPLE__) && !defined(FNF_NO_MALLOC_HOOK)
extern "C" {
typedef void(malloc_logger_t)(uint32_t, uintptr_t, uintptr_t, uintptr_t,
                              uintptr_t, uint32_t);
extern malloc_logger_t* malloc_logger;
}

void OnMalloc(uint32_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uint32_t) {
  if (g_forbid_allocation) {
    g_allocations.fetch_add(1);
  }
}

void InstallMallocHook() { malloc_logger = OnMalloc; }
void RemoveMallocHook() { malloc_logger = nullptr; }
#else
void InstallMallocHook() {}
void RemoveMallocHook() {}
#endif

double Rms(const std::vector<float>& samples, size_t from) {
  double energy = 0;
  for (size_t i = from; i < samples.size(); ++i) {
    energy += static_cast<double>(samples[i]) * samples[i];
  }
  return std::sqrt(energy / static_cast<double>(samples.size() - from));
}

double Db(double ratio) { return 20.0 * std::log10(ratio); }

std::vector<float> Noise(size_t count, float amplitude, unsigned seed) {
  std::mt19937 generator(seed);
  std::normal_distribution<float> distribution(0.0f, amplitude);
  std::vector<float> samples(count);
  for (float& sample : samples) {
    sample = distribution(generator);
  }
  return samples;
}

std::vector<float> Voice(size_t count, int rate, float amplitude) {
  std::vector<float> samples(count);
  double phase = 0;
  for (size_t i = 0; i < count; ++i) {
    const double t = static_cast<double>(i) / rate;
    const double pitch = 120.0 + 12.0 * std::sin(2 * M_PI * 3.0 * t);
    phase += 2 * M_PI * pitch / rate;
    const double envelope = 0.55 + 0.45 * std::sin(2 * M_PI * 4.0 * t);
    double value = 0;
    for (int harmonic = 1; harmonic <= 25; ++harmonic) {
      const double frequency = harmonic * pitch;
      if (frequency > rate * 0.45) {
        break;
      }
      const double formants =
          std::exp(-std::pow((frequency - 600) / 250, 2)) +
          0.6 * std::exp(-std::pow((frequency - 1400) / 300, 2)) +
          0.3 * std::exp(-std::pow((frequency - 2500) / 350, 2)) + 0.05;
      value += formants * std::sin(harmonic * phase);
    }
    samples[i] = static_cast<float>(amplitude * envelope * value);
  }
  return samples;
}

void Run(std::vector<float>& samples, size_t frames) {
  for (size_t i = 0; i + frames <= samples.size(); i += frames) {
    fnf_process(samples.data() + i, frames);
  }
}

void Drain(size_t frames) {
  std::vector<float> silence(frames * 20, 0.0f);
  Run(silence, frames);
}

void TestNoneIsBitExact() {
  fnf_set_backend(FNF_BACKEND_NONE);
  Drain(480);
  std::vector<float> samples = Noise(48000, 1000.0f, 1);
  const std::vector<float> original = samples;
  Run(samples, 480);
  CHECK(std::memcmp(samples.data(), original.data(),
                    samples.size() * sizeof(float)) == 0);
}

void TestRnnoiseReducesNoise(int rate) {
  const size_t frames = static_cast<size_t>(rate) / 100;
  CHECK(fnf_set_backend(FNF_BACKEND_RNNOISE) == 1);
  Drain(frames);
  std::vector<float> samples = Noise(static_cast<size_t>(rate) * 4, 600.0f, 2);
  const double before = Rms(samples, samples.size() / 2);
  Run(samples, frames);
  const double after = Rms(samples, samples.size() / 2);
  std::printf("rnnoise %d Hz white noise: %.1f dB\n", rate, Db(after / before));
  CHECK(Db(after / before) < -20.0);
}

void TestRnnoiseKeepsVoice(int rate) {
  const size_t frames = static_cast<size_t>(rate) / 100;
  CHECK(fnf_set_backend(FNF_BACKEND_RNNOISE) == 1);
  Drain(frames);
  std::vector<float> samples =
      Voice(static_cast<size_t>(rate) * 4, rate, 4000.0f);
  const double before = Rms(samples, samples.size() / 2);
  Run(samples, frames);
  const double after = Rms(samples, samples.size() / 2);
  std::printf("rnnoise %d Hz voice: %.1f dB\n", rate, Db(after / before));
  CHECK(Db(after / before) > -6.0);
  CHECK(Db(after / before) < 3.0);
}

void TestGate() {
  CHECK(fnf_set_backend(FNF_BACKEND_GATE) == 1);
  Drain(480);
  std::vector<float> quiet = Noise(48000, 100.0f, 3);
  Run(quiet, 480);
  CHECK(Rms(quiet, 4800) == 0.0);
  std::vector<float> loud = Noise(48000, 2000.0f, 4);
  const double before = Rms(loud, 4800);
  Run(loud, 480);
  CHECK(std::fabs(Db(Rms(loud, 4800) / before)) < 0.1);
  std::vector<float> between = Noise(48000, 200.0f, 5);
  const double held = Rms(between, 4800);
  Run(between, 480);
  CHECK(std::fabs(Db(Rms(between, 4800) / held)) < 0.1);
  int open_frames = 0;
  for (int i = 0; i < 60; ++i) {
    std::vector<float> frame = Noise(480, 100.0f, 100 + i);
    fnf_process(frame.data(), 480);
    if (Rms(frame, 240) > 0.0) {
      ++open_frames;
    }
  }
  std::printf("gate hold: %d0 ms\n", open_frames);
  CHECK(open_frames >= 18 && open_frames <= 21);
}

void TestSwitchIsClickFree() {
  fnf_set_backend(FNF_BACKEND_NONE);
  Drain(480);
  std::vector<float> samples(48000);
  for (size_t i = 0; i < samples.size(); ++i) {
    samples[i] = 8000.0f * std::sin(2 * M_PI * 200.0 * i / 48000.0);
  }
  float worst = 0;
  float previous = 0;
  const int order[] = {FNF_BACKEND_RNNOISE, FNF_BACKEND_GATE, FNF_BACKEND_NONE};
  for (size_t i = 0; i < samples.size(); i += 480) {
    if ((i / 480) % 10 == 5) {
      fnf_set_backend(order[(i / 4800) % 3]);
    }
    fnf_process(samples.data() + i, 480);
    for (size_t j = 0; j < 480; ++j) {
      worst = std::fmax(worst, std::fabs(samples[i + j] - previous));
      previous = samples[i + j];
    }
  }
  std::printf("largest step while switching: %.0f (tone alone: %.0f)\n", worst,
              8000.0 * 2 * M_PI * 200.0 / 48000.0);
  CHECK(worst < 900.0f);
}

void TestRecoversFromInvalidInput() {
  fnf_set_backend(FNF_BACKEND_RNNOISE);
  Drain(480);
  std::vector<float> bad(480, std::numeric_limits<float>::quiet_NaN());
  bad[3] = std::numeric_limits<float>::infinity();
  fnf_process(bad.data(), 480);
  for (float sample : bad) {
    CHECK(std::isfinite(sample));
  }
  std::vector<float> huge(480, 1e30f);
  for (int i = 0; i < 5; ++i) {
    std::vector<float> copy = huge;
    fnf_process(copy.data(), 480);
  }
  std::vector<float> samples = Noise(48000 * 3, 600.0f, 6);
  const double before = Rms(samples, 96000);
  Run(samples, 480);
  CHECK(std::isfinite(Rms(samples, 96000)));
  CHECK(Db(Rms(samples, 96000) / before) < -15.0);
}

void TestUnsupportedSizesBypass() {
  fnf_set_backend(FNF_BACKEND_RNNOISE);
  Drain(480);
  fnf_stats before;
  fnf_get_stats(&before);
  std::vector<float> samples = Noise(441, 500.0f, 7);
  const std::vector<float> original = samples;
  fnf_process(samples.data(), 441);
  CHECK(std::memcmp(samples.data(), original.data(), 441 * sizeof(float)) == 0);
  fnf_stats after;
  fnf_get_stats(&after);
  CHECK(after.bypassed_frames == before.bypassed_frames + 1);
  fnf_process(nullptr, 480);
  CHECK(fnf_set_backend(99) == 0);
  CHECK(fnf_set_backend(-1) == 0);
}

void TestNoAllocationWhileProcessing() {
  fnf_set_backend(FNF_BACKEND_RNNOISE);
  std::vector<float> buffer(480, 100.0f);
  InstallMallocHook();
#if defined(__APPLE__) && !defined(FNF_NO_MALLOC_HOOK)
  g_forbid_allocation = true;
  void* volatile probe = std::malloc(64);
  std::free(probe);
  g_forbid_allocation = false;
  CHECK(g_allocations.exchange(0) > 0);
#endif
  for (int round = 0; round < 60; ++round) {
    fnf_set_backend(round % 3);
    const size_t frames = round % 2 == 0 ? 480 : (round % 4 == 1 ? 160 : 320);
    g_forbid_allocation = true;
    for (int i = 0; i < 10; ++i) {
      fnf_process(buffer.data(), frames);
    }
    g_forbid_allocation = false;
  }
  RemoveMallocHook();
  CHECK(g_allocations.load() == 0);
}

void TestConcurrentSwitching() {
  std::atomic<bool> stop{false};
  std::thread audio([&] {
    std::vector<float> buffer(480);
    while (!stop.load()) {
      fnf_process(buffer.data(), 480);
    }
  });
  for (int i = 0; i < 3000; ++i) {
    fnf_set_backend(i % 3);
    fnf_stats stats;
    fnf_get_stats(&stats);
    if (i % 100 == 0) {
      fnf_reset_stats();
    }
    std::this_thread::yield();
  }
  stop.store(true);
  audio.join();
}

void Benchmark(int backend, const char* name, int rate) {
  const size_t frames = static_cast<size_t>(rate) / 100;
  fnf_set_backend(backend);
  Drain(frames);
  fnf_reset_stats();
  std::vector<float> samples =
      Voice(static_cast<size_t>(rate) * 10, rate, 4000.0f);
  Run(samples, frames);
  fnf_stats stats;
  fnf_get_stats(&stats);
  std::printf("bench %-8s %5d Hz: avg %.1f us, max %.1f us, backend %d\n", name,
              stats.sample_rate, stats.average_ns / 1000.0,
              stats.max_ns / 1000.0, stats.backend);
}

}

int main() {
  TestNoneIsBitExact();
  for (int rate : {48000, 32000, 16000}) {
    TestRnnoiseReducesNoise(rate);
    TestRnnoiseKeepsVoice(rate);
  }
  TestGate();
  TestSwitchIsClickFree();
  TestRecoversFromInvalidInput();
  TestUnsupportedSizesBypass();
  TestNoAllocationWhileProcessing();
  TestConcurrentSwitching();
  for (int rate : {48000, 32000, 16000}) {
    Benchmark(FNF_BACKEND_RNNOISE, "rnnoise", rate);
  }
  Benchmark(FNF_BACKEND_GATE, "gate", 48000);
  std::printf(g_failures == 0 ? "OK\n" : "%d failures\n", g_failures);
  return g_failures == 0 ? 0 : 1;
}
