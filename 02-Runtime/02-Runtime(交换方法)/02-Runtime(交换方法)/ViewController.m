//
//  ViewController.m
//  02-Runtime(交换方法)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

//#import "UIImage+Image.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIImage *image = [UIImage imageNamed:@"123"];
    // 1.每次使用,都需要导入头文件
    // 2.当一个项目开发太久,使用这个方式不靠谱
    [UIImage imageNamed:@"123"];
    
    // imageNamed:
    // 实现方法:底层调用xmg_imageNamed
    
    // 本质:交换两个方法的实现imageNamed和xmg_imageNamed方法
    // 调用imageNamed其实就是调用xmg_imageNamed
    
    
    // imageNamed加载图片,并不知道图片是否加载成功
    // 以后调用imageNamed的时候,就知道图片是否加载
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
