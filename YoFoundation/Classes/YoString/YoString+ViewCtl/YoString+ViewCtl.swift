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
