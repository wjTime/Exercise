//
//  NSObject+KVO.h
//  响应式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)GWJ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end
