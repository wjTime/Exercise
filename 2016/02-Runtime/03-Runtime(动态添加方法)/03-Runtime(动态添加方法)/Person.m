//
//  Person.m
//  03-Runtime(动态添加方法)
//
//  Created by xiaomage on 15/10/22.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "Person.h"

#import <objc/message.h>

@implementation Person

// 定义函数
// 没有返回值,参数(id,SEL)
// void(id,SEL)
void aaaa(id self, SEL _cmd, id param1)
{
    
    NSLog(@"调用eat %@ %@ %@",self,NSStringFromSelector(_cmd),param1);
}

// 默认一个方法都有两个参数,self,_cmd,隐式参数
// self:方法调用者
// _cmd:调用方法的编号

// 动态添加方法,首先实现这个resolveInstanceMethod
// resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
// resolveInstanceMethod作用:就知道哪些方法没有实现,从而动态添加方法
// sel:没有实现方法


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
//    NSLog(@"%@",NSStringFromSelector(sel));
    
    // 动态添加eat方法
    
    if (sel == @selector(eat:)) {
        
        /*
         cls:给哪个类添加方法
         SEL:添加方法的方法编号是什么
         IMP:方法实现,函数入口,函数名
         types:方法类型
         */
        // @:对象 :SEL
        class_addMethod(self, sel, (IMP)aaaa, "v@:@");
        
        
        // 处理完
        return YES;
        
    }
    
    
    return [super resolveInstanceMethod:sel];
}
@end
