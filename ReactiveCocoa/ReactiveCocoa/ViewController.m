//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by wenjie on 16/8/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "GloberHeader.h"

@interface ViewController ()

@property (nonatomic,assign)NSInteger age;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[self rac_valuesForKeyPath:@"age" observer:nil] subscribeNext:^(id x) {
        NSLog(@"x");
    }];


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.age ++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
