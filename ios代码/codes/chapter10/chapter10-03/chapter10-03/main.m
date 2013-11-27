//
//  main.m
//  chapter10-03
//
//  Created by amaker on 4/18/13.
//  Copyright (c) 2013 amaker. All rights reserved.
//

#import <Foundation/Foundation.h>
void testPoint(){
    // 定义一个int类型变量
    int i = 100;
    // 取i的地址赋值给指针变量p
    int *p = &i;
    // *p代表指针指向的变量值，赋值给变量j
    int j = *p;
    NSLog(@"i=%d",*p);
    NSLog(@"j=%d",j);
}
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        testPoint();
    }
    return 0;
}

