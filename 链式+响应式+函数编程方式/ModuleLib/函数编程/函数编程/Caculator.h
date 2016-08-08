//
//  Caculator.h
//  函数编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Caculator : NSObject

@property (nonatomic,assign)int result;
@property (nonatomic,assign)BOOL isEqule;

- (instancetype)add:(int)num;

- (instancetype)add2:(int(^)(int num))block;

- (instancetype)equle:(BOOL(^)(int num))block;

@end
