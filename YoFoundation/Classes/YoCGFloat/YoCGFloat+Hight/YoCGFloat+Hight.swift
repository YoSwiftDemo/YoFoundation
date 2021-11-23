//
//  YoCGFloat.swift
//  RxSwiftKing
//
//  Created by admin on 2021/10/22.
//

import UIKit

extension CGFloat {
    
    /// 屏幕宽度
    public static var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    /// 屏幕高度
    public static var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    
    /// 状态栏高度
    public static var statusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            let window: UIWindow? = UIApplication.shared.windows.first
            return (window?.windowScene?.statusBarManager?.statusBarFrame.height)!
        }else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
    /// 安全区域导航栏高度
    public static var safeAreaNavBarHeight: CGFloat { statusBarHeight + 44.0 }
}
