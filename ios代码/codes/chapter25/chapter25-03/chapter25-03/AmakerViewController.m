//
//  AmakerViewController.m
//  chapter25-03
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
    // Dispose of any resources that can be recreated.
}

- (IBAction)test:(id)sender {
    // 获得全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 执行异步请求
    dispatch_async(queue, ^{
        [self loop];
    });
}
// 循环
-(void)loop{
    for (int i=0; i<10; i++) {
        // 睡眠1秒
        [NSThread sleepForTimeInterval:1];
        NSLog(@"i=%d",i);
    }
}
@end
