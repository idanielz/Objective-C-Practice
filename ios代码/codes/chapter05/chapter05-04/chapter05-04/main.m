//
//  main.m
//  chapter05-04
//
//  Created by amaker on 3/2/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 布尔类型
        BOOL isLoop = YES;
        NSLog(@"isLoop=%d",isLoop);
        isLoop = NO;
        NSLog(@"isLoop=%d",isLoop);
    }
    return 0;
}

