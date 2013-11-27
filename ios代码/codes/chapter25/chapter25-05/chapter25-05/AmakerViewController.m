//
//  AmakerViewController.m
//  chapter25-05
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "AmakerViewController.h"
#import "MyOpetation.h"
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

- (IBAction)test1:(id)sender {
    // 创建线程队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    // 创建操作1
    MyOpetation *ope = [[MyOpetation alloc]initWithName:@"Opetation1"];
    // 添加到队列
    [queue addOperation:ope];
    // 创建操作2
    MyOpetation *ope2 = [[MyOpetation alloc]initWithName:@"Opetation2"];
    // 添加到队列
    [queue addOperation:ope2];
}

- (IBAction)test2:(id)sender {
    // 创建线程队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    // 创建操作对象，指定任务执行方法
    NSInvocationOperation *ope1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loop:) object:@"Operation1"];
    // 将任务添加到队列
    [queue addOperation:ope1];
    
    // 创建操作对象，指定任务执行方法
    NSInvocationOperation *ope2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loop:) object:@"Operation2"];
    // 将任务添加到队列
    [queue addOperation:ope2];
}
-(void)loop:(NSString*)name{
    // 循环打印那个操作在执行
    for (int i=0; i<10; i++) {
        [NSThread sleepForTimeInterval:1];
        NSLog(@"%@'s i=%d",name,i);
    }
}

- (IBAction)test3:(id)sender {
    // 创建线程队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    // 创建操作对象1
    NSBlockOperation *ope1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"%@'s i=%d",@"Operation1",i);
        }
    }];
    // 创建操作对象2
    NSBlockOperation *ope2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<10; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"%@'s i=%d",@"Operation2",i);
        }
    }];
    // 将操作对象，添加到队列
    [queue addOperation:ope1];
    [queue addOperation:ope2];
}

- (IBAction)test4:(id)sender {
    // 创建线程队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    // 创建操作对象1
    NSBlockOperation *ope1 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<5; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"%@'s i=%d",@"Operation1",i);
        }
    }];
    // 创建操作对象2
    NSBlockOperation *ope2 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<5; i++) {
            [NSThread sleepForTimeInterval:1];
            NSLog(@"%@'s i=%d",@"Operation2",i);
        }
    }];
    // 操作1依赖操作1
    [ope2 addDependency:ope1];
    // 将操作对象，添加到队列
    [queue addOperation:ope1];
    [queue addOperation:ope2];
}
@end
