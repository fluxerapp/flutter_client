cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "fluxer_voice")
project(${PROJECT_NAME} LANGUAGES C CXX)

set(PLUGIN_NAME "fluxer_voice_plugin")

include("${CMAKE_CURRENT_SOURCE_DIR}/../native/noise_filter.cmake")

add_library(${PLUGIN_NAME} SHARED
  "fluxer_voice_plugin.cc"
  "noise_filter.g.cc"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_STANDARD 17
  CXX_VISIBILITY_PRESET hidden
)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME}
  INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include"
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../desktop"
)
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
target_link_libraries(${PLUGIN_NAME} PRIVATE PkgConfig::GTK)
target_link_libraries(${PLUGIN_NAME} PRIVATE fluxer_noise_filter)
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter_webrtc_plugin)

get_target_property(FLUTTER_WEBRTC_LINUX_DIR flutter_webrtc_plugin SOURCE_DIR)
add_library(fluxer_voice_webrtc OBJECT "../desktop/webrtc_noise_filter.cc")
apply_standard_settings(fluxer_voice_webrtc)
set_target_properties(fluxer_voice_webrtc PROPERTIES
  CXX_STANDARD 17
  CXX_VISIBILITY_PRESET hidden
  POSITION_INDEPENDENT_CODE ON
)
target_compile_definitions(fluxer_voice_webrtc PRIVATE RTC_DESKTOP_DEVICE)
target_compile_options(fluxer_voice_webrtc PRIVATE -include cstdint)
target_include_directories(fluxer_voice_webrtc PRIVATE
  "${FLUTTER_WEBRTC_LINUX_DIR}/flutter/include"
  "${CMAKE_CURRENT_SOURCE_DIR}/../native/include"
)
target_link_libraries(fluxer_voice_webrtc PRIVATE flutter flutter_webrtc_plugin)
target_link_libraries(fluxer_voice_webrtc PRIVATE PkgConfig::GTK)
target_link_libraries(${PLUGIN_NAME} PRIVATE fluxer_voice_webrtc)

set(fluxer_voice_bundled_libraries "" PARENT_SCOPE)
