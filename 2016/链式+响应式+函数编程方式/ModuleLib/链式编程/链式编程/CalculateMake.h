//
//  CalculateMake.h
//  链式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateMake : NSObject

@property (nonatomic,assign)int result;


-(instancetype)add:(int)num;

- (CalculateMake *(^)(int num1))add2;

@end
