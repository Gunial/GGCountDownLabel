//
//  ThirdViewController.m
//  CountDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "ThirdViewController.h"
#import "GGCountDownLabel.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"第三个控制器";
    
    UIButton *dismissBtn = [[UIButton alloc] init];
    [dismissBtn setTitle:@"返回上一页" forState:UIControlStateNormal];
    [dismissBtn addTarget:self action:@selector(dismissThirdController) forControlEvents:UIControlEventTouchUpInside];
    dismissBtn.frame = CGRectMake(0, 0, 100, 50);
    dismissBtn.center = CGPointMake(self.view.frame.size.width/2, 100);
    [self.view addSubview:dismissBtn];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [GGCountDownLabel gg_hidden];
}

- (void)dismissThirdController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [GGCountDownLabel gg_countDownWithBeginNumber:5 endTitle:@"第三个控制器" begin:nil finished:nil];
}


@end
