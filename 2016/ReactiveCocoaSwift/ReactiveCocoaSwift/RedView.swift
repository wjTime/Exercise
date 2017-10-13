//
//  RedView.swift
//  ReactiveCocoaSwift
//
//  Created by wenjie on 16/8/27.
//  Copyright © 2016年 test. All rights reserved.
//

import UIKit

class RedView: UIView {
    
    var age:Int=0
    lazy var subject = RACSubject()
    
    @IBAction func click(btn:UIButton){
        self.subject.sendNext("按钮被点击啦")
    }
    

}
