set(FLUXER_NOISE_FILTER_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(FLUXER_RNNOISE_DIR "${FLUXER_NOISE_FILTER_DIR}/third_party/rnnoise")
set(FLUXER_SPEEXDSP_DIR "${FLUXER_NOISE_FILTER_DIR}/third_party/speexdsp")

string(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" FLUXER_NOISE_FILTER_PROCESSOR)
if(CMAKE_GENERATOR_PLATFORM)
  string(TOLOWER "${CMAKE_GENERATOR_PLATFORM}" FLUXER_NOISE_FILTER_PROCESSOR)
endif()
if(NOT ANDROID AND FLUXER_NOISE_FILTER_PROCESSOR MATCHES "^(x86_64|amd64|x64)$")
  set(FLUXER_RNNOISE_X64 ON)
else()
  set(FLUXER_RNNOISE_X64 OFF)
endif()

set(FLUXER_RNNOISE_SOURCES
  "${FLUXER_RNNOISE_DIR}/src/celt_lpc.c"
  "${FLUXER_RNNOISE_DIR}/src/denoise.c"
  "${FLUXER_RNNOISE_DIR}/src/kiss_fft.c"
  "${FLUXER_RNNOISE_DIR}/src/nnet.c"
  "${FLUXER_RNNOISE_DIR}/src/nnet_default.c"
  "${FLUXER_RNNOISE_DIR}/src/parse_lpcnet_weights.c"
  "${FLUXER_RNNOISE_DIR}/src/pitch.c"
  "${FLUXER_RNNOISE_DIR}/src/rnn.c"
  "${FLUXER_RNNOISE_DIR}/src/rnnoise_data.c"
  "${FLUXER_RNNOISE_DIR}/src/rnnoise_tables.c"
)
if(FLUXER_RNNOISE_X64)
  list(APPEND FLUXER_RNNOISE_SOURCES
    "${FLUXER_RNNOISE_DIR}/src/x86/nnet_avx2.c"
    "${FLUXER_RNNOISE_DIR}/src/x86/nnet_sse4_1.c"
    "${FLUXER_RNNOISE_DIR}/src/x86/x86_dnn_map.c"
    "${FLUXER_RNNOISE_DIR}/src/x86/x86cpu.c"
  )
endif()

add_library(fluxer_noise_filter STATIC
  "${FLUXER_NOISE_FILTER_DIR}/src/noise_filter.cc"
  "${FLUXER_NOISE_FILTER_DIR}/src/noise_gate.cc"
  "${FLUXER_NOISE_FILTER_DIR}/src/rnnoise_engine.cc"
  "${FLUXER_SPEEXDSP_DIR}/resample.c"
  ${FLUXER_RNNOISE_SOURCES}
)
set_target_properties(fluxer_noise_filter PROPERTIES
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED ON
  C_STANDARD 11
  POSITION_INDEPENDENT_CODE ON
  C_VISIBILITY_PRESET hidden
  CXX_VISIBILITY_PRESET hidden
  VISIBILITY_INLINES_HIDDEN ON
)
target_include_directories(fluxer_noise_filter
  PUBLIC "${FLUXER_NOISE_FILTER_DIR}/include"
  PRIVATE
    "${FLUXER_NOISE_FILTER_DIR}/compat"
    "${FLUXER_RNNOISE_DIR}/include"
    "${FLUXER_RNNOISE_DIR}/src"
    "${FLUXER_SPEEXDSP_DIR}"
)
target_compile_definitions(fluxer_noise_filter PRIVATE
  OUTSIDE_SPEEX
  FLOATING_POINT
  RANDOM_PREFIX=fnf_speex
)
if(FLUXER_RNNOISE_X64)
  target_compile_definitions(fluxer_noise_filter PRIVATE
    RNN_ENABLE_X86_RTCD
    CPU_INFO_BY_C
  )
  if(MSVC)
    target_compile_definitions(fluxer_noise_filter PRIVATE __SSE2__)
    set_source_files_properties("${FLUXER_RNNOISE_DIR}/src/x86/nnet_sse4_1.c"
      PROPERTIES COMPILE_DEFINITIONS "__SSE4_1__")
    set_source_files_properties("${FLUXER_RNNOISE_DIR}/src/x86/nnet_avx2.c"
      PROPERTIES COMPILE_OPTIONS "/arch:AVX2")
  else()
    set_source_files_properties("${FLUXER_RNNOISE_DIR}/src/x86/nnet_sse4_1.c"
      PROPERTIES COMPILE_OPTIONS "-msse4.1")
    set_source_files_properties("${FLUXER_RNNOISE_DIR}/src/x86/nnet_avx2.c"
      PROPERTIES COMPILE_OPTIONS "-mavx;-mfma;-mavx2")
  endif()
endif()
if(MSVC)
  target_compile_definitions(fluxer_noise_filter PRIVATE
    _USE_MATH_DEFINES
    _CRT_SECURE_NO_WARNINGS
  )
  target_compile_options(fluxer_noise_filter PRIVATE /O2)
  set_source_files_properties(
    ${FLUXER_RNNOISE_SOURCES}
    "${FLUXER_SPEEXDSP_DIR}/resample.c"
    PROPERTIES COMPILE_FLAGS "/w")
else()
  target_compile_options(fluxer_noise_filter PRIVATE -O3)
  set_source_files_properties(
    ${FLUXER_RNNOISE_SOURCES}
    "${FLUXER_SPEEXDSP_DIR}/resample.c"
    PROPERTIES COMPILE_FLAGS "-w")
  find_library(FLUXER_NOISE_FILTER_LIBM m)
  if(FLUXER_NOISE_FILTER_LIBM)
    target_link_libraries(fluxer_noise_filter PUBLIC "${FLUXER_NOISE_FILTER_LIBM}")
  endif()
endif()
