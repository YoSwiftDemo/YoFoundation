//
//  NSString+YoExpand.swift
//  RxSwiftKing
//
//  Created by admin on 2021/10/21.
//

import Foundation
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
