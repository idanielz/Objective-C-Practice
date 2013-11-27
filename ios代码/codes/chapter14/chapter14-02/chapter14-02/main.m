//
//  main.m
//  chapter14-02
//
//  Created by amaker on 3/11/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestDir.h"
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        TestDir *test = [[TestDir alloc]init];
        // 创建目录
        // [test createDir];
        // 删除目录
        // [test removeDir];
        // 获得当前路径
         [test getCurrentDir];
        // 列出当前目录下内容
        [test listDir];
    }
    return 0;
}

