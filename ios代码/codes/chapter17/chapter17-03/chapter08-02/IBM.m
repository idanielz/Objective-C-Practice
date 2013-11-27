//
//  IBM.m
//  chapter08-02
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "IBM.h"

@implementation IBM
// 初始化方法
- (id)init
{
    self = [super init];
    if (self) {
        // 指定代理
        self.delegate = self;
    }
    return self;
}
// 生产电脑方法
-(void)produce{
    NSLog(@"生产电脑...");
}
// 销售电脑
-(void)sale{
    NSLog(@"销售电脑...");
}

@end
