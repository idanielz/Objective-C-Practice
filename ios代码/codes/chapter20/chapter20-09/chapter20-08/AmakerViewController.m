//
//  AmakerViewController.m
//  chapter20-08
//
//  Created by amaker on 4/23/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"

@interface AmakerViewController ()

@end

@implementation AmakerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)rotate:(id)sender {
    // 开始动画
    [UIView beginAnimations:nil context:nil];
    // 设置持续时间
    [UIView setAnimationDuration:3];
    // 设置动画效果(渐进渐出)
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 设置旋转弧度
    CGAffineTransform rotationTrans =
    CGAffineTransformMakeRotation(180 * M_PI / 180);
    // 为图片设置转换
    self.myImage.transform = rotationTrans;
    // 提交动画
    [UIView commitAnimations];
}
@end
