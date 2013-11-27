//
//  main.m
//  chapter09-04
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"
#import "Person.h"
#import "Dog.h"
#import "Bird.h"
#import "Cat.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        id<Pet> dog = [[Dog alloc]init];
        dog.name = @"招财狗";
        id<Pet> cat = [[Cat alloc]init];
        cat.name = @"幸福猫";
        id<Pet> bird = [[Bird alloc]init];
        bird.name = @"报喜鸟";
        
        Person *per = [[Person alloc]init];
        per.name = @"Tom";
        NSMutableArray *pets = [NSMutableArray arrayWithCapacity:2];
        [pets addObject:dog];
        [pets addObject:cat];
        [pets addObject:bird];
        
        per.pets = pets;
        
        [per display];
        
    }
    return 0;
}

