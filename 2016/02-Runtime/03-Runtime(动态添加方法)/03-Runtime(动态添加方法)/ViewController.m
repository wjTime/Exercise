//
//  ViewController.m
//  03-Runtime(动态添加方法)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // performSelector:动态添加方法
    Person *p = [[Person alloc] init];
    
    // 动态添加方法
//    [p performSelector:@selector(eat)];
    [p performSelector:@selector(eat:) withObject:@111];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
