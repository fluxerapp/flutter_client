#include <jni.h>

#include "fluxer_noise_filter.h"

extern "C" {

JNIEXPORT jboolean JNICALL
Java_com_fluxer_voice_NativeNoiseFilterEngine_nativeSetBackend(JNIEnv*, jobject,
                                                               jint backend) {
  return fnf_set_backend(backend) != 0 ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT void JNICALL
Java_com_fluxer_voice_NativeNoiseFilterEngine_nativeProcess(JNIEnv* env,
                                                            jobject,
                                                            jobject buffer,
                                                            jint frames) {
  auto* samples = static_cast<float*>(env->GetDirectBufferAddress(buffer));
  fnf_process(samples, static_cast<size_t>(frames));
}

JNIEXPORT jlongArray JNICALL
Java_com_fluxer_voice_NativeNoiseFilterEngine_nativeStats(JNIEnv* env,
                                                          jobject) {
  fnf_stats stats;
  fnf_get_stats(&stats);
  const jlong values[] = {
      stats.backend,         stats.sample_rate,      stats.frames,
      stats.bypassed_frames, stats.recovered_frames, stats.average_ns,
      stats.max_ns,
  };
  constexpr jsize count = sizeof(values) / sizeof(values[0]);
  jlongArray result = env->NewLongArray(count);
  if (result != nullptr) {
    env->SetLongArrayRegion(result, 0, count, values);
  }
  return result;
}

}
