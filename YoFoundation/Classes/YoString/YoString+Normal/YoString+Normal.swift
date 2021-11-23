//
//  NSString+YoExpand.swift
//  RxSwiftKing
//
//  Created by admin on 2021/10/21.
//

import Foundation

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

