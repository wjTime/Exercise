//
//  ViewController.m
//  链式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Calculate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int result = [NSObject GWJ_makeCaculates:^(CalculateMake *make) {
        [make add:10];
        [make add:10].add2(10);
        make.add2(20);
    }];
    NSLog(@"result = %d",result);
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
