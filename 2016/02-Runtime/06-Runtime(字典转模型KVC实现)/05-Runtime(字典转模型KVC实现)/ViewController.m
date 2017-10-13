//
//  ViewController.m
//  05-Runtime(字典转模型KVC实现)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

#import "NSObject+Property.h"

#import "Status.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    
    
    // 解析Plist
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *dictArr = dict[@"statuses"];
    
     // 设计模型属性代码
//    [NSObject createPropertyCodeWithDict:dictArr[0]];
    NSMutableArray *statuses = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
        // 字典转模型
        Status *status = [Status statusWithDict:dict];
        
        [statuses addObject:status];
        
    }
    
    NSLog(@"%@",statuses);
}


@end
