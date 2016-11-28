//
//  ViewController.m
//  07-Runtime(字典转模型)(了解)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"

#import "NSObject+Model.h"
@interface ViewController ()

@end

@implementation ViewController

/*
    KVC:遍历字典中所有key,去模型中查找有没有对应的属性名
    runtime:遍历模型中所有属性名,去字典中查找
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 解析Plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *dictArr = dict[@"statuses"];
    
    NSMutableArray *statuses = [NSMutableArray array];
    // 遍历字典数组
    for (NSDictionary *dict in dictArr) {
        Status *status = [Status modelWithDict:dict];
        [statuses addObject:status];
    }
    
    NSLog(@"%@",statuses);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
