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
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 设置绘制颜色
    CGContextSetFillColorWithColor(context,  [UIColor redColor].CGColor);
    // 创建矩形
    CGRect r = CGRectMake(self.startPoint.x>self.endPoint.x?self.endPoint.x:self.startPoint.x, self.startPoint.y>self.endPoint.y?self.endPoint.y:self.startPoint.y, fabsf(self.startPoint.x-self.endPoint.x), fabsf(self.startPoint.y-self.endPoint.y));
    // 添加矩形
    CGContextAddRect(context, r);
    // 绘制矩形
    CGContextDrawPath(context, kCGPathFill);
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
