//
//  NSString+YoExpand.swift
//  RxSwiftKing
//
//  Created by admin on 2021/10/21.
//

import Foundation
import UIKit
//MARK: 根据类名获取  类实体
extension String{
    func getViewCtlFromStr() -> UIViewController?{
        // 1.获取命名空间
                // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
                guard let clsName = Bundle.main.infoDictionary?["CFBundleExecutable"] else {
                    print("命名空间不存在")
                    return nil
                }
        // 2.通过命名空间和类名转换成类
         var  viewCtlName = self
        print(self)
        if(viewCtlName.contains(".")){
            viewCtlName =  viewCtlName.components(separatedBy: ".")[1];
        }
        let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + viewCtlName)
        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
              guard let clsType = cls as? UIViewController.Type else {
                  print("无法转换成ViewController")
                  return nil
              }
              // 3.通过得到的class类型创建对象
        return clsType.init()
    }
}
//MARK: 判断字符串是否是3-15位数字或者邮箱
extension String {
    // 是否是3-15位数字
    func validateMobileNumber() -> Bool {
        let regex = "^\\d{3,15}$"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    // 是否是邮箱
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
//MARK: 判断字符串是否包含某个字符串
extension String {
    /// 判断是否含有某个字符串
    func contains(find: String) -> Bool {
        return self.range(of: find) != nil
    }

    /// 判断是否含有某个字符串 忽略大小写
    func containsIgnoringCase(find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}
//MARK: 计算字符串宽度或者高度
// 计算字符串尺寸大小
extension String {
    /// 根据字符串计算高度尺寸，width 默认是最大数
    func size(font: UIFont, width: CGFloat = CGFloat.greatestFiniteMagnitude, paragraphStyle: NSParagraphStyle = NSParagraphStyle.default) -> CGSize {
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font : font]
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        let rect = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                     attributes: attributes,
                                     context: nil)
        return rect.size
    }

    /// 根据字符串计算宽度尺寸
    func getSizeWithHeight(font: UIFont, height: CGFloat = CGFloat.greatestFiniteMagnitude, paragraphStyle: NSParagraphStyle = NSParagraphStyle.default) -> CGSize {
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font : font]
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        let rect = self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height),
                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                     attributes: attributes,
                                     context: nil)
        return rect.size
    }

}

//MARK:判断字符串是否有值
extension String {
   /**
   true if self contains characters.
   */
   var isNotEmpty: Bool {
       return !isEmpty
   }
}

extension String {
    //https://github.com/marcuswestin/WebViewJavascriptBridge/blob/master/WebViewJavascriptBridge/WebViewJavascriptBridgeBase.m#L181
    ///如果在模板字符串中需要使用反引号，则前面要用反斜杠转义
    /// https://stackoverflow.com/a/22810989/4493393
    func replaceEscapeCharacter() -> String {
        var newMD = self.replacingOccurrences(of: "\\", with: "\\\\")
        newMD = newMD.replacingOccurrences(of: "\"", with: "\\\"")
        newMD = newMD.replacingOccurrences(of: "\'", with: "\\\'")
        newMD = newMD.replacingOccurrences(of: "\n", with: "\\n")
        //newMD = newMD.replacingOccurrences(of: "`", with: "\\`")
        //newMD = newMD.replacingOccurrences(of: "\r", with: "\\r")
        //newMD = newMD.replacingOccurrences(of: "\f", with: "\\f")
        //newMD = newMD.replacingOccurrences(of: "\u2028", with: "\\u2028")
        //newMD = newMD.replacingOccurrences(of: "\u2029", with: "\\u2029")
        return newMD
    }
}
extension String {
    
    /// 计算字符串宽高
    /// - Parameters:
    ///   - font: 字体
    ///   - width: 设定的宽度
    ///   - height: 设定的高度
    ///   - kernSpace: 字符间距
    ///   - lineSpace: 行间距
    /// - Returns: CGSize 值
    public func calculateSize(
        font: UIFont,
        width: CGFloat = CGFloat.greatestFiniteMagnitude,
        height: CGFloat = CGFloat.greatestFiniteMagnitude,
        kernSpace: CGFloat = 0,
        lineSpace: CGFloat = 0
    ) -> CGSize {
        if kernSpace == 0, lineSpace == 0 {
            let rect = self.boundingRect(
                with: CGSize(width: width, height: height),
                options: .usesLineFragmentOrigin,
                attributes: [.font: font],
                context: nil
            )
            return CGSize(width: ceil(rect.width), height: ceil(rect.height))
        }else {
            let rect = CGRect(x: 0, y: 0, width: width, height: height)
            let label = UILabel(frame: rect)
            label.numberOfLines = 0
            label.font = font
            label.text = self
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineSpace
            let attr = NSMutableAttributedString(
                string: self,
                attributes: [.kern : kernSpace]
            )
            attr.addAttribute(
                .paragraphStyle,
                value: style,
                range: NSMakeRange(0, self.count)
            )
            label.attributedText = attr
            return label.sizeThatFits(rect.size)
        }
    }
}

