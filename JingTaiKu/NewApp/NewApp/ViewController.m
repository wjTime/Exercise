//
//  ViewController.m
//  NewApp
//
//  Created by wenjie on 16/10/3.
//  Copyright © 2016年 github. All rights reserved.
//

#import "ViewController.h"
#import <BaseKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Log log];
    [Test test];
    [NSObject showMessage];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
