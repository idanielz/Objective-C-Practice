//
//  main.m
//  chapter12-02
//
//  Created by amaker on 3/7/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSStringTest.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSStringTest *test = [[NSStringTest alloc]init];
        // [test testNSString];
        [test testNSMutableString];
    }
    return 0;
}

