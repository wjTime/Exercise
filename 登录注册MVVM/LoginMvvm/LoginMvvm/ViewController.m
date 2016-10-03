//
//  ViewController.m
//  LoginMvvm
//
//  Created by wenjie on 16/9/8.
//  Copyright © 2016年 exercise. All rights reserved.
//

#import "ViewController.h"
#import "GlobeHeader.h"
#import "LoginViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton    *loginBtn;


@property (strong, nonatomic) LoginViewModel *LoginVM;

@end

@implementation ViewController


- (LoginViewModel *)LoginVM{
    if (_LoginVM == nil) {
        _LoginVM = [[LoginViewModel alloc] init];
    }
    return _LoginVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 处理文本逻辑
    
    [self bindViewModel];
    [self loginEvent];
    [self getData];
    
}


- (void)bindViewModel{
    RAC(self.LoginVM,name) = _accountTF.rac_textSignal;
    RAC(self.LoginVM,pwd) = _pwdTF.rac_textSignal;
}

- (void)loginEvent{
    RAC(self.loginBtn,enabled) = self.LoginVM.loginSignal;
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [[self.LoginVM loadBookData] subscribeNext:^(id x) {
            NSLog(@"-----%@-----",x);
        }];
    }];
}

- (void)getData{
    
    
    
}

@end
