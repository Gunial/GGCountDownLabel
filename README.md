# GGCountDownLabel
读秒倒计时
一句代码引入读秒倒计时
第一步:#import "GGCountDownLabel.h"
第二步:[GGCountDownLabel gg_countDownWithBeginNumber:5 endTitle:@"第一个控制器" begin:nil finished:nil];

/**
 开始倒计时

 @param number      倒计时起始时间
 @param endTitle    倒计时结束字符串
 @param beginCount  倒计时开始回调
 @param finishCount 倒计时结束回调
 */
+ (instancetype)gg_countDownWithBeginNumber:(NSInteger)number
                                   endTitle:(NSString *)endTitle
                                      begin:(countDownBeginCallBack)beginCount
                                   finished:(countDownFinishedCallBack)finishCount;
