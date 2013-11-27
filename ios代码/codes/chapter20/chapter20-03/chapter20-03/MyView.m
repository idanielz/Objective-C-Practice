//
//  MyView.m
//  chapter20-03
//
//  Created by amaker on 4/23/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // 要绘制的文字
    NSString *str = @"《iOS 应用开发详解》";
    // 绘制在点（20，20）使用字体大小24
    [str drawAtPoint:CGPointMake(20, 20) withFont:[UIFont systemFontOfSize:24]];
    // 在矩形中绘制
    [str drawInRect:CGRectMake(20, 50, 300, 200) withFont:[UIFont systemFontOfSize:26]];
}


@end
