cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "fluxer_voice")
project(${PROJECT_NAME} LANGUAGES C CXX)

set(PLUGIN_NAME "fluxer_voice_plugin")

include("${CMAKE_CURRENT_SOURCE_DIR}/../native/noise_filter.cmake")

add_library(${PLUGIN_NAME} SHARED
  "fluxer_voice_plugin.cpp"
  "noise_filter.g.cpp"
  "noise_filter.g.h"
  "../desktop/webrtc_noise_filter.cc"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE
  FLUTTER_PLUGIN_IMPL
  LIB_WEBRTC_API_DLL
  RTC_DESKTOP_DEVICE
)
target_include_directories(${PLUGIN_NAME}
  INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include"
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../desktop"
)
target_link_libraries(${PLUGIN_NAME} PRIVATE
  flutter
  flutter_wrapper_plugin
  fluxer_noise_filter
  flutter_webrtc_plugin
)

set(fluxer_voice_bundled_libraries "" PARENT_SCOPE)
