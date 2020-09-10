
Pod::Spec.new do |s|
  s.name             = 'EYMtelStringToColor'
  s.version          = '0.1.1'
  s.summary          = 'EYMtelStringToColor'

  s.description      = <<-DESC
TODO: stringtocolor
                       DESC

  s.homepage         = 'https://github.com/zxjtext/EY.Mtel.StringToColor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zxjtext' => '1032100734@qq.com'}
  s.source           = { :git => 'https://github.com/zxjtext/EY.Mtel.StringToColor.git', :tag =>'0.1.1'}

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'EYMtelStringToColor/*.{h,m,swift}'
end
