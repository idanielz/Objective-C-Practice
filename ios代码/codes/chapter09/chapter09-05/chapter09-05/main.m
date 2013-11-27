//
//  main.m
//  chapter09-05
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bicycle.h"
#import "Vehicle.h"
#import "Steamship.h"
#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 实例化Bicycle
        Bicycle *b = [[Bicycle alloc]init];
        // 实例化Steamship
        Steamship *ss = [[Steamship alloc]init];
        // 实例化Car
        Car *car = [[Car alloc]init];
        // 实例化Person
        Person *per = [[Person alloc]init];
        // 使用自行车
        [per use:b];
        // 使用游轮
        [per use:ss];
        // 使用汽车
        [per use:car];
    }
    return 0;
}

