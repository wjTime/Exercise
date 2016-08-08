//
//  CalculateMake.m
//  链式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "CalculateMake.h"

@implementation CalculateMake

-(instancetype)add:(int)num{
    _result += num;
    return self;
}


- (CalculateMake *(^)(int num1))add2{
    return ^(int num2){
        _result += num2;
        return self;
    };
}

@end
