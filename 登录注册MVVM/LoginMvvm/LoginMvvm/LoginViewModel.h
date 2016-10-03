//
//  LoginViewModel.h
//  LoginMvvm
//
//  Created by wenjie on 16/9/9.
//  Copyright © 2016年 exercise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobeHeader.h"

@interface LoginViewModel : NSObject

@property (nonatomic,strong,readonly)RACSignal *loginSignal;
@property (nonatomic,strong,readonly)RACCommand *loginCommand;

@property (nonatomic,copy)  NSString  *name;
@property (nonatomic,copy)  NSString  *pwd;

- (RACSignal *)loadBookData;

@end
