//
//  GWJKVONotify_Person.m
//  响应式编程
//
//  Created by wenjie on 16/8/8.
//  Copyright © 2016年 test. All rights reserved.
//

#import "GWJKVONotify_Person.h"
#import <objc/runtime.h>

@implementation GWJKVONotify_Person

- (void)setAge:(int)age{
    [super setAge:age];
    id observer = objc_getAssociatedObject(self, @"observer");
    [observer observeValueForKeyPath:@"age" ofObject:self change:nil context:nil];
}

@end
