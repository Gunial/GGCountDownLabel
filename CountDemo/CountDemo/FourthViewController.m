//
//  FourthViewController.m
//  CountDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "FourthViewController.h"
#import "GGCountDownLabel.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"第四个控制器";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [GGCountDownLabel gg_hidden];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [GGCountDownLabel gg_countDownWithBeginNumber:5 endTitle:@"第四个控制器" begin:nil finished:nil];
}

@end
