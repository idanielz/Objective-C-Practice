//
//  MyView.m
//  chapter20-04
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

- (void)drawRect:(CGRect)rect
{
    // 实例化一个UIImage对象
    UIImage *image = [UIImage imageNamed:@"iphone.jpg"];
    // 在(20,20)点绘制图片
    [image drawAtPoint:CGPointMake(20, 20)];
    // 在矩形中绘制图片
    [image drawInRect:CGRectMake(20, 200, 300, 200)];
}


@end
