//
//  ViewController.m
//  函数编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "Caculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Caculator *caculator = [[Caculator alloc] init];
    int res = [[caculator add:10] result];
    NSLog(@"res == %d",res);
    
    BOOL isEqule = [[[caculator add2:^int(int num) {
        num += 1;
        return num;
    }] equle:^BOOL(int num) {
        return num == 11;
    }] isEqule];

    NSLog(@"isEqule = %d",isEqule);
                
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
