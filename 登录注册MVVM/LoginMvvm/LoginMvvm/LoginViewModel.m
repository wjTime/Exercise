//
//  LoginViewModel.m
//  LoginMvvm
//
//  Created by wenjie on 16/9/9.
//  Copyright © 2016年 exercise. All rights reserved.
//

#import "LoginViewModel.h"
#import "AFNetworking.h"
#import "BookModel.h"

@implementation LoginViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    _loginSignal = [RACSignal combineLatest:@[RACObserve(self,name),RACObserve(self, pwd)] reduce:^id(NSString *name,NSString *pwd){
        return @(name.length && pwd.length);
    }];
    //[self loadData1];
    //[self loadData2];
    
}

- (RACSignal *)loadBookData{
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"q":@"美女"}  success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                NSArray *booksArray = responseObject[@"books"];
                NSArray *modelArray = [[booksArray.rac_sequence map:^id(id value) {
                    return [BookModel bookWithDict:value];
                }] array];
                [subscriber sendNext:modelArray];
                
            } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                
            }];
            return nil;
        }];
    }];
    
    return [_loginCommand execute:nil];
}

- (void)loadData2{
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"q":@"美女"}  success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                NSArray *booksArray = responseObject[@"books"];
                NSArray *modelArray = [[booksArray.rac_sequence map:^id(id value) {
                    return [BookModel bookWithDict:value];
                }] array];
                [subscriber sendNext:modelArray];
                
            } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                
            }];
            return nil;
        }];
        return signal;
    }];
    
    [_loginCommand.executionSignals subscribeNext:^(id x) {
        
    }];
    
}

- (void)loadData1{
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        NSLog(@"发送登录请求");
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSLog(@"请求到的数据");
            [subscriber sendNext:@"请求到的数据"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    [_loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [[_loginCommand.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            NSLog(@"正在执行");
        }else{
            NSLog(@"执行完成");
        }
    }];
}

@end
