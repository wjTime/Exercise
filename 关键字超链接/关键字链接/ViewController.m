//
//  ViewController.m
//  关键字链接
//
//  Created by wenjie on 16/8/11.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "SGStatusTextView.h"

@interface ViewController ()

@property (nonatomic,strong)SGStatusTextView *myview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myview = [[SGStatusTextView alloc]initWithFrame:CGRectMake(100, 100, 200, 20)];
    [self.view addSubview:self.myview];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
