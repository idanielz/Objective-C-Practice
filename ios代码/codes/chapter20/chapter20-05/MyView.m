//
//  MyView.m
//  GraphicDemo
//
//  Created by Mahmood1 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
    // 获得上下文
    CGContextRef context =UIGraphicsGetCurrentContext();
    // 设置线宽
    CGContextSetLineWidth(context, 2);
    // 设置绘制颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    // 移动到指定的点
    CGContextMoveToPoint(context, self.startPoint.x,  self.startPoint.y);
    // 添加一条线到指定点
    CGContextAddLineToPoint(context,  self.endPoint.x,  self.endPoint.y);
    // 绘制
    CGContextStrokePath(context);
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    return [super initWithCoder:aDecoder];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 获得当前点
    UITouch *touch = [touches anyObject];
    // 初始化起始点和结束点
    self.startPoint = [touch locationInView:self];
    self.endPoint = [touch locationInView:self];
    // 触发绘制
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    // 获得当前点
    UITouch *touch = [touches anyObject];
    // 获得结束点
    self.endPoint = [touch locationInView:self];
     // 触发绘制
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
     // 获得当前点
    UITouch *touch = [touches anyObject];
    // 获得结束点
    self.endPoint = [touch locationInView:self];
    // 触发绘制
    [self setNeedsDisplay];
}

@end
