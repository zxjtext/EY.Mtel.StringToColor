
Pod::Spec.new do |s|
  s.name             = 'stringToColor'
  s.version          = '0.1.1'
  s.summary          = 'stringToColor'

  s.description      = <<-DESC
TODO: ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC / Swift，实现原理：http://blog.csdn.net/glt_code/article/details/78576628
                       DESC

  s.homepage         = 'https://gitee.com/jerrycodewhy/stringtocolor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jerry' => '1032100734@qq.com'}
  s.source           = { :git => 'https://gitee.com/jerrycodewhy/stringtocolor.git', :tag =>'0.1.1'}

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'stringToColor/*.{h,m,swift}'
end
