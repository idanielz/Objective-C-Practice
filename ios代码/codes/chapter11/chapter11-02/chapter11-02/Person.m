//
//  Person.m
//  chapter11-02
//
//  Created by amaker on 5/15/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import "Person.h"
@implementation Person
-(Dog*)getDog{
    Dog *dog = [[[Dog alloc]init]autorelease];
    return dog;
}
@end
