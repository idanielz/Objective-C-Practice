//
//  Computer.m
//  chapter09-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Computer.h"
@implementation Computer
- (id)init
{
    self = [super init];
    if (self) {
        // 指定电脑名称
        self.name = @"Apple";
        // 初始化CPU
        self.cpu = [[CPU alloc]init];
        // 设置CPU名称
        self.cpu.name = @"英特尔";
        // 初始化ROM
        self.rom = [[ROM alloc]init];
        // 指定ROM名称
        self.rom.name = @"金士顿";
    }
    return self;
}
-(void)displayMsg{
    // 显示电脑名称
    NSLog(@"computer's name=%@",self.name);
    // 显示CPU名称
    NSLog(@"cpu's name=%@",self.cpu.name);
    // 显示ROM名称
    NSLog(@"rom's name=%@",self.rom.name);
}
@end
