//
//  main.m
//  chapter03-02
//
//  Created by amaker on 2/27/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 定义int类型变量
        int i = 100;
        // 定义float类型变量
        float pi = 3.14;
        // 定义字符串类型变量
        NSString *s = @"iOS应用开发详解";
        NSLog(@"i=%d",i);
        NSLog(@"pi=%f",pi);
        NSLog(@"s=%@",s);
    }
    return 0;
}

