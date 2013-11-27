//
//  main.m
//  chapter05-01
//
//  Created by amaker on 3/2/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 有符号整型
        int test1 = -100;
        NSLog(@"%d",test1);
        // 无符号整型
        unsigned int test2 = 200;
        NSLog(@"%u",test2);
        // 8进制整型
        int test3 = 0123;
        NSLog(@"%o",test3);
        // 16进制整型
        int test4 = 0x127ff;
        NSLog(@"%x",test4);
        int test5 = 0xffff;
        NSLog(@"%x",test5);
        // 测试整型长度
        int size = sizeof(test1);
        NSLog(@"size=%d",size);
        //NSInteger 表示长整型
        NSInteger i = 1234;
        NSLog(@"%ld",i);
        // NSUInteger 表示无符号长整型
        NSUInteger j = 5678;
        NSLog(@"%lu",j);
    }
    return 0;
}

