#ifndef FLUXER_VOICE_OS_SUPPORT_H_
#define FLUXER_VOICE_OS_SUPPORT_H_

#include "common.h"

#define OPUS_CLEAR(dst, n) RNN_CLEAR(dst, n)
#define OPUS_COPY(dst, src, n) RNN_COPY(dst, src, n)
#define OPUS_MOVE(dst, src, n) RNN_MOVE(dst, src, n)

#endif
