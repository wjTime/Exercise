//
//  ViewController.swift
//  ReactiveCocoaSwift
//
//  Created by wenjie on 16/8/27.
//  Copyright © 2016年 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myview: RedView!
    
    @IBOutlet weak var myBtn: UIButton!
    
    @IBOutlet weak var mTextField: UITextField!
    
    @IBOutlet weak var mLb: UILabel!
    var subsci = RACSubscriber?()
    var signal = RACSignal()
    
    
    @IBOutlet weak var accountField: UITextField!
    
    @IBOutlet weak var pwdField: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    
    dynamic var age : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.redColor()
        
        // RACSignal
        //self.Demo1()
        
        // RACDisposable
        //self.Demo2()
        
        // RACSubject
        //self.Demo3()
        
        // RACSubject 代替代理
        //self.Demo4()
        
        // RACTuple 遍历数组
        //self.Demo5()
        
        // rac_signalForSelector  代替代理
        //self.Demo6()
        
        // rac_valuesForKeyPath 监听属性改变
        //self.Demo7()
        
        // 监听事件
        //self.Demo8()
        
        // 通知
        //self.Demo9()
        
        // 监听 TextField
        //self.Demo10()
        
        // 组合数据
        //self.Demo11()
        
        // 常见的宏 (不支持)
        //self.Demo12()
        
        //let str:String?
        //str?.characters.count
       
        
        self.signal = RACSignal.combineLatest([self.accountField.rac_textSignal(),self.pwdField.rac_textSignal()]).map({ (x) -> AnyObject! in
            print(x)
            return true
        })
        self.signal.subscribeNext { (x) in
            //print(x)
        }
        
//        self.signal = RACSignal.combineLatest([self.accountField.rac_textSignal(),self.pwdField.rac_textSignal()]).subscribeNext({ (x) in
//            print(x)
//        })
    }
    


}

extension ViewController {
    func Demo12 () {
        self.mTextField.rac_textSignal().subscribeNext { (x) in
            self.mLb.text = x as? String
        }
        // swift不支持
        // RAC  @weakify() @strong() RACObserver RACTuplePack RACTupleUnPack 
    }
}


extension ViewController {
    func Demo11 () {
        // 创建热门商品信号
        let signalA = RACSignal.createSignal { (sub) -> RACDisposable! in
            print("获取数据一")
            sub.sendNext("第一部分数据")
            return nil
        }
        let signalB = RACSignal.createSignal { (sub) -> RACDisposable! in
            print("获取数据二")
            sub.sendNext("第二部分数据")
            return nil
        }
        self.rac_liftSelector(#selector(updataUI(_:b:)), withSignalsFromArray: [signalA,signalB])
        
    }
    func updataUI (a:String,b:String) {
        print("更新UI")
    }
}

extension ViewController {
    func Demo10 () {
        self.mTextField.rac_textSignal().subscribeNext { (x) in
            print("textField 输入文字的改变 \(x)")
        }
    }
}

extension ViewController {
    func Demo9 () {
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIKeyboardDidShowNotification, object: nil).subscribeNext { (x) in
            print("监听键盘弹出x:\(x)")
        }
    }
}


extension ViewController {
    func Demo8 () {
        self.myBtn.rac_signalForControlEvents(.TouchUpInside).subscribeNext { (x) in
            print("调用按钮点击方法")
        }
    }
}


extension ViewController {
    func Demo7 () {
        self.rac_valuesForKeyPath("age", observer: nil).subscribeNext({ (x) in
            print("age动态监听到的属性\(x)")
        })
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.age += 1
        let vc = PushViewControll()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}



// MARK: - RACSignalForSelector  代替代理
extension ViewController {
    func Demo6 () {
        myview.rac_signalForSelector(#selector(myview.click(_:))).subscribeNext { (x) in
            print("控制器监听到redView按钮的点击事件：\(x)")
        }
        
    }
}



// MARK: - RACTuple 遍历数组
extension ViewController {
    func Demo5 () {
        // 转成 RACTuple (类似元祖)
        let tupel = RACTuple.init(objectsFromArray: ["1","2","3"])
        print(tupel[0])
        
        // 转成 RACSequence
        let sequence = tupel.rac_sequence
        let signal = sequence.signal()
        signal.subscribeNext { (x) in
            print(x)
        }
        
    }
}

// MARK: - RACSubject 代替代理
extension ViewController {
    func Demo4 () {
        self.myview.subject.subscribeNext { (x) in
            print("控制器拿到了view的消息：\(x)")
        }
    }
}

// MARK: - RACSubject 信号提供者
extension ViewController {
    func Demo3 () {
        // 创建信号
        let subject = RACSubject.init()
        // 接受信号
        subject.subscribeNext { (x) in
            print("接收到的信号\(x)")
        }
        // 发送信号
        print("发送信号")
        subject.sendNext(3)
        
        
    }
}


// MARK: - RACSignalDemo2 RACDisposable 处理信号完成与否
extension ViewController {
    func Demo2 () {
        let signal = RACSignal.createSignal { (sub) -> RACDisposable! in
            print("发送信号")
            self.subsci = sub
            sub.sendNext(100)
            return RACDisposable.init(block: {
                print("信号处理完毕")
            })
        }
        let dispos:RACDisposable = signal.subscribeNext { (x) in
            print("接受到的信号\(x)")
        }
        dispos.dispose()
        
    }
}

// MARK: - RACSignalDemo1 创建信号订阅信号

extension ViewController {
    func Demo1 () {
        // 创建信号
        let signal = RACSignal.createSignal { (sub) -> RACDisposable! in
            
            sub.sendNext(2)
            return nil
        }
        // 订阅信号
        signal.subscribeNext { (x) in
            print("接受到的信号\(x)")
        } as RACDisposable
        
 
        
        
    }
}

extension ViewController {
    
    

    
    
    
    
    
}


