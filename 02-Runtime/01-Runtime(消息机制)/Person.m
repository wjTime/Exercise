//
//  Person.m
//  01-Runtime(消息机制)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)eat
{
    NSLog(@"对象方法-吃东西");
}

+ (void)eat
{
    NSLog(@"类方法-吃东西");
}

- (void)run:(int)age
{
    NSLog(@"%d",age);
}
@end
