//
//  ViewController.m
//  SpaceDemo
//
//  Created by wenjie on 16/10/6.
//  Copyright © 2016年 github. All rights reserved.
//

#import "ViewController.h"
//#import "MBProgressHUD.h"
#import "CommontLib/CommontLib.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [CommontLib log];
    NSDictionary *dict = [NSDictionary dictionary];
    
    //NSObject *obj = dict
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
