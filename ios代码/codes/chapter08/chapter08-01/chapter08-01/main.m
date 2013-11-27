//
//  main.m
//  chapter08-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass+MyCategory.h"
#import "MyClass2.h"
int main(int argc, const char * argv[])
{
    // NSArray
    
    @autoreleasepool {
        // 实例化
        MyClass *mc = [[MyClass alloc]init];
        // 原有方法
        [mc method1];
        [mc method2];
        // 新添加方法
        [mc method3];
        [mc method4];
        
        MyClass2 *mc2 = [[MyClass2 alloc]init];
        // 原有方法
        [mc2 method1];
        [mc2 method2];
        // 第一组分类
        [mc2 method3];
        [mc2 method4];
        // 第二组分类
        [mc2 method5];
        [mc2 method6];
    }
    return 0;
}

