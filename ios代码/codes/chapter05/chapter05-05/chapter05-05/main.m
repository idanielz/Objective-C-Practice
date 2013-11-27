//
//  main.m
//  chapter05-05
//
//  Created by amaker on 3/2/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 长整型
        long int test1 = 1;
        // 缩写
        long test2 = 1;
        int size = sizeof(test2);
        NSLog(@"size=%d",size);
        // 无符号整型
        unsigned int test3= 1;
        // 缩写
        int test4 = 1;
        // 短整型
        short int test5 = 1;
        // 缩写
        short test6 = 1;
        size = sizeof(test6);
        NSLog(@"size=%d",size);
    }
    return 0;
}

