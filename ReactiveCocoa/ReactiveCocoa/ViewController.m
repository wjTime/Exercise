//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by wenjie on 16/8/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "GloberHeader.h"
#import "swifttest-swift.h"


@interface ViewController ()

@property (nonatomic,assign)NSInteger age;

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (nonatomic,strong)RACSignal *signal;


@end

@implementation ViewController
///

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //swiftmodel *model = [[swiftmodel alloc]init];
    
    
    
    
    swiftmodel *model = [[swiftmodel alloc]init];
    
    NSLog(@"model name %@",model.name);
    // Do any additional setup after loading the view, typically from a nib.
    [[self rac_valuesForKeyPath:@"age" observer:nil] subscribeNext:^(id x) {
        NSLog(@"x");
    }];

    self.signal = [RACSignal combineLatest:@[self.accountField.rac_textSignal,self.pwdField.rac_textSignal] reduce:^id(NSString *acc,NSString *pwd){
        NSLog(@"x=%@,y=%@",acc,pwd);
        return @(acc.length && pwd.length);
    }];
    [self.signal subscribeNext:^(id x) {
        NSLog(@"======%@",x);
    }];
    
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.age ++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
