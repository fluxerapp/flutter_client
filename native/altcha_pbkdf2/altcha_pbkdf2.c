#include <stdint.h>
#include <string.h>

#if defined(_WIN32)
#define ALTCHA_EXPORT __declspec(dllexport)
#else
#define ALTCHA_EXPORT __attribute__((visibility("default")))
#endif

#if defined(_MSC_VER) && !defined(__clang__)
#include <intrin.h>
#define ATOMIC_FETCH_ADD(p, n) \
  ((uint32_t)_InterlockedExchangeAdd((volatile long *)(p), (long)(n)))
#define ATOMIC_LOAD(p) ((uint32_t)_InterlockedOr((volatile long *)(p), 0))
#define ATOMIC_STORE(p, v) _InterlockedExchange((volatile long *)(p), (long)(v))
#else
#define ATOMIC_FETCH_ADD(p, n) __atomic_fetch_add((p), (n), __ATOMIC_RELAXED)
#define ATOMIC_LOAD(p) __atomic_load_n((p), __ATOMIC_ACQUIRE)
#define ATOMIC_STORE(p, v) __atomic_store_n((p), (v), __ATOMIC_RELEASE)
#endif

#if defined(__aarch64__) && (defined(__clang__) || defined(__GNUC__))
#define ALTCHA_ARM_SHA2 1
#include <arm_neon.h>
#if defined(__linux__)
#include <sys/auxv.h>
#ifndef HWCAP_SHA2
#define HWCAP_SHA2 (1 << 6)
#endif
#endif
#endif

#define LANES 4
#define BLOCK_BYTES 64
#define DIGEST_BYTES 32
#define MAX_SALT_BYTES 51

#define SOLVE_UNSUPPORTED (-2)
#define SOLVE_STOPPED (-1)

static const uint32_t K[64] = {
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1,
    0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
    0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786,
    0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147,
    0x06ca6351, 0x14292967, 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
    0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b,
    0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a,
    0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
    0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,
};

static const uint32_t INITIAL_STATE[8] = {
    0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
    0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19,
};

typedef void (*compress_fn)(uint32_t state[LANES][8],
                            uint32_t block[LANES][16],
                            uint32_t out[LANES][8]);

#define ROTR(x, n) (((x) >> (n)) | ((x) << (32 - (n))))

static void compress_one(const uint32_t state[8], const uint32_t block[16],
                         uint32_t out[8]) {
  uint32_t w[64];
  memcpy(w, block, 16 * sizeof(uint32_t));
  for (int t = 16; t < 64; t++) {
    uint32_t s0 = ROTR(w[t - 15], 7) ^ ROTR(w[t - 15], 18) ^ (w[t - 15] >> 3);
    uint32_t s1 = ROTR(w[t - 2], 17) ^ ROTR(w[t - 2], 19) ^ (w[t - 2] >> 10);
    w[t] = w[t - 16] + s0 + w[t - 7] + s1;
  }
  uint32_t a = state[0], b = state[1], c = state[2], d = state[3];
  uint32_t e = state[4], f = state[5], g = state[6], h = state[7];
  for (int t = 0; t < 64; t++) {
    uint32_t t1 = h + (ROTR(e, 6) ^ ROTR(e, 11) ^ ROTR(e, 25)) +
                  ((e & f) ^ (~e & g)) + K[t] + w[t];
    uint32_t t2 = (ROTR(a, 2) ^ ROTR(a, 13) ^ ROTR(a, 22)) +
                  ((a & b) ^ (a & c) ^ (b & c));
    h = g;
    g = f;
    f = e;
    e = d + t1;
    d = c;
    c = b;
    b = a;
    a = t1 + t2;
  }
  out[0] = state[0] + a;
  out[1] = state[1] + b;
  out[2] = state[2] + c;
  out[3] = state[3] + d;
  out[4] = state[4] + e;
  out[5] = state[5] + f;
  out[6] = state[6] + g;
  out[7] = state[7] + h;
}

static void compress_portable(uint32_t state[LANES][8],
                              uint32_t block[LANES][16],
                              uint32_t out[LANES][8]) {
  for (int lane = 0; lane < LANES; lane++) {
    compress_one(state[lane], block[lane], out[lane]);
  }
}

