//
//  AmakerViewController.m
//  chapter17-02
//
//  Created by amaker on 4/20/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"

@interface AmakerViewController ()

@end

@implementation AmakerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 实例化按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    // 设置按钮大小
    btn.frame = CGRectMake(20, 20, 200, 50);
    // 设置按钮标题
    [btn setTitle:@"点击我..." forState: UIControlStateNormal];
    // 使用Target-Action设计模式，在两个对象直接发送消息
    // 1.self是指当前对象即AmakerViewController
    // 2. action即click方法
    // 3. 何时调用UIControlEventTouchUpInside，即单击
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加到View
    [self.view addSubview:btn];
}

-(IBAction)click:(id)sender{
    // 显示对话框
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"测试Target-Action设计模式" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
