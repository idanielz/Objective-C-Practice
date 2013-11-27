//
//  main.m
//  chapter06-04
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 获得随机值
        int r = arc4random();
        // 取余
        int i = r%100;
        // 获得随机值
        r = arc4random();
        // 余100
        int j = r%100;
        // 声明计算结果
        NSString  *result;
        // 判断，i是否大于j，并打印结果
        result = i>j?@"YES":@"NO";
        NSLog(@"%d>%d=%@",i,j,result);
        // 判断，i是否大于等于j，并打印结果
        result = i>=j?@"YES":@"NO";
        NSLog(@"%d>=%d=%@",i,j,result);
        // 判断，i是否小于j，并打印结果
        result = i<j?@"YES":@"NO";
        NSLog(@"%d<%d=%@",i,j,result);
        // 判断，i是否小于等于j，并打印结果
        result = i<=j?@"YES":@"NO";
        NSLog(@"%d<=%d=%@",i,j,result);
        // 判断，i是否等于j，并打印结果
        result = i==j?@"YES":@"NO";
        NSLog(@"%d==%d=%@",i,j,result);
        // 判断，i是否不等于j，并打印结果
        result = i!=j?@"YES":@"NO";
        NSLog(@"%d!=%d=%@",i,j,result);
    }
    return 0;
}

