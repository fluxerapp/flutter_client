Pod::Spec.new do |s|
  s.name                = 'fluxer_clipboard'
  s.version             = '0.0.1'
  s.summary             = 'Reads files, images and text from the system clipboard.'
  s.description         = 'Reads files, images and text from the system clipboard.'
  s.homepage            = 'https://github.com/fluxerapp'
  s.license             = { :type => 'AGPL-3.0' }
  s.author              = 'Fluxer'
  s.source              = { :path => '.' }
  s.source_files        = 'fluxer_clipboard/Sources/fluxer_clipboard/**/*.swift'
  s.ios.dependency 'Flutter'
  s.osx.dependency 'FlutterMacOS'
  s.ios.deployment_target = '16.0'
  s.osx.deployment_target = '12.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version       = '5.0'
end
