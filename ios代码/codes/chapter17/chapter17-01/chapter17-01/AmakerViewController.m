//
//  AmakerViewController.m
//  chapter17-01
//
//  Created by amaker on 4/9/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"

@interface AmakerViewController ()

@end

@implementation AmakerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[CalculatorModel alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
// 数字按钮被按下的实现
-(IBAction)digitPress:(id)sender{
    UIButton *btn = (UIButton*)sender;
    // 获得当前被按下按钮数字
    double num = [btn.titleLabel.text doubleValue];
    // 如果第一次按下数字
    if (self.currentOperator==nil) {
        self.model.result = num;
    }
    // 计算结果
    [self.model calculate:num andOperator:self.currentOperator];
}
// 操作符被按下的实现
-(IBAction)operatorPress:(id)sender{
    UIButton *btn = (UIButton*)sender;
    // 获得当前被按下的操作符
    self.currentOperator = btn.titleLabel.text;
}
// 结果按钮被按下
-(IBAction)resultPress:(id)sender{
    self.resultLabel.text = [NSString stringWithFormat:@"%f",self.model.result];
}
// 清除按钮被按下
-(IBAction)cleanPress:(id)sender{
    // 归零
    self.resultLabel.text = @"0.0";
    self.model.result = 0.0;
    self.currentOperator = nil;
}

@end
