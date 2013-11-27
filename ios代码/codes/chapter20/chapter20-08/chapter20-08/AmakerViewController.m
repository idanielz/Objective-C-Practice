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
    self.scale = 2.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)scale:(id)sender {
    // 更改缩放比例
    self.scale = self.scale==2.0?0.5:2.0;
    // 开始动画
    [UIView beginAnimations:nil context:nil];
    // 设置持续时间
    [UIView setAnimationDuration:3];
    // 设置动画效果(渐进渐出)
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 设置缩放比例
    CGAffineTransform scaleTrans =
    CGAffineTransformMakeScale(self.scale, self.scale);
    // 为图片设置转换
    self.myImage.transform = scaleTrans;
    // 提交动画
    [UIView commitAnimations];
}
@end
