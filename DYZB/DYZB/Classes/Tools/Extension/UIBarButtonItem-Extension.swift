//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by buyun1 on 2017/11/6.
//  Copyright © 2017年 buyun1. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(imageName : String, highImageName : String, size : CGSize) ->UIBarButtonItem {
        let btn = UIButton();
        btn.setImage(UIImage.init(named: imageName), for: .normal);
        btn.setImage(UIImage.init(named: highImageName), for: .highlighted);
        btn.frame = CGRect(origin: CGPoint.zero, size: size);
        return UIBarButtonItem(customView: btn);
    }
    */
    
    //便利构造函数：1、convenience开头 2、在构造函数中必须明确调用一个设计的构造函数（self）
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero) {
        let btn = UIButton();
        btn.setImage(UIImage.init(named: imageName), for: .normal);
        if highImageName != "" {
            btn.setImage(UIImage.init(named: highImageName), for: .highlighted);
        }
        if size == CGSize.zero {
            btn.sizeToFit();
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size);
        }
        self.init(customView: btn);
    }
}
