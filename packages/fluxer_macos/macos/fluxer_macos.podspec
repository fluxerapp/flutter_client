Pod::Spec.new do |s|
  s.name                = 'fluxer_macos'
  s.version             = '0.0.1'
  s.summary             = 'macOS privacy permissions and global input hook'
  s.description         = 'macOS privacy permissions and global input hook'
  s.homepage            = 'https://github.com/fluxerapp/flutter_client'
  s.license             = { :type => 'AGPL-3.0' }
  s.author              = 'Fluxer'
  s.source              = { :path => '.' }
  s.source_files        = 'fluxer_macos/Sources/fluxer_macos/**/*.swift'
  s.platform            = :osx, '12.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version       = '5.0'

  s.dependency 'FlutterMacOS'
end
