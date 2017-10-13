//
//  NSObject+Calculate.h
//  链式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculateMake.h";

@interface NSObject (Calculate)

+ (int)GWJ_makeCaculates:(void(^)(CalculateMake *make))block;

@end
