cmake_minimum_required(VERSION 3.15)
project(fluxer_voice LANGUAGES C CXX)

include("${CMAKE_CURRENT_SOURCE_DIR}/../../../../native/noise_filter.cmake")

add_library(fluxer_voice SHARED noise_filter_jni.cc)
set_target_properties(fluxer_voice PROPERTIES
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED ON
  CXX_VISIBILITY_PRESET hidden
)
target_link_libraries(fluxer_voice PRIVATE fluxer_noise_filter)
target_link_options(fluxer_voice PRIVATE
  "-Wl,-z,max-page-size=16384"
  "-Wl,--exclude-libs,ALL"
)
