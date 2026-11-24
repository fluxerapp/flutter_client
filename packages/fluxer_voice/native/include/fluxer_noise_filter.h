#ifndef FLUXER_NOISE_FILTER_H_
#define FLUXER_NOISE_FILTER_H_

#include <stddef.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
  FNF_BACKEND_NONE = 0,
  FNF_BACKEND_GATE = 1,
  FNF_BACKEND_RNNOISE = 2,
} fnf_backend;

typedef struct {
  int32_t backend;
  int32_t sample_rate;
  int64_t frames;
  int64_t bypassed_frames;
  int64_t recovered_frames;
  int64_t average_ns;
  int64_t max_ns;
} fnf_stats;

int fnf_set_backend(int backend);

int fnf_process(float* samples, size_t frames);

void fnf_get_stats(fnf_stats* stats);

void fnf_reset_stats(void);

#ifdef __cplusplus
}
#endif

#endif
