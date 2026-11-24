Pod::Spec.new do |s|
  s.name                = 'fluxer_voice'
  s.version             = '0.0.1'
  s.summary             = 'Fluxer native voice handling package'
  s.description         = 'Fluxer native voice handling package'
  s.homepage            = 'https://github.com/fluxerapp'
  s.license             = { :type => 'AGPL-3.0' }
  s.author              = 'Fluxer'
  s.source              = { :path => '.' }
  s.source_files        = 'fluxer_voice/Sources/fluxer_voice/**/*.swift',
                          'fluxer_voice/Sources/fluxer_noise_filter/{include,src,compat}/*.{h,cc}',
                          'fluxer_voice/Sources/fluxer_noise_filter/third_party/rnnoise/{include,src}/*.{h,c}',
                          'fluxer_voice/Sources/fluxer_noise_filter/third_party/speexdsp/*.{h,c}'
  s.public_header_files = 'fluxer_voice/Sources/fluxer_noise_filter/include/fluxer_noise_filter.h'
  s.library             = 'c++'
  s.platform            = :ios, '16.0'
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) OUTSIDE_SPEEX=1 FLOATING_POINT=1 RANDOM_PREFIX=fnf_speex',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }
  s.swift_version       = '5.0'
  s.static_framework    = true

  s.dependency 'Flutter'
  s.dependency 'WebRTC-SDK'
  s.dependency 'flutter_webrtc'
end
