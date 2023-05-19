#
# Be sure to run `pod lib lint Extension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Extension'
    s.version          = '0.1.3'
    s.summary          = '常用扩展'
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://gitee.com/uiop/extension'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'yxkkk' => '13730228573@163.com' }
    s.source           = { :git => 'https://gitee.com/uiop/extension.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '13.0'
    s.swift_version = '5.0'
    s.source_files = 'Extension/Classes/**/*'
    
    s.subspec 'Array' do |arr|
        arr.source_files = 'Extension/Classes/Array/**/*'
    end
    
    s.subspec 'Device' do |device|
        device.source_files = 'Extension/Classes/Device/**/*'
    end
    
    s.subspec 'Color' do |color|
        color.source_files = 'Extension/Classes/Color/**/*'
    end
    
    s.subspec 'String' do |string|
        string.source_files = 'Extension/Classes/String/**/*'
    end
    
    s.subspec 'ViewController' do |vc|
        vc.source_files = 'Extension/Classes/ViewController/**/*'
    end
    
    s.subspec 'Bundle' do |bundle|
        bundle.source_files = 'Extension/Classes/Bundle/**/*'
    end
    
end
