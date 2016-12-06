//
//  FirstViewController.m
//  CountDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "FirstViewController.h"
#import "FourthViewController.h"
#import "GGCountDownLabel.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"第一个控制器";
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    [pushBtn addTarget:self action:@selector(pushFourthVc) forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setTitle:@"下一页" forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:pushBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [GGCountDownLabel gg_hidden];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [GGCountDownLabel gg_countDownWithBeginNumber:5 endTitle:@"第一个控制器" begin:nil finished:nil];
}

- (void)pushFourthVc
{
    FourthViewController *fourthVc = [[FourthViewController alloc] init];
    [self.navigationController pushViewController:fourthVc animated:YES];
}

@end
