Pod::Spec.new do |s|
  s.name = 'Lisk'
  s.version = '1.0.0-beta13'
  s.summary = 'Swift 4 library for Lisk - the cryptocurrency and blockchain application platform'
  s.homepage = 'https://github.com/AndrewBarba/lisk-swift'
  s.documentation_url = 'https://andrewbarba.github.io/lisk-swift/'
  s.license = { :type => 'Apache 2.0', :file => 'LICENSE.md' }
  s.author = { 'Andrew Barba' => 'abarba.77@gmail.com' }
  s.source = { :git => 'https://github.com/AndrewBarba/lisk-swift.git', :tag => s.version.to_s }

  s.pod_target_xcconfig = { 'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
                            'APPLICATION_EXTENSION_API_ONLY' => 'YES' }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '3.0'

  s.source_files = 'Sources/**/*.{h,swift}'
  s.public_header_files = 'Sources/**/*.h'

  s.dependency 'Ed25519', '~> 0.2.0'
end
