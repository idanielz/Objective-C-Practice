//
//  main.m
//  NSNotificationDemo
//
//  Created by DanielZ on 13-12-11.
//  Copyright (c) 2013年 DanielZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mother.h"
#import "Son.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Mother *mother = [[Mother alloc]init];
        Son *son =[[Son alloc]init];
        [[NSRunLoop currentRunLoop]run];
        
    }
    return 0;
}

