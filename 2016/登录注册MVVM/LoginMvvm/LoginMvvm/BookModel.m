//
//  BookModel.m
//  LoginMvvm
//
//  Created by wenjie on 16/9/9.
//  Copyright © 2016年 exercise. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

+ (instancetype)bookWithDict:(NSDictionary *)dict{
    BookModel *book = [[BookModel alloc]init];
    book.title = dict[@"title"];
    book.subtitle = dict[@"subtitle"];
    return book;
}

@end
