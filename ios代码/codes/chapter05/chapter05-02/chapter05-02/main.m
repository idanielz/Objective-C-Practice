//
//  main.m
//  chapter05-02
//
//  Created by amaker on 3/2/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // float 类型
        float pi = 3.14;
        NSLog(@"pi=%f",pi);
        // float 类型的长度
        int size = sizeof(pi);
        NSLog(@"size=%d",size);
        // double类型
        double d = 3.14159;
        NSLog(@"d=%f",d);
        // double类型的长度
        size = sizeof(d);
        NSLog(@"size=%d",size);
        // 科学计数法表示
        double test = 0.31e2;
        NSLog(@"test=%f",test);
    }
    return 0;
}

