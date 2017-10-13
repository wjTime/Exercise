//
//  BookModel.h
//  LoginMvvm
//
//  Created by wenjie on 16/9/9.
//  Copyright © 2016年 exercise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject

@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;

+ (instancetype)bookWithDict:(NSDictionary *)dict;

@end
