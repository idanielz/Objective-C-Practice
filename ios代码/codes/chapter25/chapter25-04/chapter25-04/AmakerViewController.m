//
//  AmakerViewController.m
//  chapter25-04
//
//  Created by amaker on 4/22/13.
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

- (IBAction)start:(id)sender {
    // 声明队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 异步任务
    dispatch_async(queue, ^{
        // 总进度
        float total = 0.0;
        // 进度为1.0时退出
        while (total<=1.0) {
            // 增加进度
            total+=0.1;
            [NSThread sleepForTimeInterval:1];
            // 更新UI在主线程中
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.myProgress setProgress:total];
            });
        }
    });
}

@end
