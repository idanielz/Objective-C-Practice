//
//  main.m
//  chapter11-02
//
//  Created by amaker on 5/15/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{
    /*
    @autoreleasepool {
        Person *per = [[Person alloc]init];
        Dog *dog = [per getDog];
        dog = nil;
    }
     */
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    Person *per = [[Person alloc]init];
    Dog *dog = [per getDog];
    dog = nil;
    [pool release];
    return 0;
}

