//
//  main.m
//  chapter09-03
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Cat.h"
#import "Bird.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 实例化Person
        Person *per = [[Person alloc]init];
        per.name = @"张三";
        // 实例化Dog
        Dog *dog = [[Dog alloc]init];
        // 为dog属性name赋值
        dog.name = @"招财狗";
        // 为person属性dog赋值
        per.dog = dog;
        // 实例化Cat
        Cat *cat = [[Cat alloc]init];
        cat.name = @"幸福猫";
        per.cat = cat;
        
        Bird *bird = [[Bird alloc]init];
        bird.name = @"报喜鸟";
        per.bird = bird;
        
        [per display];
        
    }
    return 0;
}

