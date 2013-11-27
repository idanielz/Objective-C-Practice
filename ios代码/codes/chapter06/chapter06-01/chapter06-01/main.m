//
//  main.m
//  chapter06-01
//
//  Created by amaker on 4/22/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 求和函数
int sumFun(int a,int b){
    return a+b;
}
// 求平均数函数
int avgFun(int a,int b){
    return (a+b)/2;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        /******赋值运算********/
        // 常量赋值
        int age = 20;
        NSString *name = @"tom";
        char c = 'A';
        BOOL b = YES;
        // 变量赋值
        int myAge = age;
        NSString *myName = name;
        char myChar = c;
        BOOL myBoolean = b;
        // 表达式赋值
        int x = 1+2;
        int i =1,j = 2;
        int sum = i+j;
        // 函数返回值赋值
        int mySum = sumFun(1,2);
        int myAvg = avgFun(2,4);
        
        // 引用类型赋值
        id obj = [[NSObject alloc]init];
        NSArray *array = [NSArray arrayWithObjects:@"ios", @"Android",nil];
        
        Person *p1 = [[Person alloc]init];
        // 地址传递
        Person *p2 = p1;
        
    }
    return 0;
}

