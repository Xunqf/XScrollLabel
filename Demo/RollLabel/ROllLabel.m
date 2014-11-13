//
//  ROllLabel.m
//  RollLabel
//
//  Created by zhouxl on 12-11-2.
//  Copyright (c) 2012年 zhouxl. All rights reserved.
//


#import "ROllLabel.h"

@implementation ROllLabel
ROllLabel *roll;
- (id)initWithFrame:(CGRect)frame Withsize:(CGSize)size
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsVerticalScrollIndicator   = NO;
        self.showsHorizontalScrollIndicator = NO;//水平滚动条
//        self.bounces = NO;
        
        self.contentSize = CGSizeMake(size.width+frame.size.width, size.height);//滚动大小
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}
+ (void)rollLabelTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font superView:(UIView *)superView fram:(CGRect)rect
{
    //文字大小，设置label的大小和uiscroll的大小
    CGSize size = [title  sizeWithFont:font constrainedToSize:kConstrainedSize lineBreakMode:NSLineBreakByWordWrapping];
    CGRect frame = CGRectMake(0, 0, size.width, rect.size.height);
    roll = [[ROllLabel alloc]initWithFrame:rect Withsize:size];
    roll.userInteractionEnabled = NO;
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    label.font = font;
    label.textColor = color;
    [roll addSubview:label];
    [label release];
    [superView addSubview:roll];
    [roll release];
    if (frame.size.width>rect.size.width) {
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:roll selector:@selector(timer) userInfo:nil repeats:YES];
    }
}
- (void)timer
{
    CGPoint point = roll.contentOffset;
    point.x++;
    roll.contentOffset = point;
    if (roll.contentOffset.x>roll.contentSize.width-roll.frame.size.width) {
        roll.contentOffset = CGPointMake(-roll.frame.size.width, 0);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