#if defined(ALTCHA_ARM_SHA2)
#if defined(__clang__)
#define ALTCHA_SHA2_TARGET __attribute__((target("sha2")))
#else
#define ALTCHA_SHA2_TARGET __attribute__((target("+crypto")))
#endif

ALTCHA_SHA2_TARGET
static void compress_arm(uint32_t state[LANES][8],
                         uint32_t block[LANES][16],
                         uint32_t out[LANES][8]) {
  uint32x4_t abcd[LANES], efgh[LANES], msg[LANES][4];
  for (int lane = 0; lane < LANES; lane++) {
    abcd[lane] = vld1q_u32(&state[lane][0]);
    efgh[lane] = vld1q_u32(&state[lane][4]);
    for (int q = 0; q < 4; q++) {
      msg[lane][q] = vld1q_u32(&block[lane][q * 4]);
    }
  }
  for (int i = 0; i < 16; i++) {
    const uint32x4_t k = vld1q_u32(&K[i * 4]);
    for (int lane = 0; lane < LANES; lane++) {
      const uint32x4_t wk = vaddq_u32(msg[lane][i & 3], k);
      const uint32x4_t abcd_prev = abcd[lane];
      abcd[lane] = vsha256hq_u32(abcd[lane], efgh[lane], wk);
      efgh[lane] = vsha256h2q_u32(efgh[lane], abcd_prev, wk);
      if (i < 12) {
        msg[lane][i & 3] = vsha256su1q_u32(
            vsha256su0q_u32(msg[lane][i & 3], msg[lane][(i + 1) & 3]),
            msg[lane][(i + 2) & 3], msg[lane][(i + 3) & 3]);
      }
    }
  }
  for (int lane = 0; lane < LANES; lane++) {
    vst1q_u32(&out[lane][0], vaddq_u32(abcd[lane], vld1q_u32(&state[lane][0])));
    vst1q_u32(&out[lane][4], vaddq_u32(efgh[lane], vld1q_u32(&state[lane][4])));
  }
}

static int has_arm_sha2(void) {
#if defined(__APPLE__)
  return 1;
#elif defined(__linux__)
  return (getauxval(AT_HWCAP) & HWCAP_SHA2) != 0;
#else
  return 0;
#endif
}
#endif

static compress_fn select_compress(void) {
#if defined(ALTCHA_ARM_SHA2)
  if (has_arm_sha2()) {
    return compress_arm;
  }
#endif
  return compress_portable;
}

static void load_words(uint32_t block[16], const uint8_t bytes[BLOCK_BYTES],
                       uint8_t pad) {
  for (int i = 0; i < 16; i++) {
    block[i] = ((uint32_t)(bytes[i * 4] ^ pad) << 24) |
               ((uint32_t)(bytes[i * 4 + 1] ^ pad) << 16) |
               ((uint32_t)(bytes[i * 4 + 2] ^ pad) << 8) |
               (uint32_t)(bytes[i * 4 + 3] ^ pad);
  }
}

static void load_digest_block(uint32_t block[16], const uint32_t digest[8]) {
  memcpy(block, digest, 8 * sizeof(uint32_t));
  block[8] = 0x80000000u;
  memset(&block[9], 0, 6 * sizeof(uint32_t));
  block[15] = (BLOCK_BYTES + DIGEST_BYTES) * 8;
}

