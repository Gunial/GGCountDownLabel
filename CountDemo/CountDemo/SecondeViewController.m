//
//  SecondeViewController.m
//  CountDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "SecondeViewController.h"
#import "ThirdViewController.h"
#import "GGCountDownLabel.h"

@interface SecondeViewController ()

@end

@implementation SecondeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    self.title = @"第二个控制器";
    
    UIButton *presentBtn = [[UIButton alloc] init];
    [presentBtn setTitle:@"跳转" forState:UIControlStateNormal];
    [presentBtn addTarget:self action:@selector(modalThirdController) forControlEvents:UIControlEventTouchUpInside];
    presentBtn.frame = CGRectMake(0, 0, 100, 50);
    presentBtn.center = CGPointMake(self.view.frame.size.width/2, 100);
    [self.view addSubview:presentBtn];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [GGCountDownLabel gg_hidden];
}

- (void)modalThirdController
{
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    [self presentViewController:thirdVc animated:YES completion:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [GGCountDownLabel gg_countDownWithBeginNumber:5 endTitle:@"第二个控制器" begin:nil finished:nil];
}


@end
