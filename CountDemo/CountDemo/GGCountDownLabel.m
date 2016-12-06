//
//  GGCountDownLabel.m
//  CountDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import "GGCountDownLabel.h"
#import "AppDelegate.h"

#define GGScreenWith [UIScreen mainScreen].bounds.size.width
#define GGScreenHeight [UIScreen mainScreen].bounds.size.height
#define GGAppDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

@interface GGCountDownLabel ()

@property (nonatomic, assign) NSInteger number;
@property (nonatomic, copy) NSString *endTitle;
@property (nonatomic, copy) countDownBeginCallBack beginCount;
@property (nonatomic, copy) countDownFinishedCallBack finishCount;

@end

@implementation GGCountDownLabel
BOOL isAnimating;

/** 单例初始化 */
+ (instancetype)shareCountDownLabel
{
    static GGCountDownLabel *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[GGCountDownLabel alloc] init];
    });
    return _instance;
}

+ (instancetype)gg_countDownWithBeginNumber:(NSInteger)number endTitle:(NSString *)endTitle begin:(countDownBeginCallBack)beginCount finished:(countDownFinishedCallBack)finishCount
{
    GGCountDownLabel *countDownLabel = [GGCountDownLabel shareCountDownLabel];
    
    //** 防止重叠动画 */
    if (isAnimating) return nil;
    
    //默认倒计时为三秒
    countDownLabel.number = 3;
    
    if (number && number > 0) countDownLabel.number = number;
    if (endTitle && endTitle.length > 0) countDownLabel.endTitle = endTitle;
    if (beginCount) countDownLabel.beginCount = beginCount;
    if (finishCount) countDownLabel.finishCount = finishCount;
    
    [self gg_configLabel:countDownLabel];
    [self gg_scaleActionWithLabel:countDownLabel beginBlock:beginCount finishedBlock:finishCount];
    
    return countDownLabel;
}

/** 配置 label 的基本属性 */
+ (void)gg_configLabel:(GGCountDownLabel *)label
{
    label.hidden = NO;
    label.frame = CGRectMake(0, 0, GGScreenWith, GGScreenHeight/2);
    label.center = CGPointMake(GGScreenWith/2, GGScreenHeight/2);
    label.transform = CGAffineTransformScale(label.transform, 15, 15);
    label.alpha = 0;
    label.text = [NSString stringWithFormat:@"%zd",label.number];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    
    [[label gg_getCurrentSuperView] addSubview:label];
}

// 获取当前显示的控制器的View
- (UIView *)gg_getCurrentSuperView
{
    return [self gg_getVisibleViewControllerFrom:(UIViewController *)GGAppDelegate.window.rootViewController].view;
}

- (UIViewController *)gg_getVisibleViewControllerFrom:(UIViewController*)vc
{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self gg_getVisibleViewControllerFrom:[((UINavigationController*) vc) visibleViewController]];
    }else if ([vc isKindOfClass:[UITabBarController class]]){
        return [self gg_getVisibleViewControllerFrom:[((UITabBarController*) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self gg_getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}

/** 倒计时动画 */
+ (void)gg_scaleActionWithLabel:(GGCountDownLabel *)label beginBlock:(countDownBeginCallBack)beginCount finishedBlock:(countDownFinishedCallBack)finishCount
{
    if (!isAnimating) {
        if (label.beginCount) {
            label.beginCount();
        }
    }
    
    if (label.number >= (label.endTitle.length ? 0 : 1 )) {
        isAnimating = YES;
        label.text = label.number == 0 ? label.endTitle : [NSString stringWithFormat:@"%zd",label.number];

        [UIView animateWithDuration:1.0 animations:^{
            label.alpha = 1;
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            if (finished) {
                label.number --;
                label.alpha = 0;
                label.transform = CGAffineTransformScale(label.transform, 15, 15);
                [self gg_scaleActionWithLabel:label beginBlock:beginCount finishedBlock:finishCount];
            }
        }];
    }else {
        if (label.finishCount) label.finishCount();
        [self gg_hidden];
    }
}

/** 隐藏 */
+ (void)gg_hidden
{
    isAnimating = NO;
    [GGCountDownLabel shareCountDownLabel].transform = CGAffineTransformIdentity;
    [GGCountDownLabel shareCountDownLabel].hidden = YES;
    [[GGCountDownLabel shareCountDownLabel] removeFromSuperview];
}

@end
