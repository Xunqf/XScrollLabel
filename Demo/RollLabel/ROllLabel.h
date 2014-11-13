//
//  ROllLabel.h
//  RollLabel
//
//  Created by zhouxl on 12-11-2.
//  Copyright (c) 2012年 zhouxl. All rights reserved.
//


#import <UIKit/UIKit.h>
#define kConstrainedSize CGSizeMake(10000,40)//字体最大
@interface ROllLabel : UIScrollView
/**
*  穿件一个可以滚动的标签(创建后即可自动的循环滚动显示标签上的文字)
*
*  @param title     要显示的文
*  @param color     文字的颜色
*  @param font      字体大小
*  @param superView 要加载标签的视图
*  @param rect      标签的frame
*/
+ (void)rollLabelTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font superView:(UIView *)superView fram:(CGRect)rect;
@end
