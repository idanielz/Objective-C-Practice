//
//  main.m
//  chapter14-03
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestFileHandle.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        TestFileHandle *fh = [[TestFileHandle alloc]init];
        // 读文件
        [fh readFile];
        // 写文件
        [fh writeFile];
    }
    return 0;
}

