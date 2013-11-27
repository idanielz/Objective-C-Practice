//
//  main.m
//  chapter11-01
//
//  Created by amaker on 4/23/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 实例化Person
        Person *p1 = [[Person alloc]init];
        // 获得p1的引用计数
        NSUInteger retainCount = [p1 retainCount];
        // 输出p1的引用计数
        NSLog(@"实例化后引用计数为：%ld",retainCount);
        // p1 保留引用计数
        [p1 retain];
        // 获得p1的引用计数
        retainCount = [p1 retainCount];
        // 输出p1的引用计数
        NSLog(@"调用retain后引用计数为：%ld",retainCount);
        // 释放p1
        [p1 release];
        // 获得p1的引用计数
        retainCount = [p1 retainCount];
        // 输出p1的引用计数
        NSLog(@"调用release后引用计数为：%ld",retainCount);
        // 释放p1
        [p1 release];
               
    }
    return 0;
}

