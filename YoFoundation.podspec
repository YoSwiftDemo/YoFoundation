
Pod::Spec.new do |s|
# 项目名
s.name             = 'YoFoundation'
# 版本号
s.version          = '0.1.0'
# 简单描述
s.summary          = 'Yo Foundation of swift'
# 详细描述
s.description      = <<-DESC
Foundation扩展
DESC
# 项目的主页
s.homepage         = 'https://github.com/YoSwiftKing/YoFoundation'
# s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
# 项目遵守的协议
s.license          = { :type => 'MIT', :file => 'LICENSE' }
# 作者的邮箱
s.author           = { 'Yo' => '738816656@qq.com' }
# git仓库的https地址
s.source           = { :git => 'https://github.com/YoSwiftKing/YoFoundation.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
# 项目的最低版本支持
s.ios.deployment_target = '9.0'
#默认模块
s.default_subspec = 'YoString+Normal'
# 子模块
# 子模块 - YoString - 邮箱判断
s.subspec 'YoString+Email'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+Email/**/*'
# ss.dependency 'YoFoundation/xxx'
end
#  子模块 - YoString - 字符串size
s.subspec 'YoString+Size'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+Size/**/*'
end
#  子模块 - YoString - viewCtl 相关
s.subspec 'YoString+ViewCtl'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+ViewCtl/**/*'
end
#  子模块 -  YoString - 常用
s.subspec 'YoString+Normal'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+Normal/**/*'
end


end



