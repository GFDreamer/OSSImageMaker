#
# Be sure to run `pod lib lint OSSImageMaker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OSSImageMaker'
  s.version          = '0.1.1'
  s.summary          = 'OSS云存储对象URL的处理, 给图片参数添加一些属性, 进行图片的缩放, 比如图片的缩放模式, 设置宽高'
  s.description      = <<-DESC
    1. OSS图片URL对象处理
    2. 使用链式调用, 方便快捷
    3. 暂时只实现了图片的缩放, 后续会陆续更新更多的OSS功能
                       DESC

  s.homepage         = 'https://github.com/LDreame/OSSImageMaker'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LDreame' => 'lvguifeng_hsd@126.com' }
  s.source           = { :git => 'https://github.com/LDreame/OSSImageMaker.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'OSSImageMaker/Classes/**/*'

end
