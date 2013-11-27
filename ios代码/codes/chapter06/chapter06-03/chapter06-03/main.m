//
//  main.m
//  chapter06-03
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 声明int类型变量
        int i = 200;
        // 打印
        NSLog(@"i=%d",i);
        // 先增加，后运算
        NSLog(@"++i=%d",++i);
        // 先运算，后增加
        NSLog(@"i++=%d",i++);
        // 打印i
        NSLog(@"i=%d",i);
        // 先自减，后运算
        NSLog(@"--i=%d",--i);
        // 先运算，后自减
        NSLog(@"i--=%d",i--);
        // 打印i
        NSLog(@"i=%d",i);
    }
    return 0;
}

