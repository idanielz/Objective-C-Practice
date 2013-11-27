//
//  main.m
//  chapter06-02
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 获得随机数
        int r = arc4random();
        // 余100
        int i = r%100;
        // 获得随机数
        r = arc4random();
        // 余100
        int j = r%100;
        // 计算结果
        int result;
        // 加运算
        result = i+j;
        NSLog(@"%d+%d=%d",i,j,result);
        // 减运算
        result = i-j;
        NSLog(@"%d-%d=%d",i,j,result);
        // 乘运算
        result = i*j;
        NSLog(@"%d*%d=%d",i,j,result);
        // 除运算
        result = i/j;
        NSLog(@"%d/%d=%d",i,j,result);
    }
    return 0;
}

