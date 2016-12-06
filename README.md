# GGCountDownLabel

读秒倒计时
-------------

一句代码实现简单的读秒倒计时<br/>
使用步骤:<br/>
第一步:  #import "GGCountDownLabel.h"<br/>
第二步: 实现下面的方法<br/>

/**<br/>
 开始倒计时<br/>

 @param number      倒计时起始时间<br/>
 @param endTitle    倒计时结束字符串<br/>
 @param beginCount  倒计时开始回调<br/>
 @param finishCount 倒计时结束回调<br/>
 */<br/>
+(instancetype)gg_countDownWithBeginNumber:(NSInteger)number
                                   endTitle:(NSString *)endTitle
                                      begin:(countDownBeginCallBack)beginCount
                                   finished:(countDownFinishedCallBack)finishCount;

