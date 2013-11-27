//
//  AmakerViewController.m
//  chapter20-07
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)move:(id)sender {
    // 开始动画
    [UIView beginAnimations:@"myAnimation" context:(__bridge void *)self.myImage];
    // 设置动画持续时间
    [UIView setAnimationDuration:5.0f]; 
    // 重新设置图片frame属性
    [self.myImage setFrame:CGRectMake(200.0f, 350.0f,100.0f,100.0f)];
    // 提交动画
    [UIView commitAnimations];
}
@end
