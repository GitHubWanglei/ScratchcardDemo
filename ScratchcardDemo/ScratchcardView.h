//
//  ScratchcardView.h
//  ScratchcardDemo
//
//  Created by lihongfeng on 16/6/30.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScratchcardView : UIView

@property (nonatomic, assign) CGFloat scratchWith;//每次要刮的宽度, 默认:15point

/**
 *  初始化方法
 *
 *  @param frame          刮刮卡的 frame
 *  @param concealedView  隐藏的 view, 也就是刮开后的 view, 不需要指定 frame
 *  @param maskView       表面的涂层, 不需要指定 frame
 *
 */
+ (instancetype)viewWithFrame:(CGRect)frame concealedView:(UIView *)concealedView maskView:(UIView *)maskView;

@end

