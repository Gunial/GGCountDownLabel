//
//  GGCountDownLabel.h
//  CountDemo
//
//  Created by Mr.Gu on 16/12/6.
//  Copyright © 2016年 Mr.Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^countDownBeginCallBack)();
typedef void(^countDownFinishedCallBack)();

@interface GGCountDownLabel : UILabel

/**
 开始倒计时

 @param number   倒计时起始时间
 @param endTitle 倒计时结束字符串
 @param beginCount    倒计时开始回调
 @param finishCount 倒计时结束回调
 */
+ (instancetype)gg_countDownWithBeginNumber:(NSInteger)number
                                   endTitle:(NSString *)endTitle
                                      begin:(countDownBeginCallBack)beginCount
                                   finished:(countDownFinishedCallBack)finishCount;

/**
 隐藏
 */
+ (void)gg_hidden;

@end