static void pbkdf2_lanes(compress_fn compress, const uint8_t *nonce,
                         uint32_t nonce_len, uint32_t first_counter,
                         const uint32_t salt_block[16], uint32_t iterations,
                         uint8_t keys[LANES][DIGEST_BYTES]) {
  uint32_t initial[LANES][8];
  uint32_t inner[LANES][8];
  uint32_t outer[LANES][8];
  uint32_t block[LANES][16];
  uint32_t u[LANES][8];
  uint32_t accumulator[LANES][8];

  for (int lane = 0; lane < LANES; lane++) {
    uint8_t password[BLOCK_BYTES];
    memset(password, 0, sizeof(password));
    memcpy(password, nonce, nonce_len);
    const uint32_t counter = first_counter + (uint32_t)lane;
    password[nonce_len] = (uint8_t)(counter >> 24);
    password[nonce_len + 1] = (uint8_t)(counter >> 16);
    password[nonce_len + 2] = (uint8_t)(counter >> 8);
    password[nonce_len + 3] = (uint8_t)counter;
    memcpy(initial[lane], INITIAL_STATE, sizeof(INITIAL_STATE));
    load_words(block[lane], password, 0x36);
  }
  compress(initial, block, inner);
  for (int lane = 0; lane < LANES; lane++) {
    for (int i = 0; i < 16; i++) {
      block[lane][i] ^= 0x36363636u ^ 0x5c5c5c5cu;
    }
  }
  compress(initial, block, outer);

  for (int lane = 0; lane < LANES; lane++) {
    memcpy(block[lane], salt_block, 16 * sizeof(uint32_t));
  }
  compress(inner, block, u);
  for (int lane = 0; lane < LANES; lane++) {
    load_digest_block(block[lane], u[lane]);
  }
  compress(outer, block, u);
  memcpy(accumulator, u, sizeof(u));

  for (uint32_t iteration = 1; iteration < iterations; iteration++) {
    for (int lane = 0; lane < LANES; lane++) {
      load_digest_block(block[lane], u[lane]);
    }
    compress(inner, block, u);
    for (int lane = 0; lane < LANES; lane++) {
      load_digest_block(block[lane], u[lane]);
    }
    compress(outer, block, u);
    for (int lane = 0; lane < LANES; lane++) {
      for (int i = 0; i < 8; i++) {
        accumulator[lane][i] ^= u[lane][i];
      }
    }
  }

  for (int lane = 0; lane < LANES; lane++) {
    for (int i = 0; i < 8; i++) {
      keys[lane][i * 4] = (uint8_t)(accumulator[lane][i] >> 24);
      keys[lane][i * 4 + 1] = (uint8_t)(accumulator[lane][i] >> 16);
      keys[lane][i * 4 + 2] = (uint8_t)(accumulator[lane][i] >> 8);
      keys[lane][i * 4 + 3] = (uint8_t)accumulator[lane][i];
    }
  }
}

ALTCHA_EXPORT int64_t fluxer_altcha_solve(const uint8_t *nonce,
                                          uint32_t nonce_len,
                                          const uint8_t *salt,
                                          uint32_t salt_len,
                                          uint32_t iterations,
                                          const uint8_t *prefix,
                                          uint32_t prefix_len,
                                          uint32_t *shared,
                                          uint8_t *out_key) {
  if (nonce_len + 4 > BLOCK_BYTES || salt_len > MAX_SALT_BYTES ||
      prefix_len > DIGEST_BYTES || iterations == 0) {
    return SOLVE_UNSUPPORTED;
  }
  const compress_fn compress = select_compress();

  uint8_t message[BLOCK_BYTES];
  memset(message, 0, sizeof(message));
  memcpy(message, salt, salt_len);
  message[salt_len + 3] = 1;
  message[salt_len + 4] = 0x80;
  const uint32_t bits = (BLOCK_BYTES + salt_len + 4) * 8;
  message[62] = (uint8_t)(bits >> 8);
  message[63] = (uint8_t)bits;
  uint32_t salt_block[16];
  load_words(salt_block, message, 0);

  uint8_t keys[LANES][DIGEST_BYTES];
  for (;;) {
    if (ATOMIC_LOAD(&shared[1]) != 0) {
      return SOLVE_STOPPED;
    }
    const uint32_t first = ATOMIC_FETCH_ADD(&shared[0], (uint32_t)LANES);
    if (first > UINT32_MAX - LANES) {
      return SOLVE_STOPPED;
    }
    pbkdf2_lanes(compress, nonce, nonce_len, first, salt_block, iterations,
                 keys);
    for (int lane = 0; lane < LANES; lane++) {
      if (memcmp(keys[lane], prefix, prefix_len) == 0) {
        ATOMIC_STORE(&shared[1], 1u);
        memcpy(out_key, keys[lane], DIGEST_BYTES);
        return (int64_t)first + lane;
      }
    }
  }
}
