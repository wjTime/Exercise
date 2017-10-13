//
//  ViewController.m
//  SpaceDemo
//
//  Created by wenjie on 16/10/6.
//  Copyright © 2016年 github. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "CommontLib/CommontKit.h"
#import "Person.h"
#import "CommontLib/LogTest.h"

@interface ViewController ()

//@property (nonatomic,strong)TestView *testV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSObject *obc = [[NSObject alloc]init];
    Person *p = [[Person alloc]init];
    p.age = 18;
    //[p mj_keyValues];
    //NSLog(@"dic==%@",dic);
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //self.testV = [[TestView alloc]initWithFrame:self.view.bounds];
    
    //[self.testV log];
    [LogTest log];
    
    //[self.view addSubview:self.testV];
    
    // Do any additional setup after loading the view, typically from a nib.
    [LogTest log2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
