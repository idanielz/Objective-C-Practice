//
//  main.m
//  chapter09-01
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
#import "Computer.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 实例化Cat
        Cat *cat = [[Cat alloc]init];
        // 实例化Dog
        Dog *dog = [[Dog alloc]init];
        // 设置cat属性
        cat.name = @"花花";
        cat.age = 2;
        // 显示姓名和年龄
        [cat display];
        
        // 设置dog属性
        dog.name = @"黑豹";
        dog.age = 3;
        // 显示姓名和年龄
        [dog display];
        // 实例化Computer
        Computer *cmp = [[Computer alloc]init];
        // 显示信息
        [cmp displayMsg];
        
    }
    return 0;
}

