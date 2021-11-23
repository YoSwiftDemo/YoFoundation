Pod::Spec.new do |s|
# 项目名
s.name             = 'YoFoundation'
# 版本号
s.version          = '0.1.1'
# 简单描述
s.summary          = 'Yo Foundation of swift'
# 详细描述
s.description      = <<-DESC
Swift Foundation扩展
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

# 子模块引用 https://www.jianshu.com/p/951952f3be7a
# YoString
s.subspec 'YoString+Normal'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+Normal/**/*'
#ss.dependency 'YoSwiftUIKit/xxxx'
end

# YoString -判断邮箱
s.subspec 'YoString+Email'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+Email/**/*'
end
# YoString 算高度 宽度
s.subspec 'YoString+Size'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+Size/**/*'
#ss.dependency 'YoCommon/Configure'

end
# YoString - 生成视图控制器
s.subspec 'YoString+ViewCtlt'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoString/YoString+ViewCtl/**/*'
#ss.dependency 'YoCommon/Configure'

end
# YoNSObject - 获取类名
s.subspec 'YoNSObject+ClassName'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoNSObject/YoNSObject+ClassName/**/*'
#ss.dependency 'YoCommon/Configure'

end

# YoCGFloat - 获取系统相关高度
s.subspec 'YoCGFloat+Hight'  do |ss|
ss.source_files = 'YoFoundation/Classes/YoCGFloat/YoCGFloat+Hight/**/*'
#ss.dependency 'YoCommon/Configure'
end

end

