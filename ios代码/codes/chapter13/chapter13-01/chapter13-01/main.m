//
//  main.m
//  chapter13-01
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollecitonTest.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        CollecitonTest *test = [[CollecitonTest alloc]init];
        // [test testNSArray];
        // [test testMutableNSArray];
        // [test testNSSet];
        // [test testNSMutableSet];
        // [test testNSDictionary];
        [test testMutableNSDictionary];
        
    }
    return 0;
}

