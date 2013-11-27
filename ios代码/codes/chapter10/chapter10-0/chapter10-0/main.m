//
//  main.m
//  chapter10-0
//
//  Created by amaker on 5/14/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

// 文件包含
#include "Test.h"

#import <Foundation/Foundation.h>
// 类型定义
typedef int  MyInt;
// 条件编译
#define iPad TRUE

#ifdef iPad
#define SIZE  768
#else
#define SIZE  320
#endif


// 参数宏
// 求平方
#define SQUARE(x) (x)*(x)
// 求和
#define SUM(a,b) (a)+(b)
// 宏定义的嵌套
#define W  10
#define H  (W+10)
#define AREA  (W*H)
// 宏定义
#define PI 3.14
float area(float r){
    // 宏替换
    float area = PI*r*r;
    return area;
}
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 类型定义
        MyInt a = 100;
        NSLog(@"a=%d",a);
        // 测试条件编译
        NSLog(@"size=%d",SIZE);
        
        int s2 = SUM1(2, 3);
        NSLog(@"s2=%d",s2);
        
        int s = SUM(1, 2);
        NSLog(@"sum=%d",s);
        
        int sq = SQUARE(5);
        NSLog(@"sq=%d",sq);
        
        // NSLog(@"%d",AREA);
        // 调用area函数
        float result = area(2);
        // NSLog(@"area=%f",result);
    }
    return 0;
}

