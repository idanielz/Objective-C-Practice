//
//  main.m
//  chapter08-02
//
//  Created by amaker on 4/17/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBM.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 实例化
        IBM *ibm = [[IBM alloc]init];
        // 生产方法
        [ibm produce];
        // ibm的代理的sale方法
        [ibm.delegate sale];
    }
    return 0;
}

