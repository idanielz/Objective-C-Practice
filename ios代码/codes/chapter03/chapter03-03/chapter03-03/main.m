//
//  main.m
//  chapter03-03
//
//  Created by amaker on 2/27/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // 输出一个字符串
        NSLog(@"This is a NString");
        // 输出一个对象
        NSObject *obj = [[NSObject alloc]init];
        NSLog(@"obj=%@",obj);
        // 输出一个整型变量
        int i = 100;
        NSLog(@"i=%d",i);
        // 输出一个长整形变量
        long l = 123456;
        NSLog(@"l=%ld",l);
        // 输出一个无符号长整型变量
        unsigned long ul = 98765;
        NSLog(@"ul=%lu",ul);
        // 输出NSInteger
        NSInteger ld = 98765;
        NSLog(@"ld=%ld",ld);
        // 输出NSUInteger
        NSUInteger ul2 = 98765;
        NSLog(@"ul2=%lu",ul2);
        // 输出8进制整型
        int o = 123;
        NSLog(@"o=%o",o);
        // 输出16进制整型
        int i16 = 1234;
        NSLog(@"i16=%x",i16);
        // 输出一个浮点型
        float f = 3.14;
        NSLog(@"f=%f",f);
        // 以科学计数法输出
        float f2 = 314.2345;
        NSLog(@"f2=%E",f2);
        // 输出单个字符
        char c = 'A';
        NSLog(@"c=%c",c);
        // 输出c字符串
        char *str = "Hello World";
        NSLog(@"str=%s",str);
        
    }
    return 0;
}

