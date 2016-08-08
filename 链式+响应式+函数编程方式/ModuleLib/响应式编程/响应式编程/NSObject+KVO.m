//
//  NSObject+KVO.m
//  响应式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "GWJKVONotify_Person.h"

@implementation NSObject (KVO)

- (void)GWJ_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    object_setClass(self, [GWJKVONotify_Person class]);
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
