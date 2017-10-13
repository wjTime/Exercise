//
//  Caculator.m
//  函数编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "Caculator.h"

@implementation Caculator

- (instancetype)add:(int)num{
    _result += num;
    return self;
}

- (instancetype)add2:(int(^)(int num))block{
    _result = block(_result);
    return self;
}

- (instancetype)equle:(BOOL(^)(int num))block{
    _isEqule = block(_result);
    return self;
}

@end
