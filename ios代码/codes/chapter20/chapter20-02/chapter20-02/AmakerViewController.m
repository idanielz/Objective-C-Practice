//
//  AmakerViewController.m
//  chapter20-02
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
	// 使用图片背景
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"test.jpeg"]];
    // 为当前视图指定背景
    self.view.backgroundColor = bgColor;
    // 使用RGB创建颜色
    UIColor *labelColor1 = [UIColor colorWithRed:0.2 green:0.3 blue:0.2 alpha:1];
    // 为标签指定颜色
    self.label1.textColor = labelColor1;
    // 使用红色
    UIColor *labelColor2 = [UIColor redColor];
    // 为标签指定颜色
    self.label2.textColor = labelColor2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
