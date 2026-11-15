Pod::Spec.new do |s|
  s.name                = 'fluxer_voice'
  s.version             = '0.0.1'
  s.summary             = 'Fluxer voice call audio routing and picture-in-picture.'
  s.description         = 'Fluxer voice call audio routing and picture-in-picture.'
  s.homepage            = 'https://github.com/fluxerapp'
  s.license             = { :type => 'AGPL-3.0' }
  s.author              = 'Fluxer'
  s.source              = { :path => '.' }
  s.source_files        = 'fluxer_voice/Sources/fluxer_voice/**/*.swift'
  s.platform            = :ios, '16.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version       = '5.0'
  s.static_framework    = true

  s.dependency 'Flutter'
  s.dependency 'WebRTC-SDK'
  s.dependency 'flutter_webrtc'
end
