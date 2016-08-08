//
//  NSObject+Calculate.m
//  链式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "NSObject+Calculate.h"
#import "CalculateMake.h"

@implementation NSObject (Calculate)

+ (int)GWJ_makeCaculates:(void(^)(CalculateMake *make))block{
    CalculateMake *make = [CalculateMake new];
    block(make);
    return make.result;
}

@end
